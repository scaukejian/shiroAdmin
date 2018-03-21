
package com.yuezhi.ws.http.controller;

import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.http.vo.EmployeeVO;
import com.yuezhi.ws.http.vo.RoleVO;
import com.yuezhi.ws.service.EmpRoleRelationService;
import com.yuezhi.ws.utils.ExcelExport;
import com.yuezhi.ws.utils.HttpsUtils;
import com.yuezhi.ws.utils.StaticFileUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

/**
 * 基础控制器 Created by yanyuan on 20180301.
 */
@Controller
public class BaseController {

    protected Logger logger = LoggerFactory.getLogger(this.getClass());


    @Autowired
    private EmpRoleRelationService empRoleRelationService;

    // 状态
    public static final String STATUS = "status";
    public static final String STATUS_SUCCESS = "success";
    public static final String STATUS_FAILED = "failed";
    public static final String STATUS_ERROR = "error";
    // 返回数据类型
    public static final String DATA = "data";
    public static final String DATA_LIST = "dataList";
    public static final String ERROR_MSG = "errorMsg";
    public static final String TOTAL = "total";

    @RequestMapping("/list/{path}-{fileName}")
    public String list(@PathVariable String path, @PathVariable String fileName) {
        return path + "/" + path + "-" + fileName;
    }

    @RequestMapping("/common/{fileName}")
    public String common(@PathVariable String fileName) {
        return "common/" + fileName;
    }

    @ResponseBody
    @ExceptionHandler(RuntimeException.class)
    public Map<String, Object> exceptionHandler(RuntimeException rex, HttpServletRequest request) {
        if (getCurrentEmployee(request) == null) {
            logger.error(rex.getLocalizedMessage());
        } else {
            logger.error("[操作人:" + getCurrentEmployee(request).getName() + "] " + rex.getLocalizedMessage());
        }
        Map<String, Object> map = new HashMap<String, Object>();
        if (rex instanceof BusinessException) {
            map.put(STATUS, STATUS_FAILED);
            map.put(ERROR_MSG, rex.getMessage());
        } else {
            rex.printStackTrace();// 控制台输出异常信息
            map.put(STATUS, STATUS_ERROR);
            map.put(ERROR_MSG, "服务器繁忙，请稍后再试");
        }
        return map;
    }

    /**
     * 生成文件夹
     *
     * @param id
     * @param type
     * @return
     */
    public String generateFolderPath(Integer id, String type) {
        // 文件夹路径
        StringBuffer folderPath = new StringBuffer(StaticFileUtil.getProperty(
                "fileSystem", "storagePath"));
        String folderName = generateFolderName(id, type);
        folderPath.append(folderName).append("/");
        // 文件夹不存在时创建
        if (!new File(folderPath.toString()).exists()) {
            new File(folderPath.toString()).mkdir();
        }
        return folderPath.toString();
    }

    /**
     * 生成文件夹名称
     *
     * @param id
     * @param type
     * @return
     */
    public String generateFolderName(Integer id, String type) {
        // 最大文件夹数
        Integer fileMaxCount = Integer.valueOf(StaticFileUtil.getProperty(
                "fileSystem", "partyFileMaxCount"));
        // 生成文件夹名
        return type + id % fileMaxCount;
    }

    /**
     * 根据userId生成文件夹
     *
     * @param userId
     * @return
     */
    public String generateFolderPath(Integer userId) {
        // 文件夹路径
        StringBuffer folderPath = new StringBuffer(StaticFileUtil.getProperty(
                "fileSystem", "storagePath"));
        String folderName = generateFolderName(userId);
        folderPath.append(folderName).append("/");
        // 文件夹不存在时创建
        if (!new File(folderPath.toString()).exists()) {
            new File(folderPath.toString()).mkdir();
        }
        return folderPath.toString();
    }

    public String generateTmpFolderPath() {
        // 文件夹路径
        StringBuffer folderPath = new StringBuffer(StaticFileUtil.getProperty(
                "fileSystem", "storagePath"));
        folderPath.append("tmp/");
        if (!new File(folderPath.toString()).exists()) {
            new File(folderPath.toString()).mkdir();
        }
        return folderPath.toString();
    }

    /**
     * 按天生成文件夹名称
     *
     * @param typeName
     * @param day
     * @return
     * @author chenzeke on 2015.10.08
     */
    public String generateFolderName(String typeName, Integer day) {
        Integer fileMaxCount = Integer.valueOf(StaticFileUtil.getProperty("fileSystem", "partyFileMaxCount"));
        return typeName + day % fileMaxCount;
    }

    /**
     * 按天生成文件夹路径
     *
     * @param typeName
     * @param day
     * @return
     * @author chenzeke on 2015.10.08
     */
    public String generateFolderPath(String typeName, Integer day) {
        // 获取upload文件夹路径
        StringBuffer folderPath = new StringBuffer(StaticFileUtil.getProperty("fileSystem", "storagePath"));
        String folderName = generateFolderName(typeName, day);
        folderPath.append(folderName).append("/");
        // 文件夹不存在时创建
        if (!new File(folderPath.toString()).exists()) {
            new File(folderPath.toString()).mkdir();
        }
        return folderPath.toString();
    }

    public static void main(String[] args) {
        BaseController b = new BaseController();
        System.out.println(b.generateFolderPath(18, "partyDetail"));
    }

    /**
     * 根据userId生成文件夹名称
     *
     * @param userId
     * @return
     */
    public String generateFolderName(Integer userId) {
        // 最大文件夹数
        Integer fileMaxCount = Integer.valueOf(StaticFileUtil.getProperty(
                "fileSystem", "fileMaxCount"));
        // 生成文件夹名
        return String.valueOf(userId % fileMaxCount);
    }

    /**
     * 根据文件名生成文件路径
     *
     * @param fileName
     * @return
     */
    public String generateFilePath(String fileName) {
        // 存储路径
        StringBuffer filePath = new StringBuffer(StaticFileUtil.getProperty(
                "fileSystem", "storagePath"));
        // 文件名是否包含文件夹名称 前缀为文件夹名称
        if (fileName.indexOf("_") > 0) {
            String folderName = fileName.substring(0, fileName.indexOf("_"));
            filePath.append(folderName).append("/").append(fileName);
        } else {
            filePath.append(fileName);
        }
        return filePath.toString();
    }

    /**
     * 获取token
     *
     * @param request
     * @return
     */
    public String getRequestToken(HttpServletRequest request) {
        String serverUrl = StaticFileUtil.getProperty("systemConfig",
                "INTERFACE_SERVER");
        String url = serverUrl
                + StaticFileUtil.getProperty("systemConfig", "CREATE_TOKEN");
        Map<String, String> tokenRequestMap = new HashMap<>();
        tokenRequestMap.put("source",
                StaticFileUtil.getProperty("systemConfig", "ADMIN_SOURCE"));
        JSONObject jsonObject = new JSONObject(HttpsUtils.post(url,
                tokenRequestMap));
        String token = String.valueOf(jsonObject.get("token"));
        return token;
    }

    /**
     * 获取登陆用户信息
     *
     * @param request
     * @return
     */
    public EmployeeVO getCurrentEmployee(HttpServletRequest request) {
        // 获取登陆用户信息
        EmployeeVO employee = (EmployeeVO) request.getSession().getAttribute(
                "employee");
        return employee;
    }

    /**
     * 获取登陆用户ID
     *
     * @param request
     * @return
     */
    public Long getCurrentEmployeeId(HttpServletRequest request) {
        return getCurrentEmployee(request).getId();
    }


    /**
     * 刷新缓存
     */
    public void reflashehcache(HttpServletRequest request, String type) {
        logger.info("刷新缓存:"
                + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                .format(new Date()));
        String token = getRequestToken(request);
        Map<String, String> map = new HashMap<String, String>();
        map.put(StaticFileUtil.getProperty("systemConfig", "type"), type);
        map.put("token", token);
        String result = HttpsUtils
                .post(StaticFileUtil.getProperty("systemConfig",
                        "INTERFACE_SERVER")
                                + StaticFileUtil.getProperty("systemConfig", "ehcache"),
                        map);
        logger.info("刷新缓存 返回结果：" + result);
    }


    /**
     * 重置token
     *
     * @param userId
     * @param request
     */
    public void resetToken(Integer userId, HttpServletRequest request) {
        logger.info("重置token:userId="
                + userId
                + "  时间："
                + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                .format(new Date()));
        String token = getRequestToken(request);
        String url = StaticFileUtil.getProperty("systemConfig", "RESET_TOKEN");
        HttpsUtils.get(
                StaticFileUtil.getProperty("systemConfig", "INTERFACE_SERVER")
                        + StringUtils.replace(url, "{userId}",
                        userId.toString()), token);
    }

    /**
     * 环信推送
     * @param fromUserCode 发起人易悦号
     * @param targetCodes 用户易约号
     * @param content     内容
     * @param request
     * @return
     */
    public String batchAddIMMessage(String fromUserCode, List<String> targetCodes,
                                    String content,
                                    HttpServletRequest request) {
        JSONObject json = new JSONObject();
        json.accumulate("fromUserCode", fromUserCode);
        json.accumulate("userCodeList", targetCodes);// 单个发送
        json.accumulate("content", content);// 发送内容
        json.accumulate("type", "text");// 私信类型 text：文本
        String result = HttpsUtils.post(
                StaticFileUtil.getProperty("systemConfig", "INTERFACE_SERVER")
                        + StaticFileUtil.getProperty("systemConfig",
                        "batchAddIMMessage"), json.toString(),
                getRequestToken(request));
        return result;
    }


    /**
     * 验证图片格式
     *
     * @param imgName
     */
    public void validImgFormat(String imgName) {
        logger.info("验证图片格式, 图片名称: " + imgName);
        if (StringUtils.isBlank(imgName)) {
            throw new BusinessException("图片名不能为空");
        }
        //判断上传格式
        String prefix = imgName.substring(imgName.lastIndexOf(".") + 1);
        if (!("jpeg".equals(prefix.toLowerCase())
                || "jpg".equals(prefix.toLowerCase())
                || "gif".equals(prefix.toLowerCase())
                || "png".equals(prefix.toLowerCase()))) {
            logger.error("文件格式有误");
            throw new BusinessException("图片格式有误, 系统目前支持jpeg, jpg, gif, png");
        }
    }

    /**
     * 验证视频格式
     *
     * @param videoName
     */
    public void validVideoFormat(String videoName) {
        logger.info("验证视频格式, 视频名称: " + videoName);
        if (StringUtils.isBlank(videoName)) {
            throw new BusinessException("视频名不能为空");
        }
        //判断上传格式
        String prefix = videoName.substring(videoName.lastIndexOf(".") + 1);
        if (!("mp4".equals(prefix.toLowerCase())
                || "rmvb".equals(prefix.toLowerCase())
                || "avi".equals(prefix.toLowerCase())
                || "mkv".equals(prefix.toLowerCase())
                || "mpg".equals(prefix.toLowerCase())
                || "flv".equals(prefix.toLowerCase())
                || "wmv".equals(prefix.toLowerCase()))) {
            logger.error("文件格式有误");
            throw new BusinessException("视频格式有误, 系统目前支持mp4,rmvb,avi,mkv,mpg,flv,wmv");
        }
    }

    /**
     * 验证图片格式
     *
     * @param imgFile
     */
    public void validBase64ImgFormat(String imgFile) {
        if (imgFile == null || imgFile.isEmpty() || !imgFile.contains(","))
            throw new BusinessException("头像上传数据有误");

        //data:image/png;base64,base64编码的png图片数据
        String prefix = imgFile.split(",")[0].split("image/")[1].split(";")[0];

        logger.info("验证图片格式, 图片: " + imgFile);

        //判断上传格式
        if (!("jpeg".equals(prefix.toLowerCase())
                || "jpg".equals(prefix.toLowerCase())
                || "gif".equals(prefix.toLowerCase())
                || "png".equals(prefix.toLowerCase()))) {
            logger.error("文件格式有误");
            throw new BusinessException("图片格式有误, 系统目前支持jpeg, jpg, gif, png");
        }
    }

    /**
     * 字符串ids 转为 数组
     *
     * @param ids
     * @return
     */
    Integer[] idsString2IntegerArray(String ids) {
        String[] idStrArr = ids.split(",");
        Integer[] idArr = new Integer[idStrArr.length];
        int index = 0;
        for (String id : idStrArr) {
            idArr[index] = Integer.parseInt(id);
            index++;
        }
        return idArr;
    }

    /**
     * 字符串ids 转为 数组
     *
     * @param ids
     * @return
     */
    Long[] ids2LongArray(String ids) {
        String[] idStrArr = ids.split(",");
        Long[] idArr = new Long[idStrArr.length];
        int index = 0;
        for (String id : idStrArr) {
            idArr[index] = Long.parseLong(id);
            index++;
        }
        return idArr;
    }

    /**
     * 字符串ids 转为 数组
     *
     * @param ids
     * @return
     */
    Integer[] ids2IntArray(String ids) {
        String[] idStrArr = ids.split(",");
        Integer[] idArr = new Integer[idStrArr.length];
        int index = 0;
        for (String id : idStrArr) {
            idArr[index] = Integer.parseInt(id);
            index++;
        }
        return idArr;
    }


    protected boolean isSystemAdmin(HttpServletRequest request) {
        String roleNames = empRoleRelationService.getRoleCodesByEmpId(getCurrentEmployeeId(request));
        return StringUtils.contains(roleNames, RoleVO.SYSADMIN);
    }

    protected boolean isCustomerManager(HttpServletRequest request) {
        String roleNames = empRoleRelationService.getRoleCodesByEmpId(getCurrentEmployeeId(request));
        return StringUtils.contains(roleNames, RoleVO.CUSTOMER_MANAGER);
    }

    /**
     * 测试验收
     *
     * @param request
     * @return
     */
    protected boolean isUat(HttpServletRequest request) {
        String roleNames = empRoleRelationService.getRoleCodesByEmpId(getCurrentEmployeeId(request));
        return StringUtils.contains(roleNames, RoleVO.UAT);
    }

    /**
     * 绘制截图
     *
     * @param suffix
     * @param sourcePath
     * @param targetPath
     * @param startX
     * @param startY
     * @param endX
     * @param endY
     */
    protected void cutImage(String suffix, String sourcePath, String targetPath,
                            int startX, int startY, int endX, int endY) {
        try {
            Image img = null;
            ImageFilter cropFilter = null;
            File sourceImgFile = new File(sourcePath);
            BufferedImage bi = ImageIO.read(sourceImgFile);
            int srcWidth = bi.getWidth();
            int srcHeight = bi.getHeight();
            int destWidth = endX - startX;
            int destHeight = endY - startY;
            Image image = bi.getScaledInstance(srcWidth, srcHeight,
                    Image.SCALE_DEFAULT);
            if (srcHeight > 400) {
                cropFilter = new CropImageFilter(startX * srcHeight / 400,
                        startY * srcHeight / 400, destWidth * srcHeight / 400,
                        destHeight * srcHeight / 400);
            } else {
                cropFilter = new CropImageFilter(startX, startY, destWidth,
                        destHeight);
            }

            img = Toolkit.getDefaultToolkit().createImage(
                    new FilteredImageSource(image.getSource(), cropFilter));
            BufferedImage tag = new BufferedImage(1080, 1080,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = tag.getGraphics();
            g.drawImage(img, 0, 0, 1080, 1080, null);
            g.dispose();
            ImageIO.write(tag, suffix, new File(targetPath));

        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("上传失败, 系统繁忙! ");
        }
    }


    /**
     * 绘制截图并且让短边补白带
     * @param suffix
     * @param sourcePath
     * @param targetPath
     * @param startX
     * @param startY
     * @param endX
     * @param endY
     */
    protected void cutImageWithWhite(String suffix, String sourcePath, String targetPath,
                                     int startX, int startY, int endX, int endY) {
        try {
            Image img = null;
            ImageFilter cropFilter = null;
            File sourceImgFile = new File(sourcePath);
            BufferedImage bi = ImageIO.read(sourceImgFile);
            int srcWidth = bi.getWidth();
            int srcHeight = bi.getHeight();
            int destWidth = endX - startX;
            int destHeight = endY - startY;
            Image image = bi.getScaledInstance(srcWidth, srcHeight,
                    Image.SCALE_DEFAULT);
            if (srcHeight > 400) {
                cropFilter = new CropImageFilter(startX * srcHeight / 400,
                        startY * srcHeight / 400, destWidth * srcHeight / 400,
                        destHeight * srcHeight / 400);
            } else {
                cropFilter = new CropImageFilter(startX, startY, destWidth,
                        destHeight);
            }

            img = Toolkit.getDefaultToolkit().createImage(
                    new FilteredImageSource(image.getSource(), cropFilter));
            BufferedImage tag = new BufferedImage(1080, 1080,
                    BufferedImage.TYPE_INT_RGB);
            Graphics g = tag.getGraphics();
            g.drawImage(img, 0, 0, 1080, 1080, null);
            g.dispose();
            ImageIO.write(tag, suffix, new File(targetPath));//截图并保存完毕

        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("上传失败, 系统繁忙! ");
        }
    }

    /**
     * 临时图片上传并且让短边补白带(为截图做准备)
     *
     * @param files
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/uploadTmpPhotoWithWhite.do")
    public Map<String, Object> uploadFileWithWhite(@RequestParam("file") CommonsMultipartFile files) {
        logger.info("开始上传...");
        Map<String, Object> map = new HashMap<>();
        // 获取文件名称
        String myFileName = files.getOriginalFilename();

        validImgFormat(myFileName);
        String prefix = myFileName.substring(myFileName.lastIndexOf(".") + 1);
        // 生成文件夹路径
        String folderPath = generateTmpFolderPath();
        // 生成文件夹名
        String fileName = "tmp_" + UUID.randomUUID() + "_" + myFileName;
        File localFile = new File(folderPath + fileName);
        try {
            files.transferTo(localFile);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        try {
            //开始补白边
            File f = new File(folderPath + fileName); // 读入文件
            Image src = ImageIO.read(f); // 构造Image对象
            int width = src.getWidth(null); // 得到源图宽
            int height = src.getHeight(null); // 得到源图长
            BufferedImage biWhite = ImageIO.read(f);
            Image itemp = biWhite.getScaledInstance(width, height, biWhite.SCALE_SMOOTH);
            if (height > width) {
                width = height;
            } else if (height < width) {
                height = width;
            }
            BufferedImage imageWhite = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D gWhite = imageWhite.createGraphics();
            gWhite.setColor(new Color(240, 239, 242));
            gWhite.fillRect(0, 0, width, height);
            if (width == itemp.getWidth(null))
                gWhite.drawImage(itemp, 0, (height - itemp.getHeight(null)) / 2, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);
            else
                gWhite.drawImage(itemp, (width - itemp.getWidth(null)) / 2, 0, itemp.getWidth(null), itemp.getHeight(null), Color.white, null);
            gWhite.dispose();
            itemp = imageWhite;
            ImageIO.write((BufferedImage) itemp, prefix, f);
        } catch (IOException e) {
            e.printStackTrace();
        }
        map.put("fileName", fileName);
        map.put("originalImgName", myFileName);

        return map;
    }


    /**
     * 按参数规定长度和宽度绘制截图
     *
     * @param suffix
     * @param sourcePath
     * @param targetPath
     * @param startX
     * @param startY
     * @param endX
     * @param endY
     */
    protected void cutImageByXY(String suffix, String sourcePath, String targetPath,
                                int startX, int startY, int endX, int endY) {
        try {
            File sourceImgFile = new File(sourcePath);
            BufferedImage bi = ImageIO.read(sourceImgFile);
            int srcWidth = bi.getWidth();//原始宽度
            int srcHeight = bi.getHeight();//原始高度
            double nowHeight = 300d;//现在高度
            double nowWidth = srcWidth * 300d / srcHeight; //现在宽度
            double rateWidth = 1.0 * srcWidth / nowWidth;//宽度缩小放大倍率
            double rateHeight = 1.0 * srcHeight / nowHeight;//高度缩小放大倍率
            int width = endX - startX;//裁剪图片宽度
            int height = endY - startY;//裁剪图片高度
            Iterator iterator = ImageIO.getImageReadersByFormatName(suffix);
            ImageReader reader = (ImageReader) iterator.next();
            InputStream inputStream = new FileInputStream(sourcePath);
            ImageInputStream iis = ImageIO.createImageInputStream(inputStream);
            reader.setInput(iis, true);
            ImageReadParam param = reader.getDefaultReadParam();
            //(int)(startX * rateWidth): 原始图片开始裁剪X坐标位置，
            //(int)(startY * rateHeight)：原始图片开始裁剪Y坐标位置，
            //(int)(width * rateWidth)原始图片裁剪宽度，
            //(int)(height * rateHeight)原始图片裁剪高度
            Rectangle rectangle = new Rectangle((int) (startX * rateWidth), (int) (startY * rateHeight), (int) (width * rateWidth), (int) (height * rateHeight));/*指定截取范围*/
            param.setSourceRegion(rectangle);
            BufferedImage bi2 = reader.read(0, param);
            ImageIO.write(bi2, suffix, new File(targetPath));
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("上传失败, 系统繁忙! ");
        }
    }

    /**
     * 临时图片上传(为截图做准备)
     *
     * @param files
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/uploadTmpPhoto.do")
    public Map<String, Object> uploadFile(@RequestParam("file") CommonsMultipartFile files) {
        logger.info("开始上传...");
        Map<String, Object> map = new HashMap<>();
        // 获取文件名称
        String myFileName = files.getOriginalFilename();

        validImgFormat(myFileName);

        // 生成文件夹路径
        String folderPath = generateTmpFolderPath();
        // 生成文件夹名
        String fileName = "tmp_" + UUID.randomUUID() + "_" + myFileName;
        File localFile = new File(folderPath + fileName);
        try {
            files.transferTo(localFile);
        } catch (IllegalStateException | IOException e) {
            e.printStackTrace();
        }
        map.put("fileName", fileName);
        map.put("originalImgName", myFileName);

        return map;
    }

    public String getRemoteHost(javax.servlet.http.HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
    }

    /**
     * 生成表头
     */
    protected void createHeader(HSSFSheet sheet, String[] header) {
        // 设置表头
        HSSFRow headerRow = sheet.createRow(0);
        headerRow.setHeight((short) 500);
        for (int i = 0; i < header.length; i++) {
            HSSFCell cell = headerRow.createCell(i);// 创建一列
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(header[i]);
        }
    }

    /**
     * 根据list生成行
     *
     * @param sheet
     * @param list
     * @throws IllegalAccessException
     */
    protected void createRows(HSSFSheet sheet, List<?> list) throws IllegalAccessException {

        if (list == null || list.isEmpty()) return;

        // 填充数据
        int rowIndex = 1;
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        for (Object obj : list) {
            HSSFRow row = sheet.createRow(rowIndex);// 创建一行
            row.setHeight((short) 500);
            Field[] fields = obj.getClass().getDeclaredFields();
            for (Field field : fields) {
                if (!field.isAnnotationPresent(ExcelExport.class)) {
                    continue;
                }
                int sort = field.getAnnotation(ExcelExport.class).sort();
                HSSFCell cell = row.createCell(sort);// 创建一列
                //私有变量必须先设置Accessible为true
                field.setAccessible(true);
                //获取用get类方法。
                Object object = field.get(obj);
                if (object instanceof Integer) {
                    cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
                    cell.setCellValue(object != null ? ((Integer) object)
                            .intValue() : 0);
                    if (object != null && ((Integer) object).intValue() > 0) {
                        cell.setCellValue(((Integer) object).intValue());
                    } else {
                        cell.setCellValue("");
                    }
                } else if (object instanceof Date) {
                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                    cell.setCellValue(dateFormat.format(object));
                } else {
                    cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                    cell.setCellValue(object != null ? object
                            .toString() : "");
                }
            }
            rowIndex++;
        }
    }

}

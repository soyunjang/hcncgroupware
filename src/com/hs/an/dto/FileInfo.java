package com.hs.an.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class FileInfo {

    private int fileNum;
    private String filetype;
    private String filePath;
    private String fileChangeName;
    private String fileOriginalName;
    private String useYn;
    private String regId;
    private LocalDateTime regDt;

    public int getFileNum() {
        return fileNum;
    }

    public void setFileNum(int fileNum) {
        this.fileNum = fileNum;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileChangeName() {
        return fileChangeName;
    }

    public void setFileChangeName(String fileChangeName) {
        this.fileChangeName = fileChangeName;
    }

    public String getFileOriginalName() {
        return fileOriginalName;
    }

    public void setFileOriginalName(String fileOriginalName) {
        this.fileOriginalName = fileOriginalName;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    public String getRegId() {
        return regId;
    }

    public void setRegId(String regId) {
        this.regId = regId;
    }

    public LocalDateTime getRegDt() {
        return regDt;
    }

    public void setRegDt(LocalDateTime regDt) {
        this.regDt = regDt;
    }

    @Override
    public String toString() {
        return "FileInfo{" +
                "fileNum=" + fileNum +
                ", filetype='" + filetype + '\'' +
                ", filePath='" + filePath + '\'' +
                ", fileChangeName='" + fileChangeName + '\'' +
                ", fileOriginalName='" + fileOriginalName + '\'' +
                ", useYn='" + useYn + '\'' +
                ", regId='" + regId + '\'' +
                ", regDt=" + regDt +
                '}';
    }
}

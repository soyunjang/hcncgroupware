package com.hs.an.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FileInfoDto {

    private int fileNum;
    private String filetype;
    private String filePath;
    private String fileChangeName;
    private String fileOriginalName;
    private String useYn;
    private String regId;
    private LocalDateTime regDt;

}

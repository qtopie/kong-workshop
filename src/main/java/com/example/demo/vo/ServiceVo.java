/**
 * 
 */
package com.example.demo.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class ServiceVo implements Serializable {

  /**
   * Generated serialized version UID
   */
  private static final long serialVersionUID = -6081015555591182699L;
  
  private String id;
  private Integer createdAt;
  private Integer updatedAt;
  private String name;
  private Integer retries;
  private String protocol;
  private String host;
  private Integer port;
  private String path;
  private Integer connectTimeout;
  private Integer writeTimeout;
  private Integer readTimeout;
  private List<String> tags;
  private Map<String, String> clientCertificate;
  private Boolean tlsVerify;
  private Integer tlsVerifyDepth;
  private List<String> caCertificates;

}

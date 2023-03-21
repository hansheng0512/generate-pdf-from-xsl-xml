<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:r="http://ws.cmctos.com.my/ctosnet/response"
                version="1.0">

    <xsl:template name="section_a_template">
        
        <p class="title">
            A: SNAPSHOT
        </p>
        
        <table>
            <tr>
                <td class="table-left-width" valign="top">
                    
                    <xsl:call-template name="section_a_id_verification_template"/>

                    <br/>                                        
                    
                    <xsl:call-template name="section_a_credit_info_at_a_glance_template"/>
                    
                    <br/>
                    
                </td>
                <td class="table-center-width">
                    <br/>
                </td>
                <td class="table-right-width" valign="top">
                    
                    <!--<xsl:call-template name="section_a_sme_financial_health_indicator_template"/>-->
                    
                    <xsl:call-template name="section_a_fico_score_template"/>
                   
                      <!-- sme score -->
                    <xsl:call-template name="section_a_sme_score_template"/>
                   
                    <xsl:call-template name="section_a_ctos_litigation_index_template"/>
                    
                    <br/>
                    
                    <xsl:call-template name="section_a_stats_template"/>
                    
                    <br/>
                    
                </td>
            </tr>
        </table>
        
        <xsl:call-template name="section_a_directorships_and_business_interests_template"/>
        
    </xsl:template>
    
    <xsl:template name="lite_section_a_template">
        
        <p class="title">
            A: SNAPSHOT
        </p>
        
        <xsl:call-template name="lite_section_a_id_verification_template"/>
        
        <br/>                        
        
        <xsl:call-template name="section_a_directorships_and_business_interests_template"/>
        
    </xsl:template>
    
    <xsl:template name="fico_section_a_template">
        
        <p class="title">
            A: SNAPSHOT
        </p>
        
        <table>
            <tr>
                <td class="table-left-width" valign="top">
                    
                    <xsl:call-template name="section_a_id_verification_template"/>

                    <br/>                                        
                    
                    <xsl:call-template name="section_a_credit_info_at_a_glance_template"/>
                    
                    <br/>
                    
                </td>
                <td class="table-center-width">
                    <br/>
                </td>
                <td class="table-right-width" valign="top">
                    
                    <xsl:call-template name="section_a_fico_score_template"/>
                    
                    <br/>
                    
                    <!--<xsl:call-template name="section_a_sme_financial_health_indicator_template"/>-->
                    
                    <!--<xsl:call-template name="section_a_sme_score_template"/>-->
                    
                    <br/>
                    
<!--                    <xsl:call-template name="section_a_fico_probability_template"/>
                    
                    <br/>-->                                       
                    
<!--                    <xsl:call-template name="section_a_fico_credit_template"/>
                    
                    <br/>-->
                    
                    <xsl:call-template name="section_a_ctos_litigation_index_template"/>
                    
                    <br/>
                    
                    <xsl:call-template name="section_a_stats_template"/>
                    
                    <br/>
                    
                </td>
            </tr>
        </table>
        
        <xsl:call-template name="section_a_directorships_and_business_interests_template"/>
        
    </xsl:template>
    
    <!-- start section_a_id_verification_template -->
    <xsl:template name="section_a_id_verification_template">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <p class="title">
            ID Verification
        </p>
        
        <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype='I']">
            <xsl:call-template name="section_a_individual_id_verification_template"/> 
        </xsl:if>
        <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype='B' or @ptype='L']">
            <xsl:call-template name="section_a_business_id_verification_template"/>
        </xsl:if>
        <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype='C']">
            <xsl:call-template name="section_a_commercial_id_verification_template"/>    
        </xsl:if>
        
        
    </xsl:template>
    <!-- finish section_a_id_verification_template -->        

    <!-- start section_a_credit_info_at_a_glance_template -->
    <xsl:template name="section_a_credit_info_at_a_glance_template">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <p class="title">
            Credit Info at a Glance
        </p>
        
        <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype='I']">
            <xsl:call-template name="section_a_individual_credit_info_at_a_glance_template"/>
        </xsl:if>
                      
        <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype='C'] or ../r:summary/r:enq_sum[@seq = $seq][@ptype='B' or @ptype='L']">
            <xsl:call-template name="section_a_commercial_and_business_credit_info_at_a_glance_template"/>
        </xsl:if>
        
    </xsl:template>
    <!-- finish section_a_credit_info_at_a_glance_template -->

    <!-- start section_a_individual_id_verification_template -->
    <xsl:template name="section_a_individual_id_verification_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='I']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                
                <xsl:call-template name="section_a_individual_id_verification_sub_template_top"/>
                    
                <xsl:if test="r:section_a[@data = 'true']">

                    <xsl:for-each select="r:section_a/r:record">
                            
                        <xsl:if test="@rpttype = 'Id' or @rpttype = 'Ie' or @rpttype = 'If'">
                        
                            <xsl:call-template name="section_a_individual_id_verification_sub_template_bottom"/>
                        
                        </xsl:if>
                            
                    </xsl:for-each>
                
                </xsl:if>
                
                <xsl:if test="r:section_a[@data = 'false']">
                        
                    <xsl:call-template name="section_a_individual_id_verification_sub_template_bottom"/>
   
                </xsl:if>
                
            </table>
            
        </xsl:if>
        
    </xsl:template>
    <!-- finish section_a_individual_id_verification_template -->

    <!-- start section_a_individual_id_verification_sub_template_top -->
    <xsl:template name="section_a_individual_id_verification_sub_template_top">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption-left">Name (Your Input)</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">New ID / Old ID (Your Input)</th>
            <td class="long-content-left">
                <xsl:call-template name="join_string_with_delimiter">
                    <xsl:with-param name="value1" select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                    <xsl:with-param name="value2" select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                    <xsl:with-param name="delimiter" select="'/'"/>
                </xsl:call-template>
                <!--                /
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:call-template>-->
            </td>
        </tr>
        
    </xsl:template>
    <!-- finish section_a_individual_id_verification_sub_template_top -->

    <!-- start section_a_individual_id_verification_sub_template_bottom -->
    <xsl:template name="section_a_individual_id_verification_sub_template_bottom">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption-left">Name</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">New ID</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:nic_brno"/>
                </xsl:call-template>
            </td>                        
        </tr>
        <tr>
            <th class="caption-left">Old ID</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:ic_lcno"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Date of Birth</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:birth_date"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Nationality</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:nationality"/>
                </xsl:call-template>
                <xsl:if test="r:source and r:source != ''"> 
                    Source: <xsl:value-of select="r:source"/>
                </xsl:if>
            </td>
        </tr> 
        <tr>
            <th class="caption-left">Address 1</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr"/>
                </xsl:call-template>
                <xsl:if test="r:source and r:source != '' and r:addr and r:addr != ''">
                    <br/>Source: <xsl:value-of select="r:source"/>
                </xsl:if>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Address 2</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr1"/>                                    
                </xsl:call-template>
                
                <xsl:if test="r:addr1 and r:addr1 != ''"> <!-- and r:addr1 and r:addr1 != ''"> -->
                    <br/>Source: <xsl:value-of select="r:source"/>
                </xsl:if>
            </td>
        </tr>           
        <tr>
            <th class="caption-left">Ref No.</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:ref_no"/>
                </xsl:call-template>
            </td>
        </tr>
                              
        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status[@code != '1']">
            <tr>
                <th class="caption">
                    <font color="red">
                        Error
                    </font>
                </th>
                <td>
                    <font color="red">
                        <xsl:value-of select="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status"/>
                    </font>
                </td>
            </tr>
        </xsl:if>
        
    </xsl:template>
    <!-- start section_a_individual_id_verification_sub_template_bottom -->

    <!-- start section_a_business_id_verification_template -->
    <xsl:template name="section_a_business_id_verification_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='B' or @ptype='L']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                
                <xsl:call-template name="section_a_business_id_verification_sub_template_top"/>
                
                <xsl:if test="r:section_a[@data = 'true']">
                        
                    <xsl:for-each select="r:section_a/r:record[@seq = $seq]">
                            
                        <xsl:if test="@rpttype = 'CJ' or @rpttype = 'Ir'">
                        
                            <xsl:call-template name="section_a_business_id_verification_sub_template_bottom"/>
                            
                        </xsl:if>
                        
                        <xsl:if test="@rpttype = 'Id'">
                            
                            <xsl:call-template name="section_a_individual_id_verification_sub_template_bottom"/>
                            
                        </xsl:if>
                        
                    </xsl:for-each>
                    
                </xsl:if>
                
                <xsl:if test="r:section_a[@data = 'false']">
                        
                    <xsl:call-template name="section_a_business_id_verification_sub_template_bottom"/>
                        
                </xsl:if>
                
            </table>
            
        </xsl:if>
    </xsl:template>
    <!-- finish section_a_business_id_verification_template -->

    <!-- start section_a_business_id_verification_sub_template_top -->
    <xsl:template name="section_a_business_id_verification_sub_template_top">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption-left">Business Name (Your Input)</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Registration No (Your Input)</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                </xsl:call-template>
                <!--                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno = ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno = '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/> / <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>-->
            </td>
        </tr>
        
    </xsl:template>
    <!-- finish section_a_business_id_verification_sub_template_top -->

    <!-- start section_a_business_id_verification_sub_template_bottom -->
    <xsl:template name="section_a_business_id_verification_sub_template_bottom">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption-left">Business Name</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Registration No (Old/ New)</th>
            <td class="long-content-left">
                <xsl:call-template name="display_section_a_reg_no">
                    <xsl:with-param name="reg_num_1" select="r:register_no" />
                    <xsl:with-param name="reg_num_2" select="r:additional_registration_no" />
                </xsl:call-template>
            </td>                        
        </tr> 
        <tr>
            <th class="caption-left">Business Address</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Registration Date</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:reg_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Type</th>
            <td class="long-content-left">
                <xsl:if test="r:business_type = 'SP'">
                    SOLE PROPRIETOR
                </xsl:if>
                <xsl:if test="r:business_type = 'PN'">
                    PARTNERSHIP
                </xsl:if>
                <xsl:if test="not(r:business_type) or r:business_type = ''">
                    -
                </xsl:if>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Business Type</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:business_nature"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Business Commenced</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:business_commenced"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Last Changed Date</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:last_change_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Rob Search Date</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:cpo_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Current Registration Expiry Date</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:expiry_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Remark</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:remark"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Ref No.</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:ref_no"/>
                </xsl:call-template>
            </td>
        </tr>
                                       
        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status[@code != '1']">
            <tr>
                <th class="caption">
                    <font color="red">
                        Error
                    </font>
                </th>
                <td>
                    <font color="red">
                        <xsl:value-of select="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status"/>
                    </font>
                </td>
            </tr>
        </xsl:if>
        
    </xsl:template>
    <!-- finish section_a_business_id_verification_sub_template_bottom -->

    <!-- start section_a_commercial_id_verification_template -->
    <xsl:template name="section_a_commercial_id_verification_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='C']">
        
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                
                <xsl:call-template name="section_a_commercial_id_verification_sub_template_top"/>
                    
                <xsl:if test="r:section_a[@data = 'true']">                                       
                    
                    <xsl:for-each select="r:section_a/r:record">
                            
                        <xsl:if test="@rpttype = 'CE' or @rpttype = 'Cr'">
                        
                            <xsl:call-template name="section_a_commercial_id_verification_sub_template_bottom"/>
                        
                        </xsl:if>
                            
                    </xsl:for-each>
                    
                </xsl:if>
                    
                <xsl:if test="r:section_a[@data = 'false']">
                        
                    <xsl:call-template name="section_a_commercial_id_verification_sub_template_bottom"/>
                        
                </xsl:if>
                
            </table>
            
            <br/>
            
            <xsl:call-template name="section_a_financial_and_shareholders_template"/>
            
        </xsl:if>
    </xsl:template>
    <!-- finish section_a_commercial_id_verification_template -->    


    <!-- start section_a_commercial_id_verification_sub_template_top -->
    <xsl:template name="section_a_commercial_id_verification_sub_template_top">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption-left">Company Name (Your Input)</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Registration No (Your Input)</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:call-template>
                <!--                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno = ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno = '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/> / <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>-->
            </td>
        </tr>
        
    </xsl:template>
    <!-- finish section_a_commercial_id_verification_sub_template_top -->

    <!-- start section_a_commercial_id_verification_sub_template_bottom -->
    <xsl:template name="section_a_commercial_id_verification_sub_template_bottom">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption-left">Company Name</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Registration No (Old/ New)</th>
            <td class="long-content-left">
                <xsl:call-template name="display_section_a_reg_no">
                    <xsl:with-param name="reg_num_1" select="r:ic_lcno" />
                    <xsl:with-param name="reg_num_2" select="r:additional_registration_no" />
                    <xsl:with-param name="checksum" select="r:lc_checksum" />
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Registration Date</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:register_date"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Type of Company</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:comp_category"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:comp_type"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Registration Address</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr"/>
                </xsl:call-template>
            </td>
        </tr> 
        <tr>
            <th class="caption-left">Business Address</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr1"/>
                </xsl:call-template>
            </td>
        </tr> 
        <tr>
            <th class="caption-left">Business Sector</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:type_of_business"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Company Status</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:status"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Ref No.</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:ref_no"/>
                </xsl:call-template>
            </td>
        </tr>
                                        
        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status[@code != '1']">
            <tr>
                <th class="caption">
                    <font color="red">
                        Error
                    </font>
                </th>
                <td>
                    <font color="red">
                        <xsl:value-of select="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status"/>
                    </font>
                </td>
            </tr>
        </xsl:if>
        
    </xsl:template>
    <!-- finish section_a_commercial_id_verification_sub_template_bottom -->

    <!-- start section_a_financial_and_shareholders_template -->
    <xsl:template name="section_a_financial_and_shareholders_template">
        
        <xsl:if test="r:section_a/r:record[@rpttype = 'CE'] or r:section_a/r:record[@rpttype = 'Cr']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <p class="title">
                Financials and Shareholders
            </p>
            
            <xsl:for-each select="r:section_a/r:record">
        
                <table class="table">
                    <tr>
                        <th class="caption-left">Last Updated</th>
                        <td class="long-content-left">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:cpo_date"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption-left">Exempt Private Company</th>
                        <td class="long-content-left">
                            <xsl:for-each select="r:accounts/r:account[@seq = '1']">
                                <xsl:choose>
                                    <xsl:when test="r:exempted and r:exempted = 'true'">
                                        Yes 
                                    </xsl:when>
                                    <xsl:otherwise>
                                        No 
                                    </xsl:otherwise>
                                </xsl:choose>
<!--                                <xsl:if test="r:pldd and r:pldd != ''">
                                    (<xsl:value-of select="r:pldd"/>)
                                </xsl:if>-->
                            </xsl:for-each>
                        </td>
                    </tr>                                        
                    <tr>
                        <th class="caption-left">Previous Name Change</th>
                        <td class="long-content-left">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:previous_names/r:previous_name/r:name"/>
                            </xsl:call-template>
                            <xsl:if test="r:previous_names/r:change_date and r:previous_names/r:change_date != ''">
                                <br/>
                                (<xsl:value-of select="r:previous_names/r:change_date"/>)
                            </xsl:if>
                        </td>
                    </tr>                                        
                    <tr>
                        <th class="caption-left">Revenue (RM)</th>
                        <td class="long-content-left">                            
                            <xsl:if test="r:ic_lcno and r:ic_lcno != ''">
                                    
                                <xsl:for-each select="r:accounts/r:account[@seq = '1']">
                                    <xsl:if test="r:turnover and r:turnover != ''">
                                                                        
                                        <xsl:call-template name="check_empty_number">
                                            <xsl:with-param name="number" select="r:turnover"/>
                                        </xsl:call-template>
                                    
                                    </xsl:if>                                
                                
                                    <xsl:if test="not(r:turnover) or r:turnover = ''">
                                    
                                        Refer to FS Latest Year
                                    
                                    </xsl:if>
                                </xsl:for-each>
                                    
                            </xsl:if>
                            <xsl:if test="not(r:ic_lcno) or r:ic_lcno = ''">
                                    
                                -
                                    
                            </xsl:if>                            
                        </td>
                    </tr>
                    <tr>
                        <th class="caption-left">Profit After Tax (RM)</th>
                        <td class="long-content-left">
                            <xsl:for-each select="r:accounts/r:account[@seq = '1']">
                                <xsl:if test="r:plnpbt and r:plnpbt != ''">
                                                                        
                                    <xsl:call-template name="check_empty_number">
                                        <xsl:with-param name="number" select="r:plnpat"/>
                                    </xsl:call-template>
                                    
                                </xsl:if>
                                
                                <xsl:if test="not(r:plnpbt) or r:plnpbt = ''">
                                    
                                    -
                                    
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption-left">Total Assets (RM)</th>
                        <td class="long-content-left">
                            <xsl:for-each select="r:accounts/r:account[@seq = '1']">
                                <xsl:choose>
                                    <xsl:when test="r:exempted and r:exempted = 'false'">
                                        <xsl:if test="r:totass and r:totass != ''">
                                                                        
                                            <xsl:call-template name="check_empty_number">
                                                <xsl:with-param name="number" select="r:totass"/>
                                            </xsl:call-template>
                                    
                                        </xsl:if>
                                
                                        <xsl:if test="not(r:totass) or r:totass = ''">
                                    
                                            -
                                    
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        EPC
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption-left">Paid-Up Capital (RM)</th>
                        <td class="long-content-left">
                            <xsl:call-template name="check_empty_number">
                                <xsl:with-param name="number" select="r:paid_up"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption-left">Total Company Charges</th>
                        <td class="long-content-left">
                            <xsl:call-template name="check_empty_number">
                                <xsl:with-param name="number" select="r:charges/@total"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption-left">Directorship</th>
                        <td class="long-content-left">
                            <xsl:for-each select="r:directors/r:director[r:position = 'DO' or r:position = 'DS' or r:position = 'AD']">
                                <xsl:if test="position() &lt; '6'">
                                    <xsl:call-template name="check_empty_string">
                                        <xsl:with-param name="value" select="r:name"/>
                                    </xsl:call-template>
                                    <xsl:if test="r:alias != ''">
                                        @ <xsl:value-of select="r:alias"/>
                                    </xsl:if>
                                    <br/>
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption-left">Top 5 Shareholders</th>
                        <td class="long-content-left">
                            <xsl:for-each select="r:directors/r:director[r:position = 'SO' or r:position = 'DS']">
                                <xsl:if test="position() &lt; '6'">
                                    <xsl:call-template name="check_empty_string">
                                        <xsl:with-param name="value" select="r:name"/>
                                    </xsl:call-template>
                                    <xsl:if test="r:alias != ''">
                                        @ <xsl:value-of select="r:alias"/>
                                    </xsl:if>
                                    <br/>
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    
                </table>
                
            </xsl:for-each>
            
        </xsl:if>
        
    </xsl:template>
    <!-- finish section_a_financial_and_shareholders_template -->

    <!-- start section_a_individual_credit_info_at_a_glance_template -->
    <xsl:template name="section_a_individual_credit_info_at_a_glance_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='I']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                <tr>
                    <td class="header" width="70%">Credit Info</td>
                    <td class="header text-center" width="6%">Source</td>
                    <td class="header text-center" width="24%">Value</td>
                </tr>
                <tr>
                    <th class="caption">
                        Bankruptcy Proceedings Record
                    </th>
                    <td class="vertical-center">
                        Newspaper/
                        <br/>
                        Gazette
                    </td>
                    <td class="vertical-center">
                        <xsl:call-template name="convert_value_to_boolean1">
                            <xsl:with-param name="value" select="r:section_summary/r:ctos/r:bankruptcy/@status"/>
                        </xsl:call-template>
                    </td>
                </tr>
                <tr>
                    <th rowspan="2" class="caption">
                        Legal records in past 24 months
                        <br/>
                        (personal capacity)
                        <br/>
                        - Number
                        <br/>
                        - Value
                    </th>
                    <td rowspan="2">
                        CTOS
                    </td>
                    <td>
                        
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_personal_capacity) and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and not(r:section_summary/r:ctos/r:legal)">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>

                    </td>
                </tr>
                <tr>
                    <td>
                        
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_personal_capacity) and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and not(r:section_summary/r:ctos/r:legal)">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>

                    </td>
                </tr>
                <tr>
                    <th rowspan="2" class="caption">
                        Legal records in past 24 months
                        <br/>
                        (non-personal capacity)
                        <br/>
                        - Number
                        <br/>
                        - Value
                    </th>
                    <td rowspan="2">
                        CTOS
                    </td>
                    <td>
                        
                        <xsl:if test="r:section_summary/r:ctos/r:legal_non_personal_capacity">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_non_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_non_personal_capacity)">
                            NO
                        </xsl:if>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        <xsl:if test="r:section_summary/r:ctos/r:legal_non_personal_capacity">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_non_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_non_personal_capacity)">
                            NO
                        </xsl:if>

                    </td>
                </tr>
                <tr>
                    <th class="caption">
                        Availability of Legal Records
                    </th>
                    <td>
                        BNM
                    </td>                    
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:if test="r:section_ccris and r:section_ccris/r:summary/r:legal">
                                    <xsl:if test="r:section_ccris/@data = 'true' and r:section_ccris/r:summary/r:legal/@status = '1'">
                                        YES
                                    </xsl:if>
                                    <xsl:if test="r:section_ccris/@data = 'false' or r:section_ccris/r:summary/r:legal/@status = '0'">
                                        NO
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(r:section_ccris) or not(r:section_ccris/r:summary/r:legal)">
                                    NO
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <th class="caption">
                        Special Attention Accounts
                    </th>
                    <td>
                        BNM
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:if test="r:section_ccris and r:section_ccris/r:summary/r:special_attention">
                                    <xsl:if test="r:section_ccris/@data = 'true' and r:section_ccris/r:summary/r:special_attention/@status = '1'">
                                        YES
                                    </xsl:if>
                                    <xsl:if test="r:section_ccris/@data = 'false' or r:section_ccris/r:summary/r:special_attention/@status = '0'">
                                        NO
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(r:section_ccris) or not(r:section_ccris/r:summary/r:special_attention)">
                                    NO
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <th rowspan="3" class="caption">
                        Outstanding credit facilities
                        <br/>
                        - Number
                        <br/>
                        - Value
                        <br/>
                        - Installments in arrears in past 15 months
                    </th>
                    <td rowspan="3">
                        BNM
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:facility/@total"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_empty_and_format_currency">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:facility/@value"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="convert_value_to_boolean1">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:facility/@arrears"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>                
                <tr>
                    <th rowspan="3" class="caption">
                        Credit applications in past 15 months
                        <br/>
                        - Total
                        <br/>
                        - Approved
                        <br/>
                        - Pending
                    </th>
                    <td rowspan="3">
                        BNM
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:application/@total"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>                
                <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:application/@approved"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:application/@pending"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <!--                
                <tr>
                    <th class="caption">
                        Availability of Trade Referee Listing
                    </th>
                    <td>
                        CTOS
                    </td>
                    <td>
                        <xsl:call-template name="convert_value_to_boolean1">
                            <xsl:with-param name="value" select="r:section_summary/r:tr/r:trex_ref/@negative"/>
                        </xsl:call-template>
                    </td>
                </tr>
                -->
            </table>
        </xsl:if>
    </xsl:template>
    <!-- finish section_a_individual_credit_info_at_a_glance_template -->

    <!-- start section_a_commercial_and_business_credit_info_at_a_glance_template -->
    <xsl:template name="section_a_commercial_and_business_credit_info_at_a_glance_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='C'] or ../r:summary/r:enq_sum[@ptype='B' or @ptype='L']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                <tr>
                    <td class="header" width="70%">Credit Info</td>
                    <td class="header text-center">Source</td>
                    <td class="header text-center">Entity</td>
                    <td class="header text-center">Related<br/>Parties</td>
                </tr>
                <tr>
                    <th class="caption">
                        Winding Up / Bankruptcy Proceedings Record
                    </th>
                    <td>
                        Newspaper/
                        <br/>
                        Gazette
                    </td>
                    <td>
                        <xsl:call-template name="convert_value_to_boolean1">
                            <xsl:with-param name="value" select="r:section_summary/r:ctos/r:bankruptcy/@status"/>
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:call-template name="convert_value_to_boolean1">
                            <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:bankruptcy/@status"/>
                        </xsl:call-template>
                    </td>
                </tr>
                <tr>
                    <th rowspan="2" class="caption">
                        Legal records in past 24 months
                        <br/>
                        (personal capacity)
                        <br/>
                        - Number
                        <br/>
                        - Value
                    </th>
                    <td rowspan="2">
                        <xsl:choose>
                            <xsl:when test="r:section_summary/r:ctos/r:legal_personal_capacity and r:section_summary/r:ctos/r:legal_personal_capacity/r:source">
                                <xsl:choose>
                                    <xsl:when test="r:section_summary/r:ctos/r:legal_personal_capacity/@total &gt; 1">
                                        <xsl:for-each select="r:section_summary/r:ctos/r:legal_personal_capacity/r:source">
                                            <xsl:value-of select="@name"/>
                                            <br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="r:section_summary/r:ctos/r:legal_personal_capacity/r:source/@name"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                NO
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_personal_capacity) and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and not(r:section_summary/r:ctos/r:legal)">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_personal_capacity) and not(r:section_summary/r:ctos/r:legal)">
                            NO
                        </xsl:if>

                    </td>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity and r:section_summary/r:ctos/r:related_parties/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity) and r:section_summary/r:ctos/r:related_parties/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity and not(r:section_summary/r:ctos/r:related_parties/r:legal)">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity) and not(r:section_summary/r:ctos/r:related_parties/r:legal)">
                            NO
                        </xsl:if>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_personal_capacity) and r:section_summary/r:ctos/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_personal_capacity and not(r:section_summary/r:ctos/r:legal)">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_personal_capacity) and not(r:section_summary/r:ctos/r:legal)">
                            NO
                        </xsl:if>
                    </td>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity and r:section_summary/r:ctos/r:related_parties/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity) and r:section_summary/r:ctos/r:related_parties/r:legal">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity and not(r:section_summary/r:ctos/r:related_parties/r:legal)">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:related_parties/r:legal_personal_capacity) and not(r:section_summary/r:ctos/r:related_parties/r:legal)">
                            NO 
                        </xsl:if>
                    </td>
                </tr>                
                <tr>
                    <th rowspan="2" class="caption">
                        Legal records in past 24 months
                        <br/>
                        (non-personal capacity)
                        <br/>
                        - Number
                        <br/>
                        - Value
                    </th>
                    <td rowspan="2">
                        <xsl:choose>
                            <xsl:when test="r:section_summary/r:ctos/r:legal_non_personal_capacity and r:section_summary/r:ctos/r:legal_non_personal_capacity/r:source">
                                <xsl:choose>
                                    <xsl:when test="r:section_summary/r:ctos/r:legal_non_personal_capacity/@total &gt; 1">
                                        <xsl:for-each select="r:section_summary/r:ctos/r:legal_non_personal_capacity/r:source">
                                            <xsl:value-of select="@name"/>
                                            <br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="r:section_summary/r:ctos/r:legal_non_personal_capacity/r:source/@name"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                NO
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_non_personal_capacity">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_non_personal_capacity/@total"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_non_personal_capacity)">
                            NO
                        </xsl:if>

                    </td>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:related_parties/r:legal_non_personal_capacity">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal_non_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:related_parties/r:legal_non_personal_capacity)">
                            NO
                        </xsl:if>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:legal_non_personal_capacity">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:legal_non_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:legal_non_personal_capacity)">
                            NO
                        </xsl:if>

                    </td>
                    <td>
                        <xsl:if test="r:section_summary/r:ctos/r:related_parties/r:legal_non_personal_capacity">
                            <xsl:call-template name="check_null">
                                <xsl:with-param name="value" select="r:section_summary/r:ctos/r:related_parties/r:legal_non_personal_capacity/@value"/>
                            </xsl:call-template>
                        </xsl:if>
                        <xsl:if test="not(r:section_summary/r:ctos/r:related_parties/r:legal_non_personal_capacity)">
                            NO
                        </xsl:if>

                    </td>
                </tr>
                <tr>
                    <th class="caption">
                        Availability of Legal Records
                    </th>
                    <td>
                        BNM
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:if test="r:section_summary/r:section_ccris/r:summary/r:legal">
                                    <xsl:if test="r:section_summary/r:section_ccris/r:summary/r:legal/@status = '0'">
                                        NO
                                    </xsl:if>
                                    <xsl:if test="r:section_summary/r:section_ccris/r:summary/r:legal/@status = '1'">
                                        YES
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(r:section_summary/r:section_ccris/r:summary/r:legal)">
                                    NO
                                </xsl:if>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                NO
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <th class="caption">
                        Special Attention Accounts
                    </th>
                    <td>
                        BNM
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="convert_value_to_boolean1">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:special_attention/@accounts"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="convert_value_to_boolean1">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:related_parties/r:special_attention/@accounts"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <th rowspan="3" class="caption">
                        Outstanding credit facilities
                        <br/>
                        - Number
                        <br/>
                        - Value
                        <br/>
                        - Installments in arrears in past 12 months
                    </th>
                    <td rowspan="3">
                        BNM
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:facility/@total"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:related_parties/r:facility/@total"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_empty_and_format_currency">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:facility/@value"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_empty_and_format_currency">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:related_parties/r:facility/@value"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td>  
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">                      
                                <xsl:call-template name="convert_value_to_boolean1">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:facility/@arrears"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="convert_value_to_boolean1">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:related_parties/r:facility/@arrears"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>                
                <tr>
                    <th rowspan="3" class="caption">
                        Credit applications in past 12 months
                        <br/>
                        - Total
                        <br/>
                        - Approved
                        <br/>
                        - Pending
                    </th>
                    <td rowspan="3">
                        BNM
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:application/@total"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:related_parties/r:application/@total"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>                
                <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:application/@approved"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:related_parties/r:application/@approved"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:application/@pending"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                    <td>
                        <xsl:choose>
                            <xsl:when test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1'">
                                <xsl:call-template name="check_null">
                                    <xsl:with-param name="value" select="r:section_summary/r:ccris/r:related_parties/r:application/@pending"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                NOT SELECTED
                            </xsl:otherwise>
                        </xsl:choose>
                    </td>
                </tr>
                <!--
<tr>
    <th class="caption">
        Availability of Trade Referee Listing
    </th>
    <td>
        CTOS
    </td>
    <td>
        <xsl:if test="r:section_summary/r:tr/r:trex_ref">
            <xsl:if test="r:section_summary/r:tr/r:trex_ref/@negative = '0'">
                NO
            </xsl:if>
            <xsl:if test="r:section_summary/r:tr/r:trex_ref/@negative = '1'">
                YES
            </xsl:if>
        </xsl:if>
        <xsl:if test="not(r:section_summary/r:tr/r:trex_ref)">
            NO
        </xsl:if>
    </td>
    <td>
        NO
    </td>
</tr>
                -->
            </table>
        </xsl:if>
    </xsl:template>
    <!-- finish section_a_commercial_and_business_credit_info_at_a_glance_template -->

    <!-- start section_a_directorships_and_business_interests_template -->
    <xsl:template name="section_a_directorships_and_business_interests_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype != 'C'] and r:section_c[@data = 'true']">
        
            <p class="title">
                Top 5 Directorships &amp; Business Interests
            </p>

            <table class="table">
                <p class="notice">Note: The percentage of shareholding is not computed due to the number of shares information in this report comprises of Preference Shares/ Other Shares. Please purchase Form 24 from Idaman to accurately determine percentage of shareholdings for each shareholder.</p>
                <tr>
                    <td class="header text-center" width="18%">Company</td>
                    <td class="header text-center" width="16%">Position</td>
                    <td class="header text-center" width="10%">Appoint Date</td>
                    <td class="header text-center" width="14%">Resign Date</td>
                    <td class="header text-center" width="18%">Profit After Tax (RM)</td>
                    <td class="header text-center" width="8%">Year</td>
                    <td class="header text-center" width="8%">Status</td>
                    <td class="header text-center" width="8%">Shareholding (%)</td>
                </tr>
                            
                <xsl:for-each select="r:section_c/r:record[@seq &lt; '6']">
                    <tr>
                        <td class="text-center">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:company_name"/>
                            </xsl:call-template>
                        </td>
                        <td class="text-center">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:position"/>
                            </xsl:call-template>
                        </td>
                        <td class="text-center">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:appoint"/>
                            </xsl:call-template>
                        </td>
                        <td class="text-center">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:resign"/>
                            </xsl:call-template>
                        </td>
                        <td class="text-right">
                            <xsl:call-template name="check_empty_number">
                                <xsl:with-param name="number" select="r:protif_after_tax"/>
                            </xsl:call-template>
                        </td>
                        <td class="text-center">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:latest_financial_year"/>
                            </xsl:call-template>
                        </td>
                        <td class="text-center">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:status"/>
                            </xsl:call-template>
                        </td>
                        <td class="text-center">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:total_shares_percentage"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                </xsl:for-each>
            </table>  
            
            <br/>
                                 
        </xsl:if>
    </xsl:template>
    <!-- finish section_a_directorships_and_business_interests_template -->

    <!-- start section_a_fico_score_template -->
    <xsl:template name="section_a_fico_score_template">
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>

        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_code[@code = 4]">        
            <p class="title text-center">
                CTOS Score
            </p>
        
            
            <xsl:variable name="fico_score">
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index and ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '300' and ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '0'">
                    <xsl:value-of select="(((../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score - '300') div '550') * '100')"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score = '300'">
                    <xsl:value-of select="'1'"/>
                </xsl:if>
                <xsl:if test="not(../r:summary/r:enq_sum[@seq = $seq]/r:fico_index) or ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score = '0'">
                    <xsl:value-of select="'25'"/>
                </xsl:if>
            </xsl:variable>
        
            <table style="border-spacing: 0px; border: 1px solid #000000; padding: 0px 0px 0px 0px;" width="100%">
                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table style="border-spacing: 0px; border: 0px; padding: 0px 0px 0px 0px;" width="90%">
                            <tr>
                                <td colspan="2">
                                    <table style="border-spacing: 0px; border: 0px; padding: 0px 0px 0px 0px;" width="100%">
                                        <tr>
                                            <td>
                                                <xsl:attribute name="width">
                                                    <xsl:value-of select="concat(format-number($fico_score, '##0'), '%')" />
                                                </xsl:attribute>
                                            </td>
                                            <td class="text-left" valign="bottom">
                                                <p style="font-size: 5pt;">
                                                    <b>                                                    
                                                        <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index and ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '0'">
                                                        &#160;
                                                            <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score"/>
                                                        </xsl:if>
                                                    </b>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>                                        
                                            <td>
                                                <xsl:attribute name="width">
                                                    <xsl:value-of select="concat(format-number($fico_score, '##0'), '%')" />
                                                </xsl:attribute>
                                            </td>
                                            <td class="text-left" valign="bottom">
                                                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index and ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '0'">
                                                    <img style="width: 20px; height: 8px">
                                                        <xsl:attribute name="src">
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'arrow_down.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:attribute>
                                                    </img>
                                                </xsl:if>
                                                <xsl:if test="not(../r:summary/r:enq_sum[@seq = $seq]/r:fico_index) or ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score = '0'">
                                                    <p style="font-size: 8pt;">
                                                        No Score Generated
                                                    </p>
                                                </xsl:if>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>                        
                            <tr>
                                <td colspan="2" class="text-center" valign="top">
                                    <img style="width: 100%; height: 26px">
                                        <xsl:attribute name="src">
                                            <xsl:call-template name="image_template">
                                                <xsl:with-param name="image" select="'dog_bone.png'"/>
                                            </xsl:call-template>
                                        </xsl:attribute>
                                    </img>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left">
                                    <p style="font-size: 5pt;">&#160;&#160;&#160;300</p>
                                </td>
                                <td class="text-right">
                                    <p style="font-size: 5pt;">850&#160;&#160;&#160;</p>
                                </td>
                            </tr>                        
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br/>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <img style="width: 90%">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'score_table.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </td>
                </tr>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index and ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '0'">
                    <xsl:call-template name="section_a_fico_factor_template"/>
                </xsl:if>
                <xsl:if test="not(../r:summary/r:enq_sum[@seq = $seq]/r:fico_index) or ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score = '0'">
                    <tr colspan="2">                    
                        <td>
                            <table style="border-spacing: 0px; border: 0px; padding: 0px 0px 5px 40px;" width="80%">
                                <tr>
                                    <td class="text-center">
                                        <p style="font-size: 8pt;">
                                            <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/r:fico_factor/."/>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </xsl:if>
            
            </table>
            <br/>
        </xsl:if>
    </xsl:template>
    <!-- finish section_a_fico_score_template -->

    <!-- start section_a_sme_financial_health_indicator_template -->
    <xsl:template name="section_a_sme_financial_health_indicator_template">
            
        <xsl:if test="r:section_a/r:record[@rpttype = 'CE']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:include_sfi and //r:summary/r:enq_sum[@seq = $seq]/r:include_sfi = '1' and //r:summary/r:enq_sum[@seq = $seq]/r:enq_code[@code != 11]">
        
                <p class="title text-center">CTOS SME Financial Health Indicator</p>
                
                <xsl:for-each select="r:section_a/r:record[@seq = $seq]">
                
                    <table style="border-spacing: 0px; border: 1px solid #000000; padding: 0px 10px 0px 10px;" width="100%">
                        <tr>
                            <td>
                                <table style="border-spacing: 0px; border: 0px solid #000000; padding: 5px 0px 5px 0px;" width="100%">
                                    <tr>
                                        <td>
                                            <img>
                                                <xsl:attribute name="src">
                                                    <xsl:choose>
                                                        <xsl:when test="r:sme_financial_score/r:health/@code = 'A'">
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'sme_financial_score_a_short.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:when test="r:sme_financial_score/r:health/@code = 'B'">
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'sme_financial_score_b_short.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:when test="r:sme_financial_score/r:health/@code = 'C'">
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'sme_financial_score_c_short.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:when test="r:sme_financial_score/r:health/@code = 'D'">
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'sme_financial_score_d_short.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:when test="r:sme_financial_score/r:health/@code = 'E'">
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'sme_financial_score_e_short.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:when test="r:sme_financial_score/r:health/@code = 'F'">
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'sme_financial_score_f_short.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:call-template name="image_template">
                                                                <xsl:with-param name="image" select="'sme_financial_score_na_short.png'"/>
                                                            </xsl:call-template>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">100%</xsl:attribute>
                                                <xsl:attribute name="width">100%</xsl:attribute>
                                            </img>
                                        </td>                   
                                    </tr>                    
                                    <tr>
                                        <td>
                                            <p class="text-justify" style="font-size: 8pt;">
                                                <xsl:value-of select="r:sme_financial_score/r:health"/>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                                <table style="border-spacing: 0px; border: 0px solid #000000; padding: 5px 0px 5px 0px;" width="100%">
                                    <tr>
                                        <td width="30%">                                                           
                                            <img>
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_mue_short.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">24</xsl:attribute>
                                                <xsl:attribute name="width">65</xsl:attribute>
                                            </img>
                                        </td>
                                        <td width="70%">                                
                                            <p class="text-left bold" style="font-size: 8pt;">
                                    &#160;
                                                <xsl:call-template name="check_empty_string">
                                                    <xsl:with-param name="value" select="r:sme_financial_score/r:limit"/>
                                                </xsl:call-template>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                                <table style="border-spacing: 0px; border: 0px solid #000000; padding: 5px 0px 5px 0px;" width="100%">
                                    <tr>
                                        <td>
                                            <p class="notice-no-border">DISCLAIMER: Please refer to disclaimer in Financial Highlights Section.</p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </xsl:for-each>
                                
                <br/>
            
            </xsl:if>
        
        </xsl:if>
        
    </xsl:template>
    <!-- finish section_a_sme_financial_health_indicator_template -->

    <!-- start section_a_fico_probability_template -->
    <xsl:template name="section_a_fico_probability_template">
        
        <p class="title text-center">
            Probability of Default: 10%
        </p>

        <table style="border-spacing: 0px; border: 1px solid #000000; padding: 0px 0px 0px 0px;" width="100%">
            <tr>
                <td align="center">
                    <table width="90%">
                        <tr>
                            <td>
                                <br/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">                                
                                <div style="background-color: white; border: solid 1px black;">
                                    <div style="background-color: gray; width: 10%; text-align: center; color: white;">
                                        <br/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">
                                <p style="font-size: 5pt;">0%</p>
                            </td>
                            <td class="text-right">
                                <p style="font-size: 5pt;">100%</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </xsl:template>
    <!-- finish section_a_fico_probability_template -->

    <!-- start section_a_fico_factor_template -->
    <xsl:template name="section_a_fico_factor_template">

        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <td>
                <br/>
            </td>
        </tr>
        <tr>
            <td style="font-size: 8pt; padding: 2px 20px 2px 10px;">
                <b>
                    <u>Factors that influence the Score</u>
                </b>
            </td>
        </tr>
        <tr>
            <td>                    
                <table style="border-spacing: 0px; border: 0px; padding: 2px 20px 2px 20px" width="100%">                        
                    <tr>
                        <td>
                            <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index">
                                <ol start="1">
                                    <xsl:for-each select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/r:fico_factor[@code !='']">
                                        <li style="font-size: 8pt; text-align: justify;">
                                            <xsl:value-of select="."/>
                                        </li>
                                        <xsl:if test="position() != last()">
                                            <br/>
                                        </xsl:if>
                                    </xsl:for-each>
                                </ol>
                            </xsl:if>
                            <xsl:if test="not(../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/r:fico_factor[@code !=''])">
                                -
                            </xsl:if>
                        </td>
                    </tr>                        
                </table>
            </td>
        </tr>
        
    </xsl:template>
    <!-- finish section_a_fico_factor_template -->

    <!-- start section_a_fico_credit_template -->
    <xsl:template name="section_a_fico_credit_template">
        
        <p class="title text-center">
            FICO Credit Capacity Index
        </p>
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <xsl:variable name="credit_index">
            <!--            <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index and ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '300'">
                <xsl:value-of select="(((../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score - '1') div '8') * '100')"/>
            </xsl:if>
            <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score = '300'">
                <xsl:value-of select="'1'"/>
            </xsl:if>
            <xsl:if test="not(../r:summary/r:enq_sum[@seq = $seq]/r:fico_index)">
                <xsl:value-of select="'50'"/>
            </xsl:if>-->
            
            <xsl:value-of select="((('4' - '1') div '8') * '100')"/>
        </xsl:variable>
        
        <table style="border-spacing: 0px; border: 1px solid #000000; padding: 0px 0px 0px 0px;" width="100%">
            <tr>
                <td align="center">
                    <table style="border-spacing: 0px; border: 0px; padding: 0px 0px 0px 0px;" width="90%">
                        <tr>
                            <td colspan="2">
                                <table style="border-spacing: 0px; border: 0px; padding: 0px 0px 0px 0px;" width="100%">
                                    <tr>
                                        <td>
                                            <xsl:attribute name="width">
                                                <xsl:value-of select="concat(format-number($credit_index, '##0'), '%')" />
                                            </xsl:attribute>
                                        </td>
                                        <td class="text-left" valign="bottom">
                                            <p style="font-size: 5pt;">
                                                <b>                                                    
                                                    <xsl:if test="not(../r:summary/r:enq_sum[@seq = $seq]/r:fico_index)">
                                                        &#160;&#160;&#160;-
                                                    </xsl:if>
                                                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index">
                                                        &#160;&#160;&#160;
                                                        <!--<xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score"/>-->
                                                        4
                                                    </xsl:if>
                                                </b>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>                                        
                                        <td>
                                            <xsl:attribute name="width">
                                                <xsl:value-of select="concat(format-number($credit_index, '##0'), '%')" />
                                            </xsl:attribute>
                                        </td>
                                        <td class="text-left" valign="bottom">
                                            <img style="width: 15px; height: 8px">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'arrow_down.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                            </img>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>                        
                        <tr>
                            <td colspan="2" class="text-center" valign="top">
                                <img style="width: 100%; height: 26px">
                                    <xsl:attribute name="src">
                                        <xsl:call-template name="image_template">
                                            <xsl:with-param name="image" select="'dog_bone.png'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </img>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">
                                <p style="font-size: 5pt;">&#160;&#160;&#160;&#160;&#160;&#160;1</p>
                            </td>
                            <td class="text-right">
                                <p style="font-size: 5pt;">9&#160;&#160;&#160;&#160;&#160;&#160;</p>
                            </td>
                        </tr>                        
                    </table>
                </td>
            </tr>
        </table>
        
    </xsl:template>
    <!-- finish section_a_fico_credit_template -->
    
    <!-- start section_a_sme_score_template -->
    <xsl:template name="section_a_sme_score_template">
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable> 
        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_code[@code = 11]">
            <table style="border-spacing: 0px; border: 1px solid #000000; padding: 0px 5px 0px 5px;" width="100%">
                <!-- start SME score business -->
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype = 'B']">
                    <tr>
                        <td align="center" colspan="2">
                            <table style="border-spacing: 0px; border: 0px; padding: 0px 10px 5px 10px;" width="90%">                     
                                <tr>
                                    <td colspan="2" class="text-center" valign="top">
                                        <img style="width: 70%; height: 20px">
                                            <xsl:attribute name="src">
                                                <xsl:call-template name="image_template">
                                                    <xsl:with-param name="image" select="'ctos_sme_score.png'"/>
                                                </xsl:call-template>
                                            </xsl:attribute>
                                        </img>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <table class="table-sme" align="center">
                                <tr>
                                    <th class="sme-header" >Business Owner(s) / Partner(s)</th>
                                    <th class="sme-header" >CTOS SME Score</th>
                                    <th class="sme-header" >Range</th>
                                </tr>
                                <xsl:for-each select="../r:summary/r:enq_sum[@ptype='I']">
                                    <tr>
                                        <td class="text-center">
                                            <xsl:call-template name="check_empty_string">
                                                <xsl:with-param name="value" select="r:name"/>
                                            </xsl:call-template>
                                        </td>
                                        <td class="text-center">
                                            <xsl:if test="r:fico_index/@score != '' or r:fico_index/@score != '0'">
                                                <xsl:value-of select="r:fico_index/@score" />
                                            </xsl:if>
                                            <xsl:if test="not(r:fico_index/@score) or r:fico_index/@score = ''">
                                                -
                                            </xsl:if>
                                        </td>
                                        <xsl:call-template name="sme_range_business">
                                            <xsl:with-param name="range" select="r:fico_index/@score"/>
                                        </xsl:call-template>
                                    </tr>
                                </xsl:for-each>
                            </table> 
                        </td> 
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <p style="font-size: 5pt; padding: 5px 10px 5px 10px; text-align: justify">DISCLAIMER: The CTOS SME Score(s) above encompasses a
                                combined scoring algorithm of a business and the selected business
                                owner or partner. Multiple scores can be obtained if a business has
                                several owners and/or partners because the risk involved with each
                                owner and/or partner is viewed independently. Please note that this
                                score is different as compared to the individual CTOS score for the
                                owner and/or partner as it takes into account the business risk as
                                well.</p>
                        </td>
                    </tr>
                </xsl:if>
                <!-- end SME score business -->
                <!-- start SME score company -->
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype != 'B']">
                    <tr>
                        <td align="center" colspan="2">
                            <img style="width: 80%; padding: 5px">
                                <xsl:attribute name="src">
                                    <xsl:call-template name="image_template">
                                        <xsl:with-param name="image" select="'ctos_sme_score.png'"/>
                                    </xsl:call-template>
                                </xsl:attribute>
                            </img>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <xsl:call-template name="sme_range_company">
                                <xsl:with-param name="range" select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score"/>
                            </xsl:call-template>
                            
                            <xsl:call-template name="sme_range_company_details">
                                <xsl:with-param name="range" select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score"/>
                            </xsl:call-template>
                             
                        </td>
                    </tr>
                    <!--                <tr>
                        <td align="center" colspan="2" style="font-size: 25px; font-weight: bold;">
                            <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score" />
                        </td>
                    </tr>-->
                    <tr>
                        <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/@score != '0'">
                            <tr>
                                <td style="font-size: 8pt; padding: 5px 0px 2px 0px;">
                                    <b>
                                        <u>Factors that influence the Score</u>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td>                    
                                    <table style="padding: 5px 10px 25px 10px; width=100%">                        
                                        <tr>
                                            <td>
                                                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index">
                                                    <ol start="1">
                                                        <xsl:for-each select="../r:summary/r:enq_sum[@seq = $seq]/r:fico_index/r:fico_factor[@code !='']">
                                                            <li style="font-size: 8pt; text-align: justify; margin-top: 3px; margin-bottom: -19px;">
                                                                <xsl:value-of select="."/>
                                                            </li>
                                                            <xsl:if test="position() != last()">
                                                                <br/>
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </ol>
                                                </xsl:if>
                                                <xsl:if test="not(../r:summary/r:enq_sum[@seq = $seq]/r:fico_index)">
                                                    -
                                                </xsl:if>
                                            </td>
                                        </tr>                        
                                    </table>
                                </td>
                            </tr>
                        </xsl:if>
                    </tr>
                </xsl:if>
                <!-- end SME score company -->
            </table>
            <br/>
        </xsl:if>
    </xsl:template>
    
    <!-- end section_a_sme_score_template -->


    <!-- start section_a_ctos_litigation_index_template -->
    <xsl:template name="section_a_ctos_litigation_index_template">
        
        <p class="title text-center">
            CTOS Litigation Index
        </p>
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <xsl:variable name="litigation_index">
            <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:dd_index != '----'">
                <xsl:value-of select="('100' - (../r:summary/r:enq_sum[@seq = $seq]/r:dd_index div '9999') * '100')"/>
            </xsl:if>
            <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:dd_index = '9999'">
                <xsl:value-of select="'1'"/>
            </xsl:if>
            <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:dd_index = '----'">
                <xsl:value-of select="'50'"/>
            </xsl:if>
        </xsl:variable>
        
        <table style="border-spacing: 0px; border: 1px solid #000000; padding: 0px 0px 0px 0px;" width="100%">
            <tr>
                <td>
                    <br/>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <table style="border-spacing: 0px; border: 0px; padding: 0px 0px 0px 0px;" width="90%">
                        <tr>
                            <td colspan="2">
                                <table style="border-spacing: 0px; border: 0px; padding: 0px 0px 0px 0px;" width="100%">
                                    <tr>
                                        <td>
                                            <xsl:attribute name="width">
                                                <xsl:value-of select="concat(format-number($litigation_index, '##0'), '%')" />
                                            </xsl:attribute>
                                        </td>
                                        <td class="text-left" valign="bottom">
                                            <p style="font-size: 5pt;">
                                                <b>                                                    
                                                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:dd_index = '----'">
                                                        &#160;&#160;----
                                                    </xsl:if>
                                                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:dd_index != '----'">
                                                        <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:dd_index"/>
                                                    </xsl:if>
                                                </b>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>                                        
                                        <td>
                                            <xsl:attribute name="width">
                                                <xsl:value-of select="concat(format-number($litigation_index, '##0'), '%')" />
                                            </xsl:attribute>
                                        </td>
                                        <td class="text-left" valign="bottom">
                                            <img style="width: 15px; height: 8px">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'arrow_down.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                            </img>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>                        
                        <tr>
                            <td colspan="2" class="text-center" valign="top">
                                <img style="width: 100%; height: 26px">
                                    <xsl:attribute name="src">
                                        <xsl:call-template name="image_template">
                                            <xsl:with-param name="image" select="'dog_bone.png'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                </img>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-left">
                                <p style="font-size: 5pt;">&#160;&#160;9999</p>
                            </td>
                            <td class="text-right">
                                <p style="font-size: 5pt;">0000&#160;&#160;</p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br/>
                </td>
            </tr>
            <tr>
                <td style="font-size: 8pt; padding: 2px 20px 2px 10px;" colspan="2">
                    <b>
                        <u>Index Description</u>
                    </b>
                </td>
            </tr>
            <tr>
                <td style="font-size: 8pt; padding: 2px 20px 2px 10px;" width="5%" valign="top">
                    <xsl:value-of select="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 1, 2)"/>
                </td>
                <td style="font-size: 8pt; padding: 2px 0px 2px 5px;" width="95%">
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype = 'C']">
                        <xsl:call-template name="company_record_type_index">
                            <xsl:with-param name="index" select="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 1, 2)"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq][@ptype != 'C']">
                        <xsl:call-template name="individual_record_type_index">
                            <xsl:with-param name="index" select="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 1, 2)"/>
                        </xsl:call-template>
                    </xsl:if>
                </td>
            </tr>
            <tr>
                <td style="font-size: 8pt; padding: 2px 20px 2px 10px;" width="5%" valign="top">
                    <xsl:value-of select="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 3, 1)"/>
                </td>
                <td style="font-size: 8pt; padding: 2px 0px 2px 5px;" width="95%">
                    <xsl:if test="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 1, 1) = '4'">
                        <xsl:call-template name="weightage_settlement_index">
                            <xsl:with-param name="index" select="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 3, 1)"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 1, 1) != '4'">
                        <xsl:call-template name="weightage_index">
                            <xsl:with-param name="index" select="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 3, 1)"/>
                        </xsl:call-template>
                    </xsl:if>
                </td>
            </tr>
            <tr>
                <td style="font-size: 8pt; padding: 2px 20px 2px 10px;" width="5%" valign="top">
                    <xsl:value-of select="substring(../r:summary/r:enq_sum[@seq = $seq]/r:dd_index, 4, 1)"/>
                </td>
                <td style="font-size: 8pt; padding: 2px 0px 2px 5px;" width="95%">
                    Number of records
                </td>
            </tr>
        </table>
        
    </xsl:template>
    <!-- finish section_a_ctos_litigation_index_template -->
    
    <!-- start section_a_stats_template -->
    <xsl:template name="section_a_stats_template">
        
        <p class="title text-center">
            Section Summary
        </p>
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <table class="table-stats">
            <tr>
                <td class="header text-center" colspan="6">CTOS</td>
                <td class="header text-center">Others</td>
            </tr>
            <tr>
                <th width="16%">Section</th>
                <th width="14%">ID</th>
                <th width="14%">SSM</th>
                <th width="14%">BPH</th>
                <th width="14%">LGL</th>
                <th width="14%">TR</th>
                <th width="14%">IL</th>
            </tr>
            <tr>
                <th class="caption">Selected</th>
                <td class="text-center">
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ctos = '1'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'tick.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ctos = '0'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'cross.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ctos = '1'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'tick.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ctos ='0'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'cross.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris = '1' or ../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris_supp = '1'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'tick.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                    <xsl:if test="(not(../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris) or ../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris ='0') and (not(../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris_supp) or ../r:summary/r:enq_sum[@seq = $seq]/r:include_ccris_supp ='0')">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'cross.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ctos = '1'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'tick.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_ctos ='0'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'cross.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_trex = '1'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'tick.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                    <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:include_trex = '0'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'cross.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                </td>                
                <td class="text-center" width="15%">
                    <xsl:if test="//r:eil_report/@status = '1'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'tick.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                    <xsl:if test="not(//r:eil_report) or //r:eil_report/@status ='0'">
                        <img style="height: 10px">
                            <xsl:attribute name="src">
                                <xsl:call-template name="image_template">
                                    <xsl:with-param name="image" select="'cross.png'"/>
                                </xsl:call-template>
                            </xsl:attribute>
                        </img>
                    </xsl:if>
                </td>
            </tr>
            <tr>
                <th class="caption">Available</th>
                <td class="text-center">
                    <xsl:if test="r:section_a[@data = 'true']">
                        A
                    </xsl:if>
                    <xsl:if test="not(r:section_a) or r:section_a[@data = 'false']">
                        -
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="r:section_a[@data = 'true']">
                        B
                    </xsl:if>
                    <xsl:if test="not(r:section_a) or r:section_a[@data = 'false']">
                        -
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="(r:section_ccris[@data = 'true'] or r:section_ccris_supp[@data = 'true'])">
                        C
                    </xsl:if>
                    <xsl:if test="(not(r:section_ccris) or r:section_ccris[@data = 'false']) and (not(r:section_ccris_supp) or r:section_ccris_supp[@data = 'false'])">
                        -
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="r:section_d[@data = 'true']">
                        D
                    </xsl:if>
                    <xsl:if test="not(r:section_d) or r:section_d[@data = 'false']">
                        -
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="r:section_e[@data = 'true']">
                        E
                    </xsl:if>
                    <xsl:if test="not(r:section_e) or r:section_e[@data = 'false']">
                        -
                    </xsl:if>
                </td>
                <td class="text-center">
                    <xsl:if test="//r:eil_report/@status = '1'">
                        IL
                    </xsl:if>
                    <xsl:if test="not(//r:eil_report) or //r:eil_report/@status ='0'">
                        -
                    </xsl:if>
                </td>
            </tr>            
        </table>
        <table>
            <tr>
                <td>
                    <br/>
                </td>
            </tr>
            <tr>
                <td>
                    <p style="font-size: 8pt">Notes on various sections</p>
                </td>
            </tr>
            <tr>
                <td>                    
                    <ul style="padding: 2px 0px 2px 15px; font-size: 8pt;list-style-type:square; text-align: justify;">
                        <li>ID refers to data from CTOS' identify database</li>
                        <li>SSM refers to data from Suruhanjaya Syarikat Malaysia</li>
                        <li>BPH refers to data from Bank Negara Malaysia</li>
                        <li>LGL refers to data from CTOS' litigation database</li>
                        <li>TR refers to trade reference data submitted by merchants</li>
                        <li>IL refers to your own internal list (if provided to CTOS)</li>
                    </ul>
                </td>
            </tr>
        </table>
        
    </xsl:template>
    <!-- start section_a_stats_template -->

    <!-- start lite_section_a_id_verification_template -->
    <xsl:template name="lite_section_a_id_verification_template">
        
        <p class="title">
            ID Verification
        </p>
                      
        <xsl:call-template name="lite_section_a_individual_id_verification_template"/>
        <xsl:call-template name="lite_section_a_business_id_verification_template"/>
        <xsl:call-template name="lite_section_a_commercial_id_verification_template"/>
        
    </xsl:template>
    <!-- finish lite_section_a_id_verification_template -->

    <!-- start lite_section_a_individual_id_verification_template -->
    <xsl:template name="lite_section_a_individual_id_verification_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='I']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                
                <xsl:call-template name="lite_section_a_individual_id_verification_sub_template_top"/>
                
                <xsl:if test="r:section_a/r:record[@rpttype = 'Id'] or r:section_a/r:record[@rpttype = 'Ie'] or r:section_a/r:record[@rpttype = 'If'] or r:section_a[@data = 'false']">
                    
                    <xsl:if test="r:section_a[@data = 'true']">
                    
                        <xsl:for-each select="r:section_a/r:record[@seq = $seq]">
                        
                            <xsl:call-template name="lite_section_a_individual_id_verification_sub_template_bottom"/>
                        
                        </xsl:for-each>
                    
                    </xsl:if>
                    
                    <xsl:if test="r:section_a[@data = 'false']">
                        
                        <xsl:call-template name="lite_section_a_individual_id_verification_sub_template_bottom"/>
                        
                    </xsl:if>
                    
                </xsl:if>
                
            </table>
            
        </xsl:if>
        
    </xsl:template>
    <!-- finish lite_section_a_individual_id_verification_template -->

    <!-- start lite_section_a_individual_id_verification_sub_template_top -->
    <xsl:template name="lite_section_a_individual_id_verification_sub_template_top">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption">Name (Your Input)</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">New ID / Old ID (Your Input)</th>
            <td class="long-content">
                <xsl:call-template name="join_string_with_delimiter">
                    <xsl:with-param name="value1" select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                    <xsl:with-param name="value2" select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                    <xsl:with-param name="delimiter" select="'/'"/>
                </xsl:call-template>
                <!--                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno = ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno = '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/> / <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>-->
            </td>
        </tr>
        
    </xsl:template>
    <!-- finish lite_section_a_individual_id_verification_sub_template_top -->

    <!-- start lite_section_a_individual_id_verification_sub_template_bottom -->
    <xsl:template name="lite_section_a_individual_id_verification_sub_template_bottom">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption">Name</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">New ID</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:nic_brno"/>
                </xsl:call-template>
            </td>                        
        </tr>
        <tr>
            <th class="caption">Old ID</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:ic_lcno"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Date of Birth</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:birth_date"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Nationality</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:nationality"/>
                </xsl:call-template>
                <xsl:if test="r:source and r:source != ''"> 
                    Source: <xsl:value-of select="r:source"/>
                </xsl:if>
            </td>
        </tr> 
        <tr>
            <th class="caption">Address 1</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr"/>
                </xsl:call-template>
                <xsl:if test="r:source and r:source != '' and r:addr and r:addr != ''">
                    Source: <xsl:value-of select="r:source"/>
                </xsl:if>
            </td>
        </tr>
        <tr>
            <th class="caption">Address 2</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr1"/>                                    
                </xsl:call-template>
                <xsl:if test="r:source and r:source != '' and r:addr1 and r:addr1 != ''">
                    Source: <xsl:value-of select="r:source"/>
                </xsl:if>
            </td>
        </tr>
        <tr>
            <th class="caption">LitE Status</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:mdi_status"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Ref No.</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:ref_no"/>
                </xsl:call-template>
            </td>
        </tr>
                                        
        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status[@code != '1']">
            <tr>
                <th class="caption">
                    <font color="red">
                        Error
                    </font>
                </th>
                <td>
                    <font color="red">
                        <xsl:value-of select="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status"/>
                    </font>
                </td>
            </tr>
        </xsl:if>
        
    </xsl:template>
    <!-- finish lite_section_a_individual_id_verification_sub_template_bottom -->

    <!-- start lite_section_a_business_id_verification_template -->
    <xsl:template name="lite_section_a_business_id_verification_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='B' or @ptype='L']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                
                <xsl:call-template name="lite_section_a_business_id_verification_sub_template_top"/>
                
                <xsl:if test="r:section_a/r:record[@rpttype = 'CJ'] or r:section_a/r:record[@rpttype = 'Ir'] or r:section_a[@data = 'false']">
                    
                    <xsl:if test="r:section_a[@data = 'true']">
                    
                        <xsl:for-each select="r:section_a/r:record[@seq = $seq]">
                        
                            <xsl:call-template name="lite_section_a_business_id_verification_sub_template_bottom"/>
                        
                        </xsl:for-each>
                    
                    </xsl:if>
                    
                    <xsl:if test="r:section_a[@data = 'false']">
                        
                        <xsl:call-template name="lite_section_a_business_id_verification_sub_template_bottom"/>
                        
                    </xsl:if>
                    
                </xsl:if>
                
            </table>
            
        </xsl:if>
        
    </xsl:template>
    <!-- finish lite_section_a_business_id_verification_template -->

    <!-- start lite_section_a_business_id_verification_sub_template_top -->
    <xsl:template name="lite_section_a_business_id_verification_sub_template_top">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption">Business Name (Your Input)</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Registration No (Your Input)</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                </xsl:call-template>
                <!--                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno = ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno = '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/> / <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>-->
            </td>
        </tr>
        
    </xsl:template>
    <!-- finish lite_section_a_business_id_verification_sub_template_top -->

    <!-- start lite_section_a_business_id_verification_sub_template_bottom -->
    <xsl:template name="lite_section_a_business_id_verification_sub_template_bottom">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption">Business Name</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Registration No (Old/ New)</th>
            <td class="long-content">
                <xsl:call-template name="display_section_a_reg_no">
                    <xsl:with-param name="reg_num_1" select="r:register_no" />
                    <xsl:with-param name="reg_num_2" select="r:additional_registration_no" />
                </xsl:call-template>
            </td>                        
        </tr> 
        <tr>
            <th class="caption">Business Address</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Registration Date</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:reg_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Type</th>
            <td class="long-content">
                <xsl:if test="r:business_type = 'SP'">
                    SOLE PROPRIETOR
                </xsl:if>
                <xsl:if test="r:business_type = 'PN'">
                    PARTNERSHIP
                </xsl:if>
                <xsl:if test="not(r:business_type) or r:business_type = ''">
                    -
                </xsl:if>
            </td>
        </tr>
        <tr>
            <th class="caption">Business Type</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:business_nature"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Business Commenced</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:business_commenced"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Last Changed Date</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:last_change_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Rob Search Date</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:cpo_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Current Registration Expiry Date</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:expiry_date"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Remark</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:remark"/>                                    
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">LitE Status</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:mdi_status"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Ref No.</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:ref_no"/>
                </xsl:call-template>
            </td>
        </tr>
                                        
        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status[@code != '1']">
            <tr>
                <th class="caption">
                    <font color="red">
                        Error
                    </font>
                </th>
                <td>
                    <font color="red">
                        <xsl:value-of select="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status"/>
                    </font>
                </td>
            </tr>
        </xsl:if>
        
    </xsl:template>
    <!-- finish lite_section_a_business_id_verification_sub_template_bottom -->

    <!-- start lite_section_a_commercial_id_verification_template -->
    <xsl:template name="lite_section_a_commercial_id_verification_template">
        <xsl:if test="../r:summary/r:enq_sum[@ptype='C']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <table class="table">
                
                <xsl:call-template name="lite_section_a_commercial_id_verification_sub_template_top"/>
                
                <xsl:if test="r:section_a/r:record[@rpttype = 'CE'] or r:section_a/r:record[@rpttype = 'Cr'] or r:section_a[@data = 'false']">
                    
                    <xsl:if test="r:section_a[@data = 'true']">
                    
                        <xsl:for-each select="r:section_a/r:record[@seq = $seq]">
                        
                            <xsl:call-template name="lite_section_a_commercial_id_verification_sub_template_bottom"/>
                        
                        </xsl:for-each>
                    
                    </xsl:if>
                    
                    <xsl:if test="r:section_a[@data = 'false']">
                
                        <xsl:call-template name="lite_section_a_commercial_id_verification_sub_template_bottom"/>
                                
                    </xsl:if>        
                    
                </xsl:if>
                
            </table>
            
            <br/>
            
            <xsl:call-template name="lite_section_a_sme_financial_health_indicator_template"/>
            
            <xsl:call-template name="lite_section_a_financial_and_shareholders_template"/>
            
        </xsl:if>
    </xsl:template>
    <!-- finish lite_section_a_commercial_id_verification_template -->    

    <!-- start lite_section_a_commercial_id_verification_sub_template_top -->
    <xsl:template name="lite_section_a_commercial_id_verification_sub_template_top">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption">Company Name (Your Input)</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Registration No (Your Input)</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:call-template>
                <!--                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno = ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno = '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>
                <xsl:if test="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno != '' and ../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno != ''">
                    <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:nic_brno"/> / <xsl:value-of select="../r:summary/r:enq_sum[@seq = $seq]/r:ic_lcno"/>
                </xsl:if>-->
            </td>
        </tr>
        
    </xsl:template>
    <!-- finish lite_section_a_commercial_id_verification_sub_template_top -->

    <!-- start lite_section_a_commercial_id_verification_sub_template_bottom -->
    <xsl:template name="lite_section_a_commercial_id_verification_sub_template_bottom">
        
        <xsl:variable name="seq">
            <xsl:value-of select="@seq"/>
        </xsl:variable>
        
        <tr>
            <th class="caption">Company Name</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:name"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Registration No (Old/ New)</th>
            <td class="long-content">
                <xsl:call-template name="display_section_a_reg_no">
                    <xsl:with-param name="reg_num_1" select="r:ic_lcno" />
                    <xsl:with-param name="reg_num_2" select="r:additional_registration_no" />
                    <xsl:with-param name="checksum" select="r:lc_checksum" />
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Registration Date</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:register_date"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption-left">Type of Company</th>
            <td class="long-content-left">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:comp_category"/>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:comp_type"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Registration Address</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr"/>
                </xsl:call-template>
            </td>
        </tr> 
        <tr>
            <th class="caption">Business Address</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:addr1"/>
                </xsl:call-template>
            </td>
        </tr> 
        <tr>
            <th class="caption">Business Sector</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:type_of_business"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">Company Status</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="r:status"/>
                </xsl:call-template>
            </td>
        </tr>
        <tr>
            <th class="caption">LitE Status</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:mdi_status"/>
                </xsl:call-template>
            </td>
        </tr>        
        <tr>
            <th class="caption">Ref No.</th>
            <td class="long-content">
                <xsl:call-template name="check_empty_string">
                    <xsl:with-param name="value" select="//r:summary/r:enq_sum[@seq = $seq]/r:ref_no"/>
                </xsl:call-template>
            </td>
        </tr>
                        
        <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status[@code != '1']">
            <tr>
                <th class="caption">
                    <font color="red">
                        Error
                    </font>
                </th>
                <td class="long-content">
                    <font color="red">
                        <xsl:value-of select="//r:summary/r:enq_sum[@seq = $seq]/r:enq_status"/>
                    </font>
                </td>
            </tr>
        </xsl:if>
        
    </xsl:template>
    <!-- finish lite_section_a_commercial_id_verification_sub_template_bottom -->

    <!-- start lite_section_a_financial_and_shareholders_template -->
    <xsl:template name="lite_section_a_financial_and_shareholders_template">
        
        <xsl:if test="r:section_a/r:record[@rpttype = 'CE'] or r:section_a/r:record[@rpttype = 'Cr']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <p class="title">
                Financials and Shareholders
            </p>
            
            <xsl:for-each select="r:section_a/r:record[@seq = $seq]">
        
                <table class="table">
                    <tr>
                        <th class="caption">Last Updated</th>
                        <td class="long-content">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:cpo_date"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption">Exempt Private Company</th>
                        <td class="long-content">
                            <xsl:call-template name="check_empty_string">
                                <xsl:with-param name="value" select="r:previous_names/r:name"/>
                            </xsl:call-template>
<!--                            <xsl:if test="r:previous_names/r:change_date and r:previous_names/r:change_date != ''">
                                <br/>
                                (<xsl:value-of select="r:previous_names/r:change_date"/>)
                            </xsl:if>-->
                        </td>
                    </tr>                                        
                    <tr>
                        <th class="caption">Revenue (RM)</th>
                        <td class="long-content">                            
                            <xsl:if test="r:ic_lcno and r:ic_lcno != ''">
                                    
                                <xsl:for-each select="r:accounts/r:account[@seq = '1']">
                                    <xsl:if test="r:turnover and r:turnover != ''">
                                                                        
                                        <xsl:call-template name="check_empty_number">
                                            <xsl:with-param name="number" select="r:turnover"/>
                                        </xsl:call-template>
                                    
                                    </xsl:if>                                
                                
                                    <xsl:if test="not(r:turnover) or r:turnover = ''">
                                    
                                        Refer to FS Latest Year
                                    
                                    </xsl:if>
                                </xsl:for-each>
                                    
                            </xsl:if>
                            <xsl:if test="not(r:ic_lcno) or r:ic_lcno = ''">
                                    
                                -
                                    
                            </xsl:if>                            
                        </td>
                    </tr>
                    <tr>
                        <th class="caption">Profit After Tax (RM)</th>
                        <td class="long-content">
                            <xsl:for-each select="r:accounts/r:account[@seq = '1']">
                                <xsl:if test="r:plnpbt and r:plnpbt != ''">
                                                                        
                                    <xsl:call-template name="check_empty_number">
                                        <xsl:with-param name="number" select="r:plnpat"/>
                                    </xsl:call-template>
                                    
                                </xsl:if>
                                
                                <xsl:if test="not(r:plnpbt) or r:plnpbt = ''">
                                    
                                    -
                                    
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption">Total Assets (RM)</th>
                        <td class="long-content">
                            <xsl:for-each select="r:accounts/r:account[@seq = '1']">
                                <xsl:choose>                                
                                    <xsl:when test="r:exempted and r:exempted = 'false'">
                                        <xsl:if test="r:totass and r:totass != ''">
                                                                        
                                            <xsl:call-template name="check_empty_number">
                                                <xsl:with-param name="number" select="r:totass"/>
                                            </xsl:call-template>
                                    
                                        </xsl:if>
                                
                                        <xsl:if test="not(r:totass) or r:totass = ''">
                                    
                                            -
                                    
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        EPC
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption">Paid-Up Capital (RM)</th>
                        <td class="long-content">
                            <xsl:call-template name="check_empty_number">
                                <xsl:with-param name="number" select="r:paid_up"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption">Total Company Charges</th>
                        <td class="long-content">
                            <xsl:call-template name="check_empty_number">
                                <xsl:with-param name="number" select="r:charges/@total"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption">Directorship</th>
                        <td class="long-content">
                            <xsl:for-each select="r:directors/r:director[r:position = 'DO' or r:position = 'DS' or r:position = 'AD']">
                                <xsl:if test="position() &lt; '6'">
                                    <xsl:call-template name="check_empty_string">
                                        <xsl:with-param name="value" select="r:name"/>
                                    </xsl:call-template>
                                    <br/>
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <th class="caption">Top 5 Shareholders</th>
                        <td class="long-content">
                            <xsl:for-each select="r:directors/r:director[r:position = 'SO' or r:position = 'DS']">
                                <xsl:if test="position() &lt; '6'">
                                    <xsl:call-template name="check_empty_string">
                                        <xsl:with-param name="value" select="r:name"/>
                                    </xsl:call-template>
                                    <br/>
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                    
                </table>
                
            </xsl:for-each>
            
        </xsl:if>
        
    </xsl:template>
    <!-- finish lite_section_a_financial_and_shareholders_template -->

    <!-- start lite_section_a_sme_financial_health_indicator_template -->
    <xsl:template name="lite_section_a_sme_financial_health_indicator_template">
        
        <xsl:if test="r:section_a/r:record[@rpttype = 'CE'] or r:section_a/r:record[@rpttype = 'Cr']">
            
            <xsl:variable name="seq">
                <xsl:value-of select="@seq"/>
            </xsl:variable>
            
            <xsl:if test="//r:summary/r:enq_sum[@seq = $seq]/r:include_sfi and //r:summary/r:enq_sum[@seq = $seq]/r:include_sfi = '1'">
            
                <p class="title">
                    SME Financial Health Indicator
                </p>
            
                <xsl:for-each select="r:section_a/r:record[@seq = $seq]">
        
                    <table class="table">
                        <tr>
                            <th class="caption">Risk Indicator</th>
                            <td class="long-content">
                                <xsl:if test="r:sme_financial_score">
                                    <xsl:choose>
                                        <xsl:when test="r:sme_financial_score/r:health[@code = 'A']">
                                            <img class="vertical-center">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_a.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">15</xsl:attribute>
                                                <xsl:attribute name="width">15</xsl:attribute>
                                            </img>
                                        </xsl:when>
                                        <xsl:when test="r:sme_financial_score/r:health[@code = 'B']">
                                            <img class="vertical-center">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_b.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">15</xsl:attribute>
                                                <xsl:attribute name="width">15</xsl:attribute>
                                            </img>
                                        </xsl:when>
                                        <xsl:when test="r:sme_financial_score/r:health[@code = 'C']">
                                            <img class="vertical-center">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_c.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">15</xsl:attribute>
                                                <xsl:attribute name="width">15</xsl:attribute>
                                            </img>
                                        </xsl:when>
                                        <xsl:when test="r:sme_financial_score/r:health[@code = 'D']">
                                            <img class="vertical-center">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_d.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">15</xsl:attribute>
                                                <xsl:attribute name="width">15</xsl:attribute>
                                            </img>
                                        </xsl:when>
                                        <xsl:when test="r:sme_financial_score/r:health[@code = 'E']">
                                            <img class="vertical-center">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_e.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">15</xsl:attribute>
                                                <xsl:attribute name="width">15</xsl:attribute>
                                            </img>                                            
                                        </xsl:when>
                                        <xsl:when test="r:sme_financial_score/r:health[@code = 'F']">
                                            <img class="vertical-center">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_f.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">15</xsl:attribute>
                                                <xsl:attribute name="width">15</xsl:attribute>
                                            </img>                                            
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <img class="vertical-center">
                                                <xsl:attribute name="src">
                                                    <xsl:call-template name="image_template">
                                                        <xsl:with-param name="image" select="'sme_financial_score_na.png'"/>
                                                    </xsl:call-template>
                                                </xsl:attribute>
                                                <xsl:attribute name="height">15</xsl:attribute>
                                                <xsl:attribute name="width">15</xsl:attribute>
                                            </img>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    &#160;
                                    <xsl:value-of select="r:sme_financial_score/r:health"/>
                                </xsl:if>
                                <xsl:if test="not(r:sme_financial_score)">
                                    -
                                </xsl:if>
                            </td>
                        </tr>
                        <tr>
                            <th class="caption">Potential Credit Line</th>
                            <td class="long-content">
                                <xsl:call-template name="check_empty_string">
                                    <xsl:with-param name="value" select="r:sme_financial_score/r:limit"/>
                                </xsl:call-template>
                            </td>
                        </tr>                    
                    
                    </table>
                
                </xsl:for-each>
            
                <br/>
            
            </xsl:if>
            
        </xsl:if>
        
    </xsl:template>
    <!-- finish lite_section_a_financial_and_shareholders_template -->

</xsl:stylesheet>

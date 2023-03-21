<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="library/general.xsl"/>
<xsl:include href="library/quick_purchase.xsl"/>
  <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="xml/input_request/search_name" /></title>
        <style type="text/css">
          <xsl:value-of select="document('library/xslt2.css')" disable-output-escaping="yes" />
        </style>
		<xsl:call-template name="xsl_link" />
      </head>
      <body>
		<div class="wrapper">
			<table width="100%">
				<tr>
					<td align="left"><img src="http://img.experian.com.my/ExperianLogo.png" width="176px" height="59px" /></td>
					<td align="right" valign="bottom" class="italic-bold"><p>CrediTrack by Experian</p><p><xsl:value-of select="xml/report_date"/></p></td>
				</tr>
			</table>
            <p class="h1">BUSINESS INTELLIGENCE – (BI)</p>
            <xsl:apply-templates/>
			<br /><br /><br />
			<xsl:call-template name="bottom_term" />
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="xml/cri">
    <xsl:for-each select="crus/*">
      <xsl:if test="name(.) = 'input_request'">
		<xsl:call-template name="end_report" />
			<br /><br /><br />
			<xsl:call-template name="bottom_term" />
        <hr />
			<table width="100%">
				<tr>
					<td align="left"><img src="http://img.experian.com.my/ExperianLogo.png" width="176px" height="59px" /></td>
					<td align="right" valign="bottom" class="italic-bold"><p>CrediTrack by Experian</p><p><xsl:value-of select="xml/report_date"/></p></td>
				</tr>
			</table>
            <p class="h1">INDIVIDUAL CREDIT INTELLIGENCE – (CRI)</p>
          <xsl:call-template name="input_request" />
      </xsl:if>
      <xsl:if test="name(.) = 'person_details'">
        <xsl:call-template name="cri_person_details" />
      </xsl:if>
      <xsl:if test="name(.) = 'person_company_interests'">
        <xsl:call-template name="person_company_interests" />
      </xsl:if>
	  <xsl:if test="name(.) = 'previous_company_interests'">
        <xsl:call-template name="previous_company_interests" />
      </xsl:if>	  
      <xsl:if test="name(.) = 'legal_suit_by_regno'">
        <xsl:call-template name="legal_suit_by_regno" />
      </xsl:if>
      <xsl:if test="name(.) = 'others_court_by_regno'">
        <xsl:call-template name="others_court_by_regno" />
      </xsl:if>
	  <xsl:if test="name(.) = 'others_known_legal_suit'">
        <xsl:call-template name="others_known_legal_suit" />
      </xsl:if>
	  <xsl:if test="name(.) = 'legal_suit_by_plaintiff'">
        <xsl:call-template name="legal_suit_by_plaintiff" />
      </xsl:if>
      <xsl:if test="name(.) = 'person_bankruptcy'">
        <xsl:call-template name="person_bankruptcy" />
      </xsl:if>
      <xsl:if test="name(.) = 'person_interest_in_struckoff_companies'">
        <xsl:call-template name="person_interest_in_struckoff_companies" />
      </xsl:if>
      <xsl:if test="name(.) = 'trade_bureau_entity_details'">
        <xsl:call-template name="trade_bureau_entity_details" />
      </xsl:if>
	  <xsl:if test="name(.) = 'aml_sanction_list_individual'">
        <xsl:call-template name="aml_sanction_list_individual" />
      </xsl:if>
	  <xsl:if test="name(.) = 'previous_enquiry'">
        <xsl:call-template name="previous_enquiry" />
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="library/quick_purchase.xsl"/>
  <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
  <xsl:template match="report_date">
  </xsl:template>
  <xsl:template match="input_request">
  </xsl:template>
  <xsl:template match="/">
    <html>
      <head>
        <title>
			<xsl:value-of select="xml/input_request/search_name" />
		</title>
        <style type="text/css">
          <xsl:value-of select="document('library/xslt2.css')" disable-output-escaping="yes" />
        </style>
      </head>
      <body>
		<div class="wrapper">
			<table width="100%">
				<tr>
					<td align="left"><img src="https://ct.experian.com.my/images/ExperianLogo.png" width="176px" height="59px" /></td>
					<td align="right" valign="bottom" class="italic-bold"><p>CrediTrack by Experian</p><p><xsl:value-of select="xml/report_date"/></p></td>
				</tr>
			</table>
            <p class="h1">CUSTOMER DUE-D INDIVIDUAL (CDDI)</p>
			<!--<xsl:if test="xml/input_request/requested_partial_name != ''">
				<p align="left" class="italic-bold">Partial Name Match</p>
			</xsl:if>
			<xsl:if test="xml/input_request/requested_forename != ''">
				<p align="left" class="italic-bold">Exact Name Match</p>
			</xsl:if>-->
            <xsl:apply-templates />
			<br /><br /><br />
			<!--bottom-->
			<xsl:variable name="dateValue" select="xml/request_criteria/dateRequest"/>
			<xsl:variable name="date" select="substring-after($dateValue, ' ')"/>
			<xsl:variable name="year" select="substring-after($date, ' ')"/>
			
			<p class="no-margin liteblue bold" align="center"><font>COMMERCIAL CONFIDENTIAL</font></p>
			<p class="no-margin liteblue bold">Experian Information Services (Malaysia) Sdn. Bhd. (532271-T) is certified to ISO/IEC 27001:2013, Cert. No: ISM 00290</p>
			<p class="small liteblue term">NOTICE: The information provided by Experian Information Services (Malaysia) Sdn. Bhd. (EXPERIAN) in this report is based on information which has been compiled from public sources and third parties. We do not guarantee the accuracy of the information provided by EXPERIAN. While we have used our best endeavours to ensure that the data is complete and accurate, we do not accept any liability for errors, omissions, incomplete information or non-current data and a purchaser or user of the information in this Report shall verify the accuracy of the information on its own. The information furnished is <u>STRICTLY CONFIDENTIAL</u> and should not be disclosed to any party including the subject concerned. The information in this report is not for evaluation or a comment on the credit-worthiness of the subject nor is it any advice, analysis, observation, representation or comment on the credit risk of the subject person or company/business or any other entity on whom/which the information is provided. EXPERIAN shall not be liable for any conclusions drawn by you/the user of any of the information found in this report. Please notify &amp; contact EXPERIAN promptly of any questions regarding the accuracy of the information contained in this report to the Customer Service Division at: Suite 16.02, Level 16, Centrepoint South Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur, Malaysia or call: +60326151111.<br/><span style="text-align: left;">Dow Jones</span><span style="float:right;text-align: right;">Copyright@<xsl:value-of select="$year"/>. Dow Jones &amp; Company Inc. All rights reserved.</span></p>
        </div>
      </body>
    </html>
  </xsl:template>
  
	<xsl:template match="xml/request_criteria">
	
		<table border="0" width="100%" class="full_border">
			<tr>
				<td class="kyc_header" colspan="2" align="left">
					<font >Note: An entry level search for quick validation of an individual who are in the Sanctions, Enforcement, Politically Exposed People listing &amp; Adverse media listing of more than 35,000 data sources across the globe. Search results are based on name search and the search can be refined further based on additional input of date/year of birth and country of a more precise match.</font>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="left"><span class="kyc_request_table"><b>REQUEST CRITERIA</b></span><br /><span class="small">(You have requested to search on the following)</span></td>
			</tr>
			
			<xsl:if test="dateRequest">
				<tr>
					<td width="20%" class="bold">Date of Request</td>
					<td width="80%"><xsl:value-of select="dateRequest"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="requestor_name">
				<tr>
					<td width="20%" class="bold">Name of Requestor</td>
					<td width="80%"><xsl:value-of select="requestor_name"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="PartialName">
				<tr>
					<td width="20%" class="bold">Requested Name:</td>
					<td width="80%"><xsl:value-of select="PartialName"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="ForeName">
				<tr>
					<td width="20%" class="bold">Requested First Name:</td>
					<td width="80%"><xsl:value-of select="ForeName"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="MiddleName">
				<tr>
					<td width="20%" class="bold">Requested Middle Name:</td>
					<td width="80%"><xsl:value-of select="MiddleName"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="SurName">
				<tr>
					<td width="20%" class="bold">Requested First Name:</td>
					<td width="80%"><xsl:value-of select="SurName"/></td>
				</tr>
			</xsl:if>
			
			
			<xsl:if test="DateOfBirth" >
				<tr>
					<td width="20%" class="bold">Requested Date of Birth:</td>
					<td width="80%"><xsl:value-of select="DateOfBirth"/></td>
				</tr>
			</xsl:if>
			
			<xsl:if test="Country">
				<!-- <tr>
					<td width="20%" class="bold">Requested Country:</td>
					<td width="80%"><xsl:value-of select="Country"/></td>
					
				</tr> -->
				
				<xsl:for-each select="Country">
					
						<xsl:if test="CountryofCitizenship">
							<tr>
								<td width="20%" class="bold">Requested Country of Citizenship</td>
								<td width="80%"><xsl:value-of select="CountryofCitizenship"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="CountryofResidence">
							<tr>
								<td width="20%" class="bold">Requested Country of Residence</td>
								<td width="80%"><xsl:value-of select="CountryofResidence"/></td>
							</tr>
						</xsl:if>
						<xsl:if test="CountryofRegistration">
							<tr>
								<td width="20%" class="bold">Requested Country of Registration</td>
								<td width="80%"><xsl:value-of select="CountryofRegistration"/></td>
							</tr>
						</xsl:if>
					
				</xsl:for-each>
				
			</xsl:if>
			
			<xsl:if test="CountryType">
				<tr>
					<td width="20%" class="bold">Requested Country Type:</td>
					<!-- <td width="80%"><xsl:value-of select="CountryType"/></td> -->
					<xsl:choose>
						<xsl:when test="CountryType = 2">
							<td width="80%">Country of Citizenship</td>
						</xsl:when>
						<xsl:when test="CountryType = 9">
							<td width="80%">Country of Residence</td>
						</xsl:when>
						<xsl:otherwise>
							<td width="80%"><xsl:value-of select="CountryType"/></td>
						</xsl:otherwise>
					</xsl:choose>
				</tr>
			</xsl:if>
			
			<xsl:if test="EntityNo">
				<tr>
					<td width="20%" class="bold">Requested ID:</td>
					<td width="80%"><xsl:value-of select="EntityNo"/></td>
					
				</tr>
			</xsl:if>
			
			<xsl:if test="EntityNoType">
				<tr>
					<td width="20%" class="bold">Requested ID Type:</td>
					<td width="80%"><xsl:value-of select="EntityNoType"/></td>
					
				</tr>
			</xsl:if>
			
			<xsl:if test="subscriber_refno">
				<tr>
					<td width="20%" class="bold">Your Ref. No</td>
					<td width="80%"><xsl:value-of select="subscriber_refno"/></td>
				</tr>
			</xsl:if>
			
		</table>
	</xsl:template>
	
	<xsl:template match="xml/search_result">
		<br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="9" align="left">SEARCH RECORD<br /></th>
			</tr>
			<xsl:call-template name="result_details" />
		</table>
		
		<xsl:if test="(count(profile_lists/profile_list)) > 0">
			You may use the Profile ID to proceed for Enhanced Customer Due-D Individual Report
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="result_details">
		
			
			
			<tr>
				<th width="10%" class="bold">Profile ID</th>
				<th width="10%" class="bold">Risk Category</th>
				<!-- <th width="10%" class="bold">Name</th> -->
				<th width="20%" class="bold">Match Name</th>
				<th width="10%" class="bold">Date of Birth</th>
				<th width="10%" class="bold">Gender</th>
				<th width="10%" class="bold">Country</th>
				<th width="20%" class="bold">Remarks</th>
				<th width="10%" class="bold">Name Match (%)</th>
				
			</tr>
			<xsl:for-each select="profile_lists/profile_list">
			<tr>
				<td width="10%"><xsl:value-of select="ProID"/></td>
				<td width="10%">
					<!-- <xsl:value-of select="IcoInfs"/> -->
					<xsl:for-each select="IcoTyps/IcoTyp">
						<xsl:if test="position() > 1">,<br /></xsl:if>
						<xsl:value-of select='.'/>
						
					</xsl:for-each>

				</td>
				<!-- <td width="10%"><xsl:value-of select="Nam"/></td> -->
				<td width="20%"><xsl:value-of select="MatNam"/></td>
				<td width="10%">
					<!-- <xsl:value-of select="DOBInfs"/> -->
					<xsl:choose>
						<xsl:when test="count(DOBInfs/DOBInf) > 0">
							<xsl:for-each select="DOBInfs/DOBInf">
								<!-- <xsl:value-of select='.'/><br /> -->
								<xsl:choose>
									<xsl:when test="Day">
										<xsl:value-of select="concat(Day, '/', Mth, '/', Yea)"/>
									</xsl:when>
									<xsl:when test="Mth">
										<xsl:value-of select="concat( Mth, '/', Yea)"/>
									</xsl:when>
									<xsl:when test="Yea">
										<xsl:value-of select="Yea"/>
									</xsl:when>
									
								</xsl:choose>
								<br />
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							-
						</xsl:otherwise></xsl:choose>
				</td>
				<td width="10%">
				
					<!-- <xsl:value-of select="Gdr"/> -->
					<xsl:choose>
						<xsl:when test="Gdr = 'M'">Male</xsl:when>
						<xsl:when test="Gdr = 'F'">Female</xsl:when>
						<xsl:otherwise><xsl:value-of select="Gdr"/></xsl:otherwise>
					</xsl:choose>
				</td>
				<td width="10%"><xsl:value-of select="Cty"/></td>
				
				<td width="20%">
					<!-- <xsl:value-of select="Tit"/> -->
					<xsl:choose>
						<xsl:when test="Tit"><xsl:value-of select="Tit"/></xsl:when>
						<xsl:otherwise>-</xsl:otherwise>
					</xsl:choose>
				</td>
				
				<td width="10%"><xsl:value-of select="MatSco"/></td>
				
			</tr>
			</xsl:for-each>
			<xsl:if test="(count(profile_lists/profile_list)) = 0">
				<tr>
					<td colspan="9" class="show_border" align="center">NO RECORD FOUND</td>
				</tr>
			</xsl:if>
	</xsl:template>
	
	<!--End of Report-->
	<xsl:template match="xml/end">
		<!--Remark Legend-->
		<br /><br />
		<table border="0" width="100%" class="full_border">
			<tr>
				<th colspan="2" align="left">Risk Category<br /></th>
				<th colspan="2" align="left">Description<br /></th>
			</tr>
			<tr>
				<td width="10%" class="bold">SAN</td>
				<td width="20%" class="bold">Sanction List - Person</td>
				<td width="70%">PERSONS WHO ARE SUBJECT TO COMPREHENSIVE OR TARGETED RESTRICTIVE MEASURE OR CITED IN SANCTIONS LIST FOR VARIOUS REASON</td>
			</tr>
			
			<tr>
				<td width="10%" class="bold">OOL</td>
				<td width="20%" class="bold">Other Official List - Person</td>
				<td width="70%">PERSONS WHO ARE ASSOCIATED WITH POTENTIALLY HIGH RISK ACTIVITIES SUCH AS SERIOUS CRIME AND FINANCIAL OR PROFESSIONAL ENFORCEMENT ACTIONS OR WARNINGS.</td>
			</tr>
			
			<tr>
				<td width="10%" class="bold">PEP</td>
				<td width="20%" class="bold">Politically Exposed Person</td>
				<td width="70%">PERSONS WHO ARE WIELDING POLITICAL POWER OR INFLUENCE, EITHER IN A GOVERNMENT POSITION OR IN AN INTERNATIONAL ORGANIZATION.</td>
			</tr>
			
			<tr>
				<td width="10%" class="bold">SI</td>
				<td width="20%" class="bold">Special Interest - Person</td>
				<td width="70%">PERSONS WHO ARE PROMINENT IN THE NEWS ASSOCIATION WITH ACCUSED OF, ARRESTED FOR OR CONVICTED OF SERIOUS CRIMES.</td>
			</tr>
			
			<tr>
				<td width="10%" class="bold">SI-LT</td>
				<td width="20%" class="bold">Special Interest - Person (Lower Threshold)</td>
				<td width="70%">PERSONS WHO ARE REPORTED TO HAVE COMMITTED CRIMES, OR HAS BEEN FORMALLY DECLARED WANTED AN OFFENCE, OR HAS BEEN CHARGED WITH AND/ OR ARRESTED ON SUSPICION ACTIVITIES.</td>
			</tr>
			
			<tr>
				<td width="10%" class="bold">OEL</td>
				<td width="20%" class="bold">Other Exclusion List - Person</td>
				<td width="70%">EXCLUSIONS FROM PUBLIC SECTOR ACTIVITIES AGAINST PEOPLE AND/OR ENTITIES OPERATING IN A PARTICULAR JURISDICTION, SECTOR OR INDUSTRY, USUALLY FOR A SET PERIOD.</td>
			</tr>
			
			<tr>
				<td width="10%" class="bold">RCA</td>
				<td width="20%" class="bold">Relative or close associates</td>
				<td width="70%">THE IMMEDIATE FAMILY MEMBERS OF A PERSON AND THEIR CLOSEST NON-FAMILIAL ASSOCIATES OF PEP.</td>
			</tr>
			
			<tr>
				<td width="10%" class="bold">BM</td>
				<td width="20%" class="bold">Board member</td>
				<td width="70%">BOARD MEMBER OF THE STATE-OWNED COMPANIES BY THE COMPREHENSIVELY SANCTIONED COUNTRIES.</td>
			</tr>
			
		</table>
		<br /><br />
		
		<p class="bold">-END OF REPORT-</p>
		<table border="0" width="100%">
			<tr>
				<td align="left">SUBSCRIBER NAME: <xsl:value-of select="/xml/end/subscriber_name" /></td>
				<td align="right">ORDER DATE: <xsl:value-of select="/xml/end/order_date" /></td>
			</tr>
			<tr>
				<td align="left">USER NAME: <xsl:value-of select="/xml/end/username" /></td>
				<td align="right">ORDER TIME: <xsl:value-of select="/xml/end/order_time" /></td>
			</tr>
		</table>
	</xsl:template>
	
</xsl:stylesheet>
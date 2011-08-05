<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0">
    
    <!-- This is the root level template -->
    <xsl:template match="/">
        <ftk_report>
            <xsl:apply-templates/>
        </ftk_report>
    </xsl:template>
    
    <!-- This template matches any fo:page-sequence that contains "Case Information" The following fo:block[7] contains the "Series Information".-->
     <xsl:template
        match="//fo:page-sequence[1][fo:flow/fo:block[text()='Case Information']]/fo:flow/fo:block[7]">
        <Series>
            <xsl:value-of select="."/>
        </Series>
    </xsl:template>

    <!-- This template matches any fo:table-body that contains "File Comments" This indicates the beginning of a new file description. -->
    <xsl:template
        match="//fo:table-body[fo:table-row/fo:table-cell/fo:block[text()='File Comments']]">
        <file>
            <xsl:apply-templates/>
        </file>
    </xsl:template>


<!-- This template matches fo:table-row that contains "Name". The following fo:table-cell[2] contains the value of the "Name" field. -->
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Name']]/fo:table-cell[2]/fo:block">
        <filename>
            <xsl:value-of select="."/>
        </filename>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Item Number']]/fo:table-cell[2]/fo:block">
        <Item_Number>
            <xsl:value-of select="."/>
        </Item_Number>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Logical Size']]/fo:table-cell[2]/fo:block">
        
        
        <filesize>
            <xsl:value-of select="translate(.,' B','')"/>
        </filesize>
        
        <!--  
         <xsl:for-each select="tokenize(.,' ')">
               <filesize>
                   <xsl:value-of select="."></xsl:value-of>
               </filesize> 
         </xsl:for-each>
        -->
        
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='File Type']]/fo:table-cell[2]/fo:block">
        <filetype>
            <xsl:value-of select="."/>
        </filetype>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Path']]/fo:table-cell[2]/fo:block">
        <filepath>
            <xsl:value-of select="."/>
        </filepath>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Created Date']]/fo:table-cell[2]/fo:block">
        <file_creation_date>
            <xsl:value-of select="."/>
        </file_creation_date>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Accessed Date']]/fo:table-cell[2]/fo:block">
        <file_accessed_date>
            <xsl:value-of select="."/>
        </file_accessed_date>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Modified Date']]/fo:table-cell[2]/fo:block">
        <file_modified_date>
            <xsl:value-of select="."/>
        </file_modified_date>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Label']]/fo:table-cell[2]/fo:block">
        
            <xsl:for-each select="tokenize(.,',')">
               <Label> 
                   <xsl:value-of select="."></xsl:value-of>
               </Label> </xsl:for-each>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='MD5 Hash']]/fo:table-cell[2]/fo:block">
        <MD5_Hash>
            <xsl:value-of select="."/>
        </MD5_Hash>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Exported as']]/fo:table-cell[2]/fo:block">
        <Export_path>
            <xsl:value-of select="."/>
        </Export_path>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Flagged Privileged']]/fo:table-cell[2]/fo:block">
        <Restricted>
            <xsl:value-of select="."/>
        </Restricted>
    </xsl:template>
    
    <xsl:template
        match="//fo:table-row[fo:table-cell/fo:block[text()='Duplicate File']]/fo:table-cell[2]/fo:block">
        <Duplicate_File>
            <xsl:value-of select="."/>
        </Duplicate_File>
    </xsl:template>
    
    
    
    
    <xsl:template match="@*|node()">

        <xsl:apply-templates select="@*|node()"/>

    </xsl:template>

</xsl:stylesheet>

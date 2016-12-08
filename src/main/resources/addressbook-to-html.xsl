<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output
            method="html"
            encoding="UTF-8"
            indent="yes"
            doctype-public="-//W3C//DTD HTML 4.01//EN"
            doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

    <xsl:template match="/addressbook">
        <html>
            <head>
                <style>

                            #zahlavie {
                            position: relative;
                            top: 0em;
                            min-width: 35em;
                            max-width: 50em;
                            height: 5em;
                            margin: 0em auto;
                            padding: 1em;
                            background-color: #000000;
                            color: #FFFFFF;
                        }
                        #obsah {
                            position: relative;
                            min-width: 35em;
                            max-width: 52em;
                            margin: 0em auto;
                            padding: 1em 0em;
                            background-color: #FFF3E0;
                            color: #000000;
                        }

                </style>
            </head>
            <body>
                <div id="zahlavie">
                    <h1><xsl:value-of select="@title"/></h1>
                </div>
                <div id="obsah">
                    <div id="text">
                        <xsl:apply-templates select="*">
                            <xsl:sort select="name/lastname"/>
                        </xsl:apply-templates>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="person">
        <xsl:apply-templates select="name"/>
        <div class="person-info">
            <xsl:apply-templates select="contact/phonenumber"/>
            <xsl:apply-templates select="contact/email"/>
            <xsl:apply-templates select="contact/website"/>
            <xsl:apply-templates select="address"/>
            <xsl:apply-templates select="contact/other"/>
            <xsl:apply-templates select="notes"/>
        </div>
    </xsl:template>

    <xsl:template match="name">
        <h3><span class="person-name">
        <xsl:value-of select="lastname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="middlename"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="firstname"/>
        </span>
        </h3>
    </xsl:template>

    <xsl:template match="contact/phonenumber">
        <xsl:text>Phone </xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:if test="@type = (@*)">
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@type"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
        <br />
    </xsl:template>

    <xsl:template match="contact/email">
        <xsl:text>Email </xsl:text>
        <a href="mailto:{//email}">
            <xsl:value-of select="//email"/>
        </a>
        <br />
    </xsl:template>

   <xsl:template match="contact/website">
        <xsl:text>Website </xsl:text>
        <a>
            <xsl:attribute name="href"><xsl:value-of select="text()"/></xsl:attribute>
            <xsl:value-of select="text()"/>
        </a>
        <br />
    </xsl:template>

    <xsl:template match="address">
        <xsl:text>Address </xsl:text>
        <xsl:value-of select="street"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="doornumber"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="postalnumber"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="city"/>
        <xsl:text>, </xsl:text>
        <xsl:value-of select="state"/>
        <br />
    </xsl:template>

    <xsl:template match="contact/other">
        <xsl:text>Other </xsl:text>
        <xsl:value-of select="nameofservice/text()"/>
        <xsl:text> :: </xsl:text>
        <xsl:value-of select="userid/text()"/>
        <br />
    </xsl:template>

    <xsl:template match="notes">
        <xsl:text>Notes </xsl:text>
        <xsl:value-of select="text()"/>
        <br />
    </xsl:template>
    
</xsl:transform>
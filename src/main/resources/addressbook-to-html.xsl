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
                        body {
                            font-family: sans-serif
                        }
                        #head {
                            position: relative;
                            top: 0em;
                            min-width: 35em;
                            max-width: 50em;
                            height: 5em;
                            margin: 0em auto;
                            padding: 1em;
                            background-color: #223038;
                            color: #FFFFFF;
                        }
                        #content {
                            position: relative;
                            min-width: 35em;
                            max-width: 52em;
                            margin: 0em auto;
                            padding: 1em 0em;
                            background-color: #E4F5FF;
                            color: #000000;
                        }
                        #text {
                            padding: 0em 1em;
                        }
                        a {
                            color: #3F8588;
                        }
                        a:hover {
                            color: #1BBEC5;
                        }

                        .person-name {
                            background-color: #E6E1CF;
                            color: #000000;
                        }
                        .person-background {
                            padding: 0.5em 0.3em 0.3em 0.5em;
                            background-color: #FFFFFF;
                            color: #000000;
                        }
                        h2 {
                            display: block;
                            font-size: 1.5em;
                            margin-top: 1em;
                            margin-bottom: 0.5em;
                            margin-left: 0;
                            margin-right: 0;
                            font-weight: bold;
                        }
                        .rowname {
                            text-align: right;
                            font-size: 1.2em;
                            font-weight: bold;
                        }


                </style>
            </head>
            <body>
                <div id="head">
                    <h1>Address Book</h1>
                </div>
                <div id="content">
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
        <div class="person-background">
      <table cellspacing="10">
        <tr>
            <td class="rowname"> Phone</td>
            <td><xsl:apply-templates select="contact/phonenumber"/></td>
        </tr>
        <tr>
            <td class="rowname">Email</td>
            <td><xsl:apply-templates select="contact/email"/></td>
        </tr>
        <tr>
            <td class="rowname">Website</td>
            <td><xsl:apply-templates select="contact/website"/></td>
        </tr>
        <tr>
            <td class="rowname">Address</td>
            <td><xsl:apply-templates select="address"/></td>
        </tr>
        <tr>
            <td class="rowname">Other</td>
            <td><xsl:apply-templates select="contact/other"/></td>
        </tr>
        <tr>
            <td class="rowname">Notes</td>
            <td><xsl:apply-templates select="notes"/></td>
        </tr>         
         </table>
        </div>
    </xsl:template>

    <xsl:template match="name">
        <h2><span class="person-background">
        <xsl:value-of select="lastname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="middlename"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="firstname"/>
        </span>
        </h2>
    </xsl:template>

    <xsl:template match="contact/phonenumber">
            <xsl:value-of select="text()"/>
            <xsl:if test="@type = (@*)">
                <xsl:text> (</xsl:text>
                <xsl:value-of select="@type"/>
                <xsl:text>)</xsl:text>
            </xsl:if>
        <br />
    </xsl:template>

    <xsl:template match="contact/email">
        <a href="mailto:{//email}">
            <xsl:value-of select="//email"/>
        </a>
        <br />
    </xsl:template>

   <xsl:template match="contact/website">
        <a>
            <xsl:attribute name="href"><xsl:value-of select="text()"/></xsl:attribute>
            <xsl:value-of select="text()"/>
        </a>
        <br />
    </xsl:template>

    <xsl:template match="address">
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
        <i><xsl:value-of select="nameofservice/text()"/></i>
        <xsl:text> :: </xsl:text>
        <xsl:value-of select="userid/text()"/>
        <br />
    </xsl:template>

    <xsl:template match="notes">
        <xsl:value-of select="text()"/>
        <br />
    </xsl:template>

</xsl:transform>
Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609FFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 12 Mar 2022 00:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiCLAGK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Mar 2022 19:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiCLAGJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Mar 2022 19:06:09 -0500
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4673A1FA5F
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Mar 2022 16:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647043503; i=@lenovo.com;
        bh=HGkPw6PowNWg/7FSPeC5u6jUxO6sTllV7xZBZDxnXGs=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type:Content-Transfer-Encoding;
        b=zP/vQyKbbCM6akFvidmF9qZOe8BzY5IinnqRi77kTKxUtkahtAhrsaSaHhQqA9eCd
         i1Jl8sp0C7jI3VR2cn5ZlkdW/klYyeFnlAehN4Wftppu/XkQXJ/jZ5tsFvZJFBRiEc
         HEVs+Rn+RfooP/o0TdFCVCL3BN/Xl5Zu+LOkdY/k4Wez2X+8hhuoaPR/ghm/J4ouNO
         5nY/AIE3V7B5Rxn83vXl/Zz0CnrjfPYad9+U7vHKfH/7F5CWU3oUYUF61tPZ0+6Nv2
         Be7ifW5XmXL2kA6Z+yyKwmxcYUNze7J8arFRRh7V2UAKb+6nC4dc/cSxaL6dCby3By
         1lR4SJnt3UdTA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAJsWRWlGSWpSXmKPExsWSoV9jrLvusXa
  SwYdLahZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGXs+vGYs
  WLOVseLUzinMDYxLZjJ2MXJxMAosZZZY//o/K4SziFXi19z9zBBOJ5PE5Hn32EEcIYH5TBKHP
  zxggnAOM0lsOD4VbICEwHFGie5D66AynYwSP16dYuli5ARyJjFJbF/NC5F4wihx98EhRgjnLa
  PEjBVrmECq2AS0JbZs+cXWxcjBISIgI/FhrSdImFkgUuLqo+9gJcICARLrV5wCs1kEVCVmvgK
  Jc3DwClhJnOnQAAlLCMhLdP/7A7aXU8Ba4n17AxPEDSES+z/+ZAexeQUEJU7OfMICMV5TonX7
  b3YIW16ieetsZoh6ZYlf/eeZYWYu/NbJAmEnSPT8e8QGYUtKXLt5gR3ClpU4enYOVI2vxNWuC
  1C2rsTaTcdZIewciZlHljBB2HISp3rPMcHM37nxNssERp1ZSM6bheS8WUjOW8DIvIrRKqkoMz
  2jJDcxM0fX0MBA19DQRNdQ18jUSC+xSjdRr7RYNzWxuETXUC+xvFgvtbhYr7gyNzknRS8vtWQ
  TIzDxpBQx/tnB2NnzU+8QoyQHk5Io7+yH2klCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjn3QfK
  CRalpqdWpGXmAJMgTFqCg0dJhDcBpJW3uCAxtzgzHSJ1ilGX48q2vXuZhVjy8vNSpcR55z0CK
  hIAKcoozYMbAUvIlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ88qCTOHJzCuB2/QK6AgmoC
  M+qmmBHFGSiJCSamDi8WOcqNqvJWn7qfu8v9vyXUccKzpsZtrdZ9Hod9euecJ8btuv/XmX0nj
  e/vH0/GH2VFqlPK8n1FT6R3P5hjOL2yatX/aBo+j9yY9d17kd07dMmvFqvgffrdeHAxepLjWR
  +/zn0DG1QJYnhd1FL9l1+lq1TUMWiWSETbp4PGj/BR+JbZGu+XFTDea83mBrtu3c01LDb7P2v
  zv3vfZUwNnPkjHh7y1n/890rIw5uk3qRbD167aWkw+ubDf72+qif3vFYf2muktpdrfu+v7eec
  TfSGjj59TcFb5PeE7X2vdlzeIMkX28w/R0k4qghKRWx6WNebWfqvckrda+uPb/63UHBB2jJTz
  M//pGfv57ceMjJZbijERDLeai4kQAX5sLpkMEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-11.tower-706.messagelabs.com!1647043500!2374!1
X-Originating-IP: [104.47.124.51]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15301 invoked from network); 12 Mar 2022 00:05:02 -0000
Received: from mail-hk2apc01lp2051.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.51)
  by server-11.tower-706.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Mar 2022 00:05:02 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3Ymu5E+AYiAD9jNGxhKxZCt5PniO/1sXHrmYs1Y6vUH2DD3JpTJtFtw/9rqQZxbs5d4F3qfRg9vKg3CKjnVyNIDpxeEiMf1EYLF+PRQMs0645OceQp+GZEUQztrTbYjB3Q+EWv0NAkFPboFLsLrDSMoWj+zATwAd5NwCW4kUhJ5RtjHZ9utyHy/uiPs9zq0HZbV+deuH1YwAFN7NQofYcDA95AtbGBD9ZcNGognGkLwuBrVR3/4fZbwHh3f6yN6ZK3Vc2nc20cV5BscuuM5W9hbK4SnfDKOb6fIj9/rkoWXpnshzx+YL3h8AzrIHVrvVoK0X/WxKrXgZfidrMDc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGkPw6PowNWg/7FSPeC5u6jUxO6sTllV7xZBZDxnXGs=;
 b=J0DfnsebqeIX/Bv4/vnbSsJEo+umFyQK0Z0p8FHq7MQxWPdIEQPdenjBCVfSkQPVrPScEfss80NcGq6McB/S3JyWlQga1GE14Vo1Ai185w3zHIf41RQ34UA/kp5WdkpY11H/Teq/mDOn7bG5VM/a4eZooHNLOsHhw7/uOG7E7dzzdg99tyWkqkoFR+KjbSVcovwTHepBcUeZE8F72OSxyD6npSKCDPitj2QG/kQ1rY+Fk28D+cqJULwPoNJCwC8+uxQqJ+G7ByAGCOGXrPvXb5r3Zz1JVcD48dO8YgWGigYbbwqynPB2+7UuePGoD3fT/N5uTtPsd2b3xucJFhCHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2PR04CA0005.apcprd04.prod.outlook.com (2603:1096:300:55::17)
 by TYZPR03MB6496.apcprd03.prod.outlook.com (2603:1096:400:1c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.17; Sat, 12 Mar
 2022 00:04:59 +0000
Received: from HK2APC01FT037.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:55:cafe::bb) by PS2PR04CA0005.outlook.office365.com
 (2603:1096:300:55::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24 via Frontend
 Transport; Sat, 12 Mar 2022 00:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT037.mail.protection.outlook.com (10.152.248.223) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Sat, 12 Mar 2022 00:04:57 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Fri, 11 Mar
 2022 19:04:56 -0500
Received: from PKOVACSXF1Q5S2Z.lenovo.com (10.85.90.15) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 19:04:53 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH 2/2] platform/x86: think-lmi: Certificate authentication support
Date:   Fri, 11 Mar 2022 19:04:39 -0500
Message-ID: <20220312000439.4143-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312000439.4143-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20220312000439.4143-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.85.90.15]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fc97d4f-02af-4c4d-1af5-08da03bbf23a
X-MS-TrafficTypeDiagnostic: TYZPR03MB6496:EE_
X-Microsoft-Antispam-PRVS: <TYZPR03MB6496DA6DBAA70B4A5FC590A2C50D9@TYZPR03MB6496.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qniE8BCin72mYf1cvZHfLUrUHpaga76dQl+q0oZOAkJ1lgCCJgj22vNPkrGmGLMvtCzg2a+mOqfUccOhTEBztnF8LHHn3dY5rVOJVLp8tOxA/+oZeVGN1k8dIoZn/SN203kzbRaUQnFL0gcF0+Ehyo3HHRSPqT9/MQhxgF00Vk5CaydTCBnzujV3hXmFwWG2W35G/6PZsp69KG4hpCzA5aqp6hZ5pjF74PpX3kc7rjsoI9SiLpDfpRXrdTOzsMROo0oh8kbMjtQOsMWep9oyYDBrK7Y6G+Y+sfrj4bxaG05qot4id+AF8kY1mMxKJuq1RJbBccObManzCeK0Q6ZjgIQBOwVYX3xIWtPpaoJ6lHd9axfhU5StH8jjLjVZkCFKuAiZxT6Jaliz2ScXtxXZQWSpV9P1EWgTBtJdRg47V92CayfYV1RiH/4ptuAJrELhOXtWjiY22IHFHZ76pAA4h0cKlS5J/ek9C5+Ib6eN/9R1gD/Qfvvs+LCBWl8AvgfiCngBECSYjVcqgvmdJY1TUArGlPFtph/EmesRP1KIIEGDDw0BvnEwfntltKyGJhLslA9MCXIn0ozK8dtZEHOBYJ3/U3I6oBXvKc9OYU1E8nqPaRmI8Rs2ogl3Ac0UEKG3EpfDU8cv+Rxx+nrJIcd5NZrv7rfuQR+Z6daW+GtWUMRwn+H2DAyacTtMDKrd2VnAnfUzyoTnzOl9HnJ6u9nsXQ==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(66574015)(426003)(7696005)(4326008)(82310400004)(336012)(8936002)(83380400001)(6666004)(70206006)(2616005)(26005)(8676002)(1076003)(316002)(6862004)(54906003)(36906005)(186003)(86362001)(37006003)(508600001)(16526019)(36756003)(6200100001)(47076005)(40460700003)(36860700001)(70586007)(7049001)(356005)(30864003)(5660300002)(81166007)(82960400001)(2906002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2022 00:04:57.9161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc97d4f-02af-4c4d-1af5-08da03bbf23a
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT037.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6496
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Implementation of certificate authentication feature for Lenovo
platforms. This allows for signed updates of BIOS settings.

Functionality supported:
 - Cert support available check. At initialisation check if BIOS
   supports certification authentication and if a certificate is
   installed. Enable the sysfs nodes appropriately
 - certificate and signature authentication attributes to enable
   a user to install, update and delete a certificate using signed
   signatures
 - certificate_thumbprint to confirm installed certificate details
 - support to go from certificate to password based authentication
 - set_signature and save_signature attributes needed for setting
   BIOS attributes using certificate authentication

Tested on X1 Carbon 10 with special trial BIOS. This feature is not
generally available yet but will be released later this year.

Note, I also cleaned up the formating of the GUIDs when I was adding
the new defines. Hope that's OK to combine in this commit.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/think-lmi.c | 560 ++++++++++++++++++++++++++-----
 drivers/platform/x86/think-lmi.h |   7 +
 2 files changed, 475 insertions(+), 92 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 0b73e16cccea..54ce71f97c37 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -16,6 +16,7 @@
 #include <linux/fs.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/dmi.h>
 #include <linux/wmi.h>
 #include "firmware_attributes_class.h"
 #include "think-lmi.h"
@@ -25,95 +26,66 @@ module_param(debug_support, bool, 0444);
 MODULE_PARM_DESC(debug_support, "Enable debug command support");
 
 /*
- * Name:
- *  Lenovo_BiosSetting
- * Description:
- *  Get item name and settings for current LMI instance.
- * Type:
- *  Query
- * Returns:
- *  "Item,Value"
- * Example:
- *  "WakeOnLAN,Enable"
+ * Name: BiosSetting
+ * Description: Get item name and settings for current LMI instance.
+ * Type: Query
+ * Returns: "Item,Value"
+ * Example: "WakeOnLAN,Enable"
  */
 #define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
 
 /*
- * Name:
- *  Lenovo_SetBiosSetting
- * Description:
- *  Change the BIOS setting to the desired value using the Lenovo_SetBiosSetting
- *  class. To save the settings, use the Lenovo_SaveBiosSetting class.
+ * Name: SetBiosSetting
+ * Description: Change the BIOS setting to the desired value using the SetBiosSetting
+ *  class. To save the settings, use the SaveBiosSetting class.
  *  BIOS settings and values are case sensitive.
  *  After making changes to the BIOS settings, you must reboot the computer
  *  before the changes will take effect.
- * Type:
- *  Method
- * Arguments:
- *  "Item,Value,Password,Encoding,KbdLang;"
- * Example:
- *  "WakeOnLAN,Disable,pa55w0rd,ascii,us;"
+ * Type: Method
+ * Arguments: "Item,Value,Password,Encoding,KbdLang;"
+ * Example: "WakeOnLAN,Disable,pa55w0rd,ascii,us;"
  */
 #define LENOVO_SET_BIOS_SETTINGS_GUID "98479A64-33F5-4E33-A707-8E251EBBC3A1"
 
 /*
- * Name:
- *  Lenovo_SaveBiosSettings
- * Description:
- *  Save any pending changes in settings.
- * Type:
- *  Method
- * Arguments:
- *  "Password,Encoding,KbdLang;"
- * Example:
- * "pa55w0rd,ascii,us;"
+ * Name: SaveBiosSettings
+ * Description: Save any pending changes in settings.
+ * Type: Method
+ * Arguments: "Password,Encoding,KbdLang;"
+ * Example: "pa55w0rd,ascii,us;"
  */
 #define LENOVO_SAVE_BIOS_SETTINGS_GUID "6A4B54EF-A5ED-4D33-9455-B0D9B48DF4B3"
 
 /*
- * Name:
- *  Lenovo_BiosPasswordSettings
- * Description:
- *  Return BIOS Password settings
- * Type:
- *  Query
- * Returns:
- *  PasswordMode, PasswordState, MinLength, MaxLength,
+ * Name: BiosPasswordSettings
+ * Description: Return BIOS Password settings
+ * Type: Query
+ * Returns: PasswordMode, PasswordState, MinLength, MaxLength,
  *  SupportedEncoding, SupportedKeyboard
  */
 #define LENOVO_BIOS_PASSWORD_SETTINGS_GUID "8ADB159E-1E32-455C-BC93-308A7ED98246"
 
 /*
- * Name:
- *  Lenovo_SetBiosPassword
- * Description:
- *  Change a specific password.
+ * Name: SetBiosPassword
+ * Description: Change a specific password.
  *  - BIOS settings cannot be changed at the same boot as power-on
  *    passwords (POP) and hard disk passwords (HDP). If you want to change
  *    BIOS settings and POP or HDP, you must reboot the system after changing
  *    one of them.
  *  - A password cannot be set using this method when one does not already
  *    exist. Passwords can only be updated or cleared.
- * Type:
- *  Method
- * Arguments:
- *  "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
- * Example:
- *  "pop,pa55w0rd,newpa55w0rd,ascii,us;”
+ * Type: Method
+ * Arguments: "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
+ * Example: "pop,pa55w0rd,newpa55w0rd,ascii,us;”
  */
 #define LENOVO_SET_BIOS_PASSWORD_GUID "2651D9FD-911C-4B69-B94E-D0DED5963BD7"
 
 /*
- * Name:
- *  Lenovo_GetBiosSelections
- * Description:
- *  Return a list of valid settings for a given item.
- * Type:
- *  Method
- * Arguments:
- *  "Item"
- * Returns:
- *  "Value1,Value2,Value3,..."
+ * Name: GetBiosSelections
+ * Description: Return a list of valid settings for a given item.
+ * Type: Method
+ * Arguments: "Item"
+ * Returns: "Value1,Value2,Value3,..."
  * Example:
  *  -> "FlashOverLAN"
  *  <- "Enabled,Disabled"
@@ -121,18 +93,14 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
 #define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
 
 /*
- * Name:
- *  Lenovo_DebugCmdGUID
- * Description
- *  Debug entry GUID method for entering debug commands to the BIOS
+ * Name: DebugCmd
+ * Description: Debug entry method for entering debug commands to the BIOS
  */
 #define LENOVO_DEBUG_CMD_GUID "7FF47003-3B6C-4E5E-A227-E979824A85D1"
 
 /*
- * Name:
- *  Lenovo_OpcodeIF
- * Description:
- *  Opcode interface which provides the ability to set multiple
+ * Name: OpcodeIF
+ * Description: Opcode interface which provides the ability to set multiple
  *  parameters and then trigger an action with a final command.
  *  This is particularly useful for simplifying setting passwords.
  *  With this support comes the ability to set System, HDD and NVMe
@@ -141,10 +109,71 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
  */
 #define LENOVO_OPCODE_IF_GUID "DFDDEF2C-57D4-48ce-B196-0FB787D90836"
 
+/*
+ * Name: SetBiosCert
+ * Description: Install BIOS certificate.
+ * Type: Method
+ * Arguments: "Certificate,Password"
+ * You must reboot the computer before the changes will take effect.
+ */
+#define LENOVO_SET_BIOS_CERT_GUID    "26861C9F-47E9-44C4-BD8B-DFE7FA2610FE"
+
+/*
+ * Name: UpdateBiosCert
+ * Description: Update BIOS certificate.
+ * Type: Method
+ * Format: "Certificate,Signature"
+ * You must reboot the computer before the changes will take effect.
+ */
+#define LENOVO_UPDATE_BIOS_CERT_GUID "9AA3180A-9750-41F7-B9F7-D5D3B1BAC3CE"
+
+/*
+ * Name: ClearBiosCert
+ * Description: Uninstall BIOS certificate.
+ * Type: Method
+ * Format: "Serial,Signature"
+ * You must reboot the computer before the changes will take effect.
+ */
+#define LENOVO_CLEAR_BIOS_CERT_GUID  "B2BC39A7-78DD-4D71-B059-A510DEC44890"
+/*
+ * Name: CertToPassword
+ * Description: Switch from certificate to password authentication.
+ * Type: Method
+ * Format: "Password,Signature"
+ * You must reboot the computer before the changes will take effect.
+ */
+#define LENOVO_CERT_TO_PASSWORD_GUID "0DE8590D-5510-4044-9621-77C227F5A70D"
+
+/*
+ * Name: SetBiosSettingCert
+ * Description: Set attribute using certificate authentication.
+ * Type: Method
+ * Format: "Item,Value,Signature"
+ */
+#define LENOVO_SET_BIOS_SETTING_CERT_GUID  "34A008CC-D205-4B62-9E67-31DFA8B90003"
+
+/*
+ * Name: SaveBiosSettingCert
+ * Description: Save any pending changes in settings.
+ * Type: Method
+ * Format: "Signature"
+ */
+#define LENOVO_SAVE_BIOS_SETTING_CERT_GUID "C050FB9D-DF5F-4606-B066-9EFC401B2551"
+
+/*
+ * Name: CertThumbprint
+ * Description: Display Certificate thumbprints
+ * Type: Query
+ * Returns: MD5, SHA1 & SHA256 thumbprints
+ */
+#define LENOVO_CERT_THUMBPRINT_GUID "C59119ED-1C0D-4806-A8E9-59AA318176C4"
+
 #define TLMI_POP_PWD (1 << 0)
 #define TLMI_PAP_PWD (1 << 1)
 #define TLMI_HDD_PWD (1 << 2)
 #define TLMI_SYS_PWD (1 << 3)
+#define TLMI_CERT    (1 << 7)
+
 #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
 #define to_tlmi_attr_setting(kobj)  container_of(kobj, struct tlmi_attr_setting, kobj)
 
@@ -608,18 +637,249 @@ static ssize_t level_store(struct kobject *kobj,
 
 static struct kobj_attribute auth_level = __ATTR_RW(level);
 
+static ssize_t cert_thumbprint(char *buf, const char *arg, int count)
+{
+	const struct acpi_buffer input = { strlen(arg), (char *)arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	const union acpi_object *obj;
+	acpi_status status;
+
+	output.length = ACPI_ALLOCATE_BUFFER;
+	output.pointer = NULL;
+
+	status = wmi_evaluate_method(LENOVO_CERT_THUMBPRINT_GUID, 0, 0, &input, &output);
+	if (ACPI_FAILURE(status)) {
+		kfree(output.pointer);
+		return -EIO;
+	}
+	obj = output.pointer;
+	if (!obj)
+		return -ENOMEM;
+	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer) {
+		kfree(output.pointer);
+		return -EIO;
+	}
+	count += sysfs_emit_at(buf, count, "%s : %s\n", arg, (char *)obj->string.pointer);
+	kfree(output.pointer);
+
+	return count;
+}
+
+static ssize_t certificate_thumbprint_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	int count = 0;
+
+	if (!tlmi_priv.certificate_support || !setting->cert_installed)
+		return -EOPNOTSUPP;
+
+	count += cert_thumbprint(buf, "Md5", count);
+	count += cert_thumbprint(buf, "Sha1", count);
+	count += cert_thumbprint(buf, "Sha256", count);
+	return count;
+}
+
+static struct kobj_attribute auth_cert_thumb = __ATTR_RO(certificate_thumbprint);
+
+static ssize_t cert_to_password_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	char *auth_str, *passwd, *p;
+	int ret;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!tlmi_priv.certificate_support)
+		return -EOPNOTSUPP;
+
+	if (!setting->cert_installed)
+		return -EINVAL;
+
+	if (!setting->signature || !setting->signature[0])
+		return -EACCES;
+
+	passwd = kstrdup(buf, GFP_KERNEL);
+	if (!passwd)
+		return -ENOMEM;
+
+	/* Strip out CR if one is present */
+	p = strchrnul(passwd, '\n');
+	*p = '\0';
+
+	/* Format: 'Password,Signature' */
+	auth_str = kasprintf(GFP_KERNEL, "%s,%s", passwd, setting->signature);
+	if (!auth_str) {
+		kfree(passwd);
+		return -ENOMEM;
+	}
+	ret = tlmi_simple_call(LENOVO_CERT_TO_PASSWORD_GUID, auth_str);
+	kfree(auth_str);
+	kfree(passwd);
+
+	return ret ?: count;
+}
+
+static struct kobj_attribute auth_cert_to_password = __ATTR_WO(cert_to_password);
+
+static ssize_t certificate_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	char *auth_str, *new_cert, *p;
+	int ret;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!tlmi_priv.certificate_support)
+		return -EOPNOTSUPP;
+
+	new_cert = kstrdup(buf, GFP_KERNEL);
+	if (!new_cert)
+		return -ENOMEM;
+	/* Strip out CR if one is present */
+	p = strchrnul(new_cert, '\n');
+	*p = '\0';
+
+	/* If empty then clear installed certificate */
+	if (new_cert[0] == '\0') { /* Clear installed certificate */
+		/* Check that signature is set */
+		if (!setting->signature || !setting->signature[0]) {
+			kfree(new_cert);
+			return -EACCES;
+		}
+		/* Format: 'serial#, signature' */
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
+				dmi_get_system_info(DMI_PRODUCT_SERIAL),
+				setting->signature);
+		if (!auth_str) {
+			kfree(new_cert);
+			return -ENOMEM;
+		}
+		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
+		kfree(auth_str);
+		return ret ?: count;
+	}
+
+	if (setting->cert_installed) {
+		/* Certificate is installed so this is an update */
+		if (!setting->signature || !setting->signature[0]) {
+			kfree(new_cert);
+			return -EACCES;
+		}
+		/* Format: 'Certificate,Signature' */
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
+				new_cert, setting->signature);
+		if (!auth_str) {
+			kfree(new_cert);
+			return -ENOMEM;
+		}
+		ret = tlmi_simple_call(LENOVO_UPDATE_BIOS_CERT_GUID, auth_str);
+		kfree(auth_str);
+	} else {
+		/* This is a fresh install */
+		if (!setting->valid || !setting->password[0]) {
+			kfree(new_cert);
+			return -EACCES;
+		}
+		/* Format: 'Certificate,Admin-password' */
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
+				new_cert, setting->password);
+		if (!auth_str) {
+			kfree(new_cert);
+			return -ENOMEM;
+		}
+		ret = tlmi_simple_call(LENOVO_SET_BIOS_CERT_GUID, auth_str);
+		kfree(auth_str);
+	}
+
+	/* If successful update stored certificate */
+	if (!ret) {
+		kfree(setting->certificate);
+		setting->certificate = new_cert;
+	} else
+		kfree(new_cert);
+
+	return ret ?: count;
+}
+
+static ssize_t certificate_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->certificate);
+}
+
+static struct kobj_attribute auth_certificate = __ATTR_RW(certificate);
+
+static ssize_t signature_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	char *new_signature, *p;
+	int ret;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!tlmi_priv.certificate_support)
+		return -EOPNOTSUPP;
+
+	new_signature = kstrdup(buf, GFP_KERNEL);
+	if (!new_signature)
+		return -ENOMEM;
+
+	/* Strip out CR if one is present */
+	p = strchrnul(new_signature, '\n');
+	*p = '\0';
+
+	/* Free any previous signature */
+	kfree(setting->signature);
+	setting->signature = new_signature;
+
+	return ret ?: count;
+}
+
+static ssize_t signature_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->signature);
+}
+
+static struct kobj_attribute auth_signature = __ATTR_RW(signature);
+
 static umode_t auth_attr_is_visible(struct kobject *kobj,
 					     struct attribute *attr, int n)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 
-	/*We only want to display level and index settings on HDD/NVMe */
+	/* We only want to display level and index settings on HDD/NVMe */
 	if ((attr == (struct attribute *)&auth_index) ||
 			(attr == (struct attribute *)&auth_level)) {
 		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
 			return attr->mode;
 		return 0;
 	}
+
+	/* We only display certificates on Admin account, if supported */
+	if ((attr == (struct attribute *)&auth_certificate) ||
+			(attr == (struct attribute *)&auth_signature) ||
+			(attr == (struct attribute *)&auth_cert_thumb) ||
+			(attr == (struct attribute *)&auth_cert_to_password)) {
+		if ((setting == tlmi_priv.pwd_admin) && tlmi_priv.certificate_support)
+			return attr->mode;
+		return 0;
+	}
+
 	return attr->mode;
 }
 
@@ -635,6 +895,10 @@ static struct attribute *auth_attrs[] = {
 	&auth_kbdlang.attr,
 	&auth_index.attr,
 	&auth_level.attr,
+	&auth_certificate.attr,
+	&auth_signature.attr,
+	&auth_cert_thumb.attr,
+	&auth_cert_to_password.attr,
 	NULL
 };
 
@@ -703,37 +967,58 @@ static ssize_t current_value_store(struct kobject *kobj,
 	p = strchrnul(new_setting, '\n');
 	*p = '\0';
 
-	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
-		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
-				tlmi_priv.pwd_admin->password,
-				encoding_options[tlmi_priv.pwd_admin->encoding],
-				tlmi_priv.pwd_admin->kbdlang);
-		if (!auth_str) {
+	/* Check if certificate authentication is enabled and active */
+	if (tlmi_priv.certificate_support && tlmi_priv.pwd_admin->cert_installed) {
+		if (!tlmi_priv.set_signature || !tlmi_priv.save_signature) {
+			ret = -EINVAL;
+			goto out;
+		}
+		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
+					new_setting, tlmi_priv.set_signature);
+		if (!set_str) {
 			ret = -ENOMEM;
 			goto out;
 		}
-	}
 
-	if (auth_str)
-		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
-				new_setting, auth_str);
-	else
-		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
-				new_setting);
-	if (!set_str) {
-		ret = -ENOMEM;
-		goto out;
-	}
+		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTING_CERT_GUID, set_str);
+		if (ret)
+			goto out;
+		ret = tlmi_simple_call(LENOVO_SAVE_BIOS_SETTING_CERT_GUID,
+				tlmi_priv.save_signature);
+		if (ret)
+			goto out;
+	} else { /* Non certiifcate based authentication */
+		if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
+			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
+					tlmi_priv.pwd_admin->password,
+					encoding_options[tlmi_priv.pwd_admin->encoding],
+					tlmi_priv.pwd_admin->kbdlang);
+			if (!auth_str) {
+				ret = -ENOMEM;
+				goto out;
+			}
+		}
 
-	ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
-	if (ret)
-		goto out;
+		if (auth_str)
+			set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
+					new_setting, auth_str);
+		else
+			set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
+					new_setting);
+		if (!set_str) {
+			ret = -ENOMEM;
+			goto out;
+		}
 
-	if (auth_str)
-		ret = tlmi_save_bios_settings(auth_str);
-	else
-		ret = tlmi_save_bios_settings("");
+		ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
+		if (ret)
+			goto out;
 
+		if (auth_str)
+			ret = tlmi_save_bios_settings(auth_str);
+		else
+			ret = tlmi_save_bios_settings("");
+	}
 	if (!ret && !tlmi_priv.pending_changes) {
 		tlmi_priv.pending_changes = true;
 		/* let userland know it may need to check reboot pending again */
@@ -823,6 +1108,63 @@ static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *
 
 static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
+static ssize_t attr_signature_store(bool set_sig, const char *buf)
+{
+	char *new_signature, *p;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!tlmi_priv.certificate_support)
+		return -EOPNOTSUPP;
+
+	new_signature = kstrdup(buf, GFP_KERNEL);
+	if (!new_signature)
+		return -ENOMEM;
+
+	/* Strip out CR if one is present */
+	p = strchrnul(new_signature, '\n');
+	*p = '\0';
+
+	/* Free any previous signature */
+	kfree(set_sig ? tlmi_priv.set_signature : tlmi_priv.save_signature);
+	if (set_sig)
+		tlmi_priv.set_signature = new_signature;
+	else
+		tlmi_priv.save_signature = new_signature;
+
+	return 0;
+}
+
+static ssize_t set_signature_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	return attr_signature_store(true /*set_sig*/, buf) ?: count;
+}
+
+static ssize_t save_signature_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	return attr_signature_store(false /*set_sig*/, buf) ?: count;
+}
+
+static ssize_t set_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "%s\n", tlmi_priv.set_signature);
+}
+
+static ssize_t save_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "%s\n", tlmi_priv.save_signature);
+}
+
+static struct kobj_attribute attr_set_signature = __ATTR_RW(set_signature);
+static struct kobj_attribute attr_save_signature = __ATTR_RW(save_signature);
+
 /* ---- Debug interface--------------------------------------------------------- */
 static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr,
 				const char *buf, size_t count)
@@ -896,8 +1238,21 @@ static void tlmi_release_attr(void)
 	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
 	if (tlmi_priv.can_debug_cmd && debug_support)
 		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
+	if (tlmi_priv.certificate_support) {
+		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj,
+				&attr_set_signature.attr);
+		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj,
+				&attr_save_signature.attr);
+	}
 	kset_unregister(tlmi_priv.attribute_kset);
 
+	if (tlmi_priv.certificate_support) {
+		kfree(tlmi_priv.pwd_admin->certificate);
+		kfree(tlmi_priv.pwd_admin->signature);
+		kfree(tlmi_priv.set_signature);
+		kfree(tlmi_priv.save_signature);
+	}
+
 	/* Authentication structures */
 	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
 	kobject_put(&tlmi_priv.pwd_admin->kobj);
@@ -975,6 +1330,17 @@ static int tlmi_sysfs_init(void)
 		if (ret)
 			goto fail_create_attr;
 	}
+	if (tlmi_priv.certificate_support) {
+		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj,
+				&attr_set_signature.attr);
+		if (ret)
+			goto fail_create_attr;
+		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj,
+				&attr_save_signature.attr);
+		if (ret)
+			goto fail_create_attr;
+	}
+
 	/* Create authentication entries */
 	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
 								&tlmi_priv.class_dev->kobj);
@@ -1087,6 +1453,11 @@ static int tlmi_analyze(void)
 	if (wmi_has_guid(LENOVO_OPCODE_IF_GUID))
 		tlmi_priv.opcode_support = true;
 
+	if (wmi_has_guid(LENOVO_SET_BIOS_CERT_GUID) &&
+		wmi_has_guid(LENOVO_SET_BIOS_SETTING_CERT_GUID) &&
+		wmi_has_guid(LENOVO_SAVE_BIOS_SETTING_CERT_GUID))
+		tlmi_priv.certificate_support = true;
+
 	/*
 	 * Try to find the number of valid settings of this machine
 	 * and use it to create sysfs attributes.
@@ -1198,6 +1569,11 @@ static int tlmi_analyze(void)
 			}
 		}
 	}
+
+	if (tlmi_priv.certificate_support &&
+		(tlmi_priv.pwdcfg.core.password_state & TLMI_CERT))
+		tlmi_priv.pwd_admin->cert_installed = true;
+
 	return 0;
 
 fail_clear_attr:
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index e46c7f383353..47c11b006f6c 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -62,6 +62,9 @@ struct tlmi_pwd_setting {
 	char kbdlang[TLMI_LANG_MAXLEN];
 	int index; /*Used for HDD and NVME auth */
 	enum level_option level;
+	bool cert_installed;
+	char *certificate;
+	char *signature;
 };
 
 /* Attribute setting details */
@@ -82,6 +85,7 @@ struct think_lmi {
 	bool pending_changes;
 	bool can_debug_cmd;
 	bool opcode_support;
+	bool certificate_support;
 
 	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
 	struct device *class_dev;
@@ -94,6 +98,9 @@ struct think_lmi {
 	struct tlmi_pwd_setting *pwd_system;
 	struct tlmi_pwd_setting *pwd_hdd;
 	struct tlmi_pwd_setting *pwd_nvme;
+
+	char *set_signature;
+	char *save_signature;
 };
 
 #endif /* !_THINK_LMI_H_ */
-- 
2.35.1


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6969C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Mar 2022 19:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344179AbiCOT6n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Mar 2022 15:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244602AbiCOT6n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Mar 2022 15:58:43 -0400
Received: from mail1.bemta35.messagelabs.com (mail1.bemta35.messagelabs.com [67.219.250.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F405620A
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647374248; i=@lenovo.com;
        bh=o8kMcuqFnZk6MQAA5wZnfUKKMk50j+AOxgIrVJ0c8LU=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type:Content-Transfer-Encoding;
        b=2dKPovlV7gJs8Chzbr3dFjv82bx6q3aykACMhALgGGpbIbg24XDFRvh3Gi5qC3cdv
         9Qvmft/n1KYyhFkmLIWNxrTWKE2cYY0eXBOCRl4JMGiPYiyfdwRSCPJupM40B5Bqza
         fZVPsQACZmZgxmvXVh6FV5LW2076GkLMmJhhufqtmJ4VWQx+E1UZZxCVxGUMPDqzI7
         fEeWVvVEVwKYKv5hJ7lvps4bg1PQCYAHPe8kTXoZxWM9L/x3Kk/k3BPtN0Zm0bpVbC
         1NJFn5pWJz6c9MpmM7tuQHeF5v0GbmUGo4q3ZhyRF1JFjKl4hDPUSTfauymJ0c8YEl
         zBfeh2LjdqCvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRWlGSWpSXmKPExsWSoS+lp7v0vUG
  SwbUOE4s3x6czWRyYOo3ZYvWeF8wOzB6bVnWyebzfd5XN4/MmuQDmKNbMvKT8igTWjMmTjrMX
  9OxnrNjz9T9LA2PbQsYuRi4ORoGlzBJ32m6yQDiLWCVuvz7FDuF0MklMnncPzBESmM0k0b7yI
  huEs59J4nTnajBHQuA4o0T3oXVMEJlORokfr06xQDgTmSQutPSxdjFyAjlPGCXWL9OGSLxklD
  jTvo8RJMEmoC2xZcsvoFkcHCICMhIf1nqChJkFIiWuPvrOBGILCwRLvLvcwAZiswioSux4OIs
  ZxOYVsJJYtWUSWI2EgLxE978/LCA2p4C1xLF7bewQe0Mk/nzdwApRLyhxcuYTFoj5mhKt23+z
  Q9jyEs1bZzND1CtL/Oo/zwwxU0Hi44aZUHaCRM+/R2wQtqTEtZsX2CFsWYmjZ+ewQNi+Evd2T
  2KEsHUldk+4B1WTI3F45zUoW07iVO85uJt3brzNMoFRZxaS82YhOW8WkvMWMDKvYrROKspMzy
  jJTczM0TU0MNA1NDQB0ka6lkZ6iVW6iXqlxbrlqcUlukBuebFeanGxXnFlbnJOil5easkmRmD
  ySSlKi9nBuK3/p94hRkkOJiVR3sJygyQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxeb4BygkWp
  6akVaZk5wEQIk5bg4FES4fV9DJTmLS5IzC3OTIdInWLU5biybe9eZiGWvPy8VClx3vVvgYoEQ
  IoySvPgRsCS8iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzT3wFN4cnMK4Hb9AroCCagI+
  ZJ64EcUZKIkJJqYFp+8P285htvCozqn33fbNEox+dk6fHkX4+8rfzzZ858s41/FEXuKlH7PIF
  d8VJ38bniycLaH89wrBc5vfHqzPvqAaJCEoeKuGZOX7/T6g5z4pl/77/cPX3OZa3fpGsKgWe+
  87NlrJlReqt+g+XZ1h+eMs5f7Q4pS99JviDjqSvkKrmb1Wfmeet8lvMsLTcYWX9tnlTBvepE+
  1lx29pp3K5zD3pfNnx9q0vHcad3gOz6R6872OSPmE0y+DK1n+1VvO6S69qb9zgy7z2U5e62bl
  Lu4rxPm2fGzxVjmPLtxAVj+aazQVksr0ISGBbOnPDifKO5hsbRKeYvqpWzw/hapyVY3p+whcu
  DVZl/zpGnL5YqsRRnJBpqMRcVJwIAi05UzUUEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-31.tower-636.messagelabs.com!1647374244!4584!1
X-Originating-IP: [104.47.26.46]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27055 invoked from network); 15 Mar 2022 19:57:25 -0000
Received: from mail-psaapc01lp2046.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.46)
  by server-31.tower-636.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2022 19:57:25 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtiYnNzU1OWiigtpYE6DQ/ptboGXbVD21wuQOtbg72rJXSTgivamDF/ua1zd261c3JHtSHYIKOvqgLOD+A1PckUWR4268AEM/AEi3c2OaIsnQGLx4K/SnVztLEA+GMpMPErmDRwp0T77dhVmimYjwEa/zJ/siZzQzb5YFn01zOl7Ufy+jrhAc7a5UDe7qf6Zjw/685UUAk51bsUWDj8fZ4jfkGiARYbHg9tPMsYtKd2wsHdQO2WhUSin4pQsqzrlaNzWTXiKYIflSOHoMEEqdCMvKlfQj6OCPQo/Uq4/ihq/a82wZEY066xbI5kWNx1r3vGTKGD6w+O4hcgtP4d2TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8kMcuqFnZk6MQAA5wZnfUKKMk50j+AOxgIrVJ0c8LU=;
 b=klVAOkxR2s7mK5t476D36CuzNCePWbnO1vBcfzfNty3pxiNscfK7AX+/nyrOnYLGO1zoH2YS1iXMNQoNGiOquGf9K1hnBbl44Do+mqvae+Wvainke9kM7/JxqQtFF8jeun0J8rTRh5+r8kgMjuZvFzr5pKY45TbMeqx3pNrWtQMR7mAGUrPafL7IXW2dxt8zDjgteFjUzBaob07NATpRevv7WXzTCBkoSzuBLK8fDUFP4NjSvlGrz15oiAX1kVZXpm5a69pPUDjaybdAtH5y70tokjCCb6uAl1pATLw9VQPZnMHYy77BhRXkYn5OJoEfBnKqhnwDRoQUIe9kHrO8jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR02CA0096.apcprd02.prod.outlook.com (2603:1096:4:90::36) by
 KL1PR03MB5948.apcprd03.prod.outlook.com (2603:1096:820:87::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.7; Tue, 15 Mar 2022 19:57:22 +0000
Received: from HK2APC01FT047.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:90:cafe::a0) by SG2PR02CA0096.outlook.office365.com
 (2603:1096:4:90::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28 via Frontend
 Transport; Tue, 15 Mar 2022 19:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 HK2APC01FT047.mail.protection.outlook.com (10.152.249.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Tue, 15 Mar 2022 19:57:22 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Tue, 15 Mar
 2022 15:57:13 -0400
Received: from x1carbon10.lenovo.com (10.85.90.243) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Tue, 15 Mar
 2022 15:57:10 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 2/2] platform/x86: think-lmi: Certificate authentication support
Date:   Tue, 15 Mar 2022 15:56:30 -0400
Message-ID: <20220315195630.3209-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315195630.3209-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20220315195630.3209-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.85.90.243]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c1e99a0-29cb-493c-3cef-08da06be0527
X-MS-TrafficTypeDiagnostic: KL1PR03MB5948:EE_
X-Microsoft-Antispam-PRVS: <KL1PR03MB59482C9DAA10940CA70A1B08C5109@KL1PR03MB5948.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /AZ8iFnlTBmgkUrGXyWVRnkf+QVj/QjBZDJfam9DwtU4bx5JRpDtwoFHAhANDrN3ERstNT5OgmVAoWN/8WXNPOvogOOEuBaxjgJU2IzMm2JHH/lKCQeUZE/gKCkJZVwFo0Yx559cM9oj04uh1cx0D1JgqCn052VZtVsZ7elr94usphBWqy+NNL8H+4gBWtBhLv33KoWq+TNz2SYHzNU7DW3o7HpecogjIyt6uZTG0Pqq1qTefGBLKNbhty/XieWMWOvl8Y9ubPKSxJyw3tM2lnmG4gsKk5oh9H+nc9HQw8skoiNASacZJM2/wK/rY8NCN3wR0ivqkxmI+A3rE8XleDsJoH93Q2xmz5b3sJDiizrVO3Zf25BAhEQWTp30Vzww07qil1IkzTrw5sVrfKGWBZd2q9NAu6UpsaTavuktIA0Pilvi+/J7PbcI3X7SZBCWh220xjtGGIq5ag5yr8wun8thfGudQPYzSqyGNRZ9aOOIy8v4n/1Gkb69aSIz8jHZPaD0xdlpBUHg1H2AA2x5b3MvqBjp3N91FzbchMGLVT4M8BVsriwO2vJViUby34uHfzP53lIhJQ9up7Gg9RsPNUiTesWNo/lrK308V046ckL2AZYyK8Y4BSj43jXYNnV2ZRFBHZR4+4/DvCFNBKqwGa4GyzAqAFxBGSZvaA/ffv1dfJBheKvgC6D0xLkUH06eAlBwvNw7X4gSZsvH6Bmtlw==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(16526019)(186003)(26005)(83380400001)(426003)(66574015)(1076003)(2906002)(8936002)(36860700001)(36756003)(336012)(5660300002)(6200100001)(30864003)(316002)(37006003)(70586007)(6862004)(4326008)(36906005)(54906003)(8676002)(70206006)(82310400004)(6666004)(86362001)(2616005)(7696005)(40460700003)(7049001)(356005)(82960400001)(47076005)(81166007)(508600001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 19:57:22.1655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1e99a0-29cb-493c-3cef-08da06be0527
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5948
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
 - signature and save_signature attributes needed for setting BIOS
   attributes using certificate authentication.

Tested on X1 Carbon 10 with special trial BIOS. This feature is not
generally available yet but will be released later this year.

Note, I also cleaned up the formating of the GUIDs when I was adding
the new defines. Hope that's OK to combine in this commit.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - Combined set_signature with signature and moved save_signature under
the authorisation folder
 - utility function to strip CR from string
 - Clean up code as recommended from review

 drivers/platform/x86/think-lmi.c | 560 +++++++++++++++++++++++++------
 drivers/platform/x86/think-lmi.h |   5 +
 2 files changed, 461 insertions(+), 104 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 0b73e16cccea..1db34a6c94c2 100644
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
 
@@ -168,6 +197,13 @@ static struct think_lmi tlmi_priv;
 static struct class *fw_attr_class;
 
 /* ------ Utility functions ------------*/
+/* Strip out CR if one is present */
+static void strip_cr(char *str)
+{
+	char *p = strchrnul(str, '\n');
+	*p = '\0';
+}
+
 /* Convert BIOS WMI error string to suitable error code */
 static int tlmi_errstr_to_err(const char *errstr)
 {
@@ -365,7 +401,6 @@ static ssize_t current_password_store(struct kobject *kobj,
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	size_t pwdlen;
-	char *p;
 
 	pwdlen = strlen(buf);
 	/* pwdlen == 0 is allowed to clear the password */
@@ -374,8 +409,7 @@ static ssize_t current_password_store(struct kobject *kobj,
 
 	strscpy(setting->password, buf, setting->maxlen);
 	/* Strip out CR if one is present, setting password won't work if it is present */
-	p = strchrnul(setting->password, '\n');
-	*p = '\0';
+	strip_cr(setting->password);
 	return count;
 }
 
@@ -386,7 +420,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 				  const char *buf, size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
-	char *auth_str, *new_pwd, *p;
+	char *auth_str, *new_pwd;
 	size_t pwdlen;
 	int ret;
 
@@ -401,8 +435,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 		return -ENOMEM;
 
 	/* Strip out CR if one is present, setting password won't work if it is present */
-	p = strchrnul(new_pwd, '\n');
-	*p = '\0';
+	strip_cr(new_pwd);
 
 	pwdlen = strlen(new_pwd);
 	/* pwdlen == 0 is allowed to clear the password */
@@ -608,18 +641,297 @@ static ssize_t level_store(struct kobject *kobj,
 
 static struct kobj_attribute auth_level = __ATTR_RW(level);
 
+static ssize_t cert_thumbprint(char *buf, const char *arg, int count)
+{
+	const struct acpi_buffer input = { strlen(arg), (char *)arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	const union acpi_object *obj;
+	acpi_status status;
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
+	char *auth_str, *passwd;
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
+	strip_cr(passwd);
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
+	char *auth_str, *new_cert;
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
+	strip_cr(new_cert);
+
+	/* If empty then clear installed certificate */
+	if (new_cert[0] == '\0') { /* Clear installed certificate */
+		kfree(new_cert);
+
+		/* Check that signature is set */
+		if (!setting->signature || !setting->signature[0])
+			return -EACCES;
+
+		/* Format: 'serial#, signature' */
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
+				dmi_get_system_info(DMI_PRODUCT_SERIAL),
+				setting->signature);
+		if (!auth_str)
+			return -ENOMEM;
+
+		ret = tlmi_simple_call(LENOVO_CLEAR_BIOS_CERT_GUID, auth_str);
+		kfree(auth_str);
+		if (ret)
+			return ret;
+
+		kfree(setting->certificate);
+		setting->certificate = NULL;
+		return count;
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
+	if (ret) {
+		kfree(new_cert);
+		return ret;
+	}
+
+	kfree(setting->certificate);
+	setting->certificate = new_cert;
+	return count;
+}
+
+static ssize_t certificate_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	if (!setting->certificate)
+		return sysfs_emit(buf, "Not set\n");
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
+	char *new_signature;
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
+	strip_cr(new_signature);
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
+	if (!setting->signature)
+		return sysfs_emit(buf, "Not set\n");
+
+	return sysfs_emit(buf, "%s\n", setting->signature);
+}
+
+static struct kobj_attribute auth_signature = __ATTR_RW(signature);
+
+static ssize_t save_signature_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	char *new_signature;
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
+	strip_cr(new_signature);
+
+	/* Free any previous signature */
+	kfree(setting->save_signature);
+	setting->save_signature = new_signature;
+
+	return ret ?: count;
+}
+
+static ssize_t save_signature_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	if (!setting->save_signature)
+		return sysfs_emit(buf, "Not set\n");
+
+	return sysfs_emit(buf, "%s\n", setting->save_signature);
+}
+
+static struct kobj_attribute auth_save_signature = __ATTR_RW(save_signature);
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
+			(attr == (struct attribute *)&auth_save_signature) ||
+			(attr == (struct attribute *)&auth_cert_thumb) ||
+			(attr == (struct attribute *)&auth_cert_to_password)) {
+		if ((setting == tlmi_priv.pwd_admin) && tlmi_priv.certificate_support)
+			return attr->mode;
+		return 0;
+	}
+
 	return attr->mode;
 }
 
@@ -635,6 +947,11 @@ static struct attribute *auth_attrs[] = {
 	&auth_kbdlang.attr,
 	&auth_index.attr,
 	&auth_level.attr,
+	&auth_certificate.attr,
+	&auth_signature.attr,
+	&auth_save_signature.attr,
+	&auth_cert_thumb.attr,
+	&auth_cert_to_password.attr,
 	NULL
 };
 
@@ -689,7 +1006,6 @@ static ssize_t current_value_store(struct kobject *kobj,
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
 	char *set_str = NULL, *new_setting = NULL;
 	char *auth_str = NULL;
-	char *p;
 	int ret;
 
 	if (!tlmi_priv.can_set_bios_settings)
@@ -700,40 +1016,60 @@ static ssize_t current_value_store(struct kobject *kobj,
 		return -ENOMEM;
 
 	/* Strip out CR if one is present */
-	p = strchrnul(new_setting, '\n');
-	*p = '\0';
+	strip_cr(new_setting);
 
-	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
-		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
-				tlmi_priv.pwd_admin->password,
-				encoding_options[tlmi_priv.pwd_admin->encoding],
-				tlmi_priv.pwd_admin->kbdlang);
-		if (!auth_str) {
+	/* Check if certificate authentication is enabled and active */
+	if (tlmi_priv.certificate_support && tlmi_priv.pwd_admin->cert_installed) {
+		if (!tlmi_priv.pwd_admin->signature || !tlmi_priv.pwd_admin->save_signature) {
+			ret = -EINVAL;
+			goto out;
+		}
+		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
+					new_setting, tlmi_priv.pwd_admin->signature);
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
+				tlmi_priv.pwd_admin->save_signature);
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
@@ -829,7 +1165,6 @@ static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr
 {
 	char *set_str = NULL, *new_setting = NULL;
 	char *auth_str = NULL;
-	char *p;
 	int ret;
 
 	if (!tlmi_priv.can_debug_cmd)
@@ -840,8 +1175,7 @@ static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr
 		return -ENOMEM;
 
 	/* Strip out CR if one is present */
-	p = strchrnul(new_setting, '\n');
-	*p = '\0';
+	strip_cr(new_setting);
 
 	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
 		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
@@ -896,8 +1230,15 @@ static void tlmi_release_attr(void)
 	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
 	if (tlmi_priv.can_debug_cmd && debug_support)
 		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
+
 	kset_unregister(tlmi_priv.attribute_kset);
 
+	if (tlmi_priv.certificate_support) {
+		kfree(tlmi_priv.pwd_admin->certificate);
+		kfree(tlmi_priv.pwd_admin->signature);
+		kfree(tlmi_priv.pwd_admin->save_signature);
+	}
+
 	/* Authentication structures */
 	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
 	kobject_put(&tlmi_priv.pwd_admin->kobj);
@@ -975,6 +1316,7 @@ static int tlmi_sysfs_init(void)
 		if (ret)
 			goto fail_create_attr;
 	}
+
 	/* Create authentication entries */
 	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
 								&tlmi_priv.class_dev->kobj);
@@ -1087,6 +1429,11 @@ static int tlmi_analyze(void)
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
@@ -1198,6 +1545,11 @@ static int tlmi_analyze(void)
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
index e46c7f383353..4f69df6eed07 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -62,6 +62,10 @@ struct tlmi_pwd_setting {
 	char kbdlang[TLMI_LANG_MAXLEN];
 	int index; /*Used for HDD and NVME auth */
 	enum level_option level;
+	bool cert_installed;
+	char *certificate;
+	char *signature;
+	char *save_signature;
 };
 
 /* Attribute setting details */
@@ -82,6 +86,7 @@ struct think_lmi {
 	bool pending_changes;
 	bool can_debug_cmd;
 	bool opcode_support;
+	bool certificate_support;
 
 	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
 	struct device *class_dev;
-- 
2.35.1


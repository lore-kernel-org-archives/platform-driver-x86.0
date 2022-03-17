Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C115C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Mar 2022 21:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiCQVmQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Mar 2022 17:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbiCQVmQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 17:42:16 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051521B2C79
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 14:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647553257; i=@lenovo.com;
        bh=9uesrfYXGFDn6TxYPCovw8LCvnVPCgOwJ6ZooELTq3Y=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Type:Content-Transfer-Encoding;
        b=NcvYyJIEKUkbgCuWlkiSeUQH7ySWYAi8a6QzYuRovRxrjBhrg1aVkeUdXAdClOaI0
         swN4jUu0ZyJd7rwFZ+YWbRsxIZOSvebC+SoatXd1zREXG03GG7cbw3/E9k2NANe2bU
         rH/Z2c2l6EKPuGI+e6awYBIg/KF4lMR3oIIB98BwKOtKKEEdVl7jfoYtlwjJq+8KWK
         GtOh3c51ZGsA3Qrg+IGJW5kgwFHoIT1tXMvmWWjBUaUsV4w25Tr6OToBwUqpB1gb7x
         u58ehnXO9Qs+/r/Ty/wMEtlheeYkzjU4JLImr1Rmr7eUTKawyadpUjmM9BMUq59r7m
         079gCrN/k9L8g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRWlGSWpSXmKPExsWSoS+Vo3ttlXG
  SwZ9lfBZvjk9nsjgwdRqzxeo9L5gdmD02repk83i/7yqbx+dNcgHMUayZeUn5FQmsGZ/urmcr
  WLKTseLT2YdsDYzfZzN2MXJxMAosZZY4teU+lLOIVaLl9UdmCKeTSWLyvHvsII6QwDwmiYNnD
  kA5h5kkevsawcokBI4zSnQfWscEkelklPjx6hQLhDOBSWLd/bWMEM4TRonnJ79DDXjMKNH8uo
  G1i5GTg01AW2LLll9sXYwcHCICMhIf1nqChJkFIiWuPvrOBGILCwRLdJzbDWazCKhKrNmzjBH
  E5hWwkpj65QEbiC0hIC/R/e8PC4jNKWAt0XBqPdh4IYEQiWXb3zBB1AtKnJz5hAVivqZE6/bf
  7BC2vETz1tnMEPXKEr/6zzNDzFSQeHf6MjuEnSDR8+8R1C5JiWs3L0DFZSWOnp3DAnK+hICvx
  MFjARBhXYlrPZehynMk/j6+C1UuJ3Gq9xwTzMk7N95mmcCoMwvJdbOQXDcLyXULGJlXMVonFW
  WmZ5TkJmbm6BoaGOgaGprompkAmRZ6iVW6iXqlxbqpicUlukZ6ieXFeqnFxXrFlbnJOSl6eak
  lmxiBySelyCFnB+OXlT/1DjFKcjApifJOXGGcJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCdxFI
  TrAoNT21Ii0zB5gIYdISHDxKIryRIGne4oLE3OLMdIjUKUZdjivb9u5lFmLJy89LlRLn7V0JV
  CQAUpRRmgc3ApaULzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5v0NMoUnM68EbtMroCOYgI
  5oFDACOaIkESEl1cAUktHN9Zn52OtnVsteL5vmcNjdbNnD5nDLRwcMYv3/skwKO1+U/3jPo8N
  BzNzPtsuapf6cxjB5WnKiU8Oe7Es5y8++k1y+TFd6+u2SnrRTnb3Jj+zKEtO/uU5YLLNFPoVv
  3vxEXraHSwMahMzun2O2nSr21ORiyOJC0U8blW8eq77jaOq75mn3BLs3F/4x7UmQExM+a/Ly3
  wS+qNVxT64skouu0d7+w7zQI1n6+8WLqV1GnbpG0QsXdbbt16vJzvF+sv3nasGpPtxLHCSlk+
  UWzQ1z2j7l+oxkl6Wm3gfkLwgrhs9oNfF/9Pvu3qLAKYXxh3coidqZrwz/6N2xibN/EW+n/ae
  dd2MyPoUk7s5VYinOSDTUYi4qTgQApLbJ2EUEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-715.messagelabs.com!1647553236!4755!1
X-Originating-IP: [104.47.26.108]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22710 invoked from network); 17 Mar 2022 21:40:37 -0000
Received: from mail-sgaapc01lp2108.outbound.protection.outlook.com (HELO APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.108)
  by server-19.tower-715.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Mar 2022 21:40:37 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIabX/cDreMGHQX+ra5zkpmHDlYgR5KuU/pXKfL2mewQhZ5ArdQBbJa3gy/xUmpZwPsnNKrkfhnixSzQXNpztEMl7y5iB0hwLfpBW/5hQHduuEEmWgyXY3THL1dNu+rRIaCu2VJ1JA55pTBeGPKrID96BkvlITiuFsRABLpUJe6v6YjRi/aNDolc3+Vp4K7Cnagg327KCYd7ehqbhEXSFulMmf2mtkFfZ9cYJxvLv2Goeu+AH8IZXism/xGMKvamQQDafR/MdjIqaqcnXGYT3FwyIVGZUMphspmMZPmeQjYJF/OwvMhxXu3qhzdJpqrd3tNUBC4SW14ftX2GKTsh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uesrfYXGFDn6TxYPCovw8LCvnVPCgOwJ6ZooELTq3Y=;
 b=X+fC616rZ7KuQxp1UawYS6KKRtTvqLiy/XpO35PgX3vuxK8j3Nf+CsCbo9Gp1jBhG/CPrURpI3+3bcAEOrH6vunO+JWdsMJtnP16UtGPn/JurlN7JzFmQlnblz9yiHNiOTRutIlPkmeWi22wdQkfSlkl+sA2UJHyqz/YPyYCjZSFr9PsZ6ADiOmfpzt0kEbXT/ivGoT7JHjgz1RmHCf4/2k6ugCXcqmxU6JBAGv+flKXODlhGkMVcvxjJhfDzIa2droCKsASGET5dZF8ylNbfrxG1M5KXHk7sMb91MW2hb5GQAV+JZquWXvsuLYmKC/PDabQQrJifEJntrQ6py5qDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2PR03CA0019.apcprd03.prod.outlook.com (2603:1096:300:5b::31)
 by KU1PR03MB2855.apcprd03.prod.outlook.com (2603:1096:802:1f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.7; Thu, 17 Mar
 2022 21:40:34 +0000
Received: from PSAAPC01FT030.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:5b:cafe::ff) by PS2PR03CA0019.outlook.office365.com
 (2603:1096:300:5b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14 via Frontend
 Transport; Thu, 17 Mar 2022 21:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PSAAPC01FT030.mail.protection.outlook.com (10.13.39.119) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 21:40:33 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 17:40:30 -0400
Received: from x1carbon10.home (10.85.81.173) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.21; Thu, 17 Mar
 2022 17:40:28 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <markgross@kernel.org>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v3 2/2] platform/x86: think-lmi: Certificate authentication support
Date:   Thu, 17 Mar 2022 17:40:08 -0400
Message-ID: <20220317214008.3459-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220317214008.3459-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20220317214008.3459-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.85.81.173]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 813e2fe0-1555-4a0f-ed2e-08da085ec41d
X-MS-TrafficTypeDiagnostic: KU1PR03MB2855:EE_
X-Microsoft-Antispam-PRVS: <KU1PR03MB2855E4B8AA17312B99DEB417C5129@KU1PR03MB2855.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p9z9FBVoDij0C0yzSuioiuukEbZG5txbxLAO3jQk6s5uorNQ4mP2lLAWuYoaYfiUNoOKEEHXv5HXOsAb6ox5pBi0EkhZdmFvRb+nYr/65MVM1xeSF6b7Ccwkc1NKVxybS42jkTDXNj/tFmwrDlWZLRdmQ6pOLB2AfYLYEW7a6Q+qSdpacBvCwoLcOiHncEKOaGd+qWChNRdq+lOa/0ycaV9L/m3vvSyaIhB82mfv5iR/NYsdbsWW0M3/WYAiZyyIMF2wpc74oUUDbB/mQA0MeO+oD3YPGTbWxr8EKbfVnvlXBeDq4syEToamYQrV9KGY8Jt64tpkN3mwJgI+eGxQZIjmdGDZmQ7fL5oDYBu90nRSnG9gc8l62BJb92eGOmiHfNT0oLGjwTOTANoDUnVqxOkqvjsPkYI6uCPI4BxVowQFQ1ucGgZhNYz9Ap4WM80FmVwm6QJW4z8QE4c2DZy9+w/9datRKVj5Ml1cEEQ4N1KQlvd/YPtr1uVTOZFRbLAWWI7LEnqcwj1xtfgjhUEC+I5uTjUqotZSYyLpjBrBuuUIp5Rcg5Tm6RHnGalpa9hWJUOCntndYoRZ+wciipDeK6TFPSmb60EzBJ7oIO4kSZSLWcdvWzNfYNi8+JJGB3WDPr0ahoU0WGsYbyRJM/4CqHmvIzgp2eHcD4c1JzVo/L/bKJX+NYIbIubLgsRcuv1yzFPi20ot0QA8sxHIy2yZbA==
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82960400001)(7049001)(2616005)(81166007)(26005)(186003)(30864003)(16526019)(336012)(426003)(66574015)(1076003)(40460700003)(356005)(6200100001)(36860700001)(8936002)(6862004)(36756003)(5660300002)(86362001)(8676002)(316002)(2906002)(82310400004)(6666004)(508600001)(83380400001)(36906005)(47076005)(37006003)(70586007)(54906003)(4326008)(70206006)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 21:40:33.2215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 813e2fe0-1555-4a0f-ed2e-08da085ec41d
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT030.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU1PR03MB2855
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

Tested on X1 Carbon G10 and X1 Yoga G7. This feature is not
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

Changes in v3:
 - Made certificate/signature attributes write only
 - Free certificate/signatures after sysfs node removed to prevent race
condition
 - Clean up certificate_store code as recommended from review

 drivers/platform/x86/think-lmi.c | 523 +++++++++++++++++++++++++------
 drivers/platform/x86/think-lmi.h |   5 +
 2 files changed, 424 insertions(+), 104 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 0b73e16cccea..407dd968ffee 100644
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
@@ -608,18 +641,260 @@ static ssize_t level_store(struct kobject *kobj,
 
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
+	char *guid;
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
+		guid = LENOVO_UPDATE_BIOS_CERT_GUID;
+		/* Format: 'Certificate,Signature' */
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
+				new_cert, setting->signature);
+	} else {
+		/* This is a fresh install */
+		if (!setting->valid || !setting->password[0]) {
+			kfree(new_cert);
+			return -EACCES;
+		}
+		guid = LENOVO_SET_BIOS_CERT_GUID;
+		/* Format: 'Certificate,Admin-password' */
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s",
+				new_cert, setting->password);
+	}
+	if (!auth_str) {
+		kfree(new_cert);
+		return -ENOMEM;
+	}
+	pr_info("Simple_call %s : %s\n", guid, auth_str);
+	ret = tlmi_simple_call(guid, auth_str);
+	kfree(auth_str);
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
+static struct kobj_attribute auth_certificate = __ATTR_WO(certificate);
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
+static struct kobj_attribute auth_signature = __ATTR_WO(signature);
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
+static struct kobj_attribute auth_save_signature = __ATTR_WO(save_signature);
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
 
@@ -635,6 +910,11 @@ static struct attribute *auth_attrs[] = {
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
 
@@ -689,7 +969,6 @@ static ssize_t current_value_store(struct kobject *kobj,
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
 	char *set_str = NULL, *new_setting = NULL;
 	char *auth_str = NULL;
-	char *p;
 	int ret;
 
 	if (!tlmi_priv.can_set_bios_settings)
@@ -700,40 +979,60 @@ static ssize_t current_value_store(struct kobject *kobj,
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
@@ -829,7 +1128,6 @@ static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr
 {
 	char *set_str = NULL, *new_setting = NULL;
 	char *auth_str = NULL;
-	char *p;
 	int ret;
 
 	if (!tlmi_priv.can_debug_cmd)
@@ -840,8 +1138,7 @@ static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr
 		return -ENOMEM;
 
 	/* Strip out CR if one is present */
-	p = strchrnul(new_setting, '\n');
-	*p = '\0';
+	strip_cr(new_setting);
 
 	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
 		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
@@ -896,6 +1193,7 @@ static void tlmi_release_attr(void)
 	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
 	if (tlmi_priv.can_debug_cmd && debug_support)
 		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
+
 	kset_unregister(tlmi_priv.attribute_kset);
 
 	/* Authentication structures */
@@ -914,6 +1212,12 @@ static void tlmi_release_attr(void)
 	}
 
 	kset_unregister(tlmi_priv.authentication_kset);
+
+	/* Free up any saved certificates/signatures */
+	kfree(tlmi_priv.pwd_admin->certificate);
+	kfree(tlmi_priv.pwd_admin->signature);
+	kfree(tlmi_priv.pwd_admin->save_signature);
+
 }
 
 static int tlmi_sysfs_init(void)
@@ -975,6 +1279,7 @@ static int tlmi_sysfs_init(void)
 		if (ret)
 			goto fail_create_attr;
 	}
+
 	/* Create authentication entries */
 	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
 								&tlmi_priv.class_dev->kobj);
@@ -1087,6 +1392,11 @@ static int tlmi_analyze(void)
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
@@ -1198,6 +1508,11 @@ static int tlmi_analyze(void)
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


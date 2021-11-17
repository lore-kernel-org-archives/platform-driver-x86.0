Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4AAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 18:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A8F861BD4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 18:45:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbhKQSs3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Nov 2021 13:48:29 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:19991 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232600AbhKQSs3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Nov 2021 13:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1637174730; i=@lenovo.com;
        bh=UEFBCI4UDv3jSb7e9j6Vam/BFviy1Fw74jdP11VoHYQ=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=p8/TnHwIotQQic8VuGqnpPIpiYKPxLu3BWjHKTBl9Ko4JGo897wrBmZb/v5IzWDxo
         LZWmkTmylfrVtmBUynsj2g81npNtcZvnkdaVvNtDJyOMFSCSDwJ/5zOb2DRbgokrg2
         L1ezewi/Pw9ZQdgD9XtTRY1FRHdBlPgoJ74PcK6ZWtIYxdHGwHtM5BzGnNo6yv7Ss8
         WMe+yrVEfBOX88eSyJXikqVbMYX/AVJPKEIM/UeolpSdVDPHyvLTtouBlxWdCNXdIa
         QW4wVh++MwmmIkvCryo6kGIj/YdL7vMKhblOKEpjpnsdUNGTfx/36infm9etMtpv4n
         aeg0ETu+g5Ngw==
Received: from [100.112.1.55] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id ED/7A-22196-9CD45916; Wed, 17 Nov 2021 18:45:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOJsWRWlGSWpSXmKPExsWSoS+lr3vSd2q
  iwYo2MYs3x6czWXzumMxisXrPC2YHZo95JwM93u+7yubxeZNcAHMUa2ZeUn5FAmvGvRWhBXPa
  GCuWz5jK1MB4uqiLkYuDUWAps8SP+QdZIJxFrBLzP0xlh3A6mSQmz7sH5ggJzGOSmHn0OAuEc
  5hJYvvXvUwgjoTAcUaJ7kPrmCAynYwSP16dgiqbyCRxvuEh1IAnjBJ/Ps1ghnBeApU1PQZyOD
  nYBLQltmz5xdbFyMEhIiAj8WGtJ0iYWSBaovntFVYQW1jAXmLh00lg5SwCqhK/J80Cs3kFrCR
  ap/xnBLElBOQlTp+4BmZzClhLPP8K8hMn0K4Qidkbl7ND1AtKnJz5hAVivrxE89bZzBC2hMTB
  Fy+YIeqVJX71n2eGmKkgMeX4ISg7QaLn3yM2CFtS4trNC+wQtqzE0bNzWCBsX4nNW2awQthaE
  g3rb0LZORKrXz+CmqMm0XrnAZQtJ3Gq9xzTBEbdWUjOm4XkvFlIzlvAyLyK0SypKDM9oyQ3MT
  NH19DAQNfQ0EjXAMTSS6zSTdIrLdZNTSwu0TXUSywv1iuuzE3OSdHLSy3ZxAhMNykFDCk7GO+
  +/qB3iFGSg0lJlPe31tREIb6k/JTKjMTijPii0pzU4kOMMhwcShK8672BcoJFqempFWmZOcDU
  B5OW4OBREuHl9gFK8xYXJOYWZ6ZDpE4xWnJMeDl3ETNHV89CIDnpyO7tzEIsefl5qVLivB9A5
  gmANGSU5sGNg6XnS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEebVB1vJk5pXAbX0FdBAT0E
  GylyeDHFSSiJCSamByVlGNzVh7arogyyIHoff/WRS2Sr5c8CPRpG3Lxj1mT1VvzQ3InyF24sL
  fb9uZDDd+PatmzW13fA2L17ZFcc4Fh7IlOtbmqi7wbWNpTg80T3i9PHV9cNQm5eC7l1V+ebC7
  qNx5xfmLvft+Fuvk+UcZy+XePY8JyAvkjpk1e7bhganZF1dMltjcFdV1qvr9Nqd5zetV+uTln
  x1yWBaYd6pVViBgX8izq8wtaW4CU7ySrZKuH5ke8Cf/hpOjzZdvsyRvqLx0K7wdzbKVsbi73f
  LrivV9E+IiVBeE/N+zp6R9rsP697/WbLz3RkiWOdxiv2uYAtdaZduNP6TfHfzprq929cgdY37
  7qAe6C4JF7h1RYinOSDTUYi4qTgQAKzxs/UoEAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-396.messagelabs.com!1637174727!217338!1
X-Originating-IP: [104.47.26.47]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7151 invoked from network); 17 Nov 2021 18:45:28 -0000
Received: from mail-psaapc01lp2047.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.47)
  by server-6.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Nov 2021 18:45:28 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCNaijJUHGJS+2OlldY9H6bKf0IcC0phpJErqtiNqLp1z+whocW14e888e23DqgkdRjtHZoOj9N7u0IjexRMEWhFxKVbEPE8VMW5SmZBAKnOrmT5nvqguGeRWF5h3KqmA45WJDB6HO3tTiRqYKW12kYI+Z5ycXakPpiKDRQvCHTUMD8aRiO0g/HduxNBTjiDiinfHjoSN2Oj0s/7V7NgDAZwXfybgn9Ix3F7TZXy+fAo29H/KfF/hx7CBXGAmp7DLX1oQ+NTZOH0XRhcmrBBh+OcLpRTx6eIGdYRToli295jHrljkQ9aFj9h0+2esZc5GDapBmxx+p03iMgVSQZoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEFBCI4UDv3jSb7e9j6Vam/BFviy1Fw74jdP11VoHYQ=;
 b=oAI6sCQxg9XrsrJ481yCvkx/W4Ev6iPZ65LGrBglYqDBer8b31L3DEheAPxqXBf2TDNbkt1QT0g7zPu22AFwTW1kgiupF8kXFv/rF3aqka27XSH8fsDesafUzbYp00PW0JZBJA0ECRUrywYlUTRtIxyH98FlosRteZ6TY8M7xo9DCkf0UFEks5jj7JW8/iAs7fsMvFdGqV0fxD0dQxq4zrVR+vbjj67IgekzFUqF+ul++HIf6ve/mXKbLZJrIox7GrEyqm3Wp3Zhz1xReGpWz1mI580JjLkpOrKdIEFeFcCRqEcpXPzesMHsihxeqryyCuFv/bYwj+1Rl7IE0+loEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.7) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PS2P216CA0026.KORP216.PROD.OUTLOOK.COM (2603:1096:300:1a::12)
 by KL1PR03MB4824.apcprd03.prod.outlook.com (2603:1096:820:1b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.15; Wed, 17 Nov
 2021 18:45:25 +0000
Received: from PU1APC01FT060.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:1a:cafe::5a) by PS2P216CA0026.outlook.office365.com
 (2603:1096:300:1a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 17 Nov 2021 18:45:25 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.7) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.7 as permitted sender)
Received: from mail.lenovo.com (104.232.225.7) by
 PU1APC01FT060.mail.protection.outlook.com (10.152.253.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 18:45:24 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 17 Nov
 2021 13:45:23 -0500
Received: from localhost.localdomain (10.64.82.201) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Wed, 17 Nov
 2021 13:45:21 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v2 2/2] platform/x86: think-lmi: Opcode support
Date:   Wed, 17 Nov 2021 13:44:53 -0500
Message-ID: <20211117184453.2476-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117184453.2476-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20211117184453.2476-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.82.201]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b16f5572-2ccf-477a-a995-08d9a9fa6b15
X-MS-TrafficTypeDiagnostic: KL1PR03MB4824:
X-Microsoft-Antispam-PRVS: <KL1PR03MB482486720252546CCF6A5F69C59A9@KL1PR03MB4824.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LbAbiSYv99C2EGt/XXtusCoCyALfyJVVOcCmpQ2r26Cwr1L9IXbYn4lAVZx6oDRB0yEaXnuRyrLYw1zvv+nOXaQwuLuuQcmgCRIq9a3AbtxvBkxi4xX8QQySfkcCJLoui0NodexUZsVe6qS4Zhc5AHVlmiCNmBO5hHEHjpqsRc2TAJT/X0fR72Dq7fkOGFCbbcbX1AgLaCHjScin41L4mxGU8mYoM1mpAEFaTr82vCZzWQZgSITO1ZQKFr+nVbE48Nly5d4gxS3E5LKOIZH9foOQmf0JIUl4QjDGYxFL2FHz/3udpuiXLHWlVK9kfiCv8xoXIwUIrtJH5nGWDOn2eZ2iDFh7JbocolDkCd+7Q4oHxvRHOBwkZYErAAoAoYy3FLGvdYtZM0+u4bxE/aD+JFxJnmFqqUbAy8BwVphdcZedwReV26d3jVLafS7oq07XKVHS7DfpYAxtX5KJJP8p6DDLkK233KamLHqLoP6XNhUzFIc6omJV/+dCE8EuQJu8EP+jjHvYXgIo3EjAGrWR4imd1Kxsmr3glbD9LjUqJdQqoPr1d8BRD2+9ZENiehx4lqdraAgbtV+sHWax8W4OO2hMeToJSpfHimWHSnj1e3S13MvQmNsaBpRZzgxPRyEkYuSYd2GWiliyxlRxBSLdOJo0+lfkUNfHbn+j2OmlQYifNEUdXB+q8wi1IzVajaSB99vwDOl3MD9c6GA4xk4u4987oTirLpnynAKzFA19wE=
X-Forefront-Antispam-Report: CIP:104.232.225.7;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(5660300002)(2906002)(356005)(70206006)(8936002)(86362001)(83380400001)(81166007)(36756003)(26005)(36860700001)(16526019)(47076005)(8676002)(70586007)(2616005)(7049001)(82310400003)(316002)(82960400001)(1076003)(30864003)(6666004)(6200100001)(336012)(54906003)(4326008)(426003)(508600001)(36906005)(6862004)(37006003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 18:45:24.8563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b16f5572-2ccf-477a-a995-08d9a9fa6b15
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.7];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB4824
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Implement Opcode support.
This is available on ThinkCenter and ThinkStations platforms and
gives improved password setting capabilities

Add options to configure System, HDD & NVMe passwords.
HDD & NVMe passwords need a user level (user/master) along with
drive index.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - Rebased to latest
 - Fixed kobject_init implementation for system-mgmt and drive roles
 - Added is_visible support for level and index attributes

 drivers/platform/x86/think-lmi.c | 316 +++++++++++++++++++++++++++----
 drivers/platform/x86/think-lmi.h |  28 ++-
 2 files changed, 310 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index c4d9c45350f7..6819bcac7d2e 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -128,8 +128,23 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
  */
 #define LENOVO_DEBUG_CMD_GUID "7FF47003-3B6C-4E5E-A227-E979824A85D1"
 
+/*
+ * Name:
+ *  Lenovo_OpcodeIF
+ * Description:
+ *  Opcode interface which provides the ability to set multiple
+ *  parameters and then trigger an action with a final command.
+ *  This is particularly useful for simplifying setting passwords.
+ *  With this support comes the ability to set System, HDD and NVMe
+ *  passwords.
+ *  This is currently available on ThinkCenter and ThinkStations platforms
+ */
+#define LENOVO_OPCODE_IF_GUID "DFDDEF2C-57D4-48ce-B196-0FB787D90836"
+
 #define TLMI_POP_PWD (1 << 0)
 #define TLMI_PAP_PWD (1 << 1)
+#define TLMI_HDD_PWD (1 << 2)
+#define TLMI_SYS_PWD (1 << 3)
 #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
 #define to_tlmi_attr_setting(kobj)  container_of(kobj, struct tlmi_attr_setting, kobj)
 
@@ -145,6 +160,10 @@ static const char * const encoding_options[] = {
 	[TLMI_ENCODING_ASCII] = "ascii",
 	[TLMI_ENCODING_SCANCODE] = "scancode",
 };
+static const char * const level_options[] = {
+	[TLMI_LEVEL_USER] = "user",
+	[TLMI_LEVEL_MASTER] = "master",
+};
 static struct think_lmi tlmi_priv;
 static struct class *fw_attr_class;
 
@@ -233,6 +252,7 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	const union acpi_object *obj;
 	acpi_status status;
+	int copy_size;
 
 	if (!tlmi_priv.can_get_password_settings)
 		return -EOPNOTSUPP;
@@ -253,14 +273,21 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
 	 * The size of thinkpad_wmi_pcfg on ThinkStation is larger than ThinkPad.
 	 * To make the driver compatible on different brands, we permit it to get
 	 * the data in below case.
+	 * Settings must have at minimum the core fields available
 	 */
-	if (obj->buffer.length < sizeof(struct tlmi_pwdcfg)) {
+	if (obj->buffer.length < sizeof(struct tlmi_pwdcfg_core)) {
 		pr_warn("Unknown pwdcfg buffer length %d\n", obj->buffer.length);
 		kfree(obj);
 		return -EIO;
 	}
-	memcpy(pwdcfg, obj->buffer.pointer, sizeof(struct tlmi_pwdcfg));
+
+	copy_size = obj->buffer.length < sizeof(struct tlmi_pwdcfg) ?
+		obj->buffer.length : sizeof(struct tlmi_pwdcfg);
+	memcpy(pwdcfg, obj->buffer.pointer, copy_size);
 	kfree(obj);
+
+	if (WARN_ON(pwdcfg->core.max_length >= TLMI_PWD_BUFSIZE))
+		pwdcfg->core.max_length = TLMI_PWD_BUFSIZE - 1;
 	return 0;
 }
 
@@ -270,6 +297,20 @@ static int tlmi_save_bios_settings(const char *password)
 				password);
 }
 
+static int tlmi_opcode_setting(char *setting, const char *value)
+{
+	char *opcode_str;
+	int ret;
+
+	opcode_str = kasprintf(GFP_KERNEL, "%s:%s;", setting, value);
+	if (!opcode_str)
+		return -ENOMEM;
+
+	ret = tlmi_simple_call(LENOVO_OPCODE_IF_GUID, opcode_str);
+	kfree(opcode_str);
+	return ret;
+}
+
 static int tlmi_setting(int item, char **value, const char *guid_string)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
@@ -370,16 +411,54 @@ static ssize_t new_password_store(struct kobject *kobj,
 		goto out;
 	}
 
-	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
-	auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",
-		 setting->pwd_type, setting->password, new_pwd,
-		 encoding_options[setting->encoding], setting->kbdlang);
-	if (!auth_str) {
-		ret = -ENOMEM;
-		goto out;
+	/* If opcode support is present use that interface */
+	if (tlmi_priv.opcode_support) {
+		char pwd_type[8];
+
+		/* Special handling required for HDD and NVMe passwords */
+		if (setting == tlmi_priv.pwd_hdd) {
+			if (setting->level == TLMI_LEVEL_USER)
+				sprintf(pwd_type, "uhdp%d", setting->index);
+			else
+				sprintf(pwd_type, "mhdp%d", setting->index);
+		} else if (setting == tlmi_priv.pwd_nvme) {
+			if (setting->level == TLMI_LEVEL_USER)
+				sprintf(pwd_type, "unvp%d", setting->index);
+			else
+				sprintf(pwd_type, "mnvp%d", setting->index);
+		} else {
+			sprintf(pwd_type, "%s", setting->pwd_type);
+		}
+
+		ret = tlmi_opcode_setting("WmiOpcodePasswordType", pwd_type);
+		if (ret)
+			goto out;
+
+		if (tlmi_priv.pwd_admin->valid) {
+			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
+					tlmi_priv.pwd_admin->password);
+			if (ret)
+				goto out;
+		}
+		ret = tlmi_opcode_setting("WmiOpcodePasswordCurrent01", setting->password);
+		if (ret)
+			goto out;
+		ret = tlmi_opcode_setting("WmiOpcodePasswordNew01", new_pwd);
+		if (ret)
+			goto out;
+		ret = tlmi_simple_call(LENOVO_OPCODE_IF_GUID, "WmiOpcodePasswordSetUpdate;");
+	} else {
+		/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",
+				setting->pwd_type, setting->password, new_pwd,
+				encoding_options[setting->encoding], setting->kbdlang);
+		if (!auth_str) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
+		kfree(auth_str);
 	}
-	ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
-	kfree(auth_str);
 out:
 	kfree(new_pwd);
 	return ret ?: count;
@@ -475,6 +554,75 @@ static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
 }
 static struct kobj_attribute auth_role = __ATTR_RO(role);
 
+static ssize_t index_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->index);
+}
+
+static ssize_t index_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	int err, val;
+
+	err = kstrtoint(buf, 10, &val);
+	if (err < 0)
+		return err;
+
+	if (val > TLMI_INDEX_MAX)
+		return -EINVAL;
+
+	setting->index = val;
+	return count;
+}
+
+static struct kobj_attribute auth_index = __ATTR_RW(index);
+
+static ssize_t level_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", level_options[setting->level]);
+}
+
+static ssize_t level_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	int i;
+
+	/* Scan for a matching profile */
+	i = sysfs_match_string(level_options, buf);
+	if (i < 0)
+		return -EINVAL;
+
+	setting->level = i;
+	return count;
+}
+
+static struct kobj_attribute auth_level = __ATTR_RW(level);
+
+static umode_t auth_attr_is_visible(struct kobject *kobj,
+					     struct attribute *attr, int n)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	/*We only want to display level and index settings on HDD/NVMe */
+	if ((attr == (struct attribute *)&auth_index) ||
+			(attr == (struct attribute *)&auth_level)) {
+		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
+			return attr->mode;
+		return 0;
+	}
+	return attr->mode;
+}
+
 static struct attribute *auth_attrs[] = {
 	&auth_is_pass_set.attr,
 	&auth_min_pass_length.attr,
@@ -485,10 +633,13 @@ static struct attribute *auth_attrs[] = {
 	&auth_mechanism.attr,
 	&auth_encoding.attr,
 	&auth_kbdlang.attr,
+	&auth_index.attr,
+	&auth_level.attr,
 	NULL
 };
 
 static const struct attribute_group auth_attr_group = {
+	.is_visible = auth_attr_is_visible,
 	.attrs = auth_attrs,
 };
 
@@ -752,6 +903,16 @@ static void tlmi_release_attr(void)
 	kobject_put(&tlmi_priv.pwd_admin->kobj);
 	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
 	kobject_put(&tlmi_priv.pwd_power->kobj);
+
+	if (tlmi_priv.opcode_support) {
+		sysfs_remove_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
+		kobject_put(&tlmi_priv.pwd_system->kobj);
+		sysfs_remove_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
+		kobject_put(&tlmi_priv.pwd_hdd->kobj);
+		sysfs_remove_group(&tlmi_priv.pwd_nvme->kobj, &auth_attr_group);
+		kobject_put(&tlmi_priv.pwd_nvme->kobj);
+	}
+
 	kset_unregister(tlmi_priv.authentication_kset);
 }
 
@@ -831,7 +992,7 @@ static int tlmi_sysfs_init(void)
 		goto fail_create_attr;
 
 	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
-	ret = kobject_add(&tlmi_priv.pwd_power->kobj, NULL, "%s", "System");
+	ret = kobject_add(&tlmi_priv.pwd_power->kobj, NULL, "%s", "Power-on");
 	if (ret)
 		goto fail_create_attr;
 
@@ -839,6 +1000,35 @@ static int tlmi_sysfs_init(void)
 	if (ret)
 		goto fail_create_attr;
 
+	if (tlmi_priv.opcode_support) {
+		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
+		ret = kobject_add(&tlmi_priv.pwd_system->kobj, NULL, "%s", "System");
+		if (ret)
+			goto fail_create_attr;
+
+		ret = sysfs_create_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
+		if (ret)
+			goto fail_create_attr;
+
+		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
+		ret = kobject_add(&tlmi_priv.pwd_hdd->kobj, NULL, "%s", "HDD");
+		if (ret)
+			goto fail_create_attr;
+
+		ret = sysfs_create_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
+		if (ret)
+			goto fail_create_attr;
+
+		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
+		ret = kobject_add(&tlmi_priv.pwd_nvme->kobj, NULL, "%s", "NVMe");
+		if (ret)
+			goto fail_create_attr;
+
+		ret = sysfs_create_group(&tlmi_priv.pwd_nvme->kobj, &auth_attr_group);
+		if (ret)
+			goto fail_create_attr;
+	}
+
 	return ret;
 
 fail_create_attr:
@@ -851,9 +1041,27 @@ static int tlmi_sysfs_init(void)
 }
 
 /* ---- Base Driver -------------------------------------------------------- */
+static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
+			    const char *pwd_role)
+{
+	struct tlmi_pwd_setting *new_pwd;
+
+	new_pwd = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	if (!new_pwd)
+		return NULL;
+
+	strscpy(new_pwd->kbdlang, "us", TLMI_LANG_MAXLEN);
+	new_pwd->encoding = TLMI_ENCODING_ASCII;
+	new_pwd->pwd_type = pwd_type;
+	new_pwd->role = pwd_role;
+	new_pwd->minlen = tlmi_priv.pwdcfg.core.min_length;
+	new_pwd->maxlen = tlmi_priv.pwdcfg.core.max_length;
+	new_pwd->index = 0;
+	return new_pwd;
+}
+
 static int tlmi_analyze(void)
 {
-	struct tlmi_pwdcfg pwdcfg;
 	acpi_status status;
 	int i, ret;
 
@@ -873,6 +1081,9 @@ static int tlmi_analyze(void)
 	if (wmi_has_guid(LENOVO_DEBUG_CMD_GUID))
 		tlmi_priv.can_debug_cmd = true;
 
+	if (wmi_has_guid(LENOVO_OPCODE_IF_GUID))
+		tlmi_priv.opcode_support = true;
+
 	/*
 	 * Try to find the number of valid settings of this machine
 	 * and use it to create sysfs attributes.
@@ -923,45 +1134,79 @@ static int tlmi_analyze(void)
 	}
 
 	/* Create password setting structure */
-	ret = tlmi_get_pwd_settings(&pwdcfg);
+	ret = tlmi_get_pwd_settings(&tlmi_priv.pwdcfg);
 	if (ret)
 		goto fail_clear_attr;
 
-	tlmi_priv.pwd_admin = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	tlmi_priv.pwd_admin = tlmi_create_auth("pap", "bios-admin");
 	if (!tlmi_priv.pwd_admin) {
 		ret = -ENOMEM;
 		goto fail_clear_attr;
 	}
-	strscpy(tlmi_priv.pwd_admin->kbdlang, "us", TLMI_LANG_MAXLEN);
-	tlmi_priv.pwd_admin->encoding = TLMI_ENCODING_ASCII;
-	tlmi_priv.pwd_admin->pwd_type = "pap";
-	tlmi_priv.pwd_admin->role = "bios-admin";
-	tlmi_priv.pwd_admin->minlen = pwdcfg.min_length;
-	if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_BUFSIZE))
-		pwdcfg.max_length = TLMI_PWD_BUFSIZE - 1;
-	tlmi_priv.pwd_admin->maxlen = pwdcfg.max_length;
-	if (pwdcfg.password_state & TLMI_PAP_PWD)
+	if (tlmi_priv.pwdcfg.core.password_state & TLMI_PAP_PWD)
 		tlmi_priv.pwd_admin->valid = true;
 
 	kobject_init(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype);
 
-	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
 	if (!tlmi_priv.pwd_power) {
 		ret = -ENOMEM;
 		goto fail_free_pwd_admin;
 	}
-	strscpy(tlmi_priv.pwd_power->kbdlang, "us", TLMI_LANG_MAXLEN);
-	tlmi_priv.pwd_power->encoding = TLMI_ENCODING_ASCII;
-	tlmi_priv.pwd_power->pwd_type = "pop";
-	tlmi_priv.pwd_power->role = "power-on";
-	tlmi_priv.pwd_power->minlen = pwdcfg.min_length;
-	tlmi_priv.pwd_power->maxlen = pwdcfg.max_length;
-
-	if (pwdcfg.password_state & TLMI_POP_PWD)
+	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
 		tlmi_priv.pwd_power->valid = true;
 
 	kobject_init(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype);
 
+	if (tlmi_priv.opcode_support) {
+		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
+		if (!tlmi_priv.pwd_system) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
+		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
+			tlmi_priv.pwd_system->valid = true;
+
+		kobject_init(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype);
+
+		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
+		if (!tlmi_priv.pwd_hdd) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
+		kobject_init(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype);
+
+		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
+		if (!tlmi_priv.pwd_nvme) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
+		kobject_init(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype);
+
+		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
+			/* Check if PWD is configured and set index to first drive found */
+			if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
+					tlmi_priv.pwdcfg.ext.hdd_master_password) {
+				tlmi_priv.pwd_hdd->valid = true;
+				if (tlmi_priv.pwdcfg.ext.hdd_master_password)
+					tlmi_priv.pwd_hdd->index =
+						ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
+				else
+					tlmi_priv.pwd_hdd->index =
+						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
+			}
+			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
+					tlmi_priv.pwdcfg.ext.nvme_master_password) {
+				tlmi_priv.pwd_nvme->valid = true;
+				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
+					tlmi_priv.pwd_nvme->index =
+						ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
+				else
+					tlmi_priv.pwd_nvme->index =
+						ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
+			}
+		}
+	}
 	return 0;
 
 fail_free_pwd_admin:
@@ -973,6 +1218,11 @@ static int tlmi_analyze(void)
 			kfree(tlmi_priv.setting[i]);
 		}
 	}
+	kfree(tlmi_priv.pwd_admin);
+	kfree(tlmi_priv.pwd_power);
+	kfree(tlmi_priv.pwd_system);
+	kfree(tlmi_priv.pwd_hdd);
+	kfree(tlmi_priv.pwd_nvme);
 	return ret;
 }
 
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index 2ce5086a5af2..e46c7f383353 100644
--- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -9,6 +9,7 @@
 #define TLMI_SETTINGS_MAXLEN 512
 #define TLMI_PWD_BUFSIZE     129
 #define TLMI_LANG_MAXLEN       4
+#define TLMI_INDEX_MAX        32
 
 /* Possible error values */
 struct tlmi_err_codes {
@@ -21,8 +22,13 @@ enum encoding_option {
 	TLMI_ENCODING_SCANCODE,
 };
 
+enum level_option {
+	TLMI_LEVEL_USER,
+	TLMI_LEVEL_MASTER,
+};
+
 /* password configuration details */
-struct tlmi_pwdcfg {
+struct tlmi_pwdcfg_core {
 	uint32_t password_mode;
 	uint32_t password_state;
 	uint32_t min_length;
@@ -31,6 +37,18 @@ struct tlmi_pwdcfg {
 	uint32_t supported_keyboard;
 };
 
+struct tlmi_pwdcfg_ext {
+	uint32_t hdd_user_password;
+	uint32_t hdd_master_password;
+	uint32_t nvme_user_password;
+	uint32_t nvme_master_password;
+};
+
+struct tlmi_pwdcfg {
+	struct tlmi_pwdcfg_core core;
+	struct tlmi_pwdcfg_ext ext;
+};
+
 /* password setting details */
 struct tlmi_pwd_setting {
 	struct kobject kobj;
@@ -42,6 +60,8 @@ struct tlmi_pwd_setting {
 	int maxlen;
 	enum encoding_option encoding;
 	char kbdlang[TLMI_LANG_MAXLEN];
+	int index; /*Used for HDD and NVME auth */
+	enum level_option level;
 };
 
 /* Attribute setting details */
@@ -61,13 +81,19 @@ struct think_lmi {
 	bool can_get_password_settings;
 	bool pending_changes;
 	bool can_debug_cmd;
+	bool opcode_support;
 
 	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
 	struct device *class_dev;
 	struct kset *attribute_kset;
 	struct kset *authentication_kset;
+
+	struct tlmi_pwdcfg pwdcfg;
 	struct tlmi_pwd_setting *pwd_admin;
 	struct tlmi_pwd_setting *pwd_power;
+	struct tlmi_pwd_setting *pwd_system;
+	struct tlmi_pwd_setting *pwd_hdd;
+	struct tlmi_pwd_setting *pwd_nvme;
 };
 
 #endif /* !_THINK_LMI_H_ */
-- 
2.31.1


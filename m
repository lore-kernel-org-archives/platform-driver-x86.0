Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AB8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 23:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DD1B61151
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 23:26:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240518AbhKHX3G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 18:29:06 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.112]:20162 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240249AbhKHX3F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 18:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1636413980; i=@lenovo.com;
        bh=vJKpJQ/xMAneCM/12cv7K/9xJTIng2ZWjvw7kTvBYEk=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=gAoyDs8lbK/40BB8ySVEbukCVnAnWG0LO/SichCxE/KLw/eM58TWgwa2Ht1hHfg9B
         3HJzBV6a64M6KTmcBZQ/ayR8GcNiH/HhknKsVpwDOOhm8nUttajMDvBBo3W5mxIccm
         oUlHeoWL9dr9YBs5AseDasy/hKns8fPuROx532eCf1m4OjUvOcGp1AJSFXJ175LHmJ
         bH/EToSHxn5+GeV1eyWC9VYsiu1tge44Mp1RqcdiZGNwwv9zbJpuTbzCm4nx9h2LW7
         ILin/K7/sMWURj5ebiUlOWwrw1wwnLeq/ycEL9AoD9uXqqws1w8AnDva2/khBmwjIj
         36/hfOoNd8omw==
Received: from [100.112.6.161] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-east-1.aws.symcld.net id EB/4F-07841-C12B9816; Mon, 08 Nov 2021 23:26:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKJsWRWlGSWpSXmKPExsWSoV9jqiuzqTP
  RYMV7Ros3x6czWXzumMxisXrPC2YHZo95JwM93u+7yubxeZNcAHMUa2ZeUn5FAmtG45GbzAVP
  6itmLV/H3MDYmNvFyMXBKLCUWeLQr4mMEM4iVolD/2czQTidTBKLumeydTFycAgJzGeSeJ8ME
  hcSOMgkMWfeZzYQR0LgAaPEgSe3WCAynYwSu7f+YINwJjJJnF+0hRXCecwosWdbBzuE84RRYk
  nTcaAtnBxsAtoSW7b8AlsiIiAj8WGtJ0iYWSBaovntFVYQW1jARuLCy41MICUsAioSn9+Ggpi
  8QOFpPWYgFRIC8hKnT1xjBLE5BWwl2mfPZgGxhQTCJP6/2coOYvMKCEqcnPmEBWK6vETz1tnM
  ELaExMEXL5gh6pUlfvWfZwYZLyGgIHF5uTnE+ASJnn+P2CBsSYlrNy+wQ9iyEkfPzmGBsH0l5
  v5rZ4do1ZJoWpkHEc6RODZ7PiuErSpx/flGKFtO4lTvOaYJjLqzkBw3C8lxs5Act4CReRWjWV
  JRZnpGSW5iZo6uoYGBrqGhka6JrpGxhV5ilW6yXmmxbmpicYmuoV5iebFecWVuck6KXl5qySZ
  GYIpJKWB5t4Px7OsPeocYJTmYlER5VVd2JgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4P2xBign
  WJSanlqRlpkDTHcwaQkOHiURXvWNQGne4oLE3OLMdIjUKUZdjgkv5y5iFmLJy89LlRLntQcpE
  gApyijNgxsBS72XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzGoFM4cnMK4Hb9AroCCagIw
  5+aQc5oiQRISXVwLRsa1Vxj0+x098U/yMcE14l1c30qf14fVnc5F1PihWSBP9F/YyzWDVZmaP
  k0HnPP18Ln50o4ZsudPeBdM7hOs+yU3GckhMtzNK+X9nOIzwrfh7rUutzxXNnGDKZ/Ms3l14v
  IeXOsadmvloGA9uVu+LSvxP6OVn0jz43d3F6a/7Hc83Ze9si/z29/uPsP7EHbqLHs6ZrH7U9d
  /HiuVrrMuGWbXcWCTlUeW+c+Vtj6rG5pXaXIj23P6r2LDl8557j7GPysy9rmDoJWj+1nXDqWb
  5WctvnFolWvToB0/gaxzLTmrW23bseu87bf+0ay2KmNQwX81clLFqQt2163r3205827O58flY
  obn20aXrMOwMlluKMREMt5qLiRAAE+XCDOAQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-18.tower-406.messagelabs.com!1636413978!134092!1
X-Originating-IP: [104.47.124.53]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22456 invoked from network); 8 Nov 2021 23:26:19 -0000
Received: from mail-hk2apc01lp2053.outbound.protection.outlook.com (HELO APC01-HK2-obe.outbound.protection.outlook.com) (104.47.124.53)
  by server-18.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Nov 2021 23:26:19 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAH3tYuYGIgcNP+d/bJULulVjaDlWoIb9ktCoIFQiwBf16/S8EPonclS9L1UQt5EzXA/2+h/reFRkTiY3lGEs/MOoww7/XBN8I36XUGz+CypRymIJO09HODhvmoQ3Wx/B/U8i1xsf2D+D3uaMl8C8nx5zhPDyb1Qe4tMY66IxapfDbKfNjDkLRgMuv5ZgSPTLkIKKUsjWtj6siSUaVDXYjjWsP0SbxzQckYUeJwQ2Mz/7ldkktQYbyI+mdhvuyxS9z8U4sQDT0XO21Fb5TKhvmNh/dhHtKTjnBkzfu76Cu4fz5AIt75zQrXsAXWpYSOc8CefJAwLnsuHQxLFL8UR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJKpJQ/xMAneCM/12cv7K/9xJTIng2ZWjvw7kTvBYEk=;
 b=Jo113Xzh7MwkrpbyWLG8x0fNGTcxm3sDa0x06PlG1FJN1HShYBKaJTAO9tFNBGvB3Vh7sWQKE1ckvS6Fs2fI4J03omSy0qZAVEn+xUftRlUIorJPNaLI5US8wJ97Gm77Mv/6nVysd7jNaur8bKfWDwLPw5qGmwiee7bjESLGKo9XRZQjUD2XZKFCZZJpL1piBl94MOo+FVB0mP4zNv1pbyoMtSkriYFc8G6rfFsGhMGGzEpNgNT+fRw1I+xiBohX1qPQ3f180xHEupRC+onLSVCX4OUGTMDgPOrH4HuV7d3A5x3E8emQn7Qg/PAhVVb8mgPxj+zvjsB2DkfDFNAOpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from HK2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:202:2::11)
 by TYZPR03MB5567.apcprd03.prod.outlook.com (2603:1096:400:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11; Mon, 8 Nov
 2021 23:26:16 +0000
Received: from HK2APC01FT020.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2:cafe::b) by HK2PR0401CA0001.outlook.office365.com
 (2603:1096:202:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13 via Frontend
 Transport; Mon, 8 Nov 2021 23:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; redhat.com; dkim=none (message not
 signed) header.d=none;redhat.com; dmarc=fail action=none
 header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 HK2APC01FT020.mail.protection.outlook.com (10.152.248.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Mon, 8 Nov 2021 23:26:15 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 8 Nov
 2021 18:26:13 -0500
Received: from fedora.lenovo.com (10.64.90.185) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2242.12; Mon, 8 Nov
 2021 18:26:11 -0500
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH 2/2] platform/x86: think-lmi: Opcode support
Date:   Mon, 8 Nov 2021 18:25:33 -0500
Message-ID: <20211108232533.211693-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108232533.211693-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20211108232533.211693-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.64.90.185]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9e16af3-4474-45e0-074b-08d9a30f291b
X-MS-TrafficTypeDiagnostic: TYZPR03MB5567:
X-Microsoft-Antispam-PRVS: <TYZPR03MB556749AABA36DFFE4DE36330C5919@TYZPR03MB5567.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpwYDyR/ajfEe8VmpmEs3I4FPNmWnxWYhq1NZyk5EkbmwpfuNc+WhMFsSmVMh2EhDwAWC7L0Y8eZiOMwY2eX0ZZZny3tBIGKlR25+FKOArQRUNWZ9/NmZaiMGpYRsBDjFYe92mI8BN2mC01pM3dKwMw0nXFz5sEaOFNBOYB3YREMKRuEWCs0au9zUm3Lu8it4g3MhE7OVKvc8ax36ucULunonMsbQI2zecKOA02jgY08pP7/+YZNOOqHM52avbzIRZ1pf29gDpgMYEu+oJjZn5w9SVeyIkWWzCYbB/Mssy1EvZ0Ifw3VM4YqzUUQWQOqgQKWawT/NCzQEOoX83wHnb7mr/ncgQN9qgab+Vl610WKFVxNH0hWNW+ceCrG5g9+jleTHwFZ7N97gAbSLug77QSTrR77qp0mk2LaHD+ytCx+rtgbZONm2B7X8dvJNnpWhrUchSKytSn109xKb/mJOnrHAfrERdhagTDSxQJ82FZ2XYRI1hhB9dM/Dmf4SPrPnKdOiXP3WHfEtIIEglheNM3JCKtskSSnQeJ/iwgieLSRukzvR8HevubWhLyl2kpbqfj/Y8xUECe5OvjFDFAUg7DKymEzjAsAofYnULLmHaS3DkOE8w1J1sEjp8CbJS1tLCt0XlXlOI54aFEkP0sRuTTvrg6Zq+lSYNcRacdukc3ijyXmJXN2SpdZMKs2cBEpcwoBxFJHcEJ3+bDNhkrEbfApRgg6aZOsKjPwKM0DjvE=
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(70206006)(36756003)(26005)(36860700001)(86362001)(316002)(6862004)(426003)(16526019)(30864003)(83380400001)(186003)(6666004)(70586007)(36906005)(8936002)(508600001)(2616005)(356005)(1076003)(81166007)(5660300002)(7696005)(336012)(37006003)(54906003)(2906002)(7049001)(82310400003)(82960400001)(47076005)(6200100001)(4326008)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 23:26:15.3812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e16af3-4474-45e0-074b-08d9a30f291b
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5567
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
 drivers/platform/x86/think-lmi.c | 303 +++++++++++++++++++++++++++----
 drivers/platform/x86/think-lmi.h |  28 ++-
 2 files changed, 296 insertions(+), 35 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 3671b5d20613..04810c5ced93 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -116,8 +116,23 @@
  */
 #define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
 
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
 
@@ -133,6 +148,10 @@ static const char * const encoding_options[] = {
 	[TLMI_ENCODING_ASCII] = "ascii",
 	[TLMI_ENCODING_SCANCODE] = "scancode",
 };
+static const char * const level_options[] = {
+	[TLMI_LEVEL_USER] = "user",
+	[TLMI_LEVEL_MASTER] = "master",
+};
 static struct think_lmi tlmi_priv;
 static struct class *fw_attr_class;
 
@@ -221,6 +240,7 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	const union acpi_object *obj;
 	acpi_status status;
+	int copy_size;
 
 	if (!tlmi_priv.can_get_password_settings)
 		return -EOPNOTSUPP;
@@ -241,14 +261,21 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
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
 
@@ -258,6 +285,20 @@ static int tlmi_save_bios_settings(const char *password)
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
@@ -358,16 +399,54 @@ static ssize_t new_password_store(struct kobject *kobj,
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
@@ -463,6 +542,60 @@ static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
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
 static struct attribute *auth_attrs[] = {
 	&auth_is_pass_set.attr,
 	&auth_min_pass_length.attr,
@@ -473,6 +606,8 @@ static struct attribute *auth_attrs[] = {
 	&auth_mechanism.attr,
 	&auth_encoding.attr,
 	&auth_kbdlang.attr,
+	&auth_index.attr,
+	&auth_level.attr,
 	NULL
 };
 
@@ -666,6 +801,16 @@ static void tlmi_release_attr(void)
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
 
@@ -738,7 +883,7 @@ static int tlmi_sysfs_init(void)
 
 	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
 	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
-			NULL, "%s", "System");
+			NULL, "%s", "Power-on");
 	if (ret)
 		goto fail_create_attr;
 
@@ -746,6 +891,38 @@ static int tlmi_sysfs_init(void)
 	if (ret)
 		goto fail_create_attr;
 
+	if (tlmi_priv.opcode_support) {
+		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
+		ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
+				NULL, "%s", "System");
+		if (ret)
+			goto fail_create_attr;
+
+		ret = sysfs_create_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
+		if (ret)
+			goto fail_create_attr;
+
+		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
+		ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
+				NULL, "%s", "HDD");
+		if (ret)
+			goto fail_create_attr;
+
+		ret = sysfs_create_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
+		if (ret)
+			goto fail_create_attr;
+
+		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
+		ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
+				NULL, "%s", "NVMe");
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
@@ -758,9 +935,27 @@ static int tlmi_sysfs_init(void)
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
 
@@ -777,6 +972,9 @@ static int tlmi_analyze(void)
 	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
 		tlmi_priv.can_get_password_settings = true;
 
+	if (wmi_has_guid(LENOVO_OPCODE_IF_GUID))
+		tlmi_priv.opcode_support = true;
+
 	/*
 	 * Try to find the number of valid settings of this machine
 	 * and use it to create sysfs attributes.
@@ -824,46 +1022,79 @@ static int tlmi_analyze(void)
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
 
-	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
 	if (!tlmi_priv.pwd_power) {
 		ret = -ENOMEM;
 		goto fail_clear_attr;
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
 
+	if (tlmi_priv.opcode_support) {
+		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
+		if (!tlmi_priv.pwd_system) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
+		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
+			tlmi_priv.pwd_system->valid = true;
+
+		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
+		if (!tlmi_priv.pwd_hdd) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
+		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
+		if (!tlmi_priv.pwd_nvme) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
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
 
 fail_clear_attr:
 	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i)
 		kfree(tlmi_priv.setting[i]);
+	kfree(tlmi_priv.pwd_admin);
+	kfree(tlmi_priv.pwd_power);
+	kfree(tlmi_priv.pwd_system);
+	kfree(tlmi_priv.pwd_hdd);
+	kfree(tlmi_priv.pwd_nvme);
 	return ret;
 }
 
@@ -876,7 +1107,11 @@ static void tlmi_remove(struct wmi_device *wdev)
 
 static int tlmi_probe(struct wmi_device *wdev, const void *context)
 {
-	tlmi_analyze();
+	int ret;
+
+	ret = tlmi_analyze();
+	if (ret)
+		return ret;
 	return tlmi_sysfs_init();
 }
 
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
index 6fa8da7af6c7..23da32b92836 100644
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
@@ -60,13 +80,19 @@ struct think_lmi {
 	bool can_get_bios_selections;
 	bool can_set_bios_password;
 	bool can_get_password_settings;
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


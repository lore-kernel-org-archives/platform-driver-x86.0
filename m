Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4E0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 20:24:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4251060FF2
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 20:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236962AbhI0U0S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:26:18 -0400
Received: from mail-sn1anam02on2075.outbound.protection.outlook.com ([40.107.96.75]:5597
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236921AbhI0U0S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 16:26:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQNPGR75C6h8NiZdm9rrZcAzGm6kW16/JQBdarfYIYZ7DWSXEvaUhcJ3exPiii3bc49THJ27npWYmtOTdTMQ9cNlmtvH68We3uC53O1YthZpz+I7eRZKE6hFKIkRTiF8BbL3K1fOFUlrmGl/5D6BrFxqlocm7jqUCPUtCAjFg3qJ3d4eaQZheJY/eRXnymNE/c1ygwIYdOQAiyqvmdAwcupgs2x74zzwU2lnoEDYcAGkTI7/FZvrSckN70s5hPrdadwkYCklGRXbyUSR0JqKpNh07ymTpu0U1bMxEKh3JqvV99ROFI0p5w5DY7cbKvv9F5VJM960ArrsGFr+aQVxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wbRJwADEIpgvyY0x+0Zg1MztL1XAKbWBSQvNOKsypNc=;
 b=dWs40bOJdhaRSuzAvebpEUumw2oaOR1tW/JMQ/tP9b3sNhBFDjKzLF0Pu3M8BrfooTXJITupaYDFntkYJ38G22YBGIn3pOjuRvoEHDvCHLbyqgwA+mZrGg9R9jDzmK1lt2Y4qKtsg//iAbnFTRrk+P1+wqH4Qfs3oSr2FmVt1qu95dGqBUiANZUZyEiYhtlQEjn8RkP+c1dSjiyA9hLRJoEgJZBlzxAngz9NMq+rx/cZQ/NeiUpXoHH+3Rk6g9Qb01W1ddhD+GJS6PL2s3hNkWymip8mHvPmWr/zzFBNAT1gcY1Xzd1fF0d17AHoC2WAExNOufqmy855nAeJU6s8Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbRJwADEIpgvyY0x+0Zg1MztL1XAKbWBSQvNOKsypNc=;
 b=c494G9ox3FgveVmgM32sWu2CrpdSM0M2HAcJ7LZIqHz7w8XQ7J15JbiZ611mAxM9F/1HXCwIZhBERFEE6Sth7PS8t7rT23HjfWBjf7ecE9P9j3vDQXV8Y6vWGdtrtgeN4NHZXSNlZobeXOK697riuIiraeBNdaKQVswYSCpHtWKygWCevWTtvIWs38v+kOh1HGggw7jFE7XrELsM/NLEOHam2nq/1Imxjcu4Kx6jAdxpKbOjyJM1rfevdROn+fimkc6PjGfO49o01cjR1ruWYifKS3YahATn8AtLglYCCaetmvDuG96uwWJ8BTmp5OatfdlC6dZ+vu0o2PqlGfMaLw==
Received: from BN6PR13CA0044.namprd13.prod.outlook.com (2603:10b6:404:13e::30)
 by BYAPR12MB3224.namprd12.prod.outlook.com (2603:10b6:a03:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 20:24:38 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13e:cafe::c2) by BN6PR13CA0044.outlook.office365.com
 (2603:10b6:404:13e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Mon, 27 Sep 2021 20:24:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 20:24:37 +0000
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 20:24:37 +0000
Received: from dude.nvidia.com (172.20.187.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 27 Sep
 2021 20:24:36 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <hdegoede@redhat.com>, <pali@kernel.org>,
        Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH 1/2] platform/x86: Remove "WMAA" from identifier names in wmaa-backlight-wmi.c
Date:   Mon, 27 Sep 2021 15:23:58 -0500
Message-ID: <20210927202359.13684-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <9cbb4e7a-4af9-32f8-0293-6c2ef7d44ceb@redhat.com>
References: <9cbb4e7a-4af9-32f8-0293-6c2ef7d44ceb@redhat.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61d99027-f561-4a85-9583-08d981f4d41b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3224:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32247119B276CF65D7F10097BCA79@BYAPR12MB3224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eiSbERtGaniNtkQCniJ809N9TZkF7XwmSn7i6agLkUe0hZg7tfvZ0GCZbIDVTILrJEPgbxjrIaZjP8BtQUc9fOXS7gGazH+uW2IcNUN5AYTYvMzsb6reTWU7JQE0n4qFZF2J7kZr1I+dEW8KEswEQTHZ1/9nuNG8UaMQ9B7XubvouROG4RqUQH4YiYGYP1GZWGJjA2u2AUtaQa0+mL5YQtn2Zy5GC6MSQVDbEzIPHayrX/VnfJ9Y6YlkBl/lJF9cmn+az3tNB+i3gy0G5UEl+H5zSuW/n458HGcXjnmW8frnCLciJTA8kywE7OkWTcebFG+3NZy5HrXsqt+HDempqQDNyGE9fZyYA57lOFbbTmcEG6DDOZ82n2c8LGb2qAJli9bgeey/+e8CdMflumubIRU99yvr/lqp7My4MQpLuLYQAsutBCmj8Nt8T6ld5fyodb8KjItdy3igNUx3r9KhCCs9+7PkLp/sXEyA61ZMZSSdmvUWhgANhgBGU6VyTlgZ4lHxi4TWlTyc0Z1UVz+e6KEXomhaRqHr9D2rlB5ROzWS9j8Ri4I8nPscmuobrZHwxWwpxWB9GxqOxojQNaqW3g8aPC5Bry3b0q9tV7MKRXBDst5s6uU42P36UW3vh/YVFN4DNTv7qAi9RCBPZdrMAE7GRgbrf5YlpXj796iuzf8KtCxJp80ql1fYLq7g65OCKqsiaUyUeha17NYVX+EOJg==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(336012)(7696005)(26005)(2906002)(5660300002)(70206006)(36756003)(30864003)(8936002)(107886003)(70586007)(86362001)(36860700001)(16526019)(186003)(8676002)(316002)(36906005)(6666004)(82310400003)(1076003)(7636003)(83380400001)(508600001)(2616005)(54906003)(356005)(47076005)(6916009)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 20:24:37.8597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d99027-f561-4a85-9583-08d981f4d41b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3224
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The "wmaa" in the name of the wmaa-backlight-wmi driver was named after
the ACPI method handle for EC-based backlight control on the systems
this driver was tested on during development. However, this "WMAA"
handle is generated by the WMI compilation process, and isn't actually
a part of the backlight control mechanism which this driver supports.
Since the "WMAA" handle isn't actually a part of the firmware backlight
interface, the various identifiers in this driver using "WMAA" or
"wmaa" aren't actually appropriate.

As a common denominator across the systems supported by this driver is
that they are hybrid graphics systems with NVIDIA GPUs, using "nvidia"
in the driver name seems more appropriate than "wmaa". Update the
driver to remove "wmaa" and "WMAA" in identifier names where they
appear. The kerneldoc comments for the enum wmi_brightness_method
values are replaced with the verbatim text from the decompiled BMF code
for this WMI class.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/platform/x86/wmaa-backlight-wmi.c | 174 +++++++++++-----------
 1 file changed, 91 insertions(+), 83 deletions(-)

diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c b/drivers/platform/x86/wmaa-backlight-wmi.c
index f5c4f8337c2c..61e37194df70 100644
--- a/drivers/platform/x86/wmaa-backlight-wmi.c
+++ b/drivers/platform/x86/wmaa-backlight-wmi.c
@@ -11,63 +11,64 @@
 #include <linux/wmi.h>
 
 /**
- * enum wmaa_method - WMI method IDs for ACPI WMAA
- * @WMAA_METHOD_LEVEL:  Get or set the brightness level,
- *                      or get the maximum brightness level.
- * @WMAA_METHOD_SOURCE: Get the source for backlight control.
+ * enum wmi_brightness_method - WMI method IDs
+ * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
+ * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
  */
-enum wmaa_method {
-	WMAA_METHOD_LEVEL = 1,
-	WMAA_METHOD_SOURCE = 2,
-	WMAA_METHOD_MAX
+enum wmi_brightness_method {
+	WMI_BRIGHTNESS_METHOD_LEVEL = 1,
+	WMI_BRIGHTNESS_METHOD_SOURCE = 2,
+	WMI_BRIGHTNESS_METHOD_MAX
 };
 
 /**
- * enum wmaa_mode - Operation mode for ACPI WMAA method
- * @WMAA_MODE_GET:           Get the current brightness level or source.
- * @WMAA_MODE_SET:           Set the brightness level.
- * @WMAA_MODE_GET_MAX_LEVEL: Get the maximum brightness level. This is only
- *                           valid when the WMI method is %WMAA_METHOD_LEVEL.
+ * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
+ * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
+ * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
+ * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
+ *                                      is only valid when the WMI method is
+ *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
  */
-enum wmaa_mode {
-	WMAA_MODE_GET = 0,
-	WMAA_MODE_SET = 1,
-	WMAA_MODE_GET_MAX_LEVEL = 2,
-	WMAA_MODE_MAX
+enum wmi_brightness_mode {
+	WMI_BRIGHTNESS_MODE_GET = 0,
+	WMI_BRIGHTNESS_MODE_SET = 1,
+	WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
+	WMI_BRIGHTNESS_MODE_MAX
 };
 
 /**
- * enum wmaa_source - Backlight brightness control source identification
- * @WMAA_SOURCE_GPU:   Backlight brightness is controlled by the GPU.
- * @WMAA_SOURCE_EC:    Backlight brightness is controlled by the system's
- *                     Embedded Controller (EC).
- * @WMAA_SOURCE_AUX:   Backlight brightness is controlled over the DisplayPort
- *                     AUX channel.
+ * enum wmi_brightness_source - Backlight brightness control source selection
+ * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
+ * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
+ *                             system's Embedded Controller (EC).
+ * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
+ *                             DisplayPort AUX channel.
  */
-enum wmaa_source {
-	WMAA_SOURCE_GPU = 1,
-	WMAA_SOURCE_EC = 2,
-	WMAA_SOURCE_AUX = 3,
-	WMAA_SOURCE_MAX
+enum wmi_brightness_source {
+	WMI_BRIGHTNESS_SOURCE_GPU = 1,
+	WMI_BRIGHTNESS_SOURCE_EC = 2,
+	WMI_BRIGHTNESS_SOURCE_AUX = 3,
+	WMI_BRIGHTNESS_SOURCE_MAX
 };
 
 /**
- * struct wmaa_args - arguments for the ACPI WMAA method
- * @mode:    Pass in an &enum wmaa_mode value to select between getting or
- *           setting a value.
- * @val:     In parameter for value to set when operating in %WMAA_MODE_SET
- *           mode. Not used in %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode.
+ * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
+ * @mode:    Pass in an &enum wmi_brightness_mode value to select between
+ *           getting or setting a value.
+ * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
+ *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
+ *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
  * @ret:     Out parameter returning retrieved value when operating in
- *           %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL mode. Not used in
- *           %WMAA_MODE_SET mode.
+ *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
+ *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
  * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
  *
- * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
- * The value passed in to @val or returned by @ret will be a brightness value
- * when the WMI method ID is %WMAA_METHOD_LEVEL, or an &enum wmaa_source value
- * when the WMI method ID is %WMAA_METHOD_SOURCE.
+ * This is the parameters structure for the WmiBrightnessNotify ACPI method as
+ * wrapped by WMI. The value passed in to @val or returned by @ret will be a
+ * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
+ * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
  */
-struct wmaa_args {
+struct wmi_brightness_args {
 	u32 mode;
 	u32 val;
 	u32 ret;
@@ -75,21 +76,21 @@ struct wmaa_args {
 };
 
 /**
- * wmi_call_wmaa() - helper function for calling ACPI WMAA via its WMI wrapper
- * @w:    Pointer to the struct wmi_device identified by %WMAA_WMI_GUID
- * @id:   The method ID for the ACPI WMAA method (e.g. %WMAA_METHOD_LEVEL or
- *        %WMAA_METHOD_SOURCE)
- * @mode: The operation to perform on the ACPI WMAA method (e.g. %WMAA_MODE_SET
- *        or %WMAA_MODE_GET)
+ * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
+ * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
+ * @id:   The WMI method ID to call (e.g. %WMI_BRIGHTNESS_METHOD_LEVEL or
+ *        %WMI_BRIGHTNESS_METHOD_SOURCE)
+ * @mode: The operation to perform on the method (e.g. %WMI_BRIGHTNESS_MODE_SET
+ *        or %WMI_BRIGHTNESS_MODE_GET)
  * @val:  Pointer to a value passed in by the caller when @mode is
- *        %WMAA_MODE_SET, or a value passed out to the caller when @mode is
- *        %WMAA_MODE_GET or %WMAA_MODE_GET_MAX_LEVEL.
+ *        %WMI_BRIGHTNESS_MODE_SET, or a value passed out to caller when @mode
+ *        is %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL.
  *
  * Returns 0 on success, or a negative error number on failure.
  */
-static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method id, enum wmaa_mode mode, u32 *val)
+static int wmi_brightness_notify(struct wmi_device *w, enum wmi_brightness_method id, enum wmi_brightness_mode mode, u32 *val)
 {
-	struct wmaa_args args = {
+	struct wmi_brightness_args args = {
 		.mode = mode,
 		.val = 0,
 		.ret = 0,
@@ -97,60 +98,64 @@ static int wmi_call_wmaa(struct wmi_device *w, enum wmaa_method id, enum wmaa_mo
 	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
 	acpi_status status;
 
-	if (id < WMAA_METHOD_LEVEL || id >= WMAA_METHOD_MAX ||
-	    mode < WMAA_MODE_GET || mode >= WMAA_MODE_MAX)
+	if (id < WMI_BRIGHTNESS_METHOD_LEVEL ||
+	    id >= WMI_BRIGHTNESS_METHOD_MAX ||
+	    mode < WMI_BRIGHTNESS_MODE_GET || mode >= WMI_BRIGHTNESS_MODE_MAX)
 		return -EINVAL;
 
-	if (mode == WMAA_MODE_SET)
+	if (mode == WMI_BRIGHTNESS_MODE_SET)
 		args.val = *val;
 
 	status = wmidev_evaluate_method(w, 0, id, &buf, &buf);
 	if (ACPI_FAILURE(status)) {
-		dev_err(&w->dev, "ACPI WMAA failed: %s\n",
+		dev_err(&w->dev, "EC backlight control failed: %s\n",
 			acpi_format_exception(status));
 		return -EIO;
 	}
 
-	if (mode != WMAA_MODE_SET)
+	if (mode != WMI_BRIGHTNESS_MODE_SET)
 		*val = args.ret;
 
 	return 0;
 }
 
-static int wmaa_backlight_update_status(struct backlight_device *bd)
+static int nvidia_wmi_ec_backlight_update_status(struct backlight_device *bd)
 {
 	struct wmi_device *wdev = bl_get_data(bd);
 
-	return wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_SET,
-			     &bd->props.brightness);
+	return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
+	                             WMI_BRIGHTNESS_MODE_SET,
+			             &bd->props.brightness);
 }
 
-static int wmaa_backlight_get_brightness(struct backlight_device *bd)
+static int nvidia_wmi_ec_backlight_get_brightness(struct backlight_device *bd)
 {
 	struct wmi_device *wdev = bl_get_data(bd);
 	u32 level;
 	int ret;
 
-	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET, &level);
+	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
+	                            WMI_BRIGHTNESS_MODE_GET, &level);
 	if (ret < 0)
 		return ret;
 
 	return level;
 }
 
-static const struct backlight_ops wmaa_backlight_ops = {
-	.update_status = wmaa_backlight_update_status,
-	.get_brightness = wmaa_backlight_get_brightness,
+static const struct backlight_ops nvidia_wmi_ec_backlight_ops = {
+	.update_status = nvidia_wmi_ec_backlight_update_status,
+	.get_brightness = nvidia_wmi_ec_backlight_get_brightness,
 };
 
-static int wmaa_backlight_wmi_probe(struct wmi_device *wdev, const void *ctx)
+static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ctx)
 {
 	struct backlight_properties props = {};
 	struct backlight_device *bdev;
 	u32 source;
 	int ret;
 
-	ret = wmi_call_wmaa(wdev, WMAA_METHOD_SOURCE, WMAA_MODE_GET, &source);
+	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
+	                           WMI_BRIGHTNESS_MODE_GET, &source);
 	if (ret)
 		return ret;
 
@@ -158,7 +163,7 @@ static int wmaa_backlight_wmi_probe(struct wmi_device *wdev, const void *ctx)
 	 * This driver is only to be used when brightness control is handled
 	 * by the EC; otherwise, the GPU driver(s) should control brightness.
 	 */
-	if (source != WMAA_SOURCE_EC)
+	if (source != WMI_BRIGHTNESS_SOURCE_EC)
 		return -ENODEV;
 
 	/*
@@ -167,39 +172,42 @@ static int wmaa_backlight_wmi_probe(struct wmi_device *wdev, const void *ctx)
 	 */
 	props.type = BACKLIGHT_FIRMWARE;
 
-	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET_MAX_LEVEL,
-			    &props.max_brightness);
+	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
+	                           WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL,
+	                           &props.max_brightness);
 	if (ret)
 		return ret;
 
-	ret = wmi_call_wmaa(wdev, WMAA_METHOD_LEVEL, WMAA_MODE_GET,
-			    &props.brightness);
+	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
+	                           WMI_BRIGHTNESS_MODE_GET, &props.brightness);
 	if (ret)
 		return ret;
 
-	bdev = devm_backlight_device_register(&wdev->dev, "wmaa_backlight",
+	bdev = devm_backlight_device_register(&wdev->dev,
+	                                      "nvidia_wmi_ec_backlight",
 					      &wdev->dev, wdev,
-					      &wmaa_backlight_ops, &props);
+					      &nvidia_wmi_ec_backlight_ops,
+					      &props);
 	return PTR_ERR_OR_ZERO(bdev);
 }
 
-#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
+#define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
 
-static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
-	{ .guid_string = WMAA_WMI_GUID },
+static const struct wmi_device_id nvidia_wmi_ec_backlight_id_table[] = {
+	{ .guid_string = WMI_BRIGHTNESS_GUID },
 	{ }
 };
-MODULE_DEVICE_TABLE(wmi, wmaa_backlight_wmi_id_table);
+MODULE_DEVICE_TABLE(wmi, nvidia_wmi_ec_backlight_id_table);
 
-static struct wmi_driver wmaa_backlight_wmi_driver = {
+static struct wmi_driver nvidia_wmi_ec_backlight_driver = {
 	.driver = {
-		.name = "wmaa-backlight",
+		.name = "nvidia-wmi-ec-backlight",
 	},
-	.probe = wmaa_backlight_wmi_probe,
-	.id_table = wmaa_backlight_wmi_id_table,
+	.probe = nvidia_wmi_ec_backlight_probe,
+	.id_table = nvidia_wmi_ec_backlight_id_table,
 };
-module_wmi_driver(wmaa_backlight_wmi_driver);
+module_wmi_driver(nvidia_wmi_ec_backlight_driver);
 
 MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
-MODULE_DESCRIPTION("WMAA Backlight WMI driver");
+MODULE_DESCRIPTION("NVIDIA WMI EC Backlight driver");
 MODULE_LICENSE("GPL");
-- 
2.20.1


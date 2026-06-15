Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3049A3D25B4
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514653; cv=none; b=pEys1O3bGWvVNVpyjcHrCJgHOmAqOQ5jQA3WvQP0SltqqUSNnohwRMTeaabhglyzZdaDVJSD39B4BcU+3TIo8jD17MCZJI9+KXcvK3uZffGyGnnS0cWL4gZW95yvFlBsHmTwWYXJUtQHWMJ8TVTrzTA9H04C+xyMK04V66gyrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514653; c=relaxed/simple;
	bh=YtaTafERoZ393agvJP2JUqd0DuE89RJB2gTdNJTr0d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=idpw+em3MICK17GZsQAj599k7uysTJBN3+G4gvs2PK8cHPMgSC3ocFsKBjI5EAnKNFTUQA+XmsmmXfpMfCDY5dW3dzaXydXdpXlFdVD0aFLILYrBJHvk3nDkEr6MoTz2S/b07NHhBOFdipgfvdORT6H0EmqGS6oXkd+qNRREWTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeLjEPGM; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeLjEPGM"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c859878eb48so1134234a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514651; x=1782119451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wntXL2H04y14YDskKhHbpHYOinbl18Fb88XrGhCya90=;
        b=QeLjEPGMOAOa5xztypD3di4jS4GSfb/jCDjCrEYr/GE0XOQxch586UGUXxFk5cw2//
         VML1wZvfYY7ABO75v3OhdLBj4WDdCysHYuTjJVuvFd8m/nE2fXe/xTKnA8EBTNNjNAFQ
         HcdmEWuH+k+p0iNTZG+pS9ajCxg6VefvokpAONnKMQSoluuFGKkqIrcW7pMXt2T5VnQR
         mykeu5kNGw1pyHrtKHuUDFPBBomVKFvtvNKVD5mJzcvJUEjvKuCKzufGdGGKAsXd4B2c
         4S2YmKHZb9FcD5JAt550AZ1WezDeP7sJylWwPfaKjaZOam0fedVldH61lx+nysHWli1b
         EozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514651; x=1782119451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wntXL2H04y14YDskKhHbpHYOinbl18Fb88XrGhCya90=;
        b=oo0ovshgGYg46PCanMYXebMiwZ4gA2DC4nzx6bL2QJstD6iC44fblidndQ8stnsrlo
         KMdsE5fCoLkyJNOph4gxVTerylolwSHIb03rc9GquF9OOBgGqGbbd352zZTCOxyxfL0L
         kFJLAoe+1OxCXQSavBZjw/R/lUSwVdU13IJGX+VBa7s66AJe2toiBuo3ATu/+56vIp97
         gp87QI/1MRglXk1o+ggB1IsMR+1CClrC053LkvBrO2Rxi2EPziDYRvYKu9GpzpgYUxXv
         zi8zMQtlSbdhxjktGO8CDCyrrM88kPAj1O9E4VbvWvfvjDmP120rJOoWQLlwAVMjdPR7
         CGUA==
X-Gm-Message-State: AOJu0YzsBtBM56w6mW/NL5YCG0VXROs/qS5pTRO8xMatOWqQy3N4T9MW
	SDkWJQp2cIuDXqxao7N3JYAuuo0wlaKe4Dzh26QlrlC0Cf6FjnBCLbcrwOiGw8s8
X-Gm-Gg: Acq92OGuitLgiNtyRMTtXHUsjKWy5h56xmPrPttj09OJiUOXlW0It1pgJk+7PR/DR9e
	Fq5YtON/EknaGQedMLmfLfjQMBcNIGfBvz2+t2iRu77WSYLLjFsK3q5EnEXgxQFxvHPMsjace4F
	LWdSHZW/8I7lYjvbishycbTC5u4pnm774Mxf8zmI7H8UKwPb/VPFaztW3J9lxeo3ZF18ZIwq3cI
	nir7WXoimhnXhRMWQ5ddX6osGPZ0Qwf9pOXZ6OU5jDziswkPdi3tAifo9i/+po/a3QR5kE/Qr9Q
	lpivvRB2bNP0QJmEBYVlHwYb+p7IXTjl3OP4sYA/AN0ze2SISIPl9vD74xU8AiljygIqVZq7VXi
	+LerURf+SInqT5dnnIRjHclaNji13A3gA3OqQIDYtfLUpor4lYILU424lNm+ayCXrOE0TAsjzq9
	0gk+F/7OqGIJawHx75NNQr1LXLGXdInO4YeUA=
X-Received: by 2002:a05:6a20:3d91:b0:398:9e47:f5ff with SMTP id adf61e73a8af0-3b7961fb1f4mr11303668637.2.1781514651336;
        Mon, 15 Jun 2026 02:10:51 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:172b:de82:f342:993b:860a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b00d4c7sm9392459b3a.40.2026.06.15.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:10:50 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v10 1/3] platform/x86: hp-wmi: Introduce board-specific feature data
Date: Mon, 15 Jun 2026 14:40:32 +0530
Message-ID: <20260615091034.987029-2-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615091034.987029-1-radheykalra901@gmail.com>
References: <20260615091034.987029-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hp_wmi DMI table is about to carry more than thermal-profile data.
Replace the direct thermal_profile_params .driver_data pointers with
hp_wmi_board_params and rename the table/setup helper accordingly.

No functional changes intended.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 127 +++++++++++++++++++------------
 1 file changed, 80 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8..ee8375d28 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -133,11 +133,35 @@ static const struct thermal_profile_params omen_v1_no_ec_thermal_params = {
 	.ec_tp_offset	= HP_NO_THERMAL_PROFILE_OFFSET,
 };
 
-/*
- * A generic pointer for the currently-active board's thermal profile
- * parameters.
- */
-static struct thermal_profile_params *active_thermal_profile_params;
+struct hp_wmi_board_params {
+	const struct thermal_profile_params *thermal_profile;
+};
+
+static const struct hp_wmi_board_params victus_s_board_params = {
+	.thermal_profile	= &victus_s_thermal_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_board_params = {
+	.thermal_profile	= &omen_v1_thermal_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_legacy_board_params = {
+	.thermal_profile	= &omen_v1_legacy_thermal_params,
+};
+
+static const struct hp_wmi_board_params omen_v1_no_ec_board_params = {
+	.thermal_profile	= &omen_v1_no_ec_thermal_params,
+};
+
+static const struct hp_wmi_board_params *active_board_params;
+
+static const struct thermal_profile_params *hp_wmi_thermal_profile(void)
+{
+	if (!active_board_params)
+		return NULL;
+
+	return active_board_params->thermal_profile;
+}
 
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
@@ -187,87 +211,87 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25",
 };
 
-/* DMI Board names of Victus 16-r and Victus 16-s laptops */
-static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+/* DMI board-specific feature data for Omen and Victus laptops. */
+static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BAB") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8B2F") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCD") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD4") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
-		.driver_data = (void *)&omen_v1_thermal_params,
+		.driver_data = (void *)&omen_v1_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
-		.driver_data = (void *)&victus_s_thermal_params,
+		.driver_data = (void *)&victus_s_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
-		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
 	{},
 };
@@ -1874,7 +1898,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 	u8 current_dstate, current_gpu_slowdown_temp, tp;
 	const struct thermal_profile_params *params;
 
-	params = active_thermal_profile_params;
+	params = hp_wmi_thermal_profile();
+	if (!params)
+		return -ENODEV;
+
 	if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
 	    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 		*profile = active_platform_profile;
@@ -1886,10 +1913,10 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 		return ret;
 
 	/*
-	 * We cannot use active_thermal_profile_params here, because boards
-	 * like 8C78 have tp == 0x0 || tp == 0x1 after cold boot, but logically
-	 * it should have tp == 0x30 || tp == 0x31, as corrected by the Omen
-	 * Gaming Hub on windows. Hence accept both of these values.
+	 * Boards like 8C78 have tp == 0x0 || tp == 0x1 after cold boot,
+	 * but logically it should have tp == 0x30 || tp == 0x31, as
+	 * corrected by the Omen Gaming Hub on windows. Hence accept both
+	 * of these values.
 	 */
 	if (tp == victus_s_thermal_params.performance ||
 	    tp == omen_v1_thermal_params.performance) {
@@ -1924,12 +1951,12 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 
 static int platform_profile_victus_s_set_ec(enum platform_profile_option profile)
 {
-	struct thermal_profile_params *params;
+	const struct thermal_profile_params *params;
 	bool gpu_ctgp_enable, gpu_ppab_enable;
 	u8 gpu_dstate; /* Test shows 1 = 100%, 2 = 50%, 3 = 25%, 4 = 12.5% */
 	int err, tp;
 
-	params = active_thermal_profile_params;
+	params = hp_wmi_thermal_profile();
 	if (!params)
 		return -ENODEV;
 
@@ -2195,6 +2222,7 @@ static const struct platform_profile_ops hp_wmi_platform_profile_ops = {
 static int thermal_profile_setup(struct platform_device *device)
 {
 	const struct platform_profile_ops *ops;
+	const struct thermal_profile_params *params;
 	int err, tp;
 
 	if (is_omen_thermal_profile()) {
@@ -2226,13 +2254,17 @@ static int thermal_profile_setup(struct platform_device *device)
 
 		ops = &platform_profile_victus_ops;
 	} else if (is_victus_s_thermal_profile()) {
+		params = hp_wmi_thermal_profile();
+		if (!params)
+			return -ENODEV;
+
 		/*
 		 * For an unknown EC layout board, platform_profile_victus_s_get_ec(),
 		 * behaves like a wrapper around active_platform_profile, to avoid using
 		 * uninitialized data, we default to PLATFORM_PROFILE_BALANCED.
 		 */
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
-		    active_thermal_profile_params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
+		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN ||
+		    params->ec_tp_offset == HP_NO_THERMAL_PROFILE_OFFSET) {
 			active_platform_profile = PLATFORM_PROFILE_BALANCED;
 		} else {
 			err = platform_profile_victus_s_get_ec(&active_platform_profile);
@@ -2693,24 +2725,25 @@ static int hp_wmi_hwmon_init(void)
 	return 0;
 }
 
-static void __init setup_active_thermal_profile_params(void)
+static void __init setup_active_board_params(void)
 {
 	const struct dmi_system_id *id;
+	const struct thermal_profile_params *params;
 
-	/*
-	 * Currently only victus_s devices use the
-	 * active_thermal_profile_params
-	 */
-	id = dmi_first_match(victus_s_thermal_profile_boards);
+	id = dmi_first_match(hp_wmi_feature_boards);
 	if (id) {
+		active_board_params = id->driver_data;
+		params = hp_wmi_thermal_profile();
+		if (!params)
+			return;
+
 		/*
 		 * Marking this boolean is required to ensure that
 		 * is_victus_s_thermal_profile() behaves like a valid
 		 * wrapper.
 		 */
 		is_victus_s_board = true;
-		active_thermal_profile_params = id->driver_data;
-		if (active_thermal_profile_params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
+		if (params->ec_tp_offset == HP_EC_OFFSET_UNKNOWN) {
 			pr_warn("Unknown EC layout for board %s. Thermal profile readback will be disabled. Please report this to platform-driver-x86@vger.kernel.org\n",
 				dmi_get_system_info(DMI_BOARD_NAME));
 		}
@@ -2745,10 +2778,10 @@ static int __init hp_wmi_init(void)
 		}
 
 		/*
-		 * Setup active board's thermal profile parameters before
-		 * starting platform driver probe.
+		 * Setup active board feature data before starting platform
+		 * driver probe.
 		 */
-		setup_active_thermal_profile_params();
+		setup_active_board_params();
 		err = platform_driver_probe(&hp_wmi_driver, hp_wmi_bios_setup);
 		if (err)
 			goto err_unregister_device;
-- 
2.54.0


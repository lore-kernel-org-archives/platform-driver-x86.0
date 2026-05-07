Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F2447AF65
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177133; cv=none; b=ChtWB48D11FzCU+GgbM9QSAykA4f8uv/HPQGFf+Q7gDPl1imeXqa1EqBhqUh9AKYoiY4NuzF5mJGR13WA+ACLtymKo427EiZlviKiGWGYaKraLIply7J0auwZ6oth65znvLaFrTzORNhsdWXGSKYaRBWueF5eS5OfJagIbEOKmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177133; c=relaxed/simple;
	bh=rYAoMChL+f703OAS9deNQ5p8NAhTB3d69XXerf+y5lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9ASxnmg4l9pD+Hzo67+U+fHt2U59KXCukgy7J6gzKIC7HKQMvVYP+yUMINp8JlrBrVwfIdFG6Y8cM0nz4K6B8hucYOYYEfNiNASiybq78SLEwC2vhZDCZTmM8qRhgYEgouDfU0HcwZyc21XWkuX46g8nRj1yVUUbbGbzPqqNlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJTRKBMX; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJTRKBMX"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so2975487eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177130; x=1778781930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCtWlqVluBBc6AGkLAJdrmb46oNIJ81KQ05m/in7DJA=;
        b=DJTRKBMXxBPgjAqefZ20tyw5EIE3obGu6BL6m33m6hCicD6EbQolap8o82Iy5SazQa
         MevuCRmqraUeyrdAJ0spIj8sNKtbGWry4BqZg5YT2K2xtPQSW1PZkKcLSNdaKgFwevpb
         aO8mTY9rBcooiaRSZFNUudw1ZUxmaoPzWVg4tCG3A49MSXmCYMLCYcueUR35yairnnp9
         E46Ey2XfU6O1OkkAY1FqzJsXGzb2z7CbNEb1EQTmTrmIern6Uzh8j10kjhft6z9DLJCB
         t67qOoX986xQgKjMcfZUiehkE8Me3gYSKLBuN//uFkJf04Qa5n7JLcZkdKxbuKEegd4/
         5kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177130; x=1778781930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCtWlqVluBBc6AGkLAJdrmb46oNIJ81KQ05m/in7DJA=;
        b=J8jdPEj3hTTNiBmtN4l/IkhUb0QXMPaO8wznYBE4iHkRzEybAQOjuv6li/7qSVk8N4
         Koj7FJ+I1SCRxGwQ7qu4GOQMkIbsF/aiDXeyqwzpMRiX7uu97KRojsZJLxVL9B7uyqmI
         a1RbQB92gU9fS40cqT1ha6VO/bFeuuGoVdmRpBfoRvBSvq6xYsJMU95exxhPer4Gdax9
         2Tll/OOa9U30wjl7Ckps8ODGuc4XWJRq0Vj3Q4MqpneXW65CtAV1TsLTEXCpU7KTczxI
         iP601CdMAei22XCtgc1Ga7H/9MOUYrlJOZUEUGAQ9els1OwGg/qnhU5Ax1qZv9twBxX/
         pnjw==
X-Forwarded-Encrypted: i=1; AFNElJ9nP22ezFy9A0MvoZQFVcZinF8u8NSWg6bSIh+9C0W61pdp2Vm2BmfS68ysYeA1n0V4Ubb8c2okKWUBYe5GGmY2xpDt@vger.kernel.org
X-Gm-Message-State: AOJu0YypumfyRg9p9HCdHlY0kzdkOkji2+AlBCXfnKNl73AgA1c6heqS
	mMo83ATb62sxkrhTKODD6WaZN30z6kPrTh2y1N5hHBOUgyjj4Ms1N1Vz
X-Gm-Gg: Acq92OFzegWKVSUq+2odCFDEDwMn/afHiLbfRQbmTtwAvBgjRZwVDXPr19lKYtZ4BPr
	7WxZvFDNQmvf0dkkfmxHH66GnHQsLuOeEJYqfHkO9yznp0K7PrldpyIcuUqyUVkT7+8qhEGLvSC
	X+8IFy8uePAL+WZ0u5iupenAhETIcLZW4IXgKGqdZkv2FmgnQkW5S99Dk53IN5MoNuhVMbZTVf5
	9wKClfwpSq1P9lCwrvd625JZvd7Q5KNi4snQCmlBG1qBOg+DCIjSZPfkYZpDFdpgtt7Yz5F9B5m
	Bxvx1uksFzg2ZGbpwRnakUb6aF43kBneilaAde3cbmHLYjB4rfedbosEj/IWrQuiuAvNGOl7CXV
	C3AFOFsk21XSkc/mqTyBKXXNUAzSOETj/sStO4ydhgie9eh4S0NVLvXk3tap9l0TZ1LmGkf55dU
	l0ewEFeeVq4ZQM6kKe4NAlH5A0c2P8Ih6Lc/giNjh7obELccU/DMcQCgFKNjI5SjQup/zP0DDzI
	hFdBF3FDe3rgoQ=
X-Received: by 2002:a05:693c:2c01:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-2f54b265a7dmr4776855eec.23.1778177130380;
        Thu, 07 May 2026 11:05:30 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:30 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 11/15] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Thu,  7 May 2026 18:05:03 +0000
Message-ID: <20260507180507.912966-12-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an enum for all GPU attribute feature ID's and add GPU attributes.

Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v9:
  - Rename gpu_didvid -> dgpu_didvid in documentation to match actual
    attribute name.
v7:
  - Fix typo in dgpu_boost_clk attribute string.
v4:
  - Align CPU feature enum values.
  - Remove gpu_oc_stat from Documentation.
v3:
  - Remove gpu_oc_stat.
---
 .../wmi/devices/lenovo-wmi-other.rst          |  10 ++
 drivers/platform/x86/lenovo/wmi-capdata.h     |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 105 ++++++++++++++++++
 3 files changed, 116 insertions(+)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 189dd4d31926..011054d64eac 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -69,6 +69,16 @@ Each attribute has the following properties:
 
 The following firmware-attributes are implemented:
  - cpu_temp: CPU Thermal Load Limit
+ - dgpu_boost_clk: Dedicated GPU Boost Clock
+ - dgpu_didvid: Dedicated GPU Device Identifier and Vendor Identifier
+ - dgpu_enable: Dedicated GPU Enabled Status
+ - gpu_mode: GPU Mode by Power Limit
+ - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline Offset
+ - gpu_nv_bpl: Nvidia GPU Base Power Limit
+ - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
+ - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
+ - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
+ - gpu_temp: GPU Thermal Load Limit
  - ppt_cpu_cl: CPU Cross Loading Power Limit
  - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
  - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index f2d45cd7a188..891b12ca1db6 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -20,6 +20,7 @@
 
 enum lwmi_device_id {
 	LWMI_DEVICE_ID_CPU = 0x01,
+	LWMI_DEVICE_ID_GPU = 0x02,
 	LWMI_DEVICE_ID_FAN = 0x04,
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 43fe56a40498..c84de0ad0cc4 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -62,6 +62,19 @@ enum lwmi_feature_id_cpu {
 	LWMI_FEATURE_ID_CPU_IPL =	0x09,
 };
 
+enum lwmi_feature_id_gpu {
+	LWMI_FEATURE_ID_GPU_NV_PPAB =		0x01,
+	LWMI_FEATURE_ID_GPU_NV_CTGP =		0x02,
+	LWMI_FEATURE_ID_GPU_TEMP =		0x03,
+	LWMI_FEATURE_ID_GPU_AC_OFFSET =		0x04,
+	LWMI_FEATURE_ID_DGPU_BOOST_CLK =	0x06,
+	LWMI_FEATURE_ID_DGPU_EN =		0x07,
+	LWMI_FEATURE_ID_GPU_MODE =		0x08,
+	LWMI_FEATURE_ID_DGPU_DIDVID =		0x09,
+	LWMI_FEATURE_ID_GPU_NV_BPL =		0x0a,
+	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
+};
+
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
 #define LWMI_TYPE_ID_CROSSLOAD	0x01
@@ -637,6 +650,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl = {
 	.type_id = LWMI_TYPE_ID_CROSSLOAD,
 };
 
+static struct tunable_attr_01 gpu_nv_ppab = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_NV_PPAB,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 gpu_nv_ctgp = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_NV_CTGP,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 gpu_temp = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_TEMP,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 gpu_nv_ac_offset = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_AC_OFFSET,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 dgpu_boost_clk = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_DGPU_BOOST_CLK,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 dgpu_enable = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_DGPU_EN,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 gpu_mode = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_MODE,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 dgpu_didvid = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_DGPU_DIDVID,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 gpu_nv_bpl = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_NV_BPL,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 gpu_nv_cpu_boost = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
 struct capdata01_attr_group {
 	const struct attribute_group *attr_group;
 	struct tunable_attr_01 *tunable_attr;
@@ -966,6 +1039,7 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+/* CPU tunable attributes */
 LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
 			      "Set the CPU thermal load limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
@@ -991,9 +1065,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
 			      "Set the CPU cross loading instantaneous power limit");
 
+/* GPU tunable attributes */
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "dgpu_boost_clk",
+			      "Set the dedicated GPU boost clock");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "dgpu_didvid",
+			      "Get the GPU device identifier and vendor identifier");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
+			      "Set the dedicated Nvidia GPU enabled status");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
+			      "Set the GPU mode by power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
+			      "Set the Nvidia GPU AC total processing power baseline offset");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
+			      "Set the Nvidia GPU base power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
+			      "Set the Nvidia GPU to CPU dynamic boost limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
+			      "Set the GPU configurable total graphics power");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
+			      "Set the Nvidia GPU power performance aware boost limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
+			      "Set the GPU thermal load limit");
 
 static struct capdata01_attr_group cd01_attr_groups[] = {
 	{ &cpu_temp_attr_group, &cpu_temp },
+	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
+	{ &dgpu_didvid_attr_group, &dgpu_didvid },
+	{ &dgpu_enable_attr_group, &dgpu_enable },
+	{ &gpu_mode_attr_group, &gpu_mode },
+	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
+	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
+	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
+	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
+	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
+	{ &gpu_temp_attr_group, &gpu_temp },
 	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
 	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
 	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
-- 
2.53.0


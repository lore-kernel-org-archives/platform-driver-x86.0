Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC0B67A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907533; cv=none; b=FmaFAwvOf/4nQbiK1/FGWT3D/khoxHFduboIBBh1dtq65y8nF93jELMf2lxSu2PomKL7xaVVc2xG78TX1vMGqcF3BWWo3OZoYp+E1Ei9J4gZSFpzD8RhzZnh5oeClwd2xZZc+CgZNR5uQrX3eb+4zVVCGcI6YZz+uKmCVKqyY08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907533; c=relaxed/simple;
	bh=nEkPRkLVQRHHUQm1Vvmpv+kKOYwKxIhi1fJkMphZTdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Saf0xMrEA3XkitpDYRdTXNxVIcWE2uqq0L8U3PPiQwc/xWQ/QcXIApmDtMSMd6EFmnyEH3YoEbwzd3FbMQ30S8L/Ke+P9FFAF4g7Ef5o8hfS6RIhncG7v7bskdY7R8HjflPuEhvLPJyTrQjSfqZyAr6ii12StJGlJKc+Roxu4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy0MA9fJ; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy0MA9fJ"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124a635476fso4763384c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 20:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907530; x=1772512330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW0PTJ2xSTHIHILISSH+wlmCW38PDwPsaAVhAgtz/fQ=;
        b=cy0MA9fJcPeIMC0t9WC84uxf35I7d0LBdYj47KCH3LPtpcaJrFUp+abNTJiBgUGuW0
         bahrP/DiW53ujUviOJmmFYcQMOAy8iGZ07yUMWBUEbMFTg95zGvEeIoJ5XtwjKbPoUff
         AjULip7RayIiYAzNnpnXkFYfLBosxB8udYKJ+HXw5vIRU/4n39vD9iyhQET8QIXrjAXZ
         fHxkfbsO3zLz7PeAnrwrwKj3oPya7MpG28H6++4qIlWpbfU1pGvoh1hNT9hwgOL+F2RJ
         e+rtvr+5rnrU2uP2Mz6Qajst2zkNQvdnLGIo3zyGLcjB7GUWnE9EIb0lO8c0iEE2kq0u
         9P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907530; x=1772512330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lW0PTJ2xSTHIHILISSH+wlmCW38PDwPsaAVhAgtz/fQ=;
        b=o2ABM6f2SMXdlCP3vWkNnUl8yt3q/9RFqWg/TSMK5gbf55LIAFLW6JypykLteFPl8I
         RkZrUTh8VSLX7SbwSoomgPe+ESabe7zVRLLEgDydqcduKOrZqkj3YgkRQBdXFCwlVbVn
         yIgpSE+QguaIfSo2ymu1Oq59DBKkWMP+rKy62RaxNhgx+At7AIHEp/by6J3r7Z8UqMIS
         nAklbhE4KxmDLoU05m1E/ralZSA75O42bg/QIFdP2rsfIa4kZrhiPxGd6W5m3yzZ1n7v
         59qno8C6knbhZ+9S9HVf5SbW31xhX4slL21jkapkXG8PoaYT2T3eMqMRuELs2ziSObGb
         aQJA==
X-Forwarded-Encrypted: i=1; AJvYcCWHtrLcPb77S5+RoR3tDfr/CV2e2GeNjBzp8nf9uxnYjrLzwGWkxIbwevbJAbSIH7jgie2PK+rJukaAURSxscQJBJFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxypjkRm8MYXSmHz7LXeViEJKqWIzgUHeiTASYRF418NaaeiSma
	Byl9cjsmSST6TCfYiNT/tnNd82If4xR2knHZNLUzKmp/+m9/Vxin9mwS
X-Gm-Gg: AZuq6aJiXvFF86zThry4TYmrR3/rTT65TXA1Iahac8VBCSp3u1tUGZgJos7AbUwT63R
	RAPnrOplZPO0jSMik/Xs8f4wKPBHrMhYMcSLtjx8osvrKYyZXBRD8bd643+/hPXz15L3VXejf1G
	LP6UfxFdPG7pa+VNZD3gDUtsbrlxUXBvcL7OaWjtaOG/C6lXQyRx+2pqS3OKusMXgIS2MXys1CF
	jEkFjMgyy7Xu9WDn5ys4msYb6/67Hcq8SipentcVdNO0JL0OBxlO8JAs3cI8OlR/O1z3beb3mEO
	T1bcf29YDk761JJplR6px6SYarIJ+PV+M+DyTv5aYib5z+iypDW1/UX0cL8AQuTPwFvQ+Xtm0wI
	ON4WO3XRYVQrEsQWhL11Z/8583aKsykR96obNVrodV05dcT2hJsbDKcRxh1zx2FmR46l+CReHEZ
	mTm+mwr94zLA0Vz9xUi4hx/ANAxQO8hNgsyTEAfYk88BKRImdTgBaGPTiGpQmBV24w0zWPrry9j
	74=
X-Received: by 2002:a05:7022:6b93:b0:122:33e:6d41 with SMTP id a92af1059eb24-1276ad11a3fmr3001986c88.23.1771907529704;
        Mon, 23 Feb 2026 20:32:09 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm9607887c88.9.2026.02.23.20.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:09 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Tue, 24 Feb 2026 04:31:58 +0000
Message-ID: <20260224043200.2680384-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an enum for all GPU attribute feature ID's and add GPU attributes.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../wmi/devices/lenovo-wmi-other.rst          |  11 ++
 drivers/platform/x86/lenovo/wmi-capdata.h     |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 105 ++++++++++++++++++
 3 files changed, 117 insertions(+)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index f4763ed66cc6..f7564b23bb7f 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -70,6 +70,17 @@ Each attribute has the following properties:
 The following firmware-attributes are implemented:
  - cpu_oc_stat: CPU Overlocking Status
  - cpu_temp: CPU Thermal Load Limit
+ - dgpu_boost_clk: Dedicated GPU Boost Clock
+ - dgpu_enable: Dedicated GPU Enabled Status
+ - gpu_didvid: GPU Device Identifier and Vendor Identifier
+ - gpu_mode: GPU Mode by Power Limit
+ - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline Offset
+ - gpu_nv_bpl: Nvidia GPU Base Power Limit
+ - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
+ - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
+ - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
+ - gpu_oc_stat: GPU Overclocking Status
+ - gpu_temp: GPU Thermal Load Limit
  - ppt_cpu_cl: CPU Cross Loading Power Limit
  - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
  - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index aa48f43cbb43..b7f9ee7b301a 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -25,6 +25,7 @@
 
 enum lwmi_device_id {
 	LWMI_DEVICE_ID_CPU = 0x01,
+	LWMI_DEVICE_ID_GPU = 0x02,
 	LWMI_DEVICE_ID_FAN = 0x04,
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 87aba244da84..67768f6a50e0 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -65,6 +65,19 @@ enum lwmi_feature_id_cpu {
 	LWMI_FEATURE_ID_CPU_IPL = 0x09,
 };
 
+enum lwmi_feature_id_gpu {
+	LWMI_FEATURE_ID_GPU_NV_PPAB = 0x01,
+	LWMI_FEATURE_ID_GPU_NV_CTGP = 0x02,
+	LWMI_FEATURE_ID_GPU_TEMP = 0x03,
+	LWMI_FEATURE_ID_GPU_AC_OFFSET = 0x04,
+	LWMI_FEATURE_ID_DGPU_BOOST_CLK = 0x06,
+	LWMI_FEATURE_ID_DGPU_EN = 0x07,
+	LWMI_FEATURE_ID_GPU_MODE = 0x08,
+	LWMI_FEATURE_ID_DGPU_DIDVID = 0x09,
+	LWMI_FEATURE_ID_GPU_NV_BPL = 0x0a,
+	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST = 0x0b,
+};
+
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
 #define LWMI_TYPE_ID_NONE 0x00
@@ -631,6 +644,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl = {
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
@@ -1069,6 +1142,7 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+/* CPU tunable attributes */
 LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
 			      "Set the CPU thermal load limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
@@ -1094,9 +1168,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
 			      "Set the CPU cross loading instantaneous power limit");
 
+/* GPU tunable attributes */
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "gpu_boost_clk",
+			      "Set the dedicated GPU boost clock");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
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
2.52.0


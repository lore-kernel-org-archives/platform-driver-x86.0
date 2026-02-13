Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E29531B833
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970378; cv=none; b=bLhl9nmA6ozL4sE6gK56Z6VuA11xE2gxqCg5LUSeKopf1yZrUbDOHdrthS/2Rdaw2vD7KWoz0peJqZAIdBBj+I5XrUFdD1V/ZexJSIYh8nMS6yTmO4akuHLDIbVhfKnIOpanWfiW4ikh8H+FbMqcTVAVYIfsChQG29UpDJG56c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970378; c=relaxed/simple;
	bh=Za5KHzr/f7M+d+4lyWXl8r0VwhlmX+RGGsnTR6snx/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwXWpPIIlg4sLkAELzdXeiHDsbsQnvzgT3Zf+JK76dFL8tjn8O+Z8B4k+e89KV60cWsrTOAzKID3ihcTt5TGddyIdlTv2iq0eXiXtAsEck2LXsEJKCAl58OlygsFyOVK2WAJYz43j8p78TErKaNL9LWKkpRiP9LXZMi9S9owbNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8d2osWV; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8d2osWV"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso1330609eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770970376; x=1771575176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6hQTtVYAHyAjOTYDv8Fn9b8616DfgJGuDqU03DkD2M=;
        b=H8d2osWVHDBu7TLLjdDx2ArMnua3sGNqT1diGP/Y2ZsgDQEjLdSYJsOyLIejIoOeck
         tr8f4mCoaiyizvM+8GEWMkck8qY1kiQA/IcxubvBv4s/3WFQN4ywTKFP2k3UZO2m86uo
         AeuqJtRMGTQdI73jVU8SOBIm+2WrZ1lORnrlph+H3Nrc9JRuNja8msHZs5tM1DYHoIRq
         oSBMbf2D3YjtpH8vU727jzmIjt/u4B8N1bwz1g61SXealCzDB7TwihPM69zsFQpK5i2m
         4gTAx1/75jV36GJMwzi/yN/dzq63gJNX+GRflJQnxE1wSE0ad96Anu7wnixZM0yrSrn+
         ypEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970376; x=1771575176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6hQTtVYAHyAjOTYDv8Fn9b8616DfgJGuDqU03DkD2M=;
        b=e21SwZUzNhBJGTOv1AO3BN8j4yzMXfK7An+n7HPim/VyIajt0HdlWkTG6VWTMrEUAE
         4WZd+SbFs2TOO/6EyYF88pTOHKaXn5Xh4WlaVvCJ2SIYm2iRKK8vjm6STtfH0F8Z1+dK
         SbgzIw/dXM3ElKWvol/JCRFXenMSm1p5+qQBjR9AmAsOg/dp0BUxtcOQeYfIdDl02gDJ
         w079b6IJMn/MNL+0WboS9LNCkoz0V0ejBvNCNK4FhHSu385pwmnl87NVcww+q5Qduxp3
         wgVW7rHOYvC0TR7mT1mW/TU9OcX2/0em15bbSoF3pRvz0gMyQdprX6pVzdZ9EmI7QXH8
         NiyA==
X-Forwarded-Encrypted: i=1; AJvYcCXLX1xQTYcX80zKsOVNiYjJ+rMH3QGy9lDdCsEgOL1h1Z9tvBmZeFfzyO72KjmF37MGs0IRVDyh6zy7rvy2z7r/oFEI@vger.kernel.org
X-Gm-Message-State: AOJu0YyXSeQ2p8JPRsEbmvftWE9o1IfK81Wkm9AnN9gQ8mUJxq+pgKup
	QITjHSx6r5W97FT1aBrYotQ7c14NyOkjDH6hWjV1tWqdWnxcf+NvX+x0
X-Gm-Gg: AZuq6aIw+sXli43fu3OpYrVWr42Wxrn66sW4X4TsoGkgKCGrhx5w1FylDt3MouTfXxM
	Uvr9lWUp//7scx1LNcSfDbFlO6mB9B8LNPreW5ShAt8Re771xxXEm74GDaGK/qoNHRE0Lfn/psm
	DVariTdNeReBSr5vYgAkJ/CBGOoyH7VuonN6VS23c+P54LjrCN6RucuBQGtMX6U+NInviKRioWV
	qH0PsEwrDkKpza87KVlj37kcketKdd2nQ6cs77plku6p0fNo/AB4pPswcpbRXw/XKrTQAVNqXrj
	dSVjY6q9nS8901HAJMyckcItwoL+ckf9bDLpvMq3kzIwoGXhUEuREzUbH3AYhQUAxJEWmAhPj2u
	dhLdwi/Wouqkfuy5Bas+uRgbRl+kY1VqE8vO9ueMz5+cUpU3JAwGa6E3TOvmk3h1vZcE4Kr2gTn
	l1a4ShIKK9KrVX41sKGnXl3CK0mIFk9c/SQKc7ZEvmKQA0Jld5Ifv/EeknW/Y5pkYV19uuKAzhb
	3Y=
X-Received: by 2002:a05:7301:1695:b0:2ba:a6e5:4ba7 with SMTP id 5a478bee46e88-2babc4b751emr335906eec.40.1770970376030;
        Fri, 13 Feb 2026 00:12:56 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd0a04csm4975052eec.33.2026.02.13.00.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:12:55 -0800 (PST)
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
Subject: [PATCH 4/5] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Fri, 13 Feb 2026 08:02:56 +0000
Message-ID: <20260213081243.794288-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213081243.794288-1-derekjohn.clark@gmail.com>
References: <20260213081243.794288-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an enum for all GPU attribute feature ID's and add GPU attributes.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../wmi/devices/lenovo-wmi-other.rst          |  11 ++
 drivers/platform/x86/lenovo/wmi-capdata.h     |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 114 ++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index f4763ed66cc6d..f7564b23bb7f0 100644
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
index aa48f43cbb43b..b7f9ee7b301a5 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -25,6 +25,7 @@
 
 enum lwmi_device_id {
 	LWMI_DEVICE_ID_CPU = 0x01,
+	LWMI_DEVICE_ID_GPU = 0x02,
 	LWMI_DEVICE_ID_FAN = 0x04,
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 7713a096077dd..cc024cb369b0f 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -66,6 +66,20 @@ enum lwmi_feature_id_cpu {
 	LWMI_FEATURE_ID_CPU_IPL = 0x09,
 };
 
+enum lwmi_feature_id_gpu {
+	LWMI_FEATURE_ID_GPU_NV_PPAB = 0x01,
+	LWMI_FEATURE_ID_GPU_NV_CTGP = 0x02,
+	LWMI_FEATURE_ID_GPU_TEMP = 0x03,
+	LWMI_FEATURE_ID_GPU_AC_OFFSET = 0x04,
+	LWMI_FEATURE_ID_GPU_OC = 0x05,
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
@@ -638,6 +652,72 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl = {
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
+static struct tunable_attr_01 gpu_oc_stat = {
+	.device_id = LWMI_DEVICE_ID_GPU,
+	.feature_id = LWMI_FEATURE_ID_GPU_OC,
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
@@ -1076,6 +1156,7 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+/* CPU tunable attributes */
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
 			      "Set the CPU sustained power limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
@@ -1103,6 +1184,29 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
 			      "Set the CPU cross loading instantaneous power limit");
 
+/* GPU tunable attributes */
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
+			      "Set the Nvidia GPU power performance aware boost limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
+			      "Set the GPU configurable total graphics power");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
+			      "Set the GPU thermal load limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
+			      "Set the Nvidia GPU AC total processing power baseline offset");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_oc_stat, "gpu_oc_stat",
+			      "Set the GPU overclocking status");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "gpu_boost_clk",
+			      "Set the dedicated GPU boost clock");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
+			      "Set the dedicated Nvidia GPU enabled status");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
+			      "Set the GPU mode by power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
+			      "Get the GPU device identifier and vendor identifier");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
+			      "Set the Nvidia GPU base power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
+			      "Set the Nvidia GPU to CPU dynamic boost limit");
 
 static struct capdata01_attr_group cd01_attr_groups[] = {
 	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
@@ -1118,6 +1222,16 @@ static struct capdata01_attr_group cd01_attr_groups[] = {
 	{ &cpu_oc_stat_attr_group, &cpu_oc_stat },
 	{ &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
 	{ &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
+	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
+	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
+	{ &gpu_temp_attr_group, &gpu_temp },
+	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
+	{ &gpu_oc_stat_attr_group, &gpu_oc_stat },
+	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
+	{ &dgpu_enable_attr_group, &dgpu_enable },
+	{ &dgpu_didvid_attr_group, &dgpu_didvid },
+	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
+	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
 	{},
 };
 
-- 
2.52.0


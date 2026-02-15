Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6C42580EE
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136028; cv=none; b=fMYzYDFseJLxrVDgXn3h/FRPTusxel4hESsMqfzYcWaMWblgn+JuJZgWxgUm2HkkKk8Ej6/Fo0wF9erMM8LNReBV1+F2wCjZSW0A906/ZivSpGIV7rvlIQ4XHS6VwtqhvmlzpItGWfCKujTs8QErPTDhi0OvL7NT0Q6Owb31mI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136028; c=relaxed/simple;
	bh=aqhY5rKwj8mLz3Kqc/UIPdBqxZUTPOMGzYLOL0qDskc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6LCv538o4r4RInAhuuQ3tt2PhTvCw4m0PrrSD0bUT7lZRCTF9BS2fKnsvOdpl7tiW4aUaN3k6jGAkRRqmbLWUFuk8WRx9FDEbVYwM3az+K9aFIfjiUPuuQ4PF4Okp+jTrYaMI8G3HL7XGKGU8xVdh/s3PJo+PYcRRLgZqAMZP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZ08Y2o1; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZ08Y2o1"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2397841eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771136026; x=1771740826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FodEvOZZ5wtibdy+Cbv3TyVCJ62hdhUOP/vBHTC1fg=;
        b=UZ08Y2o1dhvBZK5GHOHddedEp3gt5C1YWaUEML+Dp5P4YzGmk1/72DFoU5on65kn/f
         wvOwmzojlQULfcyc9KxhbE3GxL0SK61i6ZxxKyBS8+yFhHcQPL8NSQbdqRsNLa3asgTq
         KrHbJIJrweLKtBBQ7r0cOYuA6ir0X7pD8QJ5zQSAz1vkaBhwbaGL+kAqvxsf5rcxBRyl
         Qp5Uq8f7QGrLIY6qNRuaphpXXGMyahT5jR4SxQ9TQ4nZGxxkgXGFKGCG3IFTxSpwGEKj
         8nLpCVxroLrdyxZPJc1bJ6w4Lo/6LGmR67egl/xN5F+iWH1YxwPTaTlrthXK7h1eo1a1
         u3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771136026; x=1771740826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4FodEvOZZ5wtibdy+Cbv3TyVCJ62hdhUOP/vBHTC1fg=;
        b=E6p+xyW4r2RxzwBnOjhsItAzsC1EqiASnux3g+FrAZ/UZhNm9h+kQMGLFbHgc9DiGp
         hxB/k7zsaP+k4QUQoz8VONBKqEj0avP1OIEATcMxYaXyBZOXnlWG76JkiK7MhId5asu1
         NRjLDpMH1CccCvchWIIURj65TSsAsmd941Yybn7uvsgapqGUkBDqfv5DDSitJ/+nuqC1
         yglbjqNqs/JWU44MeZjSzEX4nT0lUTcB3ABXZZ0rWCzfDvaDwXGZC03dOUZDDs2BWVvM
         lwTPnUOBxJEzugkb1hgF6A0azpl8dd1G/K/zaxdD7+v3u9/RpgDPWSE1KS82jNEgd2Ap
         iybg==
X-Forwarded-Encrypted: i=1; AJvYcCUNfC4ZSOsui7687C+NDKmtZ/QVjVv1VyDbEVsAb/8/O9qRuALl3Bo1P58utw+qYHlHHeXYMKcPNuq4l8kakVSgn6hO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3m+Q1rc9aBY4sXhlTBiA4g4509KjYt+Xg6ZYSZuT+tJWg/ZMB
	GI5/aeKVFyKI2aUZzcc0Z8swk4p4QWe54tii54Dr8c/APcf/z7yWt1nF
X-Gm-Gg: AZuq6aJwzobSyItqqVqXiNjoCaXvrWhQIwWFF4tA8lHONfQsHJ30CiXsYLi5rfmKgoj
	fovvq8BCj6smhVJgUnfsET3cdjZwRJrXlhkrIcO1mkhxn09SooWqyFDsC5YuHPrsG+raHPOBX+/
	qK/YqZuLoIUnX/I/Qju+H3B4xX++KGOjGoqp/fXi6Et2I2wE1WKDCbLAMkvw7ZPjS8E46ScNh5x
	KuGbWDbGlIqxCtOi5C/HYngEiHP6kI7hXisyr2InXpDxh1BmtXWavsNhuFddDETgj5PoFOErFwY
	xyr043Seq3jm3KRTx/qFPttnjI7ZUXlErKAYZq/0oqRMA+fR8aHOTiPan+9Ed6UyObdL+Cvbco4
	O68vqVN/BjuPaSHWIXFdPL/McSIHmL2x4gpL3UX7Gt0XbmB1M48Q0Z1uaMNyajWWpunBp1jotL1
	CI/c19qoT9VqnPHISb269TxrkRGA91XrreMJg26q6lhhSV3Peu/X3XWIo9KsIVg8oDDJVUEF1XX
	BImhd+0pj6P6g==
X-Received: by 2002:a05:7300:d70b:b0:2b8:2910:dc9b with SMTP id 5a478bee46e88-2baba010c12mr2987077eec.3.1771136025589;
        Sat, 14 Feb 2026 22:13:45 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm4759245eec.12.2026.02.14.22.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 22:13:45 -0800 (PST)
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
Subject: [PATCH v2 4/6] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Sun, 15 Feb 2026 06:12:57 +0000
Message-ID: <20260215061339.2842486-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo/wmi-other.c       | 115 ++++++++++++++++++
 3 files changed, 127 insertions(+)

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
index 2986993cbb6a7..876834af838e0 100644
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
 LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_oc_stat, "cpu_oc_stat",
 			      "Set the CPU overclocking status");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
@@ -1103,10 +1184,44 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
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
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_oc_stat, "gpu_oc_stat",
+			      "Set the GPU overclocking status");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
+			      "Set the GPU thermal load limit");
 
 static struct capdata01_attr_group cd01_attr_groups[] = {
 	{ &cpu_oc_stat_attr_group, &cpu_oc_stat },
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
+	{ &gpu_oc_stat_attr_group, &gpu_oc_stat },
+	{ &gpu_temp_attr_group, &gpu_temp },
 	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
 	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
 	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
-- 
2.52.0


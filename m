Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5126361657
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100279; cv=none; b=mrCxnR8hxSq7h15SJUgy2FpBJrTrdxB4t6y5mVmF2SNXLfbqWfwYtQ/weUCdoor2HjU2I5DupU7b/YrkoRYLnl6oKAqVQ7RwCjFvLyUvbuvJuApEfFE9Wv3RSVwQKEVQX/EPbbqcBXxIwI5StbwvYjwgjiErD+DXwOBzv7GxiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100279; c=relaxed/simple;
	bh=AGNSJWHk6rHEufhSyPVS7Lzb46s2YrzKEXfMsYOAge4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8mhO/PHEvXLb0OHajiZWxDZvYhjB7G3wCYnASY5TR26UoK1w2B+l0Sz9y+hwio8oAFtMVOpTOX0mZZzA7zj6VIcMcOzYfYSjB+/owsUBvJBAVkgOU7TjlORsbIwhucmlp0hhn/PprV5nRb67Uq2MvkfKAr1VZseYHpve+nKHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Af5HIWmG; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Af5HIWmG"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so1007162eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100276; x=1775705076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4teSSDSZxadJncjuE0P+g4FnFzukItSRNmCV2eTIxU=;
        b=Af5HIWmG3qPlftzUKl0iqJdbajVu8QdxE0v3LVf5Wr7h+9JxfVNwvsVQV4kcKHeM6Q
         MuW94Vj6xb+SX/lPbS3nds7V93bOpLLjtA5P/7AiWY5nFUS6DR0Qna2MyWQdE2X4+8+K
         Htp198wBs8kXcgIYNuhTcoOYI2egvdQPofmirDV7ur6czDbpSEhSev3yAoIwsZV5dKWA
         KFkPRYQc6H/ZrmelFLbqlGz9jsujE6+jvKRH9s2qdn9qxXM2WdA4CcWtt3zDjf10KJ/6
         O/nb9mOUd4gS0jvKSZnEiBEf8nlBM2+hzzNw0/AXOlk3MUgcJl4XENSe5ZURlJEE5eA8
         OKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100276; x=1775705076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4teSSDSZxadJncjuE0P+g4FnFzukItSRNmCV2eTIxU=;
        b=KmtO7smTBWTybYO0LO4M0tZTNo9baE8eE/9NbGooG3XqeHU+3Orc1dYRR63yfAUIk6
         NqkmlH9Ny6bK2N1/tjD8mge5tSg0KqbxYrarxWe+QXnRQGDYrJILnMH6u3sFDwnIhRc5
         JG+TrpMFs+woDMtMSSfitGPgWclBKXXhVs4qnjbIAndCdwcBo/iYAjlSWI2qRCYUJEWy
         r+cv4RIVJVVlhNFJhjjp1wdazpfAI8OFCZ4XizKdhdUxz15xhA83A5/1eNYjqliCnMxT
         x0JVErH41wKQl5lnejO1EYY/KY/kC+b9YCi5A7zleYv08QTaNIKvPPQ9pNaqF99SPGWh
         QASA==
X-Forwarded-Encrypted: i=1; AJvYcCVnQ4nGqW5Fk1hVEnG9YdTChC27yc8CCq4h+t464AQnnW41jlFmhwWu9A9GyXUKzZaYobWWkM1Oj0wKyQ9nQWTT8K2d@vger.kernel.org
X-Gm-Message-State: AOJu0YzueO3WFZCDgT/Bq76IYgnaqpbwyHaOqjGoC60FDbIGSMpE97ud
	2ybNitQhh5p7+tVJnU/Dk/ZbmIC5O3jyesikOxJL6Um4v7MGXGb/N2wc
X-Gm-Gg: ATEYQzxm8oBzJGiOTm97dtY8gR159U+gxvyiRiyW4VTATwFTW1TiBDeTDXyRYaj+uyc
	xFUnEODr9Jp9YiYy8IoQ7lTEVZkI51VLvDgzQfu/AUQrvkyTDVwrBBiI+IJtlSZdtbw0w6JTeN/
	Qd/xWgZ07MJmF4C/tbMR16msH621QSjW1NM6AVYn1RmyEcwW9yp5V0Ccx/MAM4XAPIC8DjFbtom
	Zb7QZR3WhLHOlXh3qHCmOV5abeznQoe6DuxCbv2KUCuM/0cnw/UPcdKXQCMwDBDcSHq2JFxs610
	1K+nhmBSiR72xuViTeCup7sjYsNpS8pcAaCy+VhVXt9OP0tdM+bFDCtn0N246L/XphgpuENdKCK
	QVbKdU1nV/Jhflzww/hM4C0JRx23vTQK/sQg/zRWbMQLiaMDvLtAnVS2oVlXFYiy4FrdjCmN/1H
	nlGlxx8dPQdoE52ACasXxLUyDJTsl7Vhl/JMa6h2Xyi0uj5cyt42MYRPWKcD2r0SYpGC1haKegk
	66f
X-Received: by 2002:a05:7300:2150:b0:2c6:31f0:a025 with SMTP id 5a478bee46e88-2ca9047cf7bmr992790eec.27.1775100275896;
        Wed, 01 Apr 2026 20:24:35 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:35 -0700 (PDT)
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
Subject: [PATCH v7 12/16] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Thu,  2 Apr 2026 03:24:20 +0000
Message-ID: <20260402032424.678528-13-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
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
index 189dd4d31926..988ae04ff724 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -69,6 +69,16 @@ Each attribute has the following properties:
 
 The following firmware-attributes are implemented:
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
index 56c8b84f306d..57b6b6f17f33 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -61,6 +61,19 @@ enum lwmi_feature_id_cpu {
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
@@ -624,6 +637,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl = {
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
@@ -959,6 +1032,7 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+/* CPU tunable attributes */
 LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
 			      "Set the CPU thermal load limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
@@ -984,9 +1058,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
 			      "Set the CPU cross loading instantaneous power limit");
 
+/* GPU tunable attributes */
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "dgpu_boost_clk",
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
2.53.0


Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6DD44BCB5
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980744; cv=none; b=mjzE9LL2rUKGeODIryBr8wZKE6CRHQ6qW+w9o7pT7bFXHSsOvND/TvNDOi5W5KNsLWr0VMbCNMGZQMmoCjey5lK7g/NURs+ZWYnrVHHKR8GXf+56R1S0NObRYV+74gYg49qAQjrepyrEfOVs0nRXyLthfBSb3t797D/quNEZcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980744; c=relaxed/simple;
	bh=feZc+w3JkICycdeQtrVgc3L/lRp7m8kG7/h7RrrVM3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APsXuk7YSvIT2bGBwl2msKon5l4REN+kdAXZyEaB3ux0xvopfPHp4TWqa82mrEghYBdhGIIMUXWlQKwNhAtvu8YA51O8kKEOePQQ1nZ29PmoXiULgVyrwjOR193L754679Ri/VXEP+iuS6MaL17/uGt8s0xCz5TLaWesF7xWQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZmbybWQ; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZmbybWQ"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128b9b7e3edso2289370c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980739; x=1775585539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5wB5CKOkfM5PQBq8FCbagovENO2/jh6v6z2f7YXnTI=;
        b=oZmbybWQZC9tJ613m32MscPwudgzS6HvFB2F7znabw9CMJSg21SQc8S910u4qE8vjJ
         Pk1A6N/R77sNStF7/46tknXkoOhBeAGYRF+J8bsrJbVfW58pAd/bBKLva+ob2bigLdR3
         pf1vXOvKLkH4lGyXD5V8NFy1dt1xO4fj2wuJDb2+9YDQeXYKP90wR0nyKbCGG9a2iAUv
         xoKaPYSSySOBAHvf7aSXp5kgz9FgjpkAxSIOIPre+9h43BpPbsNAROcNv8hAqD32p7yb
         TRDB1uCgM31zrlv0Vm7q6O2nnsvKQhbd3QqNO4+yfSG1JNBo9UJ2stBg0Z7HPCXcOaeY
         TXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980739; x=1775585539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r5wB5CKOkfM5PQBq8FCbagovENO2/jh6v6z2f7YXnTI=;
        b=F0GmsxJ4J+rszUXgQ6EIfkOICWBgxcdmn5aXAAN38+XtWmzTOIKKk9R00KNJIbHXVm
         /HWgMaS7FDsHieajSptVNCoggWpDRAPAiuKD/tCWcxKE6/IsLZLrfF3Ub6hXrlh+UsiQ
         09f41v3sKRJYBNR0oA0f2Rhxb/V8utc3FC+2VWJWbfRiNGPf8aBFNzPi1G2y96CR1JJp
         +Ha0LI+CDrnEALEvVdwQ0ni39bOHkfW2D98QnReDPU1ujgh/u5uXxrMnAUeGlTXZE6nV
         efEzJUPqeoywV98bQQhMC0VTD3+cHkZyps1mbwBTtkg5bj297TTqGPfo3kJ59m1RbQY8
         lv6g==
X-Forwarded-Encrypted: i=1; AJvYcCV5trOGCB8bXbuy9S7TSN+CsiRHwT08SvGiBkjtRe9xMxz9XGggupRky8dzEqFfJtZbKYZYvFKfVHeCfbcSq3HGorMu@vger.kernel.org
X-Gm-Message-State: AOJu0YxnFrXqMrG3fq+jdRdgOx6zVQ0tMj4iTEz2I4N1CInUFuZgl8N5
	bWntaJ2pr71D39S15m3afG3vKtLJArJ/ORewKZGURiRZKvdN+lfDnuQb
X-Gm-Gg: ATEYQzyQ6lxA/l0Lk8UNdcfc6mNMlNdKYaF8v5RQrrdijWpUnyxNfnpppH2RTKJLwza
	5TGU2Ph42LBcjEaLHk6ATXSr/Ki9B4VsBwYKmba4HsGf4sypldnY1Q83uxyRUrk7sthwDE1VPEZ
	LmNVE20gqv/NQ3eDpmVIGTNemNDPmo4pbVrvjMvd0erjyY+VD0pmqMWCHxcK/w8PrSUl3UX+WM/
	BVkboMRop5Z9/Orhh4MIM2sVHs0IIhHN5eKkiGLJhJovsQGARHOWnvdyFrrbYF+iTF7CxYQybFd
	wvt+pn6TQAvHakFCjv6hZXyOTL9oDFg4r36nXLft8f/mJ3huRm/+E7nc4q8hwqALUrxzXp3ppeO
	O9GQ3pLeUpZTHKCf8ju33zVJ3GUti7s2VjY6hJJQVzmODCsfzjRByfbUOG0LufafgC8OIoa9r+b
	3k/pH38fYVInfxUmqIFDVf5ayoITyPynl4+Uj+6ADiN6dXqXbFNuHxEhWwKzy5uZeZ4dQFQAWyl
	hdY
X-Received: by 2002:a05:7022:fa2:b0:128:d737:d7a6 with SMTP id a92af1059eb24-12be640d655mr290697c88.3.1774980738731;
        Tue, 31 Mar 2026 11:12:18 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:18 -0700 (PDT)
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
Subject: [PATCH v6 08/13] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Tue, 31 Mar 2026 18:12:03 +0000
Message-ID: <20260331181208.421552-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331181208.421552-1-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
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
index 82c17361e749..bfbea59637bd 100644
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
index 508186c7410d..2792671ac1de 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -65,6 +65,19 @@ enum lwmi_feature_id_cpu {
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
@@ -630,6 +643,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl = {
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
@@ -1061,6 +1134,7 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+/* CPU tunable attributes */
 LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
 			      "Set the CPU thermal load limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
@@ -1086,9 +1160,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
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
2.53.0


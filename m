Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250F44D011
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980743; cv=none; b=EShmHgYDD0aS1uVJ+5+otQCNzgvnnA43ZciJ8DaSxYjrg+VHBNIOKcVocKgAz//6Ho/Y1B70r+crcKeLkBUl0/TCEqeGFTd5bgqKUfArj9ySBlZxpdJJvVnjKOtTVhV+Wxto7cJscDWx6kDSPHLdlB12f11jbZkbr+oCMsXVV/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980743; c=relaxed/simple;
	bh=zTRJS9hTDJuOn8NF67uGmslctx+vPGb0VlOu/uWvByE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oY8T8lWO13OZBkb0+wWgRNSv/eafTLMEFFyv9maZDQ4R6zc4Fa6/8AE4ltA9bZcNU4Qpwt+wTxyMQFgquzm17R8O/IjoZ5pF4Injpy1oWEaH3lduw7mZDRVlAW1dtX0VNY9BR/T06Bm+hwolI35Q3EPwn6sUfyuNRqjSiRpgFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6iQvdRj; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6iQvdRj"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1279eced0b9so8155645c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980738; x=1775585538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyooRgntglIzJaG2Yu3kpByt3RKuyXLi2A6c5xQV+9c=;
        b=V6iQvdRjb04Yekb8l5d2uzIgpdwpirfFTs8ufz6+YFtNHGLgUjG9lkb2mBZtdmrN9M
         NI2RxfSM6dSpzXm919gB5FrzSfvp6xB/ngBErYGbjwgz27TCv3GkTegfcqJyonQQVceH
         BTK8DP07I06/Jmxl2ftKhsCGQJfhk44qHit3jDDVnb2EBPBCHd1HzEn3LKRgRkoPL0lx
         BDsU2fkz0eJIrQ1RCrrYIRZix/P2erbm3+6mY9NsizOSS5iaqFgauvkBilw6HhsmUHzT
         EqvZDIQisyh7mFTl3ZbvikhLblk/3MKmHD9SYb8UIfSwMbE6ItgyGF+HuitAP0eiiAHG
         XSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980738; x=1775585538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dyooRgntglIzJaG2Yu3kpByt3RKuyXLi2A6c5xQV+9c=;
        b=PtnWTd04VsAiIgpywgoDYebJePf12ZCCBykLlJ7f4JGr5dCneIKuE/vB5xNCiFN6yX
         9J4Rh1scSml5siRxRiph7JD4oDrTpEqgbe+WFk4ACoDH/LoYYQ0BhWVf7Q+++3CXY8oA
         HEdAcuiOa7N4yh7dH7aJ2U2OXZQGYmAV7Sqwlov9IVTXjKSC4XrzUVILp0QkMIWzxvDC
         4Devx0MqCT3COsERIITAdHfoptO5UCR2GsF+64XEl6mGYv1Tecq6P1//7Pp8vT+hj+XS
         R5Gog1lBwFde9g041ZfBVy8WQCLGToacf76i6LbStBenuNdC/zWQ0VCoKSZdZ14RVHUE
         f+CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhx5tjWIYL7k65rfGd9D0UOgUhxFWLBzjKfEN6cGK5WQKKrIiYZtzgKeDUZrcHYBkkehMnVxgUXU6M0B9nrp7ubAc2@vger.kernel.org
X-Gm-Message-State: AOJu0YzLT5bxQ+yKz6wTtEK1IEbd8VUPOwnqDlwrFTgi9SsQAOUWCL7p
	4iIX1aMzMfK5uFIjIaAGz+pPraJm4O5XeXdfK9dvrut6mwxg/1d4uYbY
X-Gm-Gg: ATEYQzyNaFNLzM6u/B0LJFxXuRE7o320RtQUJfMfSePxcaHbosYULwVr4MlKwGeHHkN
	nf770is4qWTkmxHCYBZ4NNzGpyCP69mZ3HE9rPXD0tcLMKizxs8RkScBF8e99HT1Q+Qe7uJJNRl
	mS2Ml6MEA1jMgwOOsnmQxVsw806Uq1TqiLkmPV8Xo5m5h17rC2Tomp6qpIamoLmXHJsRdcGGTgA
	LaWEtTGxw49RVPpTrSOK3H8kG0V/l07sl+EL/I8GFqvOSMkjN+fIwCxZrmIHtBfXlu4IpG4FLYy
	C/DBE2tDO3i8uk50VF3bvOAwvU49B/qvUuUP4WftnA/aM/Hdibzb6W3X2lQWFEpy9eS6qedInXb
	NiXXvCPYm9CasGmkjbuoTLs1H9mCV+eWjmD90rA0Osj+w/dCrzO3R98Vn/m67hwMBrW6C+WwMwH
	XlF96hgUQp7v/HktTI/RA8tW91dJxxIthQmF9xVhXRfLYjhJPmXiL/VGElsYJhUXkvq++44TqAP
	RUJ
X-Received: by 2002:a05:701b:260a:b0:128:cf70:9042 with SMTP id a92af1059eb24-12be64ace84mr193241c88.18.1774980738023;
        Tue, 31 Mar 2026 11:12:18 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:17 -0700 (PDT)
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
Subject: [PATCH v6 07/13] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Tue, 31 Mar 2026 18:12:02 +0000
Message-ID: <20260331181208.421552-8-derekjohn.clark@gmail.com>
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

Use an enum for all device ID's and CPU attribute feature ID's,
add missing CPU attributes.

Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v4:
  - Align type ID defines.
  - Align CPU feature enum values.
  - remove cpu_oc_stat from Documentation.
v3:
  - Remove cpu_oc_stat.
---
 .../wmi/devices/lenovo-wmi-other.rst          |   9 ++
 drivers/platform/x86/lenovo/wmi-capdata.h     |   5 +-
 drivers/platform/x86/lenovo/wmi-other.c       | 101 +++++++++++++++++-
 3 files changed, 109 insertions(+), 6 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156738..82c17361e749 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -68,9 +68,18 @@ Each attribute has the following properties:
  - type
 
 The following firmware-attributes are implemented:
+ - cpu_temp: CPU Thermal Load Limit
+ - ppt_cpu_cl: CPU Cross Loading Power Limit
+ - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
  - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
+ - ppt_pl1_spl_cl: Platform Profile Tracking Cross Loading Sustained Power Limit
+ - ppt_pl1_tau: Exceed Duration for Platform Profile Tracking Sustained Power Limit
  - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
+ - ppt_pl2_sppt_cl: Platform Profile Tracking Cross Loading Slow Package Tracking
  - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
+ - ppt_pl3_fppt_cl: Platform Profile Tracking Cross Loading Fast Package Power Tracking
+ - ppt_pl4_ipl: Platform Profile Trakcing Instantaneous Power Limit
+ - ppt_pl4_ipl_cl: Platform Profile Tracking Cross Loading Instantaneous Power Limit
 
 LENOVO_FAN_TEST_DATA
 -------------------------
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 1388eaf4ab4a..f2d45cd7a188 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -18,7 +18,10 @@
 #define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
 #define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
 
-#define LWMI_DEVICE_ID_FAN	0x04
+enum lwmi_device_id {
+	LWMI_DEVICE_ID_CPU = 0x01,
+	LWMI_DEVICE_ID_FAN = 0x04,
+};
 
 #define LWMI_TYPE_ID_NONE 0x00
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index f689d19d711a..508186c7410d 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -54,14 +54,21 @@
 
 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
 
-#define LWMI_DEVICE_ID_CPU 0x01
-
-#define LWMI_FEATURE_ID_CPU_SPPT 0x01
-#define LWMI_FEATURE_ID_CPU_SPL 0x02
-#define LWMI_FEATURE_ID_CPU_FPPT 0x03
+enum lwmi_feature_id_cpu {
+	LWMI_FEATURE_ID_CPU_SPPT =	0x01,
+	LWMI_FEATURE_ID_CPU_SPL =	0x02,
+	LWMI_FEATURE_ID_CPU_FPPT =	0x03,
+	LWMI_FEATURE_ID_CPU_TEMP =	0x04,
+	LWMI_FEATURE_ID_CPU_APU =	0x05,
+	LWMI_FEATURE_ID_CPU_CL =	0x06,
+	LWMI_FEATURE_ID_CPU_TAU =	0x07,
+	LWMI_FEATURE_ID_CPU_IPL =	0x09,
+};
 
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
+#define LWMI_TYPE_ID_CROSSLOAD	0x01
+
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
 
@@ -557,18 +564,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
 	.type_id = LWMI_TYPE_ID_NONE,
 };
 
+static struct tunable_attr_01 ppt_pl1_spl_cl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
+	.type_id = LWMI_TYPE_ID_CROSSLOAD,
+};
+
 static struct tunable_attr_01 ppt_pl2_sppt = {
 	.device_id = LWMI_DEVICE_ID_CPU,
 	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
 	.type_id = LWMI_TYPE_ID_NONE,
 };
 
+static struct tunable_attr_01 ppt_pl2_sppt_cl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
+	.type_id = LWMI_TYPE_ID_CROSSLOAD,
+};
+
 static struct tunable_attr_01 ppt_pl3_fppt = {
 	.device_id = LWMI_DEVICE_ID_CPU,
 	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
 	.type_id = LWMI_TYPE_ID_NONE,
 };
 
+static struct tunable_attr_01 ppt_pl3_fppt_cl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
+	.type_id = LWMI_TYPE_ID_CROSSLOAD,
+};
+
+static struct tunable_attr_01 cpu_temp = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_TEMP,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 ppt_pl1_apu_spl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_APU,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 ppt_cpu_cl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_CL,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 ppt_pl1_tau = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_TAU,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 ppt_pl4_ipl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
+	.type_id = LWMI_TYPE_ID_NONE,
+};
+
+static struct tunable_attr_01 ppt_pl4_ipl_cl = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
+	.type_id = LWMI_TYPE_ID_CROSSLOAD,
+};
+
 struct capdata01_attr_group {
 	const struct attribute_group *attr_group;
 	struct tunable_attr_01 *tunable_attr;
@@ -794,6 +855,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cv_mode_id, tunable_attr->type_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -998,17 +1061,45 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
+			      "Set the CPU thermal load limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
+			      "Set the CPU cross loading power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
+			      "Set the APU sustained power limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
 			      "Set the CPU sustained power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
+			      "Set the CPU cross loading sustained power limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
 			      "Set the CPU slow package power tracking limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl, "ppt_pl2_sppt_cl",
+			      "Set the CPU cross loading slow package power tracking limit");
 LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
 			      "Set the CPU fast package power tracking limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl, "ppt_pl3_fppt_cl",
+			      "Set the CPU cross loading fast package power tracking limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
+			      "Set the CPU sustained power limit exceed duration");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
+			      "Set the CPU instantaneous power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
+			      "Set the CPU cross loading instantaneous power limit");
+
 
 static struct capdata01_attr_group cd01_attr_groups[] = {
+	{ &cpu_temp_attr_group, &cpu_temp },
+	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
+	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
 	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
+	{ &ppt_pl1_spl_cl_attr_group, &ppt_pl1_spl_cl },
+	{ &ppt_pl1_tau_attr_group, &ppt_pl1_tau },
 	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
+	{ &ppt_pl2_sppt_cl_attr_group, &ppt_pl2_sppt_cl },
 	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
+	{ &ppt_pl3_fppt_cl_attr_group, &ppt_pl3_fppt_cl },
+	{ &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
+	{ &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
 	{},
 };
 
-- 
2.53.0


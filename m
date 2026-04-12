Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347B385503
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028295; cv=none; b=jH3SoL+F3KPYOsqnawx5/b4UJVQYVLIynfpr48xcOruDTCzP4WekgYEMj6Ewf+PG+Ne4r8rxRKl9mAF2672qE5kBFx68fjmAJEJ/IqekWwej9W4ThxoH203pWS8XWXhkJahTtX3XGYwjyouzbwqyjMVDrxLXaPb/4DCpoDYjdU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028295; c=relaxed/simple;
	bh=/Q7L+5+s7FD7yhR0fw+A3SxzHEisnXuLUd3mmroUUyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGVW23LYu45v3bJ3sMBFUWVUpWCC8EpBdtGCCoLJ+22l5BOAorz+gWbouu9vXd8Ot/zB9WXUOg/CKIPjz5qvoIo+MVzTm9RNOIPTdOOwDN7hAKO8gpR0oUixW9neB5X79sdCqHET3A3bmqwak3+MdJt+PhixVN0gjGQP8cSwo2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4nU/74h; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4nU/74h"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c19d23b19so3719208c88.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028291; x=1776633091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgaYqy2GOTziDDZqh4ttc9SZITtVwJlVJItti8AOdu4=;
        b=K4nU/74htxblLrmlwEcoYKTnG9nuf2MKy8S7XgCNC0oUkRHYvO19PnWlM6+kBUgo1X
         rV0N2K3rhg225HXEALwkFhPX+RvsDn8N4fa5p0+hCB08bq6XxOmKyDscfJvxEReHPsky
         dVzu0xJXLTLjqELiSFHMnTT7JpVLvexpwJ1kvYVnCrZvPqAAG1Tzwl52TNsBqJ7cIJHs
         Yc80Vh1PK5zgQz7/cwICy8unDyJ/ilT07Oi6pJECOWQDEqlyk4HGWoIdV/f/Xq/sHYAR
         ZA8X82/HYUfVkkgxmUSCFPZo9E7mSbQm8gMwM7Lbp81x+u3EM89DSKZRyOrjfXhFP0k2
         QZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028291; x=1776633091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgaYqy2GOTziDDZqh4ttc9SZITtVwJlVJItti8AOdu4=;
        b=sK4xAUM1dTVgW6Jo8sVcdQnoEa+59wa36c7/nBOSq4obdGD8Z747wGNPKzxbjIVrS4
         9E1JeV0Q+X4TuvcNHZx/MBAB3wvtjFX2vq3A8HDh4ylh8DhczAB4aQ7FGb9x3pzVOlrj
         YbarEszbf4/F77SxgwjyNJbHEeDJHh/Qj6Pq4I4+M3ET2JUdy42sfHhDbMd2gfwU2JMc
         7wTl1xk58EInM/dwk2moMLtaxXMo/aygDFIyRq3HnhRBheDo3qdRFUiI1mGUCojSJMuG
         ptKUwG/lLyWy1EDRxajqk2B58zywd+YtfAoFnNaEj/NfQddkQyj+Tt5CU+si9jCSN08J
         sdnA==
X-Forwarded-Encrypted: i=1; AJvYcCXxJvMuTCG2ZNVy5KRcuA1dJNielpDC51fcd+5MKu8nxl9TMWC1qmiYpMAiqOX5tkJBTo4iI5j0WrJ7wpOCxoQOvzkB@vger.kernel.org
X-Gm-Message-State: AOJu0YxB8Dj2QICIBulMpODvTFb9HORs/gYs4Kix9Fr6RRqUgL35o8UQ
	B8h1wdK8kkPeVLp8EBC/123Odxsh9j2QZNFMyel4YZKoFC2hjvSztINA
X-Gm-Gg: AeBDiet8nZz1OlQBt4GIonzaf231PwpcHdEaF2aDSwCorR0TiCtr9nzAkyVK+tdLTmR
	2DyungXK92UOL+muNF7J7bNGIgxXi6iOc4uxmC0zpsNkJExq4YlP2RvYcMtJTXXYzfG42zWzqh9
	S70qG/N+tKhmlCe7sG9TAq8p1SZlLvNEOGsXCCUnS9BHuVGTJ8lkAvfkxgbcT/5WfECCnMyd7Xo
	JiNNAixHm/bZZI40ao0mIcDEKJUlgpKR6r0EHTLQMxkpQYT3HM08MVMZAvwtsJdYi5uentim4MF
	Pkqk+vWQokgJ8eFHqhPIb0/Lj2NA7LTTGu0fLYdEKUu7X4VOm4gPjS88fF6hvjmnAKVnMB4oGui
	gI0tZnGweLaHFocxDXCH1kcrQtKrttcrgbGgG+r49PgLY7qof9QkkF7b/uMv/+tHPCfh4FPPJrx
	7P0Jx8M7IwsaNoXxFKprFCIR6iYNdwadscOXdn21JXdpe+1QOKrzmu6m2Pal/l22+08EpEajvdl
	YUG
X-Received: by 2002:a05:7022:4589:b0:12a:6902:ddce with SMTP id a92af1059eb24-12c34e6012fmr6162042c88.10.1776028291312;
        Sun, 12 Apr 2026 14:11:31 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:31 -0700 (PDT)
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
Subject: [PATCH v10 11/16] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Sun, 12 Apr 2026 14:11:16 -0700
Message-ID: <20260412211121.2220556-12-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
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
v7:
  - Fix typo in documentation.
v4:
  - Align type ID defines.
  - Align CPU feature enum values.
  - remove cpu_oc_stat from Documentation.
v3:
  - Remove cpu_oc_stat.
---
 .../wmi/devices/lenovo-wmi-other.rst          |  9 ++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  5 +-
 drivers/platform/x86/lenovo/wmi-other.c       | 99 ++++++++++++++++++-
 3 files changed, 107 insertions(+), 6 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156738..189dd4d31926 100644
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
+ - ppt_pl4_ipl: Platform Profile Tracking Instantaneous Power Limit
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
index 3805c4cf1d10..adf4300415f8 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -50,14 +50,21 @@
 
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
 
@@ -551,18 +558,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
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
@@ -898,17 +959,45 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
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


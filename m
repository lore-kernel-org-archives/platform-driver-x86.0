Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC9327A47F
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907531; cv=none; b=cxN3MvxmheY36JtdnZ7OSeUKQ2whsY207VJ/kBZzJJTBI8nP8ci+1j7R6ffUWqTg3MvdCkP7PlwQtykjVMKHJ1uTRmitrn746O4mOp4jJNpES7v/3qpCisacDrHVsjxLVS1GqNDB2jj47o24mkurGiJ/SKJuZkbEO/KER4dBIi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907531; c=relaxed/simple;
	bh=sIRzUN3xyF8YtANkJcMMtcYfXNg0uYu+T1sypey/XpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lCpT8tSk8L0qqy0EYGPLVJrgRoEucgm6vk+16UV9aZeYPC8idw9U7KuiKTNCCjL3mVXfLR4Tb2B6EYCTEEYJuSKIaQJlFiL+XSTJ6QZkmnKo5O6deRRGknxUwRMZD1RtGYaTUOQb5vb/BHNoaWZi0BOoYLSsa3BuO6QV09wloIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ev0y2DNX; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ev0y2DNX"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12758ce1e8dso567258c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 20:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907529; x=1772512329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56CUuBs5aoxiv/DRtlg7n68+hk29R+WL0IJm73lGTYs=;
        b=ev0y2DNX74SJ1qL7rDq2/DGjt+BLx3hBOXLUPS/paOjhN30G5jv4m4GAevjtpV7R+P
         ut9H9gYx99ehsboU7l5QaF3YSmNttLy/pE2efd2o5izHx096FtCUtNYNsYw0pR3NSUos
         eYz13PgDahVHSydNNjAs1lf0DqR+VKRs2jJ0IomQ0yocMjtE+Jvk2BFT7rZ4MSJlmCCB
         5kNzXTAeopW/3vInCoE70NkpPY7S62VUGIqqPAp/yL+JVl3rXYW5J6H3DP1UTJTMlt6u
         VT6jxwqZDRKgvZek2TQyJoAsmTq8YCpzwCDAHIL14lmgkB2Am1nL2+lNRXm22TLG7NvG
         IlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907529; x=1772512329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=56CUuBs5aoxiv/DRtlg7n68+hk29R+WL0IJm73lGTYs=;
        b=IZYdlpJnauund3zPUwC21iya+q3P0dPqC3ZoiUcAIaIK9TxnYrUJ4LuqQtG9M0ZxTr
         O3weBBBCg65JSNkvKEdl4CcI/5AodvWl7EBZXl4gkiIaTnj3lBQKYej5tf4EA3s47H9k
         9+kQQL0AyKmB/xaRSGwDj7N3j8HZ4WxU0RDfeISjhwL00zqRQZu0jtHZXkpUQQJRZ1ni
         6sfyjeW2HeDelM5Tl2J2CxlqDGNyRHfQSxaIsU12lB7v6mxuXIOkYavw9sYI8C/cnFAm
         zk4XbFgFlnDjXuTnD/vlSMkZU3ZZYOy1sulFlqQibVjW12czxgeV2X+jE2CjzAr/7tt/
         Ai9g==
X-Forwarded-Encrypted: i=1; AJvYcCWw8e2hLKWzmwvlhnO+i7wreOhAu9uea85GHBscJf+egGtjDJRI7GpjBuZyKBrKomzOPU44XDzDjKKRiyZpXctD/nC8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd1lgjw2HW4/9+aVunBWTs3asR0jTneOj1rp0VtymLkqix22wb
	1FGBvoFAJPv0ruP++QbCecyJdtiFXJ+1rT2RD9cXW4Sr6wjPcW9DHdbF
X-Gm-Gg: AZuq6aI14EzJU2rykEgKlwk37ydGkymKXN3Ets6nVNn/feLB5rcoXtqujQj2DIrf3qu
	kHUKEf9N25AEJs/LphtLGG6Da4zQboMd2nAMruGN44rOdHNQ74gW4d+/URkFg4AJVO5WpM+Gzrr
	+ytZPQUgYbTyp29uHZdcTlUqb22KhYUwkNBwWYp59MXVCR3mYpK1Me7vGtkH9xfU10OHhySi4DZ
	2Bo3DtPa72wJdTS/JmoOR137Dlx4S9zVzaLtQod5ekcr0oUK+3ZW25sGMksuNKPyamak9ljk8aX
	fIsDGE59POK832LDzLqu/HRSxT9Z9I3wjzpfyoyqOq2pB9CxJATC+dEIIIp/OjbwPUC2qIQ8kXL
	Vx99+qJIhnz8I0sqPlDgwbVaFxZXUdOsoyyVYknt45s6kVPgO0Nz31xISh2eBH8nylbB8nXwodP
	xmEvfCHN/i9w2mOYtEktggPDCWuUiYtYzbrHXA8X1NaVsjOLNEOuiKt8I2J3YCmIo0ZiR3yzJnJ
	GM=
X-Received: by 2002:a05:7022:1e05:b0:124:9acd:3b15 with SMTP id a92af1059eb24-1276ad81bd6mr4856346c88.39.1771907529079;
        Mon, 23 Feb 2026 20:32:09 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm9607887c88.9.2026.02.23.20.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:08 -0800 (PST)
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
Subject: [PATCH v3 3/6] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Tue, 24 Feb 2026 04:31:57 +0000
Message-ID: <20260224043200.2680384-4-derekjohn.clark@gmail.com>
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

Use an enum for device ID's and CPU attribute feature ID's, add
missing CPU attributes.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../wmi/devices/lenovo-wmi-other.rst          | 10 ++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  5 +-
 drivers/platform/x86/lenovo/wmi-other.c       | 98 ++++++++++++++++++-
 3 files changed, 107 insertions(+), 6 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156738..f4763ed66cc6 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -68,9 +68,19 @@ Each attribute has the following properties:
  - type
 
 The following firmware-attributes are implemented:
+ - cpu_oc_stat: CPU Overlocking Status
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
index 27202e2dc8a5..aa48f43cbb43 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -23,7 +23,10 @@
 	 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) | \
 	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type))
 
-#define LWMI_DEVICE_ID_FAN	0x04
+enum lwmi_device_id {
+	LWMI_DEVICE_ID_CPU = 0x01,
+	LWMI_DEVICE_ID_FAN = 0x04,
+};
 
 struct component_match;
 struct device;
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index f3f12303e379..87aba244da84 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -54,15 +54,21 @@
 
 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
 
-#define LWMI_DEVICE_ID_CPU 0x01
-
-#define LWMI_FEATURE_ID_CPU_SPPT 0x01
-#define LWMI_FEATURE_ID_CPU_SPL 0x02
-#define LWMI_FEATURE_ID_CPU_FPPT 0x03
+enum lwmi_feature_id_cpu {
+	LWMI_FEATURE_ID_CPU_SPPT = 0x01,
+	LWMI_FEATURE_ID_CPU_SPL = 0x02,
+	LWMI_FEATURE_ID_CPU_FPPT = 0x03,
+	LWMI_FEATURE_ID_CPU_TEMP = 0x04,
+	LWMI_FEATURE_ID_CPU_APU = 0x05,
+	LWMI_FEATURE_ID_CPU_CL = 0x06,
+	LWMI_FEATURE_ID_CPU_TAU = 0x07,
+	LWMI_FEATURE_ID_CPU_IPL = 0x09,
+};
 
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
 #define LWMI_TYPE_ID_NONE 0x00
+#define LWMI_TYPE_ID_CROSSLOAD 0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -559,18 +565,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
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
@@ -1009,17 +1069,45 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
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
2.52.0


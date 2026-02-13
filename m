Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E4231B100
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970376; cv=none; b=Fb0JSkQR1nzUByEvK8PZ68x8g+6BcVa1elNLeWkGaDvXED6vLPVvwGnrc9mnaCckZborwzXDgS/8FspCJUuCt9lR3ZMbxs/6r/sTZYfVi+DfgLROgZ/c3xBagBBR+4z7aDGtezLawCJ/sjvQsSndQdnqW/E7KuD/i0e+ayxSlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970376; c=relaxed/simple;
	bh=fmD+A79YPX4gn56k6FpDZdnO97Zv8opvZM42tWZtGP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p5Wn/juB9S0lz0qTNPb9HJlZ+KnhcwOFyZCHgp41lz5K7ILMcFjOh+Lh61kroyyQ6Pa6yJFUcPZaNsYybVBVubBhyPPdg49b3VE0LvNbBnWtnKVLnP/Hb2SG2T5DfU2nPAWnKayNLvpTIcdckjYhU/I8EeRuygZ7qXdNxl0Q3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWjPS0gy; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PWjPS0gy"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba9d13f10eso1201470eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770970375; x=1771575175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0fJO7xstvRTrH/FfceNJ+hqYRj6fO5VmJRTZHauNnI=;
        b=PWjPS0gySpGUUW1+gAIw/IdWjse3mA7jhPuldrLFZ+ahjBjrTRIVi5PmHeq929JRAp
         2wPEvWWaamU7Ey+UPLWftSlbNSi/rfWqxzGYIHBfTo/JV5VDw1tquof1GRsLwCKoklqA
         jULCQoNKSqBSvukDhn6GniA2KRb3assYFWhOzWmO/3/tRuhccgqBJZFwMni52nOOFSw4
         +3CiHe2AZMLilw56+YF23P7pMWBcas7/5nQ3taHzWMEn8UDVZJ8mO/mDRwcaVKTu0BIX
         C7Spa/Bf3/lX+97zE3j7mB1LybkGwBSZNuW7pPLIP2RX98fVY/O6dwOJdYqEPeD73fOd
         pTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970375; x=1771575175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m0fJO7xstvRTrH/FfceNJ+hqYRj6fO5VmJRTZHauNnI=;
        b=PeFXczxHh5+oMp4pwqNAML+IEKd5BE8azO8suX16MT/UKHJVTjkx0BSEr5Vc2R4fzs
         5uKCY8Grs/6KHyUYhxltNdrAgaOrtQc0r9ZA1wAoFifPQxibYD074E9ktlNNYznknMmh
         QYBSJBixd4BQjGqtMYD2vttlN+rwh0qkFktx3qr+/tPAiwW/JKCU21ANODAcJHGAWzCb
         m4HS5tJxDD6m0ytqu4SnFixwm70/2LFxjcZkmt7vVPsAKMTUOYu7VtLZ2vlcFDBcg9Va
         2Iu3/N8m/qTv5pTg9RE0Rd01YirS0XQMWCLLyhrDPWnAZxB0Xpmme+60mHDdlVPolDOB
         Pyig==
X-Forwarded-Encrypted: i=1; AJvYcCU0FYGnZGHXPsK2cu0B3GDc6RL4A0sPlO2WhiZBiwNMlBy/k3emSM9CSfjMUA+JwHlGasYDFGU/FGiTWTc417P1lfDt@vger.kernel.org
X-Gm-Message-State: AOJu0YxVznUtMkxYNd5TAS5NJXIHMC/vb63PXgrkXTrvhfDRr+ausX/V
	lJxcAOUulftly8wk5yo+PaRsVJZaT/nni2IYsJttgRFr8LeC9wNtb4Nv
X-Gm-Gg: AZuq6aJ2vDo5p2V2MoD8MNJYz25mDFiNxOqDxnidmBGu9lq3iZKf543P4KeNOUNSNxg
	qeJscdqkP97n/wpbSqChvSJ2vmW/mPL0FVQFAypcT1BfD+PhYSRyEbKd4E5tFePxT0F72qfp/Lh
	W6NUfWLuhiIOpV82etNCVT301g24p+/1ElD4/J2T4XUN7SZu4RrKKR9HxiSZEfSh9paxVXpAxAP
	euIj9daI5C38RijReAxOOrENOOw9g4MFob6XShOQjTVuFsWMlf/HvKhai2blPMYGvtfMe5HidHP
	Mu4fEHKnX3hwHrKo70rzxB33CLLqivRujGS6fcio/pn4NcbaGM8xYjeJvtLzbXWYwT6H0nRUUzB
	lK3A9nsatqr0V0CKh6WkV1yQ8ORKkXCf3lWK1R1HCXk3kAKuUmYLWpwOl92MOk82HbeqgVCyLYw
	K32FRiWmnd0wPdleCwpLz5+PwGoisywiLzhclFqIvf/Jaa/Q2fVRHE+TktNbZNQFstKIVfUoQuR
	WU=
X-Received: by 2002:a05:693c:2c0b:b0:2ba:931e:7021 with SMTP id 5a478bee46e88-2babc554c70mr346771eec.34.1770970374589;
        Fri, 13 Feb 2026 00:12:54 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd0a04csm4975052eec.33.2026.02.13.00.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:12:53 -0800 (PST)
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
Subject: [PATCH 3/5] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Fri, 13 Feb 2026 08:02:55 +0000
Message-ID: <20260213081243.794288-4-derekjohn.clark@gmail.com>
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

Use an enum for all device Id's and CPU attribute feature ID's,
add missing CPU attributes.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../wmi/devices/lenovo-wmi-other.rst          |  10 ++
 drivers/platform/x86/lenovo/wmi-capdata.h     |   5 +-
 drivers/platform/x86/lenovo/wmi-other.c       | 108 +++++++++++++++++-
 3 files changed, 117 insertions(+), 6 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d4711567380..f4763ed66cc6d 100644
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
index 27202e2dc8a59..aa48f43cbb43b 100644
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
index f3f12303e3798..7713a096077dd 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -54,15 +54,22 @@
 
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
+	LWMI_FEATURE_ID_CPU_OC = 0x08,
+	LWMI_FEATURE_ID_CPU_IPL = 0x09,
+};
 
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
 #define LWMI_TYPE_ID_NONE 0x00
+#define LWMI_TYPE_ID_CROSSLOAD 0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -559,18 +566,78 @@ static struct tunable_attr_01 ppt_pl1_spl = {
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
+static struct tunable_attr_01 cpu_oc_stat = {
+	.device_id = LWMI_DEVICE_ID_CPU,
+	.feature_id = LWMI_FEATURE_ID_CPU_OC,
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
@@ -1011,15 +1078,46 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 
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
+LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
+			      "Set the CPU thermal load limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
+			      "Set the APU sustained power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
+			      "Set the CPU cross loading power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
+			      "Set the CPU sustained power limit exceed duration");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_oc_stat, "cpu_oc_stat",
+			      "Set the CPU overclocking status");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
+			      "Set the CPU instantaneous power limit");
+LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
+			      "Set the CPU cross loading instantaneous power limit");
+
 
 static struct capdata01_attr_group cd01_attr_groups[] = {
 	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
+	{ &ppt_pl1_spl_cl_attr_group, &ppt_pl1_spl_cl },
 	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
+	{ &ppt_pl2_sppt_cl_attr_group, &ppt_pl2_sppt_cl },
 	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
+	{ &ppt_pl3_fppt_cl_attr_group, &ppt_pl3_fppt_cl },
+	{ &cpu_temp_attr_group, &cpu_temp },
+	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
+	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
+	{ &ppt_pl1_tau_attr_group, &ppt_pl1_tau },
+	{ &cpu_oc_stat_attr_group, &cpu_oc_stat },
+	{ &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
+	{ &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
 	{},
 };
 
-- 
2.52.0


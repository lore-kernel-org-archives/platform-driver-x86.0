Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E2D38425C
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285041; cv=none; b=WqJ/sLGBUvORaloxHvwoA/Y8+HOSJ+DVYt9lO9s9XMEg4msPSHr5e7UolASTv5FPnP8Yw+4NruYL79heY14SQ4XHaz6kpUDuv+5mQO9fc3uhU9rB3RuwHgm17NHW7tRpc/gYQsZDTmn7Qw7WINwfVQIiKBMsa+IFBcHa0pb4iFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285041; c=relaxed/simple;
	bh=QR0zSE+nqF2iCz7QCMKUI0rGVSRB9ryVoP6ZBB68EMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNBKmeeQeCVXklSB/4F0NZ0EuzEAsmdg3mB7abGQKbVk1FzwElJa53uQKoSjhZw7/CczxTiFw2MTju0d9ppzbtpv25TSQbXSg8qTATy6W8REfWKmAjmtrt7ScnjGYR9Saka2qIZZlAD9klP1Srr3yKI9B201dT/1YJ5gKWLLOic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grJIscuL; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grJIscuL"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b6b0500e06so685387eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285039; x=1773889839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0nX4zSgIoFVhyYBOE8zOcxktKIEBCmk6esG3M7ceEY=;
        b=grJIscuLkH7OxNV1g47uqQm6sCLAZWWbZcSJoAURQk7F+t7MvCHwq8TbfGwb3+OjDB
         b9gTYnnQdfjIyHeJWnQZ9tAp0giqu5OVNUbThptsC5CGZugSVLSeHNeqnNKlGABd3p3m
         mKeBZHatVDpJxctnJMeeEigIEwXJ+kR8K1rtJBGfYT0sylvj1SkQ8IbJ0UEH1ZsQB+3l
         qA5FYV7XqhL0MiGTDeto9qFBdp7o4wH6lUho5aGH7rUvp1LKH9xv5SSp39SnSOyeBNjZ
         vO+V4CVgt4CsfWaRM8Twp0fqqCwkbfBZvSMiC0OcwUAE+RtzxHvm+JE6D7r0+e6NAnuJ
         YyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285039; x=1773889839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I0nX4zSgIoFVhyYBOE8zOcxktKIEBCmk6esG3M7ceEY=;
        b=Ir/2KOQvZGrdu/gwKnTa9dIS4q3Nq8Zjm7FOMxtqW4LWc/v1hb4dqqY90djJ2S2Nii
         lxR4Y6lmhkKKMhYIMEahsrFLgY+KQysR3VsI5vGPmyTbOv1AM9YhB9LG1t0G7B3FeOVb
         7P6xy0yBX8lscVsUJ4P75AB6O8syhpZCvBeG2CpVJCROsd8M8FVvrAc0Vjq6ZoOcEnMp
         ouYP9gXwWTATD2jJDNtW7/4/1wIk5Tqc0FYQTt83vQnaWR0e9YGNLfK4D7klu0woOsR4
         R+IKHZdXH+lHhXnLNUNjENVz3lze4nHkoYGYY5ujlgzTi2rQM16AYCJG1VNgvLWdp3Nb
         +jSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK35Xh7RsSonLX2TQkZAMYV0U1A1b9K7rYRYak1KiVggjZb1Ybc9OzFahDYpxppxtlD+J4SkMqtcghnEUL0rQ9IyYp@vger.kernel.org
X-Gm-Message-State: AOJu0YzW67Ty1Reu5cfcQ+NuE2im992ACgavnCjALRnhCDpvHRLyG/N3
	sSx0biv1/TjDSh6Eo2UNUz/ImQG2WlWehgEnSPXs4yMWZg3Q7n+eYHKr
X-Gm-Gg: ATEYQzw2O5ZTZ6wcYRwM+TzoNhMfFIs02i/gQqPOL6zb+iSf2Em6PIYxGwN1s5lbvRM
	EA4zBNa3E3lXR3QP5Vvt39U4JgpF0KK78/0siH2Gvm7SYeOiUNsdSk/dwn0xEjmsLEKK5NOGdsq
	S06+bDvb1PYm0Q9CcVLb2/O/SNn0/fx1Y6Y2yDYasgSlCINO2WFKeNQPG4so6sYwQWcPS8koDGR
	H/pneivBwI04drHsJGi06etMt3wDhOL4GuJutKDVmHXNbWfwl/S6Jpk/biJVluOQ914HfqUHnV3
	FNARLaew9PHN8nrtic4dQob58E0r+TIX5gzUtEgFpQ/DHNYpI9Yj2/gcrZhSZ8oQVRlDSIh2bVc
	F8vEwDF1x7IYme88tMpCxRVOdae0rUuob4F993NDDidBSU/J1FB7dE9Bw7KWralvu4GJrmU70Fj
	Qrb1A1WfooEsJZpBRpwz2bxq9ihOUG3vOmfrXqPLPIUDy4O911Yq2IVIX90RFQSNxBN71Oe7Umj
	TFH7NYgcHWim0g=
X-Received: by 2002:a05:693c:3016:b0:2ba:974c:4949 with SMTP id 5a478bee46e88-2be8a5804c7mr1945808eec.34.1773285038810;
        Wed, 11 Mar 2026 20:10:38 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:10:38 -0700 (PDT)
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
Subject: [PATCH v4 5/8] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Thu, 12 Mar 2026 03:10:29 +0000
Message-ID: <20260312031032.3467565-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use an enum for all device ID's and CPU attribute feature ID's,
add missing CPU attributes.

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
 drivers/platform/x86/lenovo/wmi-other.c       | 100 ++++++++++++++++--
 3 files changed, 107 insertions(+), 7 deletions(-)

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
index 8c1df3efcc55..0e61a873d5ff 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -17,7 +17,10 @@
 #define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
 #define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
 
-#define LWMI_DEVICE_ID_FAN	0x04
+enum lwmi_device_id {
+	LWMI_DEVICE_ID_CPU = 0x01,
+	LWMI_DEVICE_ID_FAN = 0x04,
+};
 
 struct component_match;
 struct device;
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 55a26e5617d4..11b5f71092fe 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -55,15 +55,21 @@
 
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
 
-#define LWMI_TYPE_ID_NONE 0x00
+#define LWMI_TYPE_ID_NONE	0x00
+#define LWMI_TYPE_ID_CROSSLOAD	0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -577,18 +583,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
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
@@ -1019,17 +1079,45 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
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


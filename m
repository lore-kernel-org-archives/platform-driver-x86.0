Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2688C367B8B
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 06:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257268; cv=none; b=dCQ4vUuGGI12Dcf97GkImi4jIcu7n6QxjlN646rsqpfwVGUUKL2E1w3nsChMkQJZEAwoP1ZI96tIhmQzXbijlaqNJra2PRUEBpjdXFqOlwj4prcNk76SW5FNbwSP1Pkd/I7loZGUnuV20OCot5N9lV9XJueQJOSsgXuhXzXCp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257268; c=relaxed/simple;
	bh=cvBWj2KS0C5CFGM8Pwuf+eDapN5TbgqVM/JSY1erLUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPoiGKcl8mKWjZRtzIIDJjDmLLZLVGzD16yrBZLeR3C1CZ1bUP6nB4Vx89VLDtgR/v3DuYPJ6sj7LkAa6yGRc71iw4M8ZarqwmlbacDb1gDzjtTRdHT1MaR50BoqI8HxCQxOaICjmOHWzRXSptUEXGcZuBP7FwtTV/GuWUjJ+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR1AW31r; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR1AW31r"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-135e88b8e55so2026816c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 23:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779257265; x=1779862065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RasGlteF+K33aN/SbpNWfGwT+9lCHJ5HMQsoJjlLjcs=;
        b=CR1AW31r2EDO1rhk10nL4uOjKOt8B2+PKHMk414HcUo9DbEdk6G23S4qfoTvN4EGXp
         5CxCzP6HjmU0AIioqyT85QX32aqJvoYWXVBuMwbUbIlefPhulYn3z83MUewTeanN42HU
         Fe1Do9bn8ktSD/x0M4gK0+OcNEEH42MHizOrc3JLGC8lph6qDKioYy8OKXCWScw7WI7Y
         Fok6zeZg+FNrEhg//PJvgGrRNh7TUbmxavg+g+XvbH5+HJ4Tfu047IcRpmp3aVsTZg4M
         I5yk1MZxGAaROT51phif95UGeaQie7kL5cZe+JOfT6F9y6vqg3xB8CavvYYKbHfbyRkl
         m2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779257265; x=1779862065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RasGlteF+K33aN/SbpNWfGwT+9lCHJ5HMQsoJjlLjcs=;
        b=auIO2bfIcg+mCZVPu3sS1zgFlvDaN/2QyFgHLs4Qte5YG2A2TdQS5k/PSv2IC1hxKA
         M2TVd6Nlb+morVeYVhV78vEcONn2Do0vpBzK2usfVyel6uLE5qsJCx1WuEtGk+vlzCPE
         QyjYOblYIRIc1M7kmO10iUTO8Qfl6+qQAJKqHvGzWlqy/VagmpnrVVVwZKc0fWX9yYWx
         cVbwqm8cTgsoEm5t16e8ZAPK3l3RxZdCwovMxYq73DN+5D3lPhAlohbsvpEte1eohQV4
         TwG6UqOrSyUBnGPygKQKDfG/DheFLTHIgYX3n2NDXyUd3bcq+fH4Rz07YIkqWpIMsqNY
         0QhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+j/rwaSe1iBk273DrCvVBAnz3xvubWeb1PSpUuw7zIxDaEkH3UeRLD3rdZDyCeUWSWS39vZhT1MOkZ+A81vuZOAUAM@vger.kernel.org
X-Gm-Message-State: AOJu0YxCjew2B8DOtHWLlCvnW6IcoqY7C/xMwpGynR8dCq8iFM9D1L0o
	/MSxOwZq/iV8Fy1mNKTNf4k27ZPPjfvMzrK1X3MPv+LeHdQlTcXOblwj
X-Gm-Gg: Acq92OG67Zu2mWoANnSNynPF4DLvmLFI1tc3WEL9Djyp21uebU+JY2CJrqDqaOlPk+M
	xMOi+qUu0QcU0LeEu2r9tjWeHGWrh+QYXxQa5S+FEAjMXfv5zbifctv9EpgeG8yriqOQ1k6yOD7
	iDsnRSsy/jLIHiD3tVdDeG/iiECJkQW3hT/kwjz7bk06OtRy+dKzhGy/IWEj8BsfK+yAhQ3V895
	WeyXDJVvAMg/RDL6GckdQ+ID/62haZFyV626FwYBVLznawynDiMtK0oRL4HTkZFV88YyIz0xPn4
	M01OQUwfcOAHrOXmHmgXGIZOWsf5H6q3mgbVCwPxMzqTpheDkkQLqvP3KgKXJC2yyrXcDMIPYag
	XweawnsdbqAZyspEOBeyLmYNfLKPuaHt+TP7yrQseIirb48ZF3L9+8cVz9uZhj9R/gL9VBLQfac
	orSjhIMdrNp2zigLsH2J2eosf4wrcXbLxTJmH08rqx2vJ+aIbpOMZyyncbFqhX99bcDiRTsS4px
	lRi
X-Received: by 2002:a05:7022:4187:b0:134:7497:2148 with SMTP id a92af1059eb24-1350552c4fbmr12226332c88.28.1779257265172;
        Tue, 19 May 2026 23:07:45 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm27906026c88.11.2026.05.19.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:07:44 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 1/7] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Wed, 20 May 2026 06:07:34 +0000
Message-ID: <20260520060740.119554-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520060740.119554-1-derekjohn.clark@gmail.com>
References: <20260520060740.119554-1-derekjohn.clark@gmail.com>
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
index 01d4711567380..189dd4d31926d 100644
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
index c3e760b8c3c3d..c74a0e5294e78 100644
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
index d318ba432fdcc..fe4cd7da017eb 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -51,14 +51,21 @@
 
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
 
@@ -566,18 +573,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
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
@@ -913,17 +974,45 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
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


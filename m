Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2AF2DC357
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387160; cv=none; b=jb+bvNM5/1lTRGZLyQg4rGOSObgQJmOKsvPvkyJplGwP9BC1q+Ockj8nZQ49MNw70CYKq2hwK5bR7Lmvg+TP129sgFEG1XGTv4W8DR+hbUQ2rXPMFeXE/bNolG8Oq0QvXrrLuaEcJUvnpFxLi3MziFP+bYpvZogZHXMAYed/5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387160; c=relaxed/simple;
	bh=0YJ2mGtXs7oR6Bdz5DJ0rUlnC2n4UGHIBGCDMZGzoHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3qw99QLBqy0IQoc6YImGxAHtoWzV29Mx80MHpmu7spNcUXb122sunXrjg2xUPV+NmneREu7Y2gml/a49OlxIqTN5PoJ128zCrE2bYXWZ2RErbU7pzhpcW1+4hkVsB1WLL7rBSln3Q1akLHE8Ox4cwe6c9chI5++AQqlnQQ+r9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bivi/iJ9; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bivi/iJ9"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c156c4a9efso4303269eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387158; x=1778991958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJ3472GP71sRhCd8CKP2V4Y6tZBdEnK/su5iObiDPXk=;
        b=Bivi/iJ90UL8VX8Q66h0mV1kBk1ttfoXgjjr9/w0hMhBB5NAsVFKM1wWK2LIVM9702
         zJaIYgVomENV7Yuvkm2tEENixMhaCxiO4e7m8oGNtGPZnxX4mRfWexS8wXSRA6ghIDoP
         TbAF8Qg8/zazTu0fdyLZkqMiOIcYa4P7K1tcTISynpntZqlU62UpAJnFFot/UILDN85F
         ws4wNkWvDZd9U5/Cip57VahMs7TqyDBVaQBv6l0v9g8wJX2Rm/DLhPP2OaKcl6dkZ8Ea
         dNmWxyca0zf7EKLB6qWsVetJkHga2J76+rMQYvliT/aPe7IwDHHUQckVuwFs6i0hhy8m
         eHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387158; x=1778991958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yJ3472GP71sRhCd8CKP2V4Y6tZBdEnK/su5iObiDPXk=;
        b=hyrJ7BPZ+16toIeDQumbGfIK8wVcJQu9jVPJdE9dPKKiTX3iTRmFwlYlVAlWohOqD/
         HNCxCvan7jOIlbW9oJPqeh1U8PzRKXn8TNRKCrHSwEQA3oEaGj6RQ8G0W2XL2PGc5IXg
         IKDeZI+n7OQb6ox8K4qSrA3B8XKOakBIeix6mX0O8Xp4EG3/nWwl15EDMLiiPZZM2TIn
         yA41Juc1oY8KIbAEuaLAfnyh132r7BRS1HxNypauYvEQ7NGwuTQKnyftG/pmZxg+R8G0
         cRy3Mpn/Ia1P9uohi4zWl7cUV6PoBih+08LPrbwQmOojONJXOJZz1FzJl2FONueU0fPF
         RUdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iA56TELbJ4vHMEQ/8rtPqC3kbWSXxg8GZpvZjVxBCz3NOA3ysi/RpNCU5GRjoMdYAfC4+hqAXW9SkL/92sN9SziIm@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWXeUQ24O8OKgr+7zSXdHQrM84RY4oLv34vXTJistrryk7EiP
	ykPRPaZzvaDNcZnTxoBdwr3IJVuFpbWySwMdIAJGU/Vb81Sp52fiNQeB
X-Gm-Gg: Acq92OH/5mUka6tZIAYPKuo3voN8F7spgGUnstTJepAIw4iM/r+7UnOqeq1Oipd1GTc
	j0ySFgpPQJsKSxuM8xbf+XcS80ihdBJKjTw7DAwSGX0spAw15hHRE47GZijEV2Zq1UgFA++OOyx
	HM1iXOYGoQTHOpuODBW4aSxuLuTjs48MQ741lxFn+75sVK0Hjf7aFTiTj2mQQzEFlDn1WEkygza
	g+NJJMsNYDyGKxFInrWvh40QytJTPA97jzIh+YM+zW3KxZoLHANAgKgXPvShEWTMXfKH9uzBIIQ
	Vt46TVFetU7ut4z+aKMwnP0+JPvzGKygDjygYIRZMgRXnQj72Vi3C2HLzL/8RFJsOraqV57M6IG
	rSDkp7e8Jzh7oNHdw0nz9mcSYfrh2dY17ik77Ot+AQmw0KRqLUMvA7JfCaTRGQCAVmbOodfqf9c
	qsjcgkEVG57002DfF8W4c7X7tHsIfXP5D90vY9Wzxy8yaaVMgui+WmkVrJmD0/hrJhqhw709j3X
	Ew5
X-Received: by 2002:a05:7301:5784:b0:2f3:dbfa:1955 with SMTP id 5a478bee46e88-2f550f44b83mr8817978eec.34.1778387157853;
        Sat, 09 May 2026 21:25:57 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:57 -0700 (PDT)
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
Subject: [PATCH v12 10/16] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Sun, 10 May 2026 04:25:40 +0000
Message-ID: <20260510042546.436874-11-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
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
index c3e760b8c3c3..c74a0e5294e7 100644
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
index e6834dec2381..5f7d7d353e90 100644
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
 
@@ -564,18 +571,72 @@ static struct tunable_attr_01 ppt_pl1_spl = {
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
@@ -911,17 +972,45 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
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


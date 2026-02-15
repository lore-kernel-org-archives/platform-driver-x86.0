Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD3256C8B
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136027; cv=none; b=CPWcIE6UNzD6UGt9GjNQ2Miaon+m6yPTlJgnJtpnUwHDbmewhWq/fiYrzDOxcDkH3hupo9QeSbaq1+M3xu43c3YixEcq4YdTVl4c9Ry+rWNqbAW3BBipEc3HH7ExIzjEF7F6yz35LLe8v/nBL5J7Z0Z5SGC3kqPPXKtGQz1/M9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136027; c=relaxed/simple;
	bh=Fs9nxSRdEPbCXJkY5NgWQzwyUWedOyG0rkTeTAWne30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBvQStlSyfCPntO0W/85Yr6xMftNUUuhBCfhLcstmX60Lrba1qiRyS+/ABe8Sb/wMasIfIPLfuCollo7RP6MpZ9DtSxI+NkIoNBTmpK+QDOf9l7fSTY0ayC0jmqlrTQLoLwPaw32X5nw4hItd2wnJgJZuynAOOCJ3cY0PBxk/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFKhCrsj; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFKhCrsj"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2013867eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771136025; x=1771740825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIOlLeyNVXkY5g8zLRZOl2wzw7gNTmnCcL1rHtdQR0k=;
        b=kFKhCrsjQA4BTsxtTU8UrEccZ4kIc6RGh0Pa+6oVlU7mHDYMX9YsczRuiI3hQRU5IV
         ZSBJVVn/V93zVNWsbdjId2xfVjETeW7niYLNiVpjp1mSG9LisencHcTs5G+uhd/2FYIy
         pOb0bTpvRrPa1x8danI3qz/RG9gDKdiix42RAm2LjUQXuXwkpBWPO4uInpMnck2vWczD
         36lzGmnhKXKy0OzhcTtF+BodEPi43RlDvh3jxcVlW+IepMDuuvR7ZY6DoY3nPSDSgrBS
         zUzSBid43ckIQFg3P9l3Lvm/TqiF5+3Wz10ZUpCM1TI6lWAHIX14BTsZxUCCKdEqmg1X
         E0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771136025; x=1771740825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIOlLeyNVXkY5g8zLRZOl2wzw7gNTmnCcL1rHtdQR0k=;
        b=q0I+VD/Aq//9VZ+ZqOryGCNak9FWqBfYDbZJaHeFC1uFOt6LgAi4GVGa9mPcQND5Sc
         lLVEnJRDwZKNV+HLzTvwnvY+ZhNe1MlhsC8/FCLWKSGJAXDAFO74wC6BHysQ+T/ouyaN
         cOFdEyiAhs59g7Mh64fyR6GVbmIZaYDJZJFjuYTg0hRlt4CS3yVDFsDJpOeeVzQVbsxF
         0o1JAeQAAWF9sOieDrc8PNr5HqB7RC9ljo7F0FewoXJzNkRu9pF5srktjUf7wfuatUCs
         ZFQZamgdM5xclOpAvHzm4myQWiUCsE5p1tTXgmcYewONzKdyB0v7qmSqjXP7fTTf/03L
         fXQA==
X-Forwarded-Encrypted: i=1; AJvYcCXTuOGC3cnPNkIV/IXB5VGc9NuY5yM0wYAKWGCcop0vxokzpfxmnr7J+iFP1WIC0PkP5JPxg4GMG6c4BOuIitrbnjqK@vger.kernel.org
X-Gm-Message-State: AOJu0YxMzReSDZp4N5fw42AB6yL45+fo0k0ew9v9kVXSnlZpo/9w2Kbg
	R8kYi2d0MlsWsZpXRh4JhfFWdPzharnKo7tOs7g/r9p29yqhnjrDG3jt
X-Gm-Gg: AZuq6aJfOKKKj4//1udcTt0eQBOF94hXnDXLeIPzMg/ziVjbP5ij01+w8Yk6MciJIPM
	RaqghlEwig0GAG7JtXFkm7iBQbs4kq4sOkrNBUVQgHT+spmC2W4cI79jW4/bitWgcFFGXzHV6an
	4Z/bh3yLjBTiNEkHXuNrKkSrHzyWGftztTkp/N682K8LXC4XjJBIHnH7rwl0zbi97lkzSyeaU6A
	usWOC4yZp0F4GZU+wt1DjEVaA3qRFQiUX2MgcZzoIYDcWBw10TDixz2lHG8HnAhV0Mxe1z4mUk9
	G5sfiPKwbkZbHaFfvN2Xj32cU+POwmeJ68yFvybZqH41gJubILNtSLLb5kWHibk1Uw7ec8D+Cql
	LyaIRmoV9800bCGNt7Qh1Qk1AHU5XqHZN/CIl33Vsd46OlGddffumWMzgiMybg9AW0ZYWba7ObY
	3O8EyYjO6Hu9wlZxaf1VtfJwMqddCTt1be9Wm3HmMDmWs+T9lgsnZIMyEawgQRGwpY6BtLhGZw8
	2E=
X-Received: by 2002:a05:7301:129b:b0:2b0:2e5:228b with SMTP id 5a478bee46e88-2babc57f80emr1919711eec.33.1771136024957;
        Sat, 14 Feb 2026 22:13:44 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm4759245eec.12.2026.02.14.22.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 22:13:44 -0800 (PST)
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
Subject: [PATCH v2 3/6] platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
Date: Sun, 15 Feb 2026 06:12:56 +0000
Message-ID: <20260215061339.2842486-4-derekjohn.clark@gmail.com>
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
index f3f12303e3798..2986993cbb6a7 100644
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
@@ -1009,17 +1076,48 @@ static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_oc_stat, "cpu_oc_stat",
+			      "Set the CPU overclocking status");
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
+	{ &cpu_oc_stat_attr_group, &cpu_oc_stat },
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


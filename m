Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6A3859C8
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028295; cv=none; b=caMtUFCRrht8yqk0HRzcLnvKU7GJjVhFXP8povjwAhb3nctlL27biK1clUr5wElfgdbClAlQ3LQT/sfEFhwsMjJ35dD5Mvu0kSoky6BzVOBaIYg7dKCHsjcWv7rwn6j6tCaVhPPbgGG00O5B/aMS+oKdFZ83X4BomSI3pVYCQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028295; c=relaxed/simple;
	bh=hBvOCtcEf6O/R0Qukc6K4ExfMtKu1/qZASDraDrt6Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8DwemTGJe11dLMMdC6VpqQkgKes88ktrBiEYFQU7KwGLt5brwSInJDTenVxiZ2YfmTQKUHK2YRoctXNYeftI1SVL3BZuWncTf6KK8lZ7xbqjp4e4Ry1OKXOumdnP8Vdyibu3/1CsLc3m+l6cM7UiD6HA2RzWL37WKCH0ptMB/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+PoTTRo; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+PoTTRo"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c20010f10so9702934c88.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028292; x=1776633092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RewIYazFMekxO+8QCuKETQhRJ6L0CCqfWKaHlVYynz8=;
        b=p+PoTTRoNgM05BkVTistkeyRFxKMZ2h87RI1V0TJPvx/Ay+UeGWLcatAr+fB7/x2i9
         l6Ic8Iu0wEsaesR9x+LN+xrH5d+/Wn7AbfeXOHRXgkBidmujTVfMq5WOAKPl3JEJL80S
         wXozRD+fm55Fm4tE8BI7XCNi2ZVuqoA7VGAA0hnGlEeb7+t96qXKFDMA4zFDgdEhaP7J
         tT86VoCMxz9dz6fSyHoCByqsEOUg02hMrOY6zTOKIDd5ZiFhB2sXEWtCj+6YKQkSV60+
         AtCqv74IEboqC80/7yNMtGHpEKDQWy7l+a8NSoiPONAqONFrxwm3MeRowsvNndrHONbf
         HEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028292; x=1776633092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RewIYazFMekxO+8QCuKETQhRJ6L0CCqfWKaHlVYynz8=;
        b=GXruJHRAvxTPp19JHONWm/OcYhmMngund0h9zyNA9I28VTmW9MHyi4YbmdlnVQl/2/
         LJqdHV6JqLY6wz6siMNV37kHHHhBOsRPNHrY5+1EpoxZX0n2PujHezDRLmjT1cCrVntg
         n0PsUYqHQixoT1Z+IFm7fHrGOQcuvqECftY4EMLTYoPAJ14hWURFfAid8pqVkONHZ0e3
         vGtq4/TkDKFH9SuN36MTnpW9IfhuvAvjxqf+0M7/p4QRMk3TCFRThIG+ni5RIn50sdR/
         QHNdO/vAYY0AzWP5c9QNtbTObhPtO46hkNiBt1R+pfFlnasKc6N1HhUN0s/m3/1w4y5a
         xFZg==
X-Forwarded-Encrypted: i=1; AJvYcCVYpqRWg1EyDK+IFkhSSwKbgjK78vaUUitL9pQoP0SEzgHNxwDiC5Otx+bhxNnA258Vio3PE/pFMCuSdYYKD8WO8Zj/@vger.kernel.org
X-Gm-Message-State: AOJu0YwMuJGBWXMVv9CqMV6sfi9TZVTpZVN7hBDov0aPIcNTxXyXcq7W
	4Jbqh+bGhaxNltg8IM4ZK9KU4WprAGBtaqwMjklWQUUVmDFO9M0bpZEX
X-Gm-Gg: AeBDiesi9hmsmgaKxU/V1rZBZ4cM1Flrvzviud5vk7fOdC/zfj3auImqekcZSnaumHO
	0Tyf7HORb3YWfUZJ42RB7VhPDfEPRiR4RIMLoG0RO11FiWa/2TyAejkOdt2ibmxLajOZHBaw7WH
	fbTP0pf6fU5BvUW3mLIl8x1viQR4xe6Nhl/VYKmVi9nbCGzlFXURjPjhztNxUM2Df7VYeQW5Z0q
	XJ7L/c5A6PZOTKQPwWLZMdVdJzw6fxZjA38xOcDc5glAFDO9fVksNCdjoluxdf9riUOsCseRK/L
	pqAKlDgy959O6PMywv+u78qu7gRf7kSAZa6q3nP37yRKRWatLPS3K9X350g8n5Ko6Fw+jdmZTCh
	yzPm3wKKLgDq1MYa/O+HszQUVmTCsUFpfQtg64utnbxAl7kFPAi2QEicjrzI9lqHeWckYndSvrh
	JfCIN74owiGtDpSuM9m4Z7Di5uIlJKVi/riaL6wZCOz8hnAjYdaGv+/gsyFPoH9xiTp42SENDD8
	aXj
X-Received: by 2002:a05:7022:6890:b0:11b:f056:a1b3 with SMTP id a92af1059eb24-12c34e7fe53mr6061725c88.11.1776028291972;
        Sun, 12 Apr 2026 14:11:31 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.31
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
Subject: [PATCH v10 12/16] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Sun, 12 Apr 2026 14:11:17 -0700
Message-ID: <20260412211121.2220556-13-derekjohn.clark@gmail.com>
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

Use an enum for all GPU attribute feature ID's and add GPU attributes.

Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v9:
  - Rename gpu_didvid -> dgpu_didvid in documentation to match actual
    attribute name.
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
index 189dd4d31926..011054d64eac 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -69,6 +69,16 @@ Each attribute has the following properties:
 
 The following firmware-attributes are implemented:
  - cpu_temp: CPU Thermal Load Limit
+ - dgpu_boost_clk: Dedicated GPU Boost Clock
+ - dgpu_didvid: Dedicated GPU Device Identifier and Vendor Identifier
+ - dgpu_enable: Dedicated GPU Enabled Status
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
index adf4300415f8..47554a20d36b 100644
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
+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "dgpu_didvid",
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


Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071C539EF11
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506456; cv=none; b=svC+tzd95LmR4x0yhtwdoABIwEN6eQJQ3CViZ8BHJ0v/y/zuPtJOZnM3Y7nWoXhe7Sug8GF+MlC6mwXYAt9r7Y9527DRUu2tEpU/a2J1gIS5TJADcmpdflKAoHTrz4XHc/twOhnOp+nnKEefkjOL6UAzIltx8BFKL6qkWhgYQUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506456; c=relaxed/simple;
	bh=AGNSJWHk6rHEufhSyPVS7Lzb46s2YrzKEXfMsYOAge4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgVAgml28m7sYEGTq843z3weyxayWx+LX4GL0lqvNnmlVDkbIEUBfMVUwQTwIWwdB7p9A4P6iOoT1PM1My/os4xS+rYZwzZpX3Qs2leWigsl7f6obUDXpCtz2tbm7mi7ppp3ez7ejrD9tAHzlXVJfWLFkiqjCuD/3VFJj+FghVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfo9jQCa; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfo9jQCa"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12bfa7fe691so1578842c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506451; x=1776111251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4teSSDSZxadJncjuE0P+g4FnFzukItSRNmCV2eTIxU=;
        b=kfo9jQCax0Qnm+8gFSAnfETVIn9L4G2uRUAUHGHm++XNoiOo+Z1ZHS6NcN0z4HXjiz
         uCIcWGzagQIu6QqElMECkmbNc/zc8ehYKP/7RNDw336ZfetD2lkBmgXOGMkOVQeQyahR
         NL8Gr6DVZIvLuRu4kNFk2jCqmAr4Wno8CHw5fL8jX8Mw5i/ZBBkxreflcqgou/r2+Oid
         wbbH5VRR2hJwdMOdhTPhHOJXW/aww7PrvEBAE2LGF3pU1r0gasY0AJqyl/R9Uj4AFz9v
         m86HC3HN6+ITPNGndLrwnihoZuIvOmwvwTCW5hw7BLTRD+mJiVjcJqmPi90mYG0CtyCI
         lH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506451; x=1776111251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c4teSSDSZxadJncjuE0P+g4FnFzukItSRNmCV2eTIxU=;
        b=OjP/Lj+Y0YW4meSdKtCCwDDCRsGjiahm1C3MmQKxuDzim5g2+B6wkB6EgQIk7utxix
         5fo/Y4t9U+MN6GFg6xcndfHgkjGzm+uZXnkxBlJAmYQ+CYoKInKBvdUM6FTqg7aIegU0
         593mNKUmhpkcRpPB8iCV3tDZi4AO8/yRhN5MsfcESZc0668jUG0Cg8IIUw/YDghYosQ2
         ue3BqeYMAFZtoHTbkmBhLwGCMhbb8Cj+Gub0K3VtYBkNsUlLgdEjGW36Yj98GISHxJEe
         d8olcomhMT22Po1C6/W9thM7a+ZpA4vb9EvXBCbmza54VcDbmKS+SC1TOe3YHowEfIrF
         Szpw==
X-Forwarded-Encrypted: i=1; AJvYcCWYg8/16P1lrDczTwkTDYO0kJy3N874ZqBYrs6X3AGFqpEBgu8T+1Y5MKQGqhHiYgQTPLXwvGRy4LCakIK+DdLWuplN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3O6qgeA+5XMmadWXQ3Jgd7SEK9ofyhr6mtunCz+IQf8bE0aSd
	parEW4JZyqoQVlUMCDmeyxVz4FHyX+NtxF/hHKruNJBUQOo0ozv0O981
X-Gm-Gg: AeBDievoVonvVvTTvzVbN8yMtrtNevVzrKRTJQeDYp2ZKTO9K3MGCTASD5bP8lTAvgw
	DxKUnrZ+fm8Oql2QY9KbFkEf8hBEC50kp1uaXC3xIhTktf1RAGiHGfDcZZu7ctW+PNQ6v9bNHON
	tDr++Kg1hAh4V6+Fq+UYo5HxAjAP833/wNu4qXcYAZGwCGiEzE9MUFAeZyRAV/T9y0NmUfwmerr
	bx9Oll9xaEZN32JotIPADBMJQ3fmiEZV+cJllN96cvOLUrHfdTT/rqfZh4YmOUYQGQX5h+k3o6E
	seCN23w7oTuTavrJIT/N+S1QhUXeQx0G0Vz0gdh5MGrqC1kCZSX8Yvwl94kNRI2tkqfyfP/HC8G
	DY7k/XvcqcpBQOLYv1qTQdWSbowHdeXI90Dn8TYjpAE+Bp5JPIky7+T2kMPh3A7oMMtzk6jlxei
	Sab1datBYFsV0D2DvxJqYfRYH7d7YuOg/wgq94b54p7U/Yw4jlLN+1Nq86NULov5AdTVSvkXcYO
	kx+
X-Received: by 2002:a05:7022:6097:b0:119:e56b:c75c with SMTP id a92af1059eb24-12bfb76a3dbmr7031113c88.33.1775506451527;
        Mon, 06 Apr 2026 13:14:11 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:11 -0700 (PDT)
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
Subject: [PATCH v8 12/16] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
Date: Mon,  6 Apr 2026 20:13:56 +0000
Message-ID: <20260406201400.438221-13-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
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
index 189dd4d31926..988ae04ff724 100644
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
index 56c8b84f306d..57b6b6f17f33 100644
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


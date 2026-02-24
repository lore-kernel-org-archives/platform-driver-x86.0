Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5B42356BE
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771910952; cv=none; b=R9SLuN0GiTSp/IFSdJQOIQ2CG7N9USKidKrFb01OJpSpgLccIXM5sg7PhbrhaABAecrLO/McpclHaCBxwN08lki0aNL3OYa63L4x1vXtdAHDUKaPZY+e+pEAF8WjjodaCofALNVy0rUvPE/OjwGOsH3HmSQG2Oo8oS5eoqmHNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771910952; c=relaxed/simple;
	bh=ZPzbL6OigHP2FtY4Vmwx8iRCZ2HHrPzRv4eo0lE0vL0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qkrJV0ThGfdEuoqLC6j80mKKIwfGOTCCRbJ/4ZqR1w4kDFNzblwnPTwj7cbvApovpc5IYtORFD+wUXO+St6m3CMbGveEW5U6eX3sip83PJI497kPwBs9pup+XPnVgVGP/GR/H+6w1ZELhvLwgqp4WEmc1XdS0b7Y5xcI8Uy9Tuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyFA+fBh; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyFA+fBh"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso5102018eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 21:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771910950; x=1772515750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mZEchtNVjuRATqjtl+Wbd2xxGRNm9flPdO2/cfrPLzQ=;
        b=HyFA+fBhTpgPtZPxyZojOHpcIOI4Yqsec3rqg7NlplCiqbLzJV2scy7EgaePSHOPgt
         gT8ZRauZofU+AghWStFlnz0Bq9O/G3bR6egcD+76J/go+/kmojlYbZNSlXvf0rlKl2dQ
         Irjox1vx7uiqgWhb4rhVSy7oqws+/dOXok/WKvuHVzqzqTJOcaiJqFkQb1RI/kQ5VgAd
         oT4SkqylzGuRmnYb4s2ip+52X8YGLcli4oTxauIHkouPsIZ3rYH4/bNWLcCO2ODw3xDg
         tqZos94GLEZIxJHtXBZ02vmpxW6UotIEFBW3a8zmnS8mKODiSa2gU7WfG9vrwUlsZreH
         +uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771910950; x=1772515750;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZEchtNVjuRATqjtl+Wbd2xxGRNm9flPdO2/cfrPLzQ=;
        b=b232iS4rBf++/Ae519ohk8n9FcmTQ1CCw8D3biSFU3vVoNQLU6xUJxXENkMXHaPTrX
         VhNagM+EbDKadS3i3GK1ytCLF4tbDCTOWVnQa98cWkn8fl1cYIedT8eZnPjq/RjG1L8Q
         CqQB4pp5uuU/sZ6Ca8nW4K2L3+/Kh5KhFdvLeGmE5yeTvgxrwQKyHiUxGhr8gx3efSi7
         tVuk21uQuhdl66pclshxPh26hNll2meCsySkM0sHTGxmclWVzRenGvJxmaZ+5gz4NN1h
         HTXRj9IJ3ueeWgEVjESOj4JmpDvT48aARcuXHJ4ssUR34yAoXgce2/Sk+M41x5aM6sQg
         /MxA==
X-Forwarded-Encrypted: i=1; AJvYcCVMwUF4lBn5U2lewWL8zUXe/V2LEh9j+TxEs5qByacKlsg7VSEUcfaC2xjCPR7kaWWivOoJDPCTk4j4n6IdG+AyGPhD@vger.kernel.org
X-Gm-Message-State: AOJu0YwGlVaQKm4NNyL2mmZuwZQ781laGKcfnABdTuMajCkfrfrHX/p0
	NC64+sNOgBTMkKp/fTyyA/eI2H1px5xj+YMpzfW1ucI2skPr+KHdzDb/
X-Gm-Gg: ATEYQzx8Mu4ntN8Y6kJek+nL9jQaGcUlH+QxV/CZ8j9MI4HBeZHpDrhRxonZbjoBtmb
	laoeMSm2/5NtUN9ewEzKxMx6Mx5k2ClqOlX+4vZv6cbs9CIFt0sEsIsYKofK7lE8SZUrqT6eaq/
	WFIjrVCEkE44pf3kL2gQjhZrMTxC/wRaQKkqkz9wmRlgjQvO+RPMs/634btOD0uyspZP/l9roV2
	pubG0eXLSjsJ9CEJZm3yLFlmaT3peuZ9lvAGDXsXl3HSsbKW/GlbEhVuJD5SLlEaQCvtZ3/GKM3
	SFOU80807FVB2NXcRYtXHHrKdHSQMdDDoVVWHdnx9XWakjHQAibkiSjxleJrJWqsoA23RcXbDtp
	zA8jAjuO5u9sXh9pDYpLSzjjpLe8KQffkKqm5Ml8Jk46r7OrDtj7zzPkNo9gq/aU9PY/JPwF2dA
	mMBx7sMKAppdOnV10B4XWZPP8g1CnU3nPHfPGDTPF0EgSvyL3JKwQzeUQ+VdgjRUE0p2ByPPfrj
	WT/CnonuZDvbzhwLGhovLkda8DSkAOX
X-Received: by 2002:a05:693c:4097:b0:2bd:aa84:cd10 with SMTP id 5a478bee46e88-2bdaa84d31fmr418588eec.38.1771910949869;
        Mon, 23 Feb 2026 21:29:09 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82desm6575876eec.20.2026.02.23.21.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 21:29:09 -0800 (PST)
Date: Mon, 23 Feb 2026 21:29:10 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Rong Zhang <i@rong.moe>,
 Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_4/6=5D_platform/x86=3A_lenov?=
 =?US-ASCII?Q?o-wmi-other=3A_Add_GPU_tunable_attributes?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260224043200.2680384-5-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com> <20260224043200.2680384-5-derekjohn.clark@gmail.com>
Message-ID: <C24F8880-0475-4DD9-A680-66AF57DE1668@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 23, 2026 8:31:58 PM PST, "Derek J=2E Clark" <derekjohn=2Eclark@=
gmail=2Ecom> wrote:
>Use an enum for all GPU attribute feature ID's and add GPU attributes=2E
>
>Reviewed-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>---
> =2E=2E=2E/wmi/devices/lenovo-wmi-other=2Erst          |  11 ++
> drivers/platform/x86/lenovo/wmi-capdata=2Eh     |   1 +
> drivers/platform/x86/lenovo/wmi-other=2Ec       | 105 ++++++++++++++++++
> 3 files changed, 117 insertions(+)
>
>diff --git a/Documentation/wmi/devices/lenovo-wmi-other=2Erst b/Documenta=
tion/wmi/devices/lenovo-wmi-other=2Erst
>index f4763ed66cc6=2E=2Ef7564b23bb7f 100644
>--- a/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>+++ b/Documentation/wmi/devices/lenovo-wmi-other=2Erst
>@@ -70,6 +70,17 @@ Each attribute has the following properties:
> The following firmware-attributes are implemented:
>  - cpu_oc_stat: CPU Overlocking Status

I forgot to remove CPU OC status from the documentation, reminding myself =
for v4=2E

>  - cpu_temp: CPU Thermal Load Limit
>+ - dgpu_boost_clk: Dedicated GPU Boost Clock
>+ - dgpu_enable: Dedicated GPU Enabled Status
>+ - gpu_didvid: GPU Device Identifier and Vendor Identifier
>+ - gpu_mode: GPU Mode by Power Limit
>+ - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline Offse=
t
>+ - gpu_nv_bpl: Nvidia GPU Base Power Limit
>+ - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
>+ - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
>+ - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
>+ - gpu_oc_stat: GPU Overclocking Status

Same for GPU OC Status=20

- Derek
>+ - gpu_temp: GPU Thermal Load Limit
>  - ppt_cpu_cl: CPU Cross Loading Power Limit
>  - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>  - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/platfo=
rm/x86/lenovo/wmi-capdata=2Eh
>index aa48f43cbb43=2E=2Eb7f9ee7b301a 100644
>--- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>+++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>@@ -25,6 +25,7 @@
>=20
> enum lwmi_device_id {
> 	LWMI_DEVICE_ID_CPU =3D 0x01,
>+	LWMI_DEVICE_ID_GPU =3D 0x02,
> 	LWMI_DEVICE_ID_FAN =3D 0x04,
> };
>=20
>diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec b/drivers/platform=
/x86/lenovo/wmi-other=2Ec
>index 87aba244da84=2E=2E67768f6a50e0 100644
>--- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>@@ -65,6 +65,19 @@ enum lwmi_feature_id_cpu {
> 	LWMI_FEATURE_ID_CPU_IPL =3D 0x09,
> };
>=20
>+enum lwmi_feature_id_gpu {
>+	LWMI_FEATURE_ID_GPU_NV_PPAB =3D 0x01,
>+	LWMI_FEATURE_ID_GPU_NV_CTGP =3D 0x02,
>+	LWMI_FEATURE_ID_GPU_TEMP =3D 0x03,
>+	LWMI_FEATURE_ID_GPU_AC_OFFSET =3D 0x04,
>+	LWMI_FEATURE_ID_DGPU_BOOST_CLK =3D 0x06,
>+	LWMI_FEATURE_ID_DGPU_EN =3D 0x07,
>+	LWMI_FEATURE_ID_GPU_MODE =3D 0x08,
>+	LWMI_FEATURE_ID_DGPU_DIDVID =3D 0x09,
>+	LWMI_FEATURE_ID_GPU_NV_BPL =3D 0x0a,
>+	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D 0x0b,
>+};
>+
> #define LWMI_FEATURE_ID_FAN_RPM 0x03
>=20
> #define LWMI_TYPE_ID_NONE 0x00
>@@ -631,6 +644,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl =3D {
> 	=2Etype_id =3D LWMI_TYPE_ID_CROSSLOAD,
> };
>=20
>+static struct tunable_attr_01 gpu_nv_ppab =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_PPAB,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 gpu_nv_ctgp =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_CTGP,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 gpu_temp =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_TEMP,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 gpu_nv_ac_offset =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_AC_OFFSET,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 dgpu_boost_clk =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_DGPU_BOOST_CLK,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 dgpu_enable =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_DGPU_EN,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 gpu_mode =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_MODE,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 dgpu_didvid =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_DGPU_DIDVID,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 gpu_nv_bpl =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_BPL,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
>+static struct tunable_attr_01 gpu_nv_cpu_boost =3D {
>+	=2Edevice_id =3D LWMI_DEVICE_ID_GPU,
>+	=2Efeature_id =3D LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
>+	=2Etype_id =3D LWMI_TYPE_ID_NONE,
>+};
>+
> struct capdata01_attr_group {
> 	const struct attribute_group *attr_group;
> 	struct tunable_attr_01 *tunable_attr;
>@@ -1069,6 +1142,7 @@ static int lwmi_attr_01_is_supported(struct tunable=
_attr_01 *tunable_attr)
> 		=2Ename =3D _fsname, =2Eattrs =3D _attrname##_attrs               \
> 	}
>=20
>+/* CPU tunable attributes */
> LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
> 			      "Set the CPU thermal load limit");
> LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
>@@ -1094,9 +1168,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl=
4_ipl",
> LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
> 			      "Set the CPU cross loading instantaneous power limit");
>=20
>+/* GPU tunable attributes */
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "gpu_boost_clk",
>+			      "Set the dedicated GPU boost clock");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
>+			      "Get the GPU device identifier and vendor identifier");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
>+			      "Set the dedicated Nvidia GPU enabled status");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
>+			      "Set the GPU mode by power limit");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
>+			      "Set the Nvidia GPU AC total processing power baseline offset")=
;
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
>+			      "Set the Nvidia GPU base power limit");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
>+			      "Set the Nvidia GPU to CPU dynamic boost limit");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
>+			      "Set the GPU configurable total graphics power");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
>+			      "Set the Nvidia GPU power performance aware boost limit");
>+LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
>+			      "Set the GPU thermal load limit");
>=20
> static struct capdata01_attr_group cd01_attr_groups[] =3D {
> 	{ &cpu_temp_attr_group, &cpu_temp },
>+	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
>+	{ &dgpu_didvid_attr_group, &dgpu_didvid },
>+	{ &dgpu_enable_attr_group, &dgpu_enable },
>+	{ &gpu_mode_attr_group, &gpu_mode },
>+	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
>+	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
>+	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
>+	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
>+	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
>+	{ &gpu_temp_attr_group, &gpu_temp },
> 	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
> 	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
> 	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },


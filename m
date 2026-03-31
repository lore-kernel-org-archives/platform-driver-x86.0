Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA03EF0CD
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 22:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774996174; cv=none; b=sdcuEPWf6PCS2kMRwETGIZAo52bZQcgpjb3mLPVdtgjZ8VRMU20kM67DUfyz+HbD2o22jbYTDyoMeb0iVpVvcuUCD82/PRHVBwz0iLm73EyOpUgy7qRRD80yqh2AaXyyUOAEdBn6NcLb0iFxnWGbPnoO0Q6eMjKUPyKJf9eMTHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774996174; c=relaxed/simple;
	bh=dR8RPVvSb/kuKrCCFijtNoAmvrCpVSpYr5Td5BP1e24=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iBYudLSYN9QzA5Ix9vXURs0UTH9dHm1C505sf49ZVZyh8Y8Kw68PMFbc1M4uksjV4aTi8vtqobmeCVLzZye+llbhpdiI8UhFHOb3X3tNwwSNaBKqoVq0DbledOAkFQdeh7kNZaKdeWd30Wq1CR1sQzr5n2FqcMtKpx7w5TrIz8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRzZBBHK; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRzZBBHK"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79ea87af213so3430987b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774996172; x=1775600972; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXdLjh9f9uZdLu5sPpA2B9RziaLkCIrwTWltVeyUsrc=;
        b=JRzZBBHKyS/hqTq+Dxg3z/YrpnQlJvCuhwvX5t6kDQRdk22MTo+lliQAqyQvQnBFw8
         uUR5pmbLscu8AkWfMl+zXdWUS5bezjRLrQvEbk1lB1KdxwRPlu17UtxEc+QB74NOblKm
         tWE4+SmA3GOvhMcxn0CjFBSm55RbDfSWIPb7v17wfdESlIXx0klO2A3piAVg6Xx4astP
         uXPXJRUSY07WqcPfsohA+1b9bZJKeD2WXWIGuyjfP4psN9uDpILUhGMemhuIYQ5dFQXy
         s0lRZ4TRK9ZU4as9xzKp3VuHJSYyul/hjp93i2IDlluVj0lESnOes1ZJtf1L/3k7gggZ
         zyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774996172; x=1775600972;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bXdLjh9f9uZdLu5sPpA2B9RziaLkCIrwTWltVeyUsrc=;
        b=JoCjZI3hALhrVbe0yChfX8LDtHGWJ+8LdPDrir5P+fNU6CTyyCNul0xmob8djncRsP
         XLWAm3mS456h0pR4WMzUL0wJpwDaRSMUYHdhs2ksbD1nrka89wY5QPUs514JeefskIOc
         tu+pDoGhLlFv9VknZ50uR9M+cPV8yRoHXimXxPLetBfyxTtlpuNcmJv9XZPNBvbGlAEN
         TSJZi1WeaYYFOVL1IOGocHG7W5jdNEYKV6u7X79swP339pQovCy65aW9msltIyK/dWZN
         jGM/8C0W4Xh48pKLCnqIOWseQD0q42cWdqKuUJIiGq870Ko5DdCuN54cs9IIutXDqsq+
         380A==
X-Forwarded-Encrypted: i=1; AJvYcCXx+yrFjmNZFZjBGwi6F+k+nyl8BYJS3Tt7+WIm6Bqliqt0Ncy9ybWa+FDY81+Oz9Vu50XVT9VF5XFsoXnCAv279CEX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1l5gICrlYrslyZkfE8G2UYxJPnY6k288Cj15K6kEu+6DSpKtZ
	OVYWTed6SzQCnbxxzKwu/Hn4MKjb6q8d4V0qbTSPunhRIACnrCTCmO0G
X-Gm-Gg: ATEYQzzrBxo0ayoMMHW/c3NrHugwLFMywnUFYMvqaeppPCWmhAkVvw4PuhRPOkinNjT
	f3+ikIcrKktNpq2ynKZUJSBK2TkojxzvN910whAoL/wvtGGHFIEyEmFVQ1Hkjz9rXBfv5yVGvh0
	KbeMUFR2nA8tt/yqy3u0r7xaWbnEaC4BeiBpy2MwGHqHr7XK9Hjeboyb8b/8ITLRpBYyODKphPe
	TE9dsjVptV24tPnApvBuEe7MKsAH8kqxaQ5wLkg/Ou0IbGtkPnL+wMalN7TySsZJtZkbBitB8Zg
	L0yjouIng5kndUs7SzsdXUGRPOyq3xzPBEGkBM6TsM8ihNYmMLCx/DNiIl21wUThtUpOHVaHkwa
	XlAk3rR7rhhqgy7ZJgv8GhuTBW0VlrXiMIqSucxhr3HkvXExthtnPsapTqUwuTFhPyYUSj2yki5
	R7msw0s7kAiLCJ2//JUq4=
X-Received: by 2002:a05:690c:c4e9:b0:79a:7e0a:57ea with SMTP id 00721157ae682-7a20c5b0375mr13337697b3.0.1774996172544;
        Tue, 31 Mar 2026 15:29:32 -0700 (PDT)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79cb4521761sm56018537b3.0.2026.03.31.15.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:29:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 17:29:30 -0500
Message-Id: <DHHBMNO17UAL.OUT3KDXVYRJ4@gmail.com>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf"
 <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Rong Zhang"
 <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/13] platform/x86: lenovo-wmi-other: Add GPU
 tunable attributes
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
 <20260331181208.421552-9-derekjohn.clark@gmail.com>
In-Reply-To: <20260331181208.421552-9-derekjohn.clark@gmail.com>

On Tue Mar 31, 2026 at 1:12 PM -05, Derek J. Clark wrote:
> Use an enum for all GPU attribute feature ID's and add GPU attributes.
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Tested-by: Kurt Borja <kuurtb@gmail.com>

> ---
> v4:
>   - Align CPU feature enum values.
>   - Remove gpu_oc_stat from Documentation.
> v3:
>   - Remove gpu_oc_stat.
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |  10 ++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |   1 +
>  drivers/platform/x86/lenovo/wmi-other.c       | 105 ++++++++++++++++++
>  3 files changed, 116 insertions(+)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index 82c17361e749..bfbea59637bd 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -69,6 +69,16 @@ Each attribute has the following properties:
> =20
>  The following firmware-attributes are implemented:
>   - cpu_temp: CPU Thermal Load Limit
> + - dgpu_boost_clk: Dedicated GPU Boost Clock
> + - dgpu_enable: Dedicated GPU Enabled Status
> + - gpu_didvid: GPU Device Identifier and Vendor Identifier
> + - gpu_mode: GPU Mode by Power Limit
> + - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline Offse=
t
> + - gpu_nv_bpl: Nvidia GPU Base Power Limit
> + - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
> + - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
> + - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
> + - gpu_temp: GPU Thermal Load Limit
>   - ppt_cpu_cl: CPU Cross Loading Power Limit
>   - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index f2d45cd7a188..891b12ca1db6 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -20,6 +20,7 @@
> =20
>  enum lwmi_device_id {
>  	LWMI_DEVICE_ID_CPU =3D 0x01,
> +	LWMI_DEVICE_ID_GPU =3D 0x02,
>  	LWMI_DEVICE_ID_FAN =3D 0x04,
>  };
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 508186c7410d..2792671ac1de 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -65,6 +65,19 @@ enum lwmi_feature_id_cpu {
>  	LWMI_FEATURE_ID_CPU_IPL =3D	0x09,
>  };
> =20
> +enum lwmi_feature_id_gpu {
> +	LWMI_FEATURE_ID_GPU_NV_PPAB =3D		0x01,
> +	LWMI_FEATURE_ID_GPU_NV_CTGP =3D		0x02,
> +	LWMI_FEATURE_ID_GPU_TEMP =3D		0x03,
> +	LWMI_FEATURE_ID_GPU_AC_OFFSET =3D		0x04,
> +	LWMI_FEATURE_ID_DGPU_BOOST_CLK =3D	0x06,
> +	LWMI_FEATURE_ID_DGPU_EN =3D		0x07,
> +	LWMI_FEATURE_ID_GPU_MODE =3D		0x08,
> +	LWMI_FEATURE_ID_DGPU_DIDVID =3D		0x09,
> +	LWMI_FEATURE_ID_GPU_NV_BPL =3D		0x0a,
> +	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D	0x0b,
> +};
> +
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
>  #define LWMI_TYPE_ID_CROSSLOAD	0x01
> @@ -630,6 +643,66 @@ static struct tunable_attr_01 ppt_pl4_ipl_cl =3D {
>  	.type_id =3D LWMI_TYPE_ID_CROSSLOAD,
>  };
> =20
> +static struct tunable_attr_01 gpu_nv_ppab =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_PPAB,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_ctgp =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_CTGP,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_temp =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_TEMP,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_ac_offset =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_AC_OFFSET,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_boost_clk =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_DGPU_BOOST_CLK,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_enable =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_DGPU_EN,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_mode =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_MODE,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 dgpu_didvid =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_DGPU_DIDVID,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_bpl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_BPL,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 gpu_nv_cpu_boost =3D {
> +	.device_id =3D LWMI_DEVICE_ID_GPU,
> +	.feature_id =3D LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
>  struct capdata01_attr_group {
>  	const struct attribute_group *attr_group;
>  	struct tunable_attr_01 *tunable_attr;
> @@ -1061,6 +1134,7 @@ static bool lwmi_attr_01_is_supported(struct tunabl=
e_attr_01 *tunable_attr)
>  		.name =3D _fsname, .attrs =3D _attrname##_attrs               \
>  	}
> =20
> +/* CPU tunable attributes */
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
>  			      "Set the CPU thermal load limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> @@ -1086,9 +1160,40 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl=
4_ipl",
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
>  			      "Set the CPU cross loading instantaneous power limit");
> =20
> +/* GPU tunable attributes */
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "gpu_boost_clk",
> +			      "Set the dedicated GPU boost clock");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "gpu_didvid",
> +			      "Get the GPU device identifier and vendor identifier");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
> +			      "Set the dedicated Nvidia GPU enabled status");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
> +			      "Set the GPU mode by power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
> +			      "Set the Nvidia GPU AC total processing power baseline offset")=
;
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
> +			      "Set the Nvidia GPU base power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
> +			      "Set the Nvidia GPU to CPU dynamic boost limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
> +			      "Set the GPU configurable total graphics power");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
> +			      "Set the Nvidia GPU power performance aware boost limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
> +			      "Set the GPU thermal load limit");
> =20
>  static struct capdata01_attr_group cd01_attr_groups[] =3D {
>  	{ &cpu_temp_attr_group, &cpu_temp },
> +	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
> +	{ &dgpu_didvid_attr_group, &dgpu_didvid },
> +	{ &dgpu_enable_attr_group, &dgpu_enable },
> +	{ &gpu_mode_attr_group, &gpu_mode },
> +	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
> +	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
> +	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
> +	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
> +	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
> +	{ &gpu_temp_attr_group, &gpu_temp },
>  	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
>  	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
>  	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },


--=20
Thanks,
 ~ Kurt


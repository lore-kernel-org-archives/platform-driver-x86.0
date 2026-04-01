Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507EE43CEF7;
	Wed,  1 Apr 2026 18:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068699; cv=pass; b=mOMqtA09zDZAcPyyTiyHwK7Pjg0SU/4PHfFM5YYvPu5Ttq2625WeVqczVFp+WMxbTEV3y/kJgPSxtsZ2NUId3mrMT/hTqvsmyHiOFpc7RyzKlBGEwrVqOvqWgOtw2MoeyTXCvFKD8QAVANBK/U6NX878bAQXOi6ntbi7oVGVd1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068699; c=relaxed/simple;
	bh=dUXVJgtSwF0mpX6hOLkbJF95oCO2M35oZQFzB0vKZpQ=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OfcjPXTmBaYahfaBATZlOOd6hltPcM3NJYlb8aoiEVvKPmEHaGF1X9VjZUYroNKCYq2jp89NzDLiuK6yKa9jcLOOdhfx4o8M9XQxXIvxWWMpcGpHzIgAM2CnZqT1R0WWWOWL//4OtpvfHS+aMiOyF0vsc8zacPpOJKzbqBCz1OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qBMRzfw+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qBMRzfw+"
ARC-Seal: i=1; a=rsa-sha256; t=1775068691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GI+TQE7+BpfycoeCvdoK5Sh1XpAvLq1QlC2IJaDCeA21cBlDkBmIe2EIc+w2vjJdzVurq9GKnBouHbyUggl1V3RP9TZzBZsG8yyasPJryxcrG8/MHGJZ5MCGAYD8SHp6euKB19wL9NdT2R7Bb5lvFf5i8NG7pxAmZ4bqkVRkIEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775068691; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=10ecRIXf3uPfZFStuAU33Elx2FGDK58sjdzaqWe2EI8=; 
	b=D1Oou9B+KNtmZDZCGoJI20Bs21KajbwPsFJa3Ziq1nAXcHHV9qqTjOfNNoM5SnivcWbULuWjx93781g+wWtZjUTzNiqjd8PjZ7iyK0bi+POa6TrjTds9MahX/S4C8rpBVYrM9/FfMwj+qb5H4o0WnJtYJn7J+m9mXpf2RKHdOJw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775068691;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=10ecRIXf3uPfZFStuAU33Elx2FGDK58sjdzaqWe2EI8=;
	b=qBMRzfw+gCBkPswCO92sJ4JWnS/LKcdmjVE0ccaLjGl4XeLCmglH/ZSViOMgMKsO
	sqde8QawRDi5xLOBNezeV8sZOvdIFqyAo61g8q9VvAC/GROIEnf8A7J4duCUTjE+rkJ
	qdSjBH02bRp8ohTnR9DMZPtkHX7EAgN0qq0w0vs9a+v8tOH4pRabCMBuRmHms82oKDF
	rDtfAJ2kvty3Lif1Y0stwceiHTrrX3A2+tZMy7JFDiY/pP5h9+HiURL/IYgIfmHZt3B
	wGqEg/iCj6zYWDrtuD2qPMxtaJ3lXglwRptYKM3k9F0faHEprioL6uhXjyiIso3mlLp
	xaAuynH5jQ==
Received: by mx.zohomail.com with SMTPS id 1775068689804574.6668454869838;
	Wed, 1 Apr 2026 11:38:09 -0700 (PDT)
Message-ID: <f72ea9c98289fa09ee7bd4f9d62b1eb121defef7.camel@rong.moe>
Subject: Re: [PATCH v6 07/13] platform/x86: lenovo-wmi-other: Add missing
 CPU tunable attributes
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331181208.421552-8-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <20260331181208.421552-8-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 02:30:01 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-31 at 18:12 +0000, Derek J. Clark wrote:
> Use an enum for all device ID's and CPU attribute feature ID's,
> add missing CPU attributes.
>=20
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Align type ID defines.
>   - Align CPU feature enum values.
>   - remove cpu_oc_stat from Documentation.
> v3:
>   - Remove cpu_oc_stat.
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          |   9 ++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |   5 +-
>  drivers/platform/x86/lenovo/wmi-other.c       | 101 +++++++++++++++++-
>  3 files changed, 109 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index 01d471156738..82c17361e749 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -68,9 +68,18 @@ Each attribute has the following properties:
>   - type
> =20
>  The following firmware-attributes are implemented:
> + - cpu_temp: CPU Thermal Load Limit
> + - ppt_cpu_cl: CPU Cross Loading Power Limit
> + - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limit
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> + - ppt_pl1_spl_cl: Platform Profile Tracking Cross Loading Sustained Pow=
er Limit
> + - ppt_pl1_tau: Exceed Duration for Platform Profile Tracking Sustained =
Power Limit
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> + - ppt_pl2_sppt_cl: Platform Profile Tracking Cross Loading Slow Package=
 Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> + - ppt_pl3_fppt_cl: Platform Profile Tracking Cross Loading Fast Package=
 Power Tracking
> + - ppt_pl4_ipl: Platform Profile Trakcing Instantaneous Power Limit

Sashiko.dev suggests:

s/Trakcing/Tracking/g

https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gm=
ail.com

> + - ppt_pl4_ipl_cl: Platform Profile Tracking Cross Loading Instantaneous=
 Power Limit
> =20
>  LENOVO_FAN_TEST_DATA
>  -------------------------
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index 1388eaf4ab4a..f2d45cd7a188 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -18,7 +18,10 @@
>  #define LWMI_ATTR_MODE_ID_MASK	GENMASK(15, 8)
>  #define LWMI_ATTR_TYPE_ID_MASK	GENMASK(7, 0)
> =20
> -#define LWMI_DEVICE_ID_FAN	0x04
> +enum lwmi_device_id {
> +	LWMI_DEVICE_ID_CPU =3D 0x01,
> +	LWMI_DEVICE_ID_FAN =3D 0x04,
> +};
> =20
>  #define LWMI_TYPE_ID_NONE 0x00
> =20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index f689d19d711a..508186c7410d 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -54,14 +54,21 @@
> =20
>  #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> =20
> -#define LWMI_DEVICE_ID_CPU 0x01
> -
> -#define LWMI_FEATURE_ID_CPU_SPPT 0x01
> -#define LWMI_FEATURE_ID_CPU_SPL 0x02
> -#define LWMI_FEATURE_ID_CPU_FPPT 0x03
> +enum lwmi_feature_id_cpu {
> +	LWMI_FEATURE_ID_CPU_SPPT =3D	0x01,
> +	LWMI_FEATURE_ID_CPU_SPL =3D	0x02,
> +	LWMI_FEATURE_ID_CPU_FPPT =3D	0x03,
> +	LWMI_FEATURE_ID_CPU_TEMP =3D	0x04,
> +	LWMI_FEATURE_ID_CPU_APU =3D	0x05,
> +	LWMI_FEATURE_ID_CPU_CL =3D	0x06,
> +	LWMI_FEATURE_ID_CPU_TAU =3D	0x07,
> +	LWMI_FEATURE_ID_CPU_IPL =3D	0x09,
> +};
> =20
>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> =20
> +#define LWMI_TYPE_ID_CROSSLOAD	0x01
> +
>  #define LWMI_FEATURE_VALUE_GET 17
>  #define LWMI_FEATURE_VALUE_SET 18
> =20
> @@ -557,18 +564,72 @@ static struct tunable_attr_01 ppt_pl1_spl =3D {
>  	.type_id =3D LWMI_TYPE_ID_NONE,
>  };
> =20
> +static struct tunable_attr_01 ppt_pl1_spl_cl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_SPL,
> +	.type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
>  static struct tunable_attr_01 ppt_pl2_sppt =3D {
>  	.device_id =3D LWMI_DEVICE_ID_CPU,
>  	.feature_id =3D LWMI_FEATURE_ID_CPU_SPPT,
>  	.type_id =3D LWMI_TYPE_ID_NONE,
>  };
> =20
> +static struct tunable_attr_01 ppt_pl2_sppt_cl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_SPPT,
> +	.type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
>  static struct tunable_attr_01 ppt_pl3_fppt =3D {
>  	.device_id =3D LWMI_DEVICE_ID_CPU,
>  	.feature_id =3D LWMI_FEATURE_ID_CPU_FPPT,
>  	.type_id =3D LWMI_TYPE_ID_NONE,
>  };
> =20
> +static struct tunable_attr_01 ppt_pl3_fppt_cl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_FPPT,
> +	.type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
> +static struct tunable_attr_01 cpu_temp =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_TEMP,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl1_apu_spl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_APU,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_cpu_cl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_CL,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl1_tau =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_TAU,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl4_ipl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_IPL,
> +	.type_id =3D LWMI_TYPE_ID_NONE,
> +};
> +
> +static struct tunable_attr_01 ppt_pl4_ipl_cl =3D {
> +	.device_id =3D LWMI_DEVICE_ID_CPU,
> +	.feature_id =3D LWMI_FEATURE_ID_CPU_IPL,
> +	.type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> +};
> +
>  struct capdata01_attr_group {
>  	const struct attribute_group *attr_group;
>  	struct tunable_attr_01 *tunable_attr;
> @@ -794,6 +855,8 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> =20
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);

This should have been added to patch 6. Bad rebase?

(found by sashiko.dev)

Thanks,
Rong

>  	args.arg1 =3D value;
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -998,17 +1061,45 @@ static bool lwmi_attr_01_is_supported(struct tunab=
le_attr_01 *tunable_attr)
>  		.name =3D _fsname, .attrs =3D _attrname##_attrs               \
>  	}
> =20
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
> +			      "Set the CPU thermal load limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> +			      "Set the CPU cross loading power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
> +			      "Set the APU sustained power limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
>  			      "Set the CPU sustained power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
> +			      "Set the CPU cross loading sustained power limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
>  			      "Set the CPU slow package power tracking limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl, "ppt_pl2_sppt_cl",
> +			      "Set the CPU cross loading slow package power tracking limit");
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
>  			      "Set the CPU fast package power tracking limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl, "ppt_pl3_fppt_cl",
> +			      "Set the CPU cross loading fast package power tracking limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
> +			      "Set the CPU sustained power limit exceed duration");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
> +			      "Set the CPU instantaneous power limit");
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
> +			      "Set the CPU cross loading instantaneous power limit");
> +
> =20
>  static struct capdata01_attr_group cd01_attr_groups[] =3D {
> +	{ &cpu_temp_attr_group, &cpu_temp },
> +	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
> +	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
>  	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> +	{ &ppt_pl1_spl_cl_attr_group, &ppt_pl1_spl_cl },
> +	{ &ppt_pl1_tau_attr_group, &ppt_pl1_tau },
>  	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> +	{ &ppt_pl2_sppt_cl_attr_group, &ppt_pl2_sppt_cl },
>  	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> +	{ &ppt_pl3_fppt_cl_attr_group, &ppt_pl3_fppt_cl },
> +	{ &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
> +	{ &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
>  	{},
>  };
> =20

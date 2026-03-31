Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45833EC2F4
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 22:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774996145; cv=none; b=D0hJhuq8FgB2xlwOBBk0wbUvlkxSJo4b+e33hOnmH3W35TVJ44dGL3M68rNyW2g9c9M4J6K1P+hlg1RxVz3SIRQVwUh9uBRThZUM7jx1uKMqw5dgweVvMg2/+Sr75CqnRJBKqn0CKTOXRreEIdC3Olt1Re++LGaZW38hcce3bXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774996145; c=relaxed/simple;
	bh=qC6+3guVF3L8JtvB+xE88disfICPfO87HzGbNttU3Tg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pphScqPX2JJSIbsLZFebO3L4JIZ0+j8z6ntUPG5Ew25N6axKyINiyqyWMjk0ReWnMgDdmvhyRRTDIhzIcNxOcOTFVw7jdtPOQ7nv/+zQCbsbO1ak8w4vkGYzGu5aL8Y44ERelu+ZpchM95rvtToOWZon0SZXgWmT/wVjfhOhelw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTGu1S17; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTGu1S17"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64eee7b83cfso7050429d50.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 15:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774996143; x=1775600943; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpCfakrLNGAk/gVkHnuxMNUFcuWioaBgFydvmURxMN4=;
        b=fTGu1S17Gq6Kg65W/pNaoJbueSJBNVpb73c69ZvljcdCR90mxbLz+PZyuksZD4jb8y
         lwtcx+0X1B7Ul3Z74q4Gi5mJmKgNcJjA7WXIH9hRHtHWhkuCXuAmc/PLb7afPoXJHcUO
         R08Al3+xDZnmSRT+h4F4tqZp7xE0vjFFREbl5+uXYqMcIr9Hlmoe6A/1f3/slInzfSwx
         0OZYNpmnn7J8zbO4QrxCj4MFvsQvWyBi8HIW/1jh34k6WE67A2qCSKJAqVJP3UyWXz8e
         UzWTnF8U6ymsMKTReu0/n5QpSe6a/xo0PnrzLiWBOGXi4qlvn38NoI8AKqY3l/n+qj1s
         9Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774996143; x=1775600943;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NpCfakrLNGAk/gVkHnuxMNUFcuWioaBgFydvmURxMN4=;
        b=sSqDe9Frt9XCPwMOjpKp/bS0HJxEML2/69mAYANrCxwym1C1JnOYaC6npmXfS100lH
         rgKzvqADomKuPxIr8Ec7rTsbGqJh1kzpfJHmEsAcLUAePHtwKNt4WEoQ0pYb0K/Q3p0/
         gYQnCsbpstD8VVJOXToWeO0/StSSGuAL3t8GMaLhItOIk1R2+VQ0aJJy0mS7+ZmgOLOU
         0r87l1d4v7TSdVccXMDeMkCEUKb2LtwrnxGAKtYIr1kpT0kSCDYb99vO+6UP5XdOtJab
         quAYJEHxY7CpCtZpo2tYgAuhGUqOWXyw67FUy6Ohirdp0UftLQH5qBAxJMg2r9IMV4Y4
         uleg==
X-Forwarded-Encrypted: i=1; AJvYcCW8jvjUtoy3H3TjWRy4yvPz/FnM+jBPsr2C1lC++kkFEU9/GPSZQf6I+yYQxllCipZFe0aFDdHvF432ADcylpbRyYFA@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgfJ9fVcAJf3CGIMvQRrWDPmSrX14JIh3J1IZLJwgWJuMr9bJ
	1eol1uPXAhE5h0aMfVY4LblsU9MugE+5HC2Jc0OIyPcvQHNl+MVzAK6n
X-Gm-Gg: ATEYQzzE6b1nuCM4J72XqCBelMsHMPLJryGIqyzIZC9oTzhi3/EKtGi3wWwcrrzs0NY
	AuVkD0dS2MH9AEZo9XMufKEcnaeplwtsaO4PZNV3gA+mnE6lTvBQ88FL2fcJP5L2ijVN2t0TnmU
	bSxWUQaDeyvQEN9tdDtpM05j6Ixpr/S1yWHzC0wxolRh1ZdE75Je/ehmstv7xpZDP00dcRkBuXf
	kdkrxoXWuauX1USFBf6fcWrTbJPfjAwbi6AWoPvn1TjBXQt7wLryy7rx//hy2Xrj709dIG7dcsQ
	kDIqY78DcuQ5wttHpNj7POk0qmHHpVZK6z572D72wByYEg5YCA+/LckS50GL2+lyXI6IL5XTPVi
	Snjpu6O83TswBoTPWmN0pscXC9+YThBt23eDDLmbZqfhN2O/Q5OVrHmPx98HXNJ1iwr404IZuFz
	2OmOO9MG9TM0qz/7gzXfE=
X-Received: by 2002:a05:690e:4841:b0:64e:e82e:840a with SMTP id 956f58d0204a3-6502fd8acd7mr862920d50.15.1774996142645;
        Tue, 31 Mar 2026 15:29:02 -0700 (PDT)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65009200901sm6247030d50.1.2026.03.31.15.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 15:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 17:29:00 -0500
Message-Id: <DHHBM9X7C4NU.1PMDJITZEDWGC@gmail.com>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf"
 <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Rong Zhang"
 <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 07/13] platform/x86: lenovo-wmi-other: Add missing
 CPU tunable attributes
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
 <20260331181208.421552-8-derekjohn.clark@gmail.com>
In-Reply-To: <20260331181208.421552-8-derekjohn.clark@gmail.com>

On Tue Mar 31, 2026 at 1:12 PM -05, Derek J. Clark wrote:
> Use an enum for all device ID's and CPU attribute feature ID's,
> add missing CPU attributes.
>
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Tested-by: Kurt Borja <kuurtb@gmail.com>

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
>
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


--=20
Thanks,
 ~ Kurt


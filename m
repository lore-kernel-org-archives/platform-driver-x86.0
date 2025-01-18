Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9871C126C1E;
	Sat, 18 Jan 2025 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737183878; cv=none; b=ab8E/MRkDaXbW2GIlFSeLA/16oYBAnOH6QM3e65Z725qJqMUS8VwHPi7AurQuJuS3im6SWYdNDvQ/Osv7jAA2Xg8P0arwa/rmoRC6Alhgf2a4sBCIYucxO3csXiue59OHHtk6+ZuE2M63HHwBAe36hpuAQevwQoutAx7Y+lNbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737183878; c=relaxed/simple;
	bh=C9/EEoHn1f3Z5ioE/+klUOECE7DllC1zFEM+Nlqppkw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=KjHtV6OyS256X2i8E6xuQ9djhR3HqQt+y86+wDgZhRhU+I9VbZVRypUI3W0dM52IhnEA1SaMS85nHgImydaux8DbKLVA/qg5WV/OGEDnotlYjcbtieVL6al053RIgQRwmHaiYooZbPTQsxktplolwZvFHC7IzxZZBaHXyVsb45g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKYYCnsR; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKYYCnsR"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5187cd9b8e5so829829e0c.1;
        Fri, 17 Jan 2025 23:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737183875; x=1737788675; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVKCHr4QLEmVsNcL8IwEutV4nA87a9Lr0Pa5Y+hfi6I=;
        b=JKYYCnsRZ/MfNkR9y0olUorpyv+rnciM9jl6XqAugt0m+rkaFg5zBCTKitCfkTPoAV
         B6jnQY4JPpsy//T/QjfSaKUzIRBggwr7TD5ZPan2MdPlKY6oePbu+FOGZ2WHVDX4bp8m
         ZQjZugTqyXzk+T14sgQQu0vjrPPjkEDuipqYcwWqhAdScMqCEaCrWcX7YVFhstlNgQ89
         KjhxPdDmXCHtWTY/KfkLPj1Zu0Ggv4bese3hKJx1gL/G4S2yIgVKykfzfEVuC7hs6+Yv
         hqRQEowZODAklKWVJM9O1/GHJXB9IkMqsbfJ89MGU1B0SauyUlGJn/Xmeikmvmzyj4Ff
         5+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737183875; x=1737788675;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVKCHr4QLEmVsNcL8IwEutV4nA87a9Lr0Pa5Y+hfi6I=;
        b=fqsJ7HvZ9++3N/t01aGu5O9s89S9iOFcc/aTz2PKO+CnS5eaomGVUFBkymKG/CNAfY
         5MuMzKnQgFiqE1kGVenuflL1bdJ2PBo8bPlogCeWVJtGwHaoFSl+9EX0Ei16bMmamodI
         6UBl1ASbQZ2iShp4apRnY7o+mr4qTzmSYSB+jRd36XQ1+ya+abnWnfygkCAo4doextTY
         W1Z6K4Y/XjYag9LMPF5HuBmmh1XAAmrjmrEsHFpN56fE54xJ+TEBq0Z90fiOFQ38CQdg
         2jbt3gAnbJdZOhXyFgrqh67diq2WrVr94Z9p+Kw/RX44nLH5rOfvQbFr9JLTpZrcPoAI
         RvcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3LikQDs7O5aqf3lrwL/+BoMWeIBY4N45iKvEeZ6dhDCb7ALNeHYUdyWQ2ppDzwDWxDJ/IpXSzYEI4x3CA@vger.kernel.org, AJvYcCXAWN0v8n9z25oGI/k407nR5T8Qijw/aSEDmfSl+SeRz4uGuw69qzOjwR6Zzmzz5NHup+1Lny/a9S8ye66SYKXJUSVj8A==@vger.kernel.org, AJvYcCXoy3GDMqthbgFOsTeb6JwLuIXWIg/ynDDhu3uRj6k8DxFR2Tsea/pUz8qnNOWgiaW0HwCs7rpKu8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygkn/Qp7Zmmy0jbaXzlEIVobjuGE050yMNvldOesk8eIePVYC9
	jVa6Twp9zP/p43dFioe0yPXvStI0/WFCUKQXF72PlCMeAqWfl5n6kybPBQ==
X-Gm-Gg: ASbGnctriJydJbSYEBJBjiO8uosg/7U3odF4MB95TDl5P1KO7LWsJV1U2Mg9QYWSSGk
	dYRp9R+Wil3dtL/U8Du2a/Hl3bFWx0V9AZ6WDqJLa+4JdoriF5TH8tTGH5z8fh+vWb6BNjh2xln
	5RLMgcG7aTnjvDqAHawK4735BiD5VYYSth38zs+ezreuSf6nyZpZ0bwIhEpZ0YXeuMsoNxj1MIE
	FcEzZFI5t9w/0DK8O2/ohs51Qp8QJUCgHiYmkEuRS7sGxv0HsJLAlGWqvCGpg==
X-Google-Smtp-Source: AGHT+IFNS0dSMdLMmRCxs4dI0d9cVarO2LLduE23a3O5xOe2nWx9eKm/M1WSaRWUavHNqBRoYo/FYw==
X-Received: by 2002:a05:6122:1908:b0:518:965c:34a with SMTP id 71dfb90a1353d-51d592cb265mr5522444e0c.2.1737183875173;
        Fri, 17 Jan 2025 23:04:35 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf55c8ca8sm640388e0c.23.2025.01.17.23.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 23:04:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jan 2025 02:04:31 -0500
Message-Id: <D750ADJIJO3T.JVSA3PBBPXGP@gmail.com>
Subject: Re: [PATCH v7] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Joshua Grisham" <josh@joshuagrisham.com>, <W_Armin@gmx.de>,
 <thomas@t-8ch.de>, <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
 <platform-driver-x86@vger.kernel.org>, <corbet@lwn.net>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250118004322.10062-1-josh@joshuagrisham.com>
In-Reply-To: <20250118004322.10062-1-josh@joshuagrisham.com>

Hi Joshua,

I have some comments on the platform profile section. The most important
one is the platform_profile probe one, the rest are suggetions.

On Fri Jan 17, 2025 at 7:43 PM -05, Joshua Grisham wrote:
> Add a new driver for Samsung Galaxy Book series notebook devices with the
> following features:
>
> - Keyboard backlight control
> - Battery extension with charge control end threshold
> - Controller for Samsung's performance modes using the platform profile
>   interface
> - Adds firmware-attributes to control various system features
> - Handles various hotkeys and notifications
>
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>

...

> +/*
> + * Platform Profile / Performance mode
> + */
> +
> +static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybo=
ok,
> +				     const u8 performance_mode)
> +{
> +	struct sawb buf =3D {};
> +
> +	buf.safn =3D GB_SAFN;
> +	buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +	buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +	buf.subn =3D GB_SUBN_PERFORMANCE_MODE_SET;
> +	buf.iob0 =3D performance_mode;
> +
> +	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MO=
DE,
> +				      &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +}
> +
> +static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybo=
ok, u8 *performance_mode)
> +{
> +	struct sawb buf =3D {};
> +	int err;
> +
> +	buf.safn =3D GB_SAFN;
> +	buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +	buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +	buf.subn =3D GB_SUBN_PERFORMANCE_MODE_GET;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_M=
ODE,
> +				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +	if (err)
> +		return err;
> +
> +	*performance_mode =3D buf.iob0;
> +
> +	return 0;
> +}
> +
> +static int get_performance_mode_profile(struct samsung_galaxybook *galax=
ybook,
> +					const u8 performance_mode,
> +					enum platform_profile_option *profile)
> +{
> +	switch (performance_mode) {
> +	case GB_PERFORMANCE_MODE_SILENT:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case GB_PERFORMANCE_MODE_QUIET:
> +		*profile =3D PLATFORM_PROFILE_QUIET;
> +		break;
> +	case GB_PERFORMANCE_MODE_OPTIMIZED:
> +	case GB_PERFORMANCE_MODE_OPTIMIZED_LEGACY:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case GB_PERFORMANCE_MODE_PERFORMANCE:
> +	case GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY:
> +		/* balanced-performance maps to Performance when Ultra exists */
> +		if (test_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +			     galaxybook->platform_profile_choices))
> +			*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +		else
> +			*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case GB_PERFORMANCE_MODE_ULTRA:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case GB_PERFORMANCE_MODE_IGNORE1:
> +	case GB_PERFORMANCE_MODE_IGNORE2:
> +		return -EOPNOTSUPP;
> +	default:
> +		dev_warn(&galaxybook->platform->dev,
> +			 "unrecognized performance mode 0x%x\n", performance_mode);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int galaxybook_platform_profile_set(struct device *dev,
> +					   enum platform_profile_option profile)
> +{
> +	struct samsung_galaxybook *galaxybook =3D dev_get_drvdata(dev);
> +
> +	return performance_mode_acpi_set(galaxybook,
> +					 galaxybook->profile_performance_modes[profile]);
> +}
> +
> +static int galaxybook_platform_profile_get(struct device *dev,
> +					   enum platform_profile_option *profile)
> +{
> +	struct samsung_galaxybook *galaxybook =3D dev_get_drvdata(dev);
> +	u8 performance_mode;
> +	int err;
> +
> +	err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> +	if (err)
> +		return err;
> +
> +	return get_performance_mode_profile(galaxybook, performance_mode, profi=
le);
> +}
> +
> +static int galaxybook_platform_profile_probe(void *drvdata, unsigned lon=
g *choices)
> +{
> +	struct samsung_galaxybook *galaxybook =3D drvdata;
> +	int i;
> +
> +	for_each_set_bit(i, galaxybook->platform_profile_choices, PLATFORM_PROF=
ILE_LAST)
> +		set_bit(i, choices);

The intended use of this callback is to "probe" for available choices
here. You should move all galaxybook_performance_mode_profile_init()
logic to this method. This would eliminate the need to have a copy of
the choices bitmap.

> +
> +	return 0;
> +}
> +
> +static const struct platform_profile_ops galaxybook_platform_profile_ops=
 =3D {
> +	.probe =3D galaxybook_platform_profile_probe,
> +	.profile_get =3D galaxybook_platform_profile_get,
> +	.profile_set =3D galaxybook_platform_profile_set,
> +};
> +
> +static int galaxybook_performance_mode_init(struct samsung_galaxybook *g=
alaxybook)
> +{
> +	enum platform_profile_option profile =3D PLATFORM_PROFILE_LAST;
> +	u8 performance_mode;
> +	int err;
> +	int i;
> +
> +	err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> +	if (err)
> +		return err;
> +
> +	err =3D get_performance_mode_profile(galaxybook, performance_mode, &pro=
file);
> +	if (err)

If this method failed we can't safely continue. I think you should
return here, else you may get an out of bounds access bellow.

> +		dev_warn(&galaxybook->platform->dev,
> +			 "initial startup performance mode 0x%x is not mapped\n",
> +			 performance_mode);
> +
> +	for_each_set_bit(i, galaxybook->platform_profile_choices, PLATFORM_PROF=
ILE_LAST)
> +		dev_dbg(&galaxybook->platform->dev,
> +			"enabled platform profile %d using performance mode 0x%x\n",
> +			i, galaxybook->profile_performance_modes[i]);

Maybe we can log this directly in the switch-case block inside
galaxybook_performance_mode_profile_init() instead of having to iterate.

> +
> +	/* ensure startup performance_mode matches that mapped to its profile *=
/
> +	if (galaxybook->profile_performance_modes[profile] =3D=3D performance_m=
ode)
> +		return 0;
> +
> +	/* otherwise, if balanced is enabled, use it as the default */
> +	if (test_bit(PLATFORM_PROFILE_BALANCED, galaxybook->platform_profile_ch=
oices))
> +		return performance_mode_acpi_set(galaxybook,
> +			galaxybook->profile_performance_modes[PLATFORM_PROFILE_BALANCED]);
> +
> +	/* otherwise, find the first enabled profile and use that instead */
> +	profile =3D find_next_bit_wrap(galaxybook->platform_profile_choices,
> +				     PLATFORM_PROFILE_LAST,
> +				     0);
> +
> +	if (profile =3D=3D PLATFORM_PROFILE_LAST) {
> +		dev_err(&galaxybook->platform->dev,
> +			"no platform profiles have been enabled\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return performance_mode_acpi_set(galaxybook,
> +					 galaxybook->profile_performance_modes[profile]);
> +}
> +
> +#define gb_pfmode(profile) galaxybook->profile_performance_modes[profile=
]
> +
> +static int galaxybook_performance_mode_profile_init(struct samsung_galax=
ybook *galaxybook)
> +{
> +	enum platform_profile_option profile;
> +	struct sawb buf =3D {};
> +	unsigned int i;
> +	int err;
> +
> +	/* fetch supported performance mode values from ACPI method */
> +	buf.safn =3D GB_SAFN;
> +	buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +	buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +	buf.subn =3D GB_SUBN_PERFORMANCE_MODE_LIST;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_M=
ODE,
> +				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +	if (err) {
> +		dev_dbg(&galaxybook->platform->dev,
> +			"failed to get supported performance modes, error %d\n", err);
> +		return err;
> +	}
> +
> +	/* set initial default profile performance mode mappings */
> +	gb_pfmode(PLATFORM_PROFILE_LOW_POWER) =3D GB_PERFORMANCE_MODE_SILENT;
> +	gb_pfmode(PLATFORM_PROFILE_QUIET) =3D GB_PERFORMANCE_MODE_QUIET;
> +	gb_pfmode(PLATFORM_PROFILE_BALANCED) =3D GB_PERFORMANCE_MODE_OPTIMIZED_=
LEGACY;
> +	gb_pfmode(PLATFORM_PROFILE_PERFORMANCE) =3D GB_PERFORMANCE_MODE_PERFORM=
ANCE_LEGACY;
> +	gb_pfmode(PLATFORM_PROFILE_LAST) =3D GB_PERFORMANCE_MODE_INVALID;
> +
> +	/*
> +	 * Value returned in iob0 will have the number of supported performance
> +	 * modes per device. The performance mode values will then be given as =
a
> +	 * list after this (iob1-iobX). Loop through the supported values and
> +	 * enable their mapped platform_profile choice, overriding "legacy"
> +	 * values along the way if a non-legacy value exists.
> +	 */
> +	for (i =3D 1; i <=3D buf.iob0; i++) {
> +		dev_dbg(&galaxybook->platform->dev,
> +			"device supports performance mode 0x%x\n", buf.iob_values[i]);
> +		err =3D get_performance_mode_profile(galaxybook, buf.iob_values[i], &p=
rofile);

Here we pass iob_values[i] through a switch-case block inside
get_performance_mode_profile() and then we do it again bellow. Maybe
this all could be done here, without having to call
get_performance_mode_profile().

> +		if (err)
> +			continue;
> +		switch (buf.iob_values[i]) {
> +		case GB_PERFORMANCE_MODE_OPTIMIZED:
> +			/* override legacy Optimized value */
> +			gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_OPTIMIZED;
> +			break;
> +		case GB_PERFORMANCE_MODE_PERFORMANCE:
> +			/* override legacy Performance value */
> +			gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_PERFORMANCE;
> +			break;
> +		case GB_PERFORMANCE_MODE_ULTRA:
> +			/*
> +			 * if Ultra is supported, downgrade performance to
> +			 * balanced-performance
> +			 */

I haven't been following the entire discussion, so I don't know if Armin
changed his mind but I agree with him.=20

I think GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY should be statically
mapped to BALANCED_PERFORMANCE and TURBO should be PERFORMANCE. This
would simplify a lot of the logic here.

> +			if (test_bit(PLATFORM_PROFILE_PERFORMANCE,
> +				     galaxybook->platform_profile_choices)) {
> +				gb_pfmode(PLATFORM_PROFILE_BALANCED_PERFORMANCE) =3D
> +					gb_pfmode(PLATFORM_PROFILE_PERFORMANCE);
> +				set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +					galaxybook->platform_profile_choices);
> +			}
> +			/* override performance profile to use Ultra's value */
> +			gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_ULTRA;
> +			break;
> +		default:
> +			break;
> +		}
> +		set_bit(profile, galaxybook->platform_profile_choices);
> +	}
> +
> +	err =3D galaxybook_performance_mode_init(galaxybook);

If the main goal of this method is to set an initial profile maybe we
can just directly set it after finding GB_PERFORMANCE_MODE_OPTIMIZED?

This would eliminate a bit of indirection.

Do you know if all devices support OPTIMIZED? either legacy or
non-legacy.

> +	if (err) {
> +		dev_dbg(&galaxybook->platform->dev,
> +			"failed to initialize performance mode, error %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int galaxybook_platform_profile_init(struct samsung_galaxybook *g=
alaxybook)
> +{
> +	struct device *ppdev;
> +	int err;
> +
> +	err =3D galaxybook_performance_mode_profile_init(galaxybook);
> +	if (err)
> +		return 0;
> +
> +	galaxybook->has_performance_mode =3D true;
> +
> +	ppdev =3D devm_platform_profile_register(&galaxybook->platform->dev, DR=
IVER_NAME,
> +					       galaxybook, &galaxybook_platform_profile_ops);
> +	if (IS_ERR(ppdev))
> +		return PTR_ERR(ppdev);
> +
> +	platform_profile_notify(ppdev);

No need to notify after registering. You can directly return
PTR_ERR_OR_ZERO().

~ Kurt

> <snip>

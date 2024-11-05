Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA5018CC1B
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 08:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730795359; cv=none; b=EMObW/wyy5WYmeAShMzjjmSxZ+pHSD4O76yE0aGKxR8oIiGkk15MrheHATHSKfnEaMPfEf9os9gakIIO/Vwj3tsp9bIV3zUieaaOtbuFJZX8QhHNLmApyzTKsbZd96/AamsCZhxhzC8YGFOAuHltQ5pKWnuMgZEAKfPn1Q59gF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730795359; c=relaxed/simple;
	bh=zIxTJdNa0ttgIKYmRh7vYr/w823TU7H2rUZo3oG+L3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=od8jaj3w9ov7cCiSEqjVSTJDq3VShmndXKvRM6KkpFyPM4Q4G5c99z8C1jenQ1kIEVkdFETZ13BgWgX2wcQ5Nmx/H86cwHiTEwQzX/JpJJOmIeJsr82GxiETRtUSFViEVTXQmTBWNSEGXSSC/KqcgsKJldX9Emj+BlUb0OVVXjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1Ku0Nm4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1Ku0Nm4"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso775810266b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Nov 2024 00:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730795356; x=1731400156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HInRBjIhTFw/88QEvkjbsC1xsfk6X1zNSQSTtKxO3/4=;
        b=E1Ku0Nm4NUrWN93rtFcU5wxGkkoG/Nw86htxWZX7VEXvDYOAodYTYX4G4Ec9NiW/B/
         JlnZ5bAlEJN3LYfU6fhe6TFDAP/AVyD16dR+506jrPmu9lCTrHU7G2Wy44QkVmNRqzSR
         ZDhlirQLC3mw9GBdiZlqUyrK1v9PK31WQ8Shh0U2Zuya4n8X1Pll8yJ4yiTweFpOUb6Y
         6LXt6MBUdOUf9bi3B8SgNSECDyDf+mWVCIn1s3NvUiSv0La+0nOzZspsWYq5jta4ZUOy
         vk3OtOui/8s1yj4x/p5+Xq+iMYntv6T2WRDrw8TieoBQ5xDN/pviJqZ1vkF91G+ivzER
         AKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730795356; x=1731400156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HInRBjIhTFw/88QEvkjbsC1xsfk6X1zNSQSTtKxO3/4=;
        b=SCc8wrITzebS4XhvHdxNKyLxx4lZjPvN88EzqjX1kNipfdrRcAfyaz27Owkyp6wwjJ
         4luaLtg/6LImHbBAzdrDOA5SlH65m9vWDi35enm/rU0D1i2vfFDkYLVBXOhxVGr9gLdO
         uy2WOhTKAvWZeZXHNF3O3eyBp8MfNBxN8ItoFLvBxu/IDa2FwTHwFB07ZQYtWPNsfTIW
         g0g351h4qE88b3MWBNafqz1ZPHbEreUDoww6M+ZgnxCKAX4tvnmctbovKwtod210k7Ja
         i4IjVFRkZGWc5hH4VsYAam7QwDWKgM8hVZslTfE41yUXokwYgMqScGvvKhWhtxSaX4c5
         j00A==
X-Forwarded-Encrypted: i=1; AJvYcCWdRT4xrayzX7/4EgZ5Ag52uqLBGd/Bdnb//TYh4wB3bMTrUsQ532Bv/zPFROZ7j1Octw35C5ww8cGuIJVPHVjC9tHs@vger.kernel.org
X-Gm-Message-State: AOJu0YxEoVNliuYaA3vh4prNR78NXULYhRSnVSQI7UPjj6Xz9svRqAM/
	XMbTOk1LG63LL9c5Mbxf1DtYWyxIEyvd9tLI40pqmagWe9GRDZzRv8fDdLI+EqaDP7VbQvwGW4S
	l/xO4ras+TbD+atqVZtRIGwBU9BA=
X-Google-Smtp-Source: AGHT+IF8cQumpoiSSBBtZ4J73XzrLo5OIZG8Jx17MPGvHixZIY9aRzkfbr7eLIc+y5QWUG4oZMIhizBTVRICop1ZUQE=
X-Received: by 2002:a17:907:97c8:b0:a9a:3d5b:dc1a with SMTP id
 a640c23a62f3a-a9e508d5ba5mr1805311766b.15.1730795355797; Tue, 05 Nov 2024
 00:29:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104200848.58693-1-hdegoede@redhat.com> <20241104200848.58693-4-hdegoede@redhat.com>
In-Reply-To: <20241104200848.58693-4-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Nov 2024 10:28:39 +0200
Message-ID: <CAHp75Ve+gJQLRjh0=ck96tDJ_KWY8tRu3dQht62QrKU7K36MDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: x86-android-tablets: Add support for
 Vexia EDU ATLA 10 tablet
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Add support for the Vexia EDU ATLA 10 tablet, Android 4.2/4.4 + Guadaline=
x
> Ubuntu tablet distributed to schools in the Spanish Andaluc=C3=ADa region=
.
>
> Besides the usual broken DSDT issues this tablet is special because all
> its LPSS island peripherals are enumerated as PCI devices rather then as
> ACPI devices as they typically are.
>
> At the same time there are disabled (_STA=3D0) ACPI devices for
> the peripherals and child ACPI devices for e.g. attached I2C/SDIO devices
> are children of these disabled ACPI devices and thus will not be used
> by Linux since the parent is disabled.
>
> So besides the usual manual i2c-client instantiation for accel/touchscree=
n
> this tablet also requires manual i2c-client instantiation for the codec
> and for the PMIC.
>
> Also it seems the mainboard was designed for Windows not Android, so
> it has an I2C attached embedded controller instead of allowing direct
> access to the charger + fuel-gauge chips as is usual with Android boards.
>
> Normally when there is an embedded controller, there also is ACPI battery
> support, but since this shipped with Android that is missing and Linux
> needs to have a power_supply class driver talking directly to the EC.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

> +               .adapter_path =3D "0000:00:18.1",

> +               .adapter_path =3D "0000:00:18.2",

> +               .adapter_path =3D "0000:00:18.5",

> +               .adapter_path =3D "0000:00:18.6",

> +               .adapter_path =3D "0000:00:18.7",

...

> +       .use_pci_devname =3D true,

Just realized that you may do something like this to the above and
also use pci_get_...() instead of iterating over the I2C type of
devices. But you can do it later.

--=20
With Best Regards,
Andy Shevchenko

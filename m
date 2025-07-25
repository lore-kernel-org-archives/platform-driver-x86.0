Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3ED8F4A
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455040; cv=none; b=LQI+26lHH6eTnM7cYlLu6gB/ZRh+KguwYVPNbBAl8GLh9CDVBkiVu81d9wzJmm1iBfLVfW3fBg64vkot+RNZyBHJBMMGwi+WahgAbTmJkeaIxjFMoeLFpI3AW1Cd5+H7+7SRPWMKSb15N8aTXtWsqiVV8HqgJXf8ymIziYv1fTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455040; c=relaxed/simple;
	bh=FqL3KDTRg3nC/lVsoHhzVGrwym3P+en1ZQEkBhs++ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuwKNZ0grI/RVOdzYrwf47tD2UUeMAa3xYkeB+XKyc1pj/ZNIaOe+JRY0ijeuLRkw8OFZs0dEmchaQDZd6gpySpRkyEZnaIBPmjbExSLkTMfj8fTOjY7iQ2y1q3lw6lzBWqv63XSCPDVqybY/uF/n1yaWUj8OFQum2U6gmoUAcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHA0IlmK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHA0IlmK"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so362573966b.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753455037; x=1754059837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPP6yD5lb30mWdtTqBNKCqK0E+fOYmH4OdMdNWZZTLo=;
        b=BHA0IlmK7OjtMDPF8GieIWxqvE3Opg3inzhKLO6wSFbNb939KWemQN1cFn/bO/h8tt
         xw6GBO+LyBor/Jiy/hrewUjyWqxreQOghOHFo6tEPqQetJFmhbE52lPYAOCn/ECXMTFD
         Ube3r4cRJXdWQA6FdLLWnDyCTWGG3T9vFBaSCHmawdLrqFuF494sNMl/k4pue7DPnQPS
         0RZo7KDjEEMm5ZPeHCdpoAIW42keIY4/0DKQEkk/ZOYln+YveqccQWHvAcq1jF8PtF2x
         h7IHYtQfMl6hU0TY/MtH6SGz4Z+ED3aiQ6N8tJAdpCNWRrhJV1EtNcLFE4WzhZOnKNVN
         nO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455037; x=1754059837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPP6yD5lb30mWdtTqBNKCqK0E+fOYmH4OdMdNWZZTLo=;
        b=BWyONWJOImmSGCHmalrJt9FvRT8diUk4IC17J38j/hdtrYI8RPUeRPtx3cQqjZCOx3
         mVeLQmDhW8mvbTgy1o8oAymtPbyCCrTs3JpYa7qX92zWNEnggDZd9mZoJd485DdM6BCw
         T3h2WIwQ5nLNrErLGMvbuQXkZkbGoZziiwrERLdsiT+F7tLrTdmJvB478EtmLZkAjWoN
         lzLsLEK+UevAFLC+Xc8lsV46nokfrbmXf/+EgN3gogDDQaer5Y5hm5tNb027X8VszarJ
         CD95PlrjDNTafHCzylRM9G8lKTpfC/nrCaCq0VEyUENbMCI0RJebPviphSohA0x+71u/
         EDkA==
X-Forwarded-Encrypted: i=1; AJvYcCX/dL1ljEykln9j9ZoAZ60DFHOg+fTX4Im+3UvJfo6NMxC40bu55QF7bzqKIYBKM0wPCjTXuFh4DnqGtuJhLyiUUF9a@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsfFqkAwgl+2Zs3SWzDCjr9jzPR3gVa6LGAyV3lDHaslVP1Ez
	1j5CRsynLqxhIckbsa4/pC1gkCP2j1J9wHxwiqZ+BRutyTWqsV98/vv/SI/pBr+3o9Aysi/MvbG
	45+0Xmwy4ghoHXcMN6c6+sVcvVbs6FsT2RZT7yWA=
X-Gm-Gg: ASbGncswv9jb6am2hqHjheAFcc6drHXcHFsjVgeFklQ+v5vlWa9ZF5uK50YJblwd9sk
	WwjdkqONHfpJIKzFu3i1tw0FsIXGiCYX2n7FXDkL5HFBF2noqAQEreLZRsLbKXhd7JXOpzTgtR9
	IIohq4MclWkqL2sk4PNMfYaMoTE/Bzbg8Dl+oVY7k5LcmOdXmuPWXCaHvYu6MLY3Q5tcBEe/Ibh
	9Pzq54k7g==
X-Google-Smtp-Source: AGHT+IE5VaPYVktNxl+8Tttc4whkPQc0OW/lLs3wngN7zWheS5CTiP4CFs7zNv0c5xjPegvjDYBuNLCtxYLX7CLM1G0=
X-Received: by 2002:a17:907:e84b:b0:ae3:b2b7:7f2f with SMTP id
 a640c23a62f3a-af619414091mr310396266b.40.1753455036760; Fri, 25 Jul 2025
 07:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725144444.210043-1-hansg@kernel.org> <20250725144444.210043-2-hansg@kernel.org>
In-Reply-To: <20250725144444.210043-2-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Jul 2025 16:49:59 +0200
X-Gm-Features: Ac12FXxnNySxb0HZPn4jbKKCJgD9Z9LSlPWjaW3WGJQP_PI30QJNqkWWC1dO2Ms
Message-ID: <CAHp75VcftCLTqRV-s3LNEHLFmy359CHx0XDDcWpdV=eoe_C20A@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: int3472: Rework regulator enable-time handling
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 4:44=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Instead of hardcoding the regulator enable-time for INT3472_GPIO_TYPE-
> POWER_ENABLE and -HANDSHAKE, make int3472_get_con_id_and_polarity()
> set the enable-time.
>
> This will allow overriding the enable time through quirks in
> the int3472_gpio_map[].

...

> + * @enable_time: Enable time in usec for GPIOs mapped to regulators
>   * GPIO_ACTIVE_HIGH otherwise

Make it enable_time_us, it will immediately give a hint in the code
without going to here to get units.

...

>  struct int3472_gpio_map {

>         u8 type_to;
>         bool polarity_low;
>         const char *con_id;
> +       unsigned int enable_time;

Wondering if this can be moved before con_id to save a few bytes on 64-bit.

>  };

...

>  static const struct int3472_gpio_map int3472_gpio_map[] =3D {
>         /* mt9m114 designs declare a powerdown pin which controls the reg=
ulators */
> -       { "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER=
_ENABLE, false, "vdd" },
> +       { "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER=
_ENABLE,
> +         false, "vdd", GPIO_REGULATOR_ENABLE_TIME },
>         /* ov7251 driver / DT-bindings expect "enable" as con_id for rese=
t */
>         { "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, fa=
lse, "enable" },

Can we actually either use a macro or at least C99 initializers?

>  };

...

> +                                           unsigned int *enable_time)

_us

...

> +       *enable_time =3D GPIO_REGULATOR_ENABLE_TIME;

_us
_US

--=20
With Best Regards,
Andy Shevchenko

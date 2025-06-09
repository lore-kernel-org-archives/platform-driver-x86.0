Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D23165F1A
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461686; cv=none; b=SPWU7qrFXoOuvvyhP4R/qh+TYNnmVc4pcmyq5We+9caEWygneqcHrcH/Zg3hHGv1KY2458fTY/1dI4is+nBUiAetayT4F1D/ynrHmhNRMn8ugvItff3NR4K5R7UnqfRCuP+LWUyc/KNMi+OtWxJskIZIrI5OioWx2IaFBrQWY+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461686; c=relaxed/simple;
	bh=v/y+qatyxRus51ILEHoQhQN+tLZNnSLyS2z5dyozyoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ya4mTP7qCfeS3xJiEi1FKy9R62vypx4Jvbtj1xievOI1BtTS2n0kvCbDvlJG1ThkqkghIVD6TSwJGeBkVZT+ducH1lU1C5vngCZQi5ea3Hyi8CAUyKtmuwtToaClxLrAMHYV50AbF8ahEbg9YghhSaw9rsNwrrzKTwU4TtbLnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2+7HT+M; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2+7HT+M"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-addda47ebeaso797647266b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Jun 2025 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749461683; x=1750066483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6QhuNvgNxRbpAYw60Mb0Fc4gBjJ7fnV6E1Z30xC7bc=;
        b=j2+7HT+M3n2uWQB5ePIGHsmaB7X0Lf2vcALnItOf7uBGCuEFZNP5V1a95urFdv3obO
         AmMWfve0gdNLY2h1TkxWliJ5prGQGcKRaGL3bmvNQCKEXQQiFgsMbANMmubR3LjRv4YW
         WgIHZe8O/6RMRkM2+qcQaZv1gYFBXw37kuhMqklKtHiI37gnxqnZ4RbokPg6jXm20x9H
         Tqj69zqCNZCMEeSs2zxzCkMsIf4q492WrxzVmdYjMSHgAbtj1+Yo7HNi1mEqFQG/Vbph
         NoT0EOlTIt9A2aZKY618K9REwTW8grKmA0btJt4Xf+GQAF05/EMvnnI4dtKWrJTQQD1Q
         YHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749461683; x=1750066483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6QhuNvgNxRbpAYw60Mb0Fc4gBjJ7fnV6E1Z30xC7bc=;
        b=LMSTYIJv+RESiRNXr9GKmBm+KuCwK5B//BJhda7U6Pgio3gf3gXNAeadd5x6V7HIp8
         rmpPEPHiXiLoYTI0y+U/4gr75oMQ2+6Mt3aQ2Vx/Z+8v6fe7E6OEm/QAXN4YIVn81MPA
         11Tk+BB569+BAr1igrd4/I6Df1TJaT3+C4TVDB4EeKhXL0qQoYU686LCNn6Z5Vq+SPDb
         1mzo9AmzaoIzhPJSiSdUEYisAf5eMJlwJpVPk8U9fhWMVJRu70IpylgwMKDNc8pKqHEv
         OJS+39orxMn6K4q1jbSA9a3dB84TJoJma1dGrFRZqQ6v/tierHjezmpcNP5lQyKit2m9
         HEBg==
X-Forwarded-Encrypted: i=1; AJvYcCW1a4jtze94he5b3zBEeWy3CqDRLB+ZSuuSQCxxahDBnOMYWP/WeklMRgSnaa5puAM+5EbDjBY/9u36ikIO76BtY+di@vger.kernel.org
X-Gm-Message-State: AOJu0YyPAl6fwBfeAUWbgK1qNZexcc/QC2SvEFFG+fQb8LIv3eQZG/R9
	2qe4PcOGYcvtd7m+gIZVktRygOBNMSQP7vDeb6k5ClMAm6pFREm6FKrfGvf5TMj2bKz7QZekun3
	6U0jaVMY0i7ByTHux8y+5dCXkZWKHwiTMtdWO
X-Gm-Gg: ASbGncszvABKCYkhdat8U8OAG50app0WaAMltkNgJ8OPCXYDZl+dV4Pi9Iv5YZadQBU
	6MJJqsmgrjRCwV3Yzv3wRFDA1pxcvka7UJkOPKKBG1e1H4wtMykpR1HNSd7aZBhxovJlM0mlEj9
	8r+taxktXqmNzFd4M0oPoVPCfD/dnpYBq/Ld+4u+kRyFVqNwURYl++JA==
X-Google-Smtp-Source: AGHT+IFNr9iKJhAa293s9HMNcUTLzMt2l7QfDY7pdDtR8Y+p8LR8L+wFVSM65+aU4Fl9VQ7WFDJi4sB9rXz2xmhhqEU=
X-Received: by 2002:a17:907:6d28:b0:add:f4ac:171f with SMTP id
 a640c23a62f3a-ade1a9e20c0mr1165327666b.5.1749461682952; Mon, 09 Jun 2025
 02:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608204154.37605-1-hansg@kernel.org> <20250608204154.37605-2-hansg@kernel.org>
In-Reply-To: <20250608204154.37605-2-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Jun 2025 12:34:06 +0300
X-Gm-Features: AX0GCFsedMYkVeKUehMMg540c4NJA5M0-0LVYsiG0XCOLi1S6UTc7IKCmRhbO08
Message-ID: <CAHp75Ver6pu-7PQePbUP4XMZxKBX4tTgwWzH4LgLK21E+aCpng@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add
 ovc-capacity-table info
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:41=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Add ovc-capacity-table info to the generic battery nodes.
>
> The values come from the ug3105 driver which currently hardcodes these
> values. The ug3105 driver will be modified to stop hardcoding this and
> instead get the values from device-properties.

Both looks good to me,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

One minor question/nit-pick below.

...

> +static const u32 generic_lipo_4v2_battery_ovc_cap_table0[] =3D {
> +       4200000, 100,
> +       4150000, 95,
> +       4110000, 90,
> +       4075000, 85,
> +       4020000, 80,
> +       3982500, 75,
> +       3945000, 70,
> +       3907500, 65,
> +       3870000, 60,
> +       3853333, 55,
> +       3836667, 50,
> +       3820000, 45,
> +       3803333, 40,
> +       3786667, 35,
> +       3770000, 30,
> +       3750000, 25,
> +       3730000, 20,
> +       3710000, 15,
> +       3690000, 10,
> +       3610000, 5,
> +       3350000, 0,

To me it sounds like a percentage and can't go below 0, meaning that
this is actually a terminator, so no trailing comma is required.

> +};
> +
> +static const u32 generic_lipo_hv_4v35_battery_ovc_cap_table0[] =3D {
> +       4300000, 100,
> +       4250000, 96,
> +       4200000, 91,
> +       4150000, 86,
> +       4110000, 82,
> +       4075000, 77,
> +       4020000, 73,
> +       3982500, 68,
> +       3945000, 64,
> +       3907500, 59,
> +       3870000, 55,
> +       3853333, 50,
> +       3836667, 45,
> +       3820000, 41,
> +       3803333, 36,
> +       3786667, 32,
> +       3770000, 27,
> +       3750000, 23,
> +       3730000, 18,
> +       3710000, 14,
> +       3690000, 9,
> +       3610000, 5,
> +       3350000, 0,

Ditto.

> +};

--=20
With Best Regards,
Andy Shevchenko

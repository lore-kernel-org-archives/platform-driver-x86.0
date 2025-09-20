Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8E1DA3D
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758367394; cv=none; b=j8oWNfQ5AXRsdLUiPvGlWnB3TFfZ+vwKi8iuSptBm9reLa0TyguNx0eshaJI4QbVr2XZurgkyGzBAkckpVPhd/xd0gr6JAS8NcCUxtS7oSIJG5r9baOS0Jwk/4OY6n7HBruMQSyTQGQ1rUjW15jV6sRuk4KyDwxgkT6zZ75g1Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758367394; c=relaxed/simple;
	bh=1CCoPqEd/yKz8xnOgfirS1uIg5glDSaaa2qfAaWqQRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ey3TJCeHAP2q1noEgwOy3O1GozFaTVonpWl63pg0m7x+5igqmVmkAT/ZHZu2Pwigqc4yelUV8j2O2aHhyzi/5FTgXIvi3GC5Gp0XoxXOYrYyFv8IwO+qNAR5qGKhJhOw1EbsdJgyYeJytJ6S4OxHQ48V/q9/gJHZTCU1JmCt/Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADkPIqjk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADkPIqjk"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b042eb09948so503304866b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 04:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758367391; x=1758972191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsaEFpLGHi+oq+I6AGVTn2qW//8mvBvN/eTlJYgsAe4=;
        b=ADkPIqjkFi3GqPc2tsXCJaFoXZrN253MvVptqyOumj6gUVSpkjfKDvMvZQQGECv5kG
         y92ypnniaovKDLAHgoj1HQRuebaWrzWfiSyathebyI7skDQQsCCGxJy+Tug4U709syFe
         rM/VEVN8ZJOXM/4u2/lY8am0Eespv/FGwvqATQK7yhweodttlQOAr/I1CY3w/unJ8avI
         yJBHuR+aljuPHOzPxj9KmQvJZFivxu0UFC5TzEtnoGax7H2qPFiiv2NSoW6muq6XTnLO
         fDGu1v2IlH4P1lUTofbl6siqM0DwflLaNPuM6ztrHrTv1XORZI4s8KNxhOvjz6JFeKTn
         J66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758367391; x=1758972191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsaEFpLGHi+oq+I6AGVTn2qW//8mvBvN/eTlJYgsAe4=;
        b=PP0NsvnaqKwnYBgL3DYHhrQAnwKwchQfPegeGmDLTyklWDd98t3aCKn2lTpm+9ZtkM
         7/kpjUSA8cBX+mF1YmACOrAofQs0fZqF/sBOTT+qt3Nt5dKSa4F+0z9iPqANRfoaNqGR
         c48Et7b6EBJwST08Vuqji2CaSbQuMH8+1LSsmjmlmBr6yJxwdKduuRLmEjGtCKuSl5U+
         kVgYcz0S6PRppCKf0MBWngPgOnUcGhItxn7gXWhTRdJRWWR5gpOF7A623pFuQPR/dUVq
         zQuME2p/dXQA4KgYBxW5Z8/m+MyNZChr3pxii/p+HD/hJT9B2M0l5U8XhleyksLhHp3L
         JcNw==
X-Forwarded-Encrypted: i=1; AJvYcCXAie7u2+s7jkeXScBd6e3ryIteHNhsQtJBz10BeVjxbkBKw8P4oITRU0+3YlX2v+UwzHaV1MK4P33S8dSVwzwnQplh@vger.kernel.org
X-Gm-Message-State: AOJu0YyP1JruXv6InQvlLO4Iv8B4nJmQPtlXfrFVoNH5meqn/1Y/0jz6
	SPqnOhkZ1hJw4ncxKx6Y3hZgF1fOJO6lkdUkcDvszvb+eU9ifA02m+Ih5XdDijwkYmeM0F9P9m7
	vHwGI9PXryPEh1qFb0T7ZYTPqRtiP2io=
X-Gm-Gg: ASbGncsKsnt2LbGFzTfkiWrwFq4CcWaJlJdMcVrrBOcBEPBUQ3lH2K+27f7KxdNPisv
	Zafi9iQ/23f21ptHdT9qa9uP6Kc3YlQSTBXVdqPQCfoEaa4Dc27XE43MhX0pw+5WBHm8V2EYW8E
	ATEEnZN7541HB9hX7KSfGOF+26mxoysmdekCRTfQCjsAtbYLmTsZgAQUuMtK+qYd4C9PP33mgbX
	jr3bDA=
X-Google-Smtp-Source: AGHT+IHhohKjilWlG3i24BvVP0/pedlNZ/34S9BoxznHLr+0qXcHxdER9oWpSD2YE5NkGPH94TVMgX80qAvvVJOB9qU=
X-Received: by 2002:a17:906:c155:b0:b04:2212:4211 with SMTP id
 a640c23a62f3a-b24ef9754fbmr810473166b.16.1758367391232; Sat, 20 Sep 2025
 04:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919204742.25581-1-hansg@kernel.org>
In-Reply-To: <20250919204742.25581-1-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Sep 2025 14:22:34 +0300
X-Gm-Features: AS18NWARi8xfpHuH-m8VbHvEX0Qk3Q79DzeGsHQVhtUMtz-HegdieOGT2ZlBj6o
Message-ID: <CAHp75Vdw2-kvtEs_m4FSb5i59P1Qs-VFv88_tMxua+dYoZhs1w@mail.gmail.com>
Subject: Re: [PATCH v3 00/19] x86-android-tablets: convert to use GPIO
 references + Acer A1-840 support
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 11:47=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> Dmitry's v2 cover-letter:
>
> "This series came about because now software nodes can be used to
> describe GPIOs (via PROPERTY_ENTRY_GPIO() macros) and I would like to
> eventually get rid of gpio_keys_platform_data structure.
>
> So while I was doing the conversions from GPIO_LOOKUP() tables for
> gpio_keys devices I decided to convert the rest of them as well. Maybe
> some time in the future we can drop support for GPIO_LOOKUP() and rely
> on device properties exclusively."
>
> Changes in v3:
> - Add missing pinctrl_put() in lenovo_yoga_tab2_830_1050_init_codec()
>   error-exit paths after the pinctrl_get_select() succeeds
>
> - Adding a swnode to the yt3 spi device changes the name of the SPI/codec
>   device and the sound/soc/intel/boards/bytcr_wm5102.c machine driver loo=
ks
>   up the code by name, update the machine driver to use the new name.
>
> - Make yoga-tab2-pro-1380-fastcharger.c propagate the fwnode set on
>   the platform-device to the serdev it creates to fix this.
>
> - Fix the commit message of "platform/x86: x86-android-tablets: convert
>   gpio_keys devices to GPIO references" which contained a stray reference
>   to wm5102.
>
> New patches in v3:
>
> - Change sw_bat register mechanism into a generic swnode_group mechanism
>
> - Use swnode_group mechanism to register groups needed, instead of having
>   init() callbacks manually do this
>
> - Changed my email address in the driver to hansg@kernel.org
>
> - Rebased "platform/x86: x86-android-tablets: Add support for Acer A1-840
>   tablet" on top, switched that to also use software-nodes for GPIOs and
>   added it to this series
>
> - Some Lenovo Yoga Tab 2 support fixes

I'm in favour of this series,
Reviewed-by: Andy Shevchenko <andy@kernel.org>
with some nit-picks here and there.

--=20
With Best Regards,
Andy Shevchenko

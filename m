Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE65B5CD
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2024 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707577609; cv=none; b=atbpbE4RZ0FvWu3wmN67yeJRIUgI5jshiHTAZqT59FnuwGxNTHz6FtYx+MV72D4Npk8MvKr+5YCvVpn0ASNUeedeipADRfNWzj0UuMO+D0lQnOLkfHWV9Y/I+4k6MQycNVBUpaTLUndS3kQNBgUHroQNYe5DNjgW4+gxzTTP5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707577609; c=relaxed/simple;
	bh=40xukRG2sUiCPOqxDGjgdcV+DdP/xeoK31R+vVnfXaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cS4yT0D8DQWklKNM49WIdOm8IQsrYcvt9Xq1p+kK3JoBslDBdSn8LcCfaD8U1/gOkfZc5+vRl49b0n20rKIt8t+/eduTvNFPVFJsdZnn2/ATc5VF7U36kQ/RmGokIMUafml6J0iXetzE3hfjpfEHGFj1IIGXm97RCixF4cj/aIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsLjPWHq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsLjPWHq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a3c2efff32aso44390766b.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2024 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707577606; x=1708182406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40xukRG2sUiCPOqxDGjgdcV+DdP/xeoK31R+vVnfXaY=;
        b=FsLjPWHqj+4I7QP0k6K9QofMtMJ8UOBB8ggqbyyPi+xICoPg5e3uS7eOqEYe5QWLfW
         xwUhs7ExBLrU8UNJm9LOPTkQE0oTINFUZ/6Wm6LzZgpuWydTuJkqMGuL7PVx4U4JWhNu
         NpykGVkKnf2BTcdwnG1LibCU8pznRTfT+YGGvqTvR8eSggLZK8S77SxIGpBDSp4/TAvG
         mcqqGfP08fJ/kwgAtwo43rKNk64D0kPoT16LhABuznF28PvyIMgbSyugKsOv0GAzpPpy
         PLYUfUsQXvINZNSOXIQlTCtWUHHjkuoJlCQ999xzwptFdOkOAMPtRwnBwEq6JjWHCyVM
         COhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707577606; x=1708182406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40xukRG2sUiCPOqxDGjgdcV+DdP/xeoK31R+vVnfXaY=;
        b=dYoamSQGa/GenTuv3SC8SgPdtborwZSyNXKGoBhaKEW9DkyA33k5C31W/RjijZYffy
         mQAkkVxdAVzvc0OWP/33xPPhqOBAeZGFR93ozc2m33bODCmvALXiZk7aN9mtrjsF0lOb
         QKSGlApVdBzlgBi12NxdRf2gk5OJ48wVPyHbh3H4qSb9vxwyXXMXI/olZR1k1xwlNKwI
         dHKThI9wqVaHC8pRvrh026wdWuD6XF8CAA+bPO1p1p2GVvUOAN8VdniUFqTBlZX1Q/w0
         W+BOXjDpwyoqYbjxO3cLjmp49KiLjhril70L8UcV2LiVLZnqJeHe75h7b7Rdr1IeKvGl
         PU3g==
X-Forwarded-Encrypted: i=1; AJvYcCU2+vmmhVoDqz0E5GncawPo0cI1PqcSWzwSs3+um3s1rLQ+wfS2FKM9wZBkfrvNdvcLL0Oj7ylA59qjgnlyxYzcVskvWyk9HJJRoRWVygQqTkQbkA==
X-Gm-Message-State: AOJu0YwGeyd3YhrhAASXhdbAtPYepdtTGxuoyKTVJuGrJ/UJo+o2kRJt
	HRha7XOUVxRc56qFi4MH2UOFKq6VyYl1gwmppBB81qwK7Yla4HLNAdIaTSSa/vaGW68zcb/eNAh
	4X8AAeM3ISd4v3Q54+6b35VT02jznSIseROM=
X-Google-Smtp-Source: AGHT+IHoKokFJGkjY8QxLWmzAKXxrrH+5pZSX8cO/ZKwZT8U6ck0EPKdasmH5CQWbhcESGP8dh5O9db+vF+axKfJ0+I=
X-Received: by 2002:a17:906:454c:b0:a3c:3ea9:ce43 with SMTP id
 s12-20020a170906454c00b00a3c3ea9ce43mr1030021ejq.75.1707577605780; Sat, 10
 Feb 2024 07:06:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210110149.12803-1-hdegoede@redhat.com>
In-Reply-To: <20240210110149.12803-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 10 Feb 2024 17:06:08 +0200
Message-ID: <CAHp75VdR+zVWvKQo_GWng0YZw=oJxsYK7z1MoZUvfaJK2E8HKg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel: int0002_vgpio: Pass IRQF_ONESHOT to request_irq()
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 10, 2024 at 1:01=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Since commit 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler
> for SCI") the ACPI OSL code passes IRQF_ONESHOT when requesting the SCI.
>
> Since the INT0002 GPIO is typically shared with the ACPI SCI the INT0002
> driver must pass the same flags.
>
> This fixes the INT0002 driver failing to probe due to following error +
> as well as removing the backtrace that follows this error:
>
> "genirq: Flags mismatch irq 9. 00000084 (INT0002) vs. 00002080 (acpi)"

While this seems the correct fix, I'm wondering why this driver can't
instead subscribe to a GPE event. See how gpio-sch does this.

--=20
With Best Regards,
Andy Shevchenko

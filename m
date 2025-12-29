Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16427241CB7
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766996291; cv=none; b=b0TAb23wOYsWqMoWMHOdv/RCQNa1iCifj80Z7tS5Yxomtr+vDB/tbholFR9spyB7Al1aFb8nFLKYwMKRgIh6FN8o+2yLq0pdQeVAuPCDTnFGP42x7nTcatDC+x6SNPakr2YaHskwUMb3PJqoOVRgEgvgrPIj61NEizWih2DEn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766996291; c=relaxed/simple;
	bh=X5aC0WSpXnb0fZ/ZqQSEMAsxQxdXxCbrq/9IOVYaCYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGwcRTjTI67eF2ole2OYXuBmZCVpMyI9hhmXO95iYYG9WNmoKMcGXwLjqA3gJ/SLHgCSqrs7BaHbjJnGf4ow5WyHh7284G6z4pHzOVXFcU/doJxWfwiBBknBpxF8jtwsIrt6vI1+6dMwI2J7scXc0tJ1uErsx2pwdZkuH2E2SLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlYB8kVX; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlYB8kVX"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64669a2ecb5so8258712d50.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 00:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766996289; x=1767601089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5aC0WSpXnb0fZ/ZqQSEMAsxQxdXxCbrq/9IOVYaCYI=;
        b=AlYB8kVX25/p1KA3OPyf3AsuRgT1uhnQ9GlzQ5GuQqJ+3Pq5e5XbQcUeD9x4gUCTRg
         5oT8qAKR41WGUcnmsc092/0qofrVicw3c9lI5WaTC6Iw52FRkfzs7UnYXO6nbOfttCdw
         m1KppJ66ATLhjM0MsGiAGgStDMO4FsJy3QzjC0EtWY8zy9P+sMZcJT36TV0rl1z6og1t
         eup/X/WvjFmhTiVARbLkRltD5hkouNUXEq/wOcb03B8GxSLL2DOYB7pN5epikoMpdh/d
         eI8dEDMcU4TuLEB9Be5DoG096PtkyEjK3AhjTp5b8zwt1JgRJNvwiVBcIYRDxv2AZXSz
         3t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766996289; x=1767601089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5aC0WSpXnb0fZ/ZqQSEMAsxQxdXxCbrq/9IOVYaCYI=;
        b=knGOVonJy8BQjS7z40cumX6pwz1M8BUaYd08R0EAlC3k2hTVanxsnlwZP0FWifWJmK
         8Jy9dm52CVoGpj7N4xQ0dT0v1nOZgDvEmZbOD2tzYcc/NnhwuUbYq6rlMeM1OObAa2uC
         mR/E3XuEaC5mpliA+zdrljOCfYX1s6x2lfQjWChudO4vD8Rd7nZobJPd2QRgT+S6ZfQk
         CvHgGwVkxV0oJKae1rgJHI63kpMTmf4vwdQOtKyWQeHG11FSbAoHpWO4gHegV/0Zq3Cb
         aITNYxyg+WUHXa2v1YQo06SWKj8OqjcHHIz8NTQ6F/5hMCWusCW6NfWIFqxIvFUykhZi
         7KQw==
X-Gm-Message-State: AOJu0YwcLusBuK7qq8pH9ZZErv5UETKh739lKi61ar8Ghw7v5BvHSyfO
	tWgA3vFVCcQiwxxRuceNXaMzi7QCPWd5Hy87mDtV9AECDvKe5LIg2JMrk7o2LNu114VPeib3Aoa
	JdUbV1YEHo2O6KPOgZIY9r2c8QDZHt46WcQ==
X-Gm-Gg: AY/fxX7Xrm4PRimXMvwhn63vCiLvos5pGedoJcf6cZ2H5tRJYWUQpgD2R+o6bLfnBEX
	psFC+vgDKCdhxPibBKZhIaqkOrZXNG9QOZczAnO00oWu57k4Dp3gYmMVQshYzjThRFtkqNvc+c3
	9/AX5IMBGkH9B2N/KJbseuqD4je+1VW7Y9A/hSdlw6+UsivO81uNMeTej8SvIqbnebLpFbOdDvZ
	8I81QG+ukaf+FjjpRHWouA04gl1ZznV3QpFVnMO1KViH2W3ctsgTSif4NFsMFdFx0f69KeJoq0e
	qheGvqrDA3WSYssxndgMqui3rbemUw==
X-Google-Smtp-Source: AGHT+IEjKREascVU5P1eBeymAz92LoWdcukHRx09eF464pg7VeSVTe9y6CdmBZ7i2lX8Xtt2KN3qET6E5sO8DjIAalQ=
X-Received: by 2002:a05:690e:2519:10b0:641:f5bc:6930 with SMTP id
 956f58d0204a3-646632e007bmr19394392d50.41.1766996288848; Mon, 29 Dec 2025
 00:18:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
 <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de> <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
 <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de>
In-Reply-To: <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de>
From: Pranay <pranaypawarofficial@gmail.com>
Date: Mon, 29 Dec 2025 13:47:57 +0530
X-Gm-Features: AQt7F2oyMHpMWTMlDdvyzspdA41qTo7m8KcT5opvEhjIl4nlXwvWF_DVA6GJQ2E
Message-ID: <CACy5qBY-6v7_jRizJ=dJkeKGF+4fVUwmX9oaP=8XHGROEYOgCA@mail.gmail.com>
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes this patch is making the driver work as expected. I had modified
the acer-wmi driver and loaded it, then changed platform profile to
balanced-performance & now fans are able to reach max RPM's. But in
performance mode (Which is supposed to be powerful than
balanced-performance) the fans are still max locked at 4500 rpm only.

Thanks & Regards,
Bugaddr (Pranay Pawar)

On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 25.12.25 um 22:51 schrieb Pranay:
>
> > Sure here you go, in attachments
> >
> > Thanks,
> > Bugaddr
>
> I attached an experimental patch that should whitelist fan control for yo=
ur model. Can you
> test that fan control and the nitro button works?
>
> Thanks,
> Armin Wolf
>
> >
> > On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
> >> Am 24.12.25 um 20:40 schrieb Pranay:
> >>
> >>> Dear Maintainers,
> >>>
> >>> I am reporting a limitation in the acer-wmi driver regarding fan spee=
d
> >>> control on the Acer Nitro AN515-58.
> >>>
> >>> The Issue: On Windows, enabling "Performance" mode via NitroSense
> >>> ramps the fans up to 7000+ RPM. On Linux, selecting the "Performance"
> >>> platform profile boosts the CPU power correctly, but the fans remain
> >>> capped at maximum 3500-4000 RPM.
> >>>
> >>> Observation: This laptop model lacks a physical "Turbo" button. thoug=
h
> >>> there is a nitrosense button which is useless in linux.
> >>>
> >>> I am requesting that support be added to fix the maximum fan speed st=
ate issue.
> >> Sure thing, can you share the output of "acpidump" to i can whitelist =
your model
> >> for fan control?
> >>
> >> Thanks,
> >> Armin Wolf
> >>
> >>> Best regards,
> >>>
> >>> bugaddr
> >>>

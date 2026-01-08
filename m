Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F1D320CAC
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 18:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767897618; cv=none; b=bQUqlZ96xN1Lw+q1v5fKNXZK1iXLjmweCaIc5Ymg8J0XZVA1A7FJV9SJOOuEw5+SO4O+0fpahJB/NVFYgrYlQ2mS5rkBHMX+lW2Fv9Y3db+mlG9BoGV/jQxrtLUYsyZ23GJHyDf4eLa6gByPk+xNigMV9qUXNmTPJLyzDxtbfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767897618; c=relaxed/simple;
	bh=MbfycOko/a+ywg01J0CLxx3gdlsDBolR3mCciYDpazg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSd4DzQVThyaYZ0Dzl8oUaDcJ3qypcwMUxhfyoktElgk/O9mkf8/KAsCAND/IDgNedEjfu5t/K/aR5A0DEfXkNeJjDLub7+ov8rXaIkTfOIy11zgB7cuwLyURQUJ1zAMmP3aE35uU1XZvSm57Cj40/URq4BcMOgfB+lmqR/QiAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzmtdHqe; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzmtdHqe"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-644715aad1aso2815948d50.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 10:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767897600; x=1768502400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbfycOko/a+ywg01J0CLxx3gdlsDBolR3mCciYDpazg=;
        b=OzmtdHqek63wgw29Kom0CXLf8E6cGV0fyiX92kC7VTgyAIo0k6TPUtlcDGbcyJiIvd
         yE94D7UuIKQxm73GV4FVOIvND9a46kXNpWGQlnl9bLSmy9PfKR5dh4ZdeZNGnSqtUxN7
         aX33AJmtqVzUUThbLct2xPf+G/LRQ4OCY0/gBhy4zYqBZHhJ7P/vpQkFFSPm/+Zzh/q+
         R/F0LGye2JsybPLovI+6y6rFxGJVgZ9/r3JveIh64NZaQMTg/Qx5v8EOSOAoOAJUVtnJ
         GyL9i2gwXMhnbJrtcIFWYOsDKT/Z/ilT3ptsemUetCAZOliikdw4pePIWkmc1qX5r8Ne
         nFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767897600; x=1768502400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MbfycOko/a+ywg01J0CLxx3gdlsDBolR3mCciYDpazg=;
        b=ooEu8mSQOfzDeZ7I1JKO804ehg/PPHUOQqT3uIAKALT7r2dl+lYItTcHRUvKkDLmFi
         n9A8AnFPCHPhHsjTHAZGx84Q2C/LpvB101YYD+v3NbZjU+jhKdjx/URJfsbAm7PvkAXM
         lTIc3IAc+3P0yA9QCGTEEpUOiV/+7MqInzdCPSD3qYgD8muJopV0bCMNhN6XgXCpMC4U
         ga1jisp8kvnlYT7nG0xvFRzPBomjl1oWDaMw2wun4YuWtcAqLZnTbZebKKpKochreo2Q
         7rWhqElER8aZLb7ru1w5IS+kSztrN0/bCGX4nPg+arZBCL6WGeUH9cXvgInV0ylSmb6z
         VyuQ==
X-Gm-Message-State: AOJu0YxBKFUjPvb1X1CEOiCTfVdFYH4tPLKJRlEaZcmur+ef7urQEqEh
	2Gj8Yz9VAWXuYB/+p9MPvsETSxqHc2sRoW5ncdtaMTptxC4UpZ7A1AoWa9lY6Ilgx0xwnH80tUP
	XGWC2bDLGPrR5L8EUnSTIMBYx0e4zMXwGooW3
X-Gm-Gg: AY/fxX7dBhfFUkuVKJqNa8t68PwM7iC92J9wLkEEIpxee25QxFJ7KFChtikk11Lna00
	TjXAn/SNLnItsxcHjUGLtO+QBChHy4WCuwOAbYoqNpuyLQty/ALWo2Xz4whp+gqNj4/S4y2DVvi
	hbtkzN/GKqcjiwXF3H4guI4C1rzYEOcIvqYDHeundZQrkVEw1JU3nblHSNmEUzA0xMqWIM+k7Y6
	PnkE9Cu1q+WMvtl/7ZCvEBpcn7FWctFQ/Br36lh4XnlyCR2z1bOtOpU2cZUgZ/py4YUPshMAct5
	hMwEIkzP/4141GOtKGKdQbiW0lzf
X-Google-Smtp-Source: AGHT+IHxb5h9DGQ1G2el7BMdret58F8b7uuLjYWlvSkAkXd6S0aLYdOzifjSj/IkDovlCJ724B38hmxEZdTnkFwZFw8=
X-Received: by 2002:a05:690e:169c:b0:641:f5bc:692a with SMTP id
 956f58d0204a3-6470d2f4069mr9549298d50.35.1767897600453; Thu, 08 Jan 2026
 10:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
 <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de> <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
 <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de> <CACy5qBY-6v7_jRizJ=dJkeKGF+4fVUwmX9oaP=8XHGROEYOgCA@mail.gmail.com>
 <CACy5qBbgvgLa-y-TXz9ChaC1pvCAgKjQbU+=0Zd3gm-qyHHW_Q@mail.gmail.com>
 <655738e4-6128-4b43-aabe-b0eb0da0a0c7@gmx.de> <CACy5qBZmA47D1G9Ma5V+yn4bcZZYg98JCGtXeKX212FFUoo13Q@mail.gmail.com>
 <CACy5qBaPBFwZ6d735fNbtC6_U4r9imzgeLuYpBuj0ckBXVDhPg@mail.gmail.com>
 <fec3a103-1205-4584-8975-c8765f8a2efa@gmx.de> <4d1406ba-818e-4d3c-8e57-759e405e6576@gmx.de>
 <CACy5qBbWn0xcPKXCWRv+t8_nHea7=iwW0Jyo5dbHqfwPg-JO2A@mail.gmail.com> <dc8c4eaa-0364-4617-b823-7f1319ae17e4@gmx.de>
In-Reply-To: <dc8c4eaa-0364-4617-b823-7f1319ae17e4@gmx.de>
From: Pranay Pawar <pranaypawarofficial@gmail.com>
Date: Fri, 9 Jan 2026 00:09:43 +0530
X-Gm-Features: AQt7F2qXcl_NTMkOEGqpZHIAGvdpSWjEDScGmOJJYdoI5Uv5IUUi9XnVz3IBrh8
Message-ID: <CACy5qBY-HWOdVMWveSFeD=7U++y3Rjd575fpC_2_vicC73AECA@mail.gmail.com>
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Still no output with acpi_listen

regards,
Pranay Pawar (bugaddr)


On Thu, Jan 8, 2026 at 9:29=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 08.01.26 um 16:56 schrieb Pranay Pawar:
>
> > No There is no such logs in dmesg.
> >
> > Regards,
> > Pranay Pawar (bugaddr)
>
> Strange. Can you check if "acpi_listen" does report any events?
>
> Thanks,
> Armin Wolf
>
> > On Thu, Jan 8, 2026 at 9:15=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
> >> Am 08.01.26 um 16:35 schrieb Armin Wolf:
> >>
> >>> Am 08.01.26 um 15:38 schrieb Pranay Pawar:
> >>>
> >>>> Hi Armin,
> >>>>
> >>>> I have tested the suggested sysfs attributes with the patched driver=
,
> >>>> and here are the results:
> >>>>
> >>>> Mode: balanced, pwmX_enable=3D0
> >>>> Setting this to "0" successfully puts both fans at maximum speed.
> >>>>
> >>>> Mode: balanced-performance, pwmX_enable=3D0
> >>>> Setting this to "0" also puts both fans at maximum speed.
> >>>>
> >>>> Mode: performance, pwmX_enable=3D0
> >>>> Setting this to "0" also puts both fans at maximum speed.
> >>>>
> >>>> It appears that switching the attributes to "0" does correctly trigg=
er
> >>>> the turbo mode for the fans.
> >>>>
> >>>> Thanks,
> >>>> Pranay Pawar (Bugaddr)
> >>> Perfect, i will send the associated patch upstream then.
> >>>
> >>> Thanks,
> >>> Armin Wolf
> >>>
> >> I forgot to ask: do you see messages similar to "unknown function numb=
er - X - X" inside the output
> >> of dmesg after pressing the Nitro button?
> >>
> >> Thanks,
> >> Armin Wolf
> >>
> >>>>> On Mon, Jan 5, 2026 at 10:31=E2=80=AFPM Armin Wolf <W_Armin@gmx.de>=
 wrote:
> >>>>>> Am 30.12.25 um 06:54 schrieb Pranay Pawar:
> >>>>>>
> >>>>>>> Sorry for the confusion earlier =E2=80=94 after rechecking the be=
havior
> >>>>>>> without the new patch, I=E2=80=99d like to clarify the results.
> >>>>>>>
> >>>>>>> ** Without the patch:
> >>>>>>> 1. The fans are able to reach maximum RPM only when using the
> >>>>>>> balanced-performance profile.
> >>>>>>> 2. When selecting the performance profile, the fan speed remains
> >>>>>>> capped at ~4500 RPM.
> >>>>>>>
> >>>>>>> ** With the patch applied:
> >>>>>>> 1. Manual fan control is unlocked, which makes this patch importa=
nt
> >>>>>>> and effective.
> >>>>>>> 2. The fans are able to reach maximum RPM only when using the
> >>>>>>> balanced-performance profile.
> >>>>>>>
> >>>>>>> So the issue is specifically that the performance profile still k=
eeps
> >>>>>>> the fans capped, even though it is expected to be more aggressive
> >>>>>>> than
> >>>>>>> balanced-performance.
> >>>>>> I see. Can you check if the fans reach their max. speed if you set
> >>>>>> the pwmX_enable
> >>>>>> sysfs attributes below the associated hwmon device to "0"? This
> >>>>>> should switch them
> >>>>>> into turbo mode.
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Armin Wolf
> >>>>>>
> >>>>>>> Apologies for the misunderstanding.
> >>>>>>>
> >>>>>>> Best regards,
> >>>>>>> Pranay Pawar (Bugaddr)
> >>>>>>>
> >>>>>>> On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay
> >>>>>>> <pranaypawarofficial@gmail.com> wrote:
> >>>>>>>> Yes this patch is making the driver work as expected. I had modi=
fied
> >>>>>>>> the acer-wmi driver and loaded it, then changed platform profile=
 to
> >>>>>>>> balanced-performance & now fans are able to reach max RPM's. But=
 in
> >>>>>>>> performance mode (Which is supposed to be powerful than
> >>>>>>>> balanced-performance) the fans are still max locked at 4500 rpm
> >>>>>>>> only.
> >>>>>>>>
> >>>>>>>> Thanks & Regards,
> >>>>>>>> Bugaddr (Pranay Pawar)
> >>>>>>>>
> >>>>>>>> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.=
de> wrote:
> >>>>>>>>> Am 25.12.25 um 22:51 schrieb Pranay:
> >>>>>>>>>
> >>>>>>>>>> Sure here you go, in attachments
> >>>>>>>>>>
> >>>>>>>>>> Thanks,
> >>>>>>>>>> Bugaddr
> >>>>>>>>> I attached an experimental patch that should whitelist fan
> >>>>>>>>> control for your model. Can you
> >>>>>>>>> test that fan control and the nitro button works?
> >>>>>>>>>
> >>>>>>>>> Thanks,
> >>>>>>>>> Armin Wolf
> >>>>>>>>>
> >>>>>>>>>> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@g=
mx.de>
> >>>>>>>>>> wrote:
> >>>>>>>>>>> Am 24.12.25 um 20:40 schrieb Pranay:
> >>>>>>>>>>>
> >>>>>>>>>>>> Dear Maintainers,
> >>>>>>>>>>>>
> >>>>>>>>>>>> I am reporting a limitation in the acer-wmi driver regarding
> >>>>>>>>>>>> fan speed
> >>>>>>>>>>>> control on the Acer Nitro AN515-58.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The Issue: On Windows, enabling "Performance" mode via
> >>>>>>>>>>>> NitroSense
> >>>>>>>>>>>> ramps the fans up to 7000+ RPM. On Linux, selecting the
> >>>>>>>>>>>> "Performance"
> >>>>>>>>>>>> platform profile boosts the CPU power correctly, but the fan=
s
> >>>>>>>>>>>> remain
> >>>>>>>>>>>> capped at maximum 3500-4000 RPM.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Observation: This laptop model lacks a physical "Turbo"
> >>>>>>>>>>>> button. though
> >>>>>>>>>>>> there is a nitrosense button which is useless in linux.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I am requesting that support be added to fix the maximum fan
> >>>>>>>>>>>> speed state issue.
> >>>>>>>>>>> Sure thing, can you share the output of "acpidump" to i can
> >>>>>>>>>>> whitelist your model
> >>>>>>>>>>> for fan control?
> >>>>>>>>>>>
> >>>>>>>>>>> Thanks,
> >>>>>>>>>>> Armin Wolf
> >>>>>>>>>>>
> >>>>>>>>>>>> Best regards,
> >>>>>>>>>>>>
> >>>>>>>>>>>> bugaddr
> >>>>>>>>>>>>

Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5C824DCE3
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887801; cv=none; b=KJmQKDukAXC2RBYFFVe0qCmKuUaaSwnZh8WOF4oFx7+Ea1V7JLdpNrRfNPabWiwjOYC7aqG5ZJT6YJBCI4ly4lpvXqm++XrDiHMymI8f5p582ZvFwjsLC4F2njrP+ZNJXEnigSg9TbCzf0RbbOnCjS9CAtYBlaaEyfnE8yTshjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887801; c=relaxed/simple;
	bh=2enPeSTFtTUjyXeGBdgnjIIdHpKrXATegSNQZyYO1J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fySLkpHPVJUTasuMSoosXhRWAuebz/+cSh0fmE6xigJBBl0zDELXtbTqAj4FHypiD2UyLbXYh2IlAK69YGdNxQx8Oc4BTVXz6U2ZE99gqbMHtgZeuTA8lLPQbvAsiofazUaxv0vwbvE3kfThWVz9siKW4ZI58M/5akWRKAAriXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUHShDUH; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUHShDUH"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78d6a3c3b77so22608797b3.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767887799; x=1768492599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2enPeSTFtTUjyXeGBdgnjIIdHpKrXATegSNQZyYO1J8=;
        b=DUHShDUHKzRfgiDcReHhQHWaCKkkCsgSJO4D4eWyFrkgiG2gfun6RhrRhsOMhy1ZS7
         PHcdgZJ/nRz5XvBE2rz3ijFdFkDtI1B5YZUWtCHVxoiDnP5k/DIF6774PUgZVCEJeomx
         z+JCu0uWlAL8fPUtZM+0XEehOLCxSr2TV4UcdGpzR+44tLD50kow4LXgRC31GwTCLL1b
         oWGr+t//bBWfGHiAcSUioVqxVsAHv2wEdQ1UOADnKE41vu15396LTEXd3EeGGieqHOoS
         rkVkFJ/5sbwQo71xOqPkxrLP3o50UdR+3shrew/F4eTyKntx7QNs9wffJm65xaJFxygJ
         J1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887799; x=1768492599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2enPeSTFtTUjyXeGBdgnjIIdHpKrXATegSNQZyYO1J8=;
        b=HvTmIpt0eOyqe28KPwDuCwDV8dXmDVoxYAEEh4XrvVM+ayVv4wvr8N23J8oPk+XC3w
         NLXa8BBTKK25Msxbcd6L7Q/7zFy4tzsn2lVgFy0TrbNs3uaWgrhIinJReW6Q67/mqPJ3
         bBIJvMwsQ5v+D8XJJFxkvldSkMbC1G3T5IX77Aglutbg0b0atAihfMGyyjeufRoEdu4h
         OYhXfTU8ucNyFDTJvbpkBd2NzvZZ5muoN//CN6sOebyhal6mgIRfHYwyq5nMS9mPhYOp
         VVW3xHmY346AnHqdaQTHwIgLJXf/7/59MMPGXlqyZZrnAE1Y8uGQ6m4N3PdcVBSMOayb
         UCKg==
X-Gm-Message-State: AOJu0YzwrlMK/v8VOeFGeSCG7PUIomom1/QPx4CVzDZ4DC7cp1OXFZRd
	mHXwmCM1E/TpLm2q4DTcieqTn4e7jCA3R4RoA054UcWz2s68+Rfm3FMJ59ukXQpg5O7LDqgWTja
	9Pl3YEKX/BaWgqJ5ElDdhQy+sA8lvBY8=
X-Gm-Gg: AY/fxX74V05u7O1J03CiVpzdrOsSCkyLiv4Ho0PRVFcLQgh+915oc9JAQh/yavYeSm5
	rAUboAQhMEr9gGRehPl8KXZsjae3p+xqZUpBeMzWizPqnPHykTJ6bY+tZ6qazB+sPYDSzaE1R6c
	PO0n5JJs1JlUdb1YakbjQ3+KkPSkVGQa/aP/L53bHD5MJ9l20+z93DFDVPBuFJwFPM8i1I7rkkX
	7+wjHmtSVrQt2UetR8cpEZp3mTUUuVtoxY4Izx39l8qQs7+Ag62MGppcumPPQeo+zeQIhaSu4OG
	UQtmjeQ1lKauXlz0ttD+FeGXz0D+
X-Google-Smtp-Source: AGHT+IG9zx8ardTXnPv8m0fMlH4tlpDOqJ4QvCj/B/oIiDkOgUkFkW0YQV2Zcp51MXenS6Nz6WYO+HK89mYvqYZ4x7A=
X-Received: by 2002:a05:690e:140d:b0:644:50c7:a50a with SMTP id
 956f58d0204a3-6470d2f3e09mr8882448d50.32.1767887798547; Thu, 08 Jan 2026
 07:56:38 -0800 (PST)
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
In-Reply-To: <4d1406ba-818e-4d3c-8e57-759e405e6576@gmx.de>
From: Pranay Pawar <pranaypawarofficial@gmail.com>
Date: Thu, 8 Jan 2026 21:26:22 +0530
X-Gm-Features: AQt7F2rK-7wR4cTMMj9HAVKVYkHbAXvXsWw1PqW_OryBLDclj5NbGsxvMJi3zKA
Message-ID: <CACy5qBbWn0xcPKXCWRv+t8_nHea7=iwW0Jyo5dbHqfwPg-JO2A@mail.gmail.com>
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No There is no such logs in dmesg.

Regards,
Pranay Pawar (bugaddr)

On Thu, Jan 8, 2026 at 9:15=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 08.01.26 um 16:35 schrieb Armin Wolf:
>
> > Am 08.01.26 um 15:38 schrieb Pranay Pawar:
> >
> >> Hi Armin,
> >>
> >> I have tested the suggested sysfs attributes with the patched driver,
> >> and here are the results:
> >>
> >> Mode: balanced, pwmX_enable=3D0
> >> Setting this to "0" successfully puts both fans at maximum speed.
> >>
> >> Mode: balanced-performance, pwmX_enable=3D0
> >> Setting this to "0" also puts both fans at maximum speed.
> >>
> >> Mode: performance, pwmX_enable=3D0
> >> Setting this to "0" also puts both fans at maximum speed.
> >>
> >> It appears that switching the attributes to "0" does correctly trigger
> >> the turbo mode for the fans.
> >>
> >> Thanks,
> >> Pranay Pawar (Bugaddr)
> >
> > Perfect, i will send the associated patch upstream then.
> >
> > Thanks,
> > Armin Wolf
> >
> I forgot to ask: do you see messages similar to "unknown function number =
- X - X" inside the output
> of dmesg after pressing the Nitro button?
>
> Thanks,
> Armin Wolf
>
> >>
> >>> On Mon, Jan 5, 2026 at 10:31=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> w=
rote:
> >>>> Am 30.12.25 um 06:54 schrieb Pranay Pawar:
> >>>>
> >>>>> Sorry for the confusion earlier =E2=80=94 after rechecking the beha=
vior
> >>>>> without the new patch, I=E2=80=99d like to clarify the results.
> >>>>>
> >>>>> ** Without the patch:
> >>>>> 1. The fans are able to reach maximum RPM only when using the
> >>>>> balanced-performance profile.
> >>>>> 2. When selecting the performance profile, the fan speed remains
> >>>>> capped at ~4500 RPM.
> >>>>>
> >>>>> ** With the patch applied:
> >>>>> 1. Manual fan control is unlocked, which makes this patch important
> >>>>> and effective.
> >>>>> 2. The fans are able to reach maximum RPM only when using the
> >>>>> balanced-performance profile.
> >>>>>
> >>>>> So the issue is specifically that the performance profile still kee=
ps
> >>>>> the fans capped, even though it is expected to be more aggressive
> >>>>> than
> >>>>> balanced-performance.
> >>>> I see. Can you check if the fans reach their max. speed if you set
> >>>> the pwmX_enable
> >>>> sysfs attributes below the associated hwmon device to "0"? This
> >>>> should switch them
> >>>> into turbo mode.
> >>>>
> >>>> Thanks,
> >>>> Armin Wolf
> >>>>
> >>>>> Apologies for the misunderstanding.
> >>>>>
> >>>>> Best regards,
> >>>>> Pranay Pawar (Bugaddr)
> >>>>>
> >>>>> On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay
> >>>>> <pranaypawarofficial@gmail.com> wrote:
> >>>>>> Yes this patch is making the driver work as expected. I had modifi=
ed
> >>>>>> the acer-wmi driver and loaded it, then changed platform profile t=
o
> >>>>>> balanced-performance & now fans are able to reach max RPM's. But i=
n
> >>>>>> performance mode (Which is supposed to be powerful than
> >>>>>> balanced-performance) the fans are still max locked at 4500 rpm
> >>>>>> only.
> >>>>>>
> >>>>>> Thanks & Regards,
> >>>>>> Bugaddr (Pranay Pawar)
> >>>>>>
> >>>>>> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de=
> wrote:
> >>>>>>> Am 25.12.25 um 22:51 schrieb Pranay:
> >>>>>>>
> >>>>>>>> Sure here you go, in attachments
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>> Bugaddr
> >>>>>>> I attached an experimental patch that should whitelist fan
> >>>>>>> control for your model. Can you
> >>>>>>> test that fan control and the nitro button works?
> >>>>>>>
> >>>>>>> Thanks,
> >>>>>>> Armin Wolf
> >>>>>>>
> >>>>>>>> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx=
.de>
> >>>>>>>> wrote:
> >>>>>>>>> Am 24.12.25 um 20:40 schrieb Pranay:
> >>>>>>>>>
> >>>>>>>>>> Dear Maintainers,
> >>>>>>>>>>
> >>>>>>>>>> I am reporting a limitation in the acer-wmi driver regarding
> >>>>>>>>>> fan speed
> >>>>>>>>>> control on the Acer Nitro AN515-58.
> >>>>>>>>>>
> >>>>>>>>>> The Issue: On Windows, enabling "Performance" mode via
> >>>>>>>>>> NitroSense
> >>>>>>>>>> ramps the fans up to 7000+ RPM. On Linux, selecting the
> >>>>>>>>>> "Performance"
> >>>>>>>>>> platform profile boosts the CPU power correctly, but the fans
> >>>>>>>>>> remain
> >>>>>>>>>> capped at maximum 3500-4000 RPM.
> >>>>>>>>>>
> >>>>>>>>>> Observation: This laptop model lacks a physical "Turbo"
> >>>>>>>>>> button. though
> >>>>>>>>>> there is a nitrosense button which is useless in linux.
> >>>>>>>>>>
> >>>>>>>>>> I am requesting that support be added to fix the maximum fan
> >>>>>>>>>> speed state issue.
> >>>>>>>>> Sure thing, can you share the output of "acpidump" to i can
> >>>>>>>>> whitelist your model
> >>>>>>>>> for fan control?
> >>>>>>>>>
> >>>>>>>>> Thanks,
> >>>>>>>>> Armin Wolf
> >>>>>>>>>
> >>>>>>>>>> Best regards,
> >>>>>>>>>>
> >>>>>>>>>> bugaddr
> >>>>>>>>>>

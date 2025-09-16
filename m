Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3219AD48
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758005970; cv=none; b=LwN85D9xhSVau90EVGLXHGVoMQdv6l4C8gUrmecmiDq4SF6/lb8tubujV8epetfDXDQL/W6BIWhOcjl5hYMFwNeV8Hl/yswNHPIu1iDuPilk7Xfs9kIarhcJiyMW/B4g0XUjiAEhPKsMqEkBmu+79pLjfI+NCfhP2rzG57NbbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758005970; c=relaxed/simple;
	bh=9aI1e3THEjDxHBmOMPGIdPryXTzJxDzPnyCZcmd9iMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWgO/CgX31bL4Dp+NPiWWLvAZFeAOt+HyWDKPkuk8JrnZx0AvQZwyfoNHpULTnwFSvnwnGLlYHTYUdgT3L+GaYuTtkuOBP3TpSbGJy80LihJJefKBde5q/huQte+9MpSTSLR0tGGX90GedG/AzRmHy2iz60bkv7h9dOmxJYBh4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=CpUQU3ov; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="CpUQU3ov"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 55F0EC8905
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:50:44 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id CA5F9C8909
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:50:43 +0300 (EEST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 3D3551FF5E4
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:50:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1758005443;
	bh=+ajQr3+adlwS6DeNjuFC3YEIP8t8As81nrR/XzzqN24=;
	h=Received:From:Subject:To;
	b=CpUQU3ovup51hK/ACWCAioBqL/kleJQWFtQ2HbSLZuXawB4ea6kz3j6OcbDinxLbH
	 Aqr9ksKYfTEGtt44jskroHLPZUYCZvXrnBQXsIKG9QYisY+Fon/NSuTHuNB8WKvzFQ
	 eHzBjiPkxjhyFFzcv5+GGGo8boyZanGy4wat1iutGiqUiIbZ/AcSV37KUwHmw+h6v9
	 JXGWh2j6xw2Y3+G+5Sdgu1RCITvSx6HttDPCxL8048KdJeM+sOPH0r3IEAx3PjsIl5
	 sNPonKxExh2oUvcHgfoZj9MdOU1vX7HoTvVUWwVu5rNKvC0klyAvcwRQ8RY4raqOMN
	 AqJuVv9UqFa8Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-336d84b58edso46610591fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 15 Sep 2025 23:50:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzq/djBmlRfQmsaEGvPzocIo4Gaa+a3STx7Ja5ffJJcSHwK6p30
	js7zMcI2gvvizUs409IQxa9uTp7eItZopiDxx20tarRSimiVFZA6Jd5iHasydSvRTJ+4JJsn6PG
	hYT7TKO29GkNorxXBKeN3eu578sEiVzk=
X-Google-Smtp-Source: 
 AGHT+IE0J7JSZkBQCVTNLE0DZWlP+dKj0Vq9K8gUlDgM+IwR5B+KsGh1toyYx/MhGzCzIfu3GOzpWADfhqEs1vJV8V4=
X-Received: by 2002:a05:651c:255a:10b0:336:ac3a:73b5 with SMTP id
 38308e7fff4ca-3513c029a14mr35125071fa.19.1758005442585; Mon, 15 Sep 2025
 23:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1e1-68c90780-93-13ea166@216760021>
In-Reply-To: <1e1-68c90780-93-13ea166@216760021>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 16 Sep 2025 08:50:31 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
X-Gm-Features: AS18NWC5jmCLMhahY7wIS4c4kno0aJ-xFq4wP31Ej4cIScYNW5fJFje4kLcqD8g
Message-ID: 
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Remove extra keys from
 ignore_key_wlan quirk
To: Rahul Chandra <rahul@chandra.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <175800544344.2626281.7665463748878159788@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wrote:
>
> Added some cc's
>
> *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is the sam=
e on the MA)

I must have mistakenly thought that the important code on both devices
is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
both. Can you verify which codes are used on the Duo?

Antheas

> --
> Rahul
> On Tuesday, September 16, 2025 02:36 EDT, "Rahul Chandra" <rahul@chandra.=
net> wrote:
>
> > On Monday, August 25, 2025 07:30 EDT, Ilpo J=C3=A4rvinen <ilpo.jarvinen=
@linux.intel.com> wrote:
> >
> > > On Fri, 08 Aug 2025 17:47:09 +0200, Antheas Kapenekakis wrote:
> > >
> > > > Currently, the ignore_key_wlan quirk applies to keycodes 0x5D, 0x5E=
, and
> > > > 0x5F. However, the relevant code for the Asus Zenbook Duo is only 0=
x5F.
> > > > Since this code is emitted by other Asus devices, such as from the =
Z13
> > > > for its ROG button, remove the extra codes before expanding the qui=
rk.
> > > >
> > > > For the Duo devices, which are the only ones that use this quirk, t=
here
> > > > should be no effect.
> > > >
> > > > [...]
> > >
> > >
> > > Thank you for your contribution, it has been applied to my local
> > > review-ilpo-fixes branch. Note it will show up in the public
> > > platform-drivers-x86/review-ilpo-fixes branch only once I've pushed m=
y
> > > local branch there, which might take a while.
> > >
> > > The list of commits applied:
> > > [1/2] platform/x86: asus-wmi: Remove extra keys from ignore_key_wlan =
quirk
> > >       commit: cf3940ac737d05c85395f343fe33a3cfcadb47db
> > > [2/2] platform/x86: asus-wmi: Fix ROG button mapping, tablet mode on =
ASUS ROG Z13
> >
> >
> > Hi, with these commits on the branch the "Airplane Mode on detach/attac=
h" bug comes back (The bug the quirk was intended to fix) . I think the Duo=
 emits 0x5D (toggle, because it deactivates and activates on attach/detach)=
 however I have not confirmed this. This is a regression from the previous =
patch and I propose that we either revert the commit or fix the keycode. I =
am not submitting a patch because I don't know if 5D is used for a differen=
t purpose on the ROG devices, can someone confirm?
> >
> > --
> > Rahul
> >
> >
>
>


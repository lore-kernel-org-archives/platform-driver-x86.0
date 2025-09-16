Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBFE4207A
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 06:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758005471; cv=none; b=VMN7qdgaT4lyBssT5QRH0JOGZnqE0BrFwbs4nsSYH/wXZy36F+VsrYPDL0dKlyMEjRzbtemYVANfZr8T+Wb/ihQYGjkNvW/Z4pMwWKbOklLt8E9vWypKcGKzXm0TtBH38E33GBt0mHH/H7mKbTgRhHvim8KOjzTzjyv1+HxL+90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758005471; c=relaxed/simple;
	bh=Mi9kuNFqoLPXjJw/sBs75Er35yrx0wcg0Rx2fwbbZAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOgQ5h3KrObgzeQ7rm6ZzQH7SW+hTv2lr6d5qD84XulYpUYhq6nr32asa16E7b3LcI+tw1jZewmw1bkSisDCd5JPHiniBJSK7hX+ELmjBMVDxLMsX9zbYM7265NhbaZ8jLa44V4yLGfvz0aQIViG3U36N+LlVNk2riJyLB+amNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=o2msdzRM; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="o2msdzRM"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 3D51DC891E
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:51:03 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id CDC30C891A
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:51:02 +0300 (EEST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 151CC1FF5D8
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:51:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1758005462;
	bh=NnA+ZtHP3dioslvBt4IoPLA8NDbu9M2+1ZJgx/d+goI=;
	h=Received:From:Subject:To;
	b=o2msdzRMaOW2oyo4fkLAJcz20geWubCzH9xPzruCBjKlES36MCkOfpEcKuYctH2ye
	 PPmIkg7BHu4NS08orEMfkEfjub6i+aeQZ4OwT3uZaKaZr8NIxMYPFukktq5xzxZx8B
	 rLHXAJQvJms51ietCggmWRKs68uk4BoilnbKvXUinDzwYDlZ3BtOHMEuv0J9/OKEGF
	 6lkOPBQcPhtfIuIld5Oee6q9iS3a8r10npvQYcJKxdUffCUfVcvZbc2IZ3L8w7FJ7E
	 WASHVQqYJ5IEC4HKv9esrXFK3kkPmPBE4AKDf0NiC3Nl1TEVe+yIMz86y6UFH3iDGh
	 GxvZ2YJJMhwSA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.42) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f42.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5720df4acc5so2310815e87.3
        for <platform-driver-x86@vger.kernel.org>;
 Mon, 15 Sep 2025 23:51:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YwVT/sM9nOhHy9bfjgZoLhOw7Gw1NvXnjkfvLzTZd6lAFDKzudG
	0u5Id6vxJEhoSckoTJ7wv9qpPMoii1idsOFYqhiwr4/ng9Uqrq8FrDb5R/tIjbzb4JpZgK4gbR8
	Gxc8My+LQhFzGyHMEQu2lKUfHYhx0UWA=
X-Google-Smtp-Source: 
 AGHT+IGHZrMmwGGmtmOYRyI1Soz0dwB2tPRV4KWfSN/Uym7/I09W01bQbcaWTuPm7oT+CjZPZwvYkKsTbzrIdHhrEUM=
X-Received: by 2002:a2e:a00e:0:20b0:338:7f3:a740 with SMTP id
 38308e7fff4ca-3513969d62emr39581921fa.7.1758005461533; Mon, 15 Sep 2025
 23:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
In-Reply-To: 
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 16 Sep 2025 08:50:50 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHwfXvMbtadFqGV6HQw6hMGiA6jfj_d-UEPtfEmURQ6tQ@mail.gmail.com>
X-Gm-Features: AS18NWAC-Pky_vK0VjMXlxk0t4_gY0FJvBk_kMs30qXEr0bIHzNkE1zEx5ollUs
Message-ID: 
 <CAGwozwHwfXvMbtadFqGV6HQw6hMGiA6jfj_d-UEPtfEmURQ6tQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Remove extra keys from
 ignore_key_wlan quirk
To: Rahul Chandra <rahul@chandra.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <175800546251.2628188.8043145696700456436@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 16 Sept 2025 at 08:50, Antheas Kapenekakis <lkml@antheas.dev> wrote=
:
>
> On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wrote:
> >
> > Added some cc's
> >
> > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is the s=
ame on the MA)
>
> I must have mistakenly thought that the important code on both devices
> is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
> both. Can you verify which codes are used on the Duo?

And for which event

> Antheas
>
> > --
> > Rahul
> > On Tuesday, September 16, 2025 02:36 EDT, "Rahul Chandra" <rahul@chandr=
a.net> wrote:
> >
> > > On Monday, August 25, 2025 07:30 EDT, Ilpo J=C3=A4rvinen <ilpo.jarvin=
en@linux.intel.com> wrote:
> > >
> > > > On Fri, 08 Aug 2025 17:47:09 +0200, Antheas Kapenekakis wrote:
> > > >
> > > > > Currently, the ignore_key_wlan quirk applies to keycodes 0x5D, 0x=
5E, and
> > > > > 0x5F. However, the relevant code for the Asus Zenbook Duo is only=
 0x5F.
> > > > > Since this code is emitted by other Asus devices, such as from th=
e Z13
> > > > > for its ROG button, remove the extra codes before expanding the q=
uirk.
> > > > >
> > > > > For the Duo devices, which are the only ones that use this quirk,=
 there
> > > > > should be no effect.
> > > > >
> > > > > [...]
> > > >
> > > >
> > > > Thank you for your contribution, it has been applied to my local
> > > > review-ilpo-fixes branch. Note it will show up in the public
> > > > platform-drivers-x86/review-ilpo-fixes branch only once I've pushed=
 my
> > > > local branch there, which might take a while.
> > > >
> > > > The list of commits applied:
> > > > [1/2] platform/x86: asus-wmi: Remove extra keys from ignore_key_wla=
n quirk
> > > >       commit: cf3940ac737d05c85395f343fe33a3cfcadb47db
> > > > [2/2] platform/x86: asus-wmi: Fix ROG button mapping, tablet mode o=
n ASUS ROG Z13
> > >
> > >
> > > Hi, with these commits on the branch the "Airplane Mode on detach/att=
ach" bug comes back (The bug the quirk was intended to fix) . I think the D=
uo emits 0x5D (toggle, because it deactivates and activates on attach/detac=
h) however I have not confirmed this. This is a regression from the previou=
s patch and I propose that we either revert the commit or fix the keycode. =
I am not submitting a patch because I don't know if 5D is used for a differ=
ent purpose on the ROG devices, can someone confirm?
> > >
> > > --
> > > Rahul
> > >
> > >
> >
> >


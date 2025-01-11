Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F882AE7F;
	Sat, 11 Jan 2025 17:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736616580; cv=none; b=qW65RHPACla2OJNOPjkF4rbd3sD2DEixW2uZGgf+tvB/Vqgp+QAqYL7IQSKAYCLIc3s4aI/rIQ+eU/Euszo36YAywD4MjS5Tk9FqgFfa6BONH+GCIydSooTsmMgDuyk6sPqQw0ay76TDShyBPjcohvcS7cZm4YvAGUgAtRfNkiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736616580; c=relaxed/simple;
	bh=Cn5SiyQ15E7a077tRflcmIZEcr3hpOV62nfMvAPrlt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oU8eTGjUUB3AaxfxxIwzbVniwQCSM8cpBT+mffRo5h/pivRZeupdA4xwPO0uI8a3bZD2A39mP6sKepxAR8/YPvrOcLjxOYrpx+kkwcgwnvc7XOeiKm2ctiYYkhFDBmUgNG0FTjASeeiCb2ZvRcHDn362EE+QFzm/AbpfMurabOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxZ9+nBq; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxZ9+nBq"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d8fd060e27so24947626d6.1;
        Sat, 11 Jan 2025 09:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736616578; x=1737221378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU33COqd0GBkdzWFO4iuHstIjUX/OJwEKPzGqR/ekjU=;
        b=hxZ9+nBq1C0r78dNe7AmY5XIuMv415E6HDah5D6p63ZVfuwdWl+kyDycQo9qlCurDF
         tJ7ZqLr3ta0JPLxDHFRIxnbVP8j1JO60bwezP7useq/pN/nBG9OSNQscvKJguNo9m1wN
         Czrsa053aKXQc1mCD7zofjt6iQeGmwhJJVlLGPQwweKhIY2Em6HNrRfu/Ho7pEcCQ0yg
         lWqzTK+FPmgcNBo4UghyC7pYv2nJWtlOtivPBFOpgEvXxJH65DNu4QEyAEqGsYyfZHba
         K2o6uvfqm0HW6XLWF8rs3EqkmlZS9RqXXpw0VTUexAGdb3TPq98yDFW2Iboh2R3fnc/H
         DlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736616578; x=1737221378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DU33COqd0GBkdzWFO4iuHstIjUX/OJwEKPzGqR/ekjU=;
        b=CVmV7oC0x+ZKw9MuKdV+EVGZRwWLwsCXZw9pWlKa56te1tkr0uIbUBKc8rIIXIDiZb
         V2b8PVDqPQIBuiOQvM2jFh1AUX+9WCvCf82F9umJmHrkKL1qMHp946qJS+2qO0cn0F30
         ZCa4RQkCSnFfw43maGRxSXjAePVfdz7CFxTbc5yY3f+ddujFX8EEIFR8vBAVMd0D/SoF
         sNBaRh5vZTaDmoOp89jFPt472reyY7y0mgeViRyKNlgEG627j5haK9+WVnnBH7gR83Vr
         E6f7UGf1I347gJB1vDsaoyMHCzuvmxLEUwuQsKxy0Hxb82FIW4ysBK400RNIkzU4aNNC
         R7+A==
X-Forwarded-Encrypted: i=1; AJvYcCWLWZST2TPctX+h3pD9fhd3lOgpKz2kQTrArT5VrEFaCRs5M9I3bjipbNziWprcgJWQKBMytnTwSnUj7xHdSNWonX86vQ==@vger.kernel.org, AJvYcCXhnK3Iow4+ImlFOkP8jQR6oZ1fF+6iAOXqUT+ZstHjbWIWzLHx0uq8QcWtTlMib0odYnHJonqagbs=@vger.kernel.org, AJvYcCXsGZX9LUjfp1JIvrMST8HObCiLeN3sDofakkakLdkDm2xVV68BzST4jBENP1CIxzeJwFhDlyd4Mf7vCmRh@vger.kernel.org
X-Gm-Message-State: AOJu0YzIo4jz83wyK2Y1FECXLopvrusZlXe+eMDIc2CyffDXcPkN78AR
	kQSEvY8JH15k+qdS0dyyTyrg3VLQIHyq7EAgAbBofmkTbm98uHLjQ8P0k2e9aQqhKDQEsnUcled
	B3vKYk5sN1U/RRA9Ge2WoPNuwjFA=
X-Gm-Gg: ASbGncsvHypogugv4NyrhopshXdy0wvNezR7JHM5FR/x//0wLyHkGPE3nZEdIjDChjA
	W7jiDN5mDyXl/ARtrgU+iDglrlmF7WH3q+esgRfs=
X-Google-Smtp-Source: AGHT+IE7q+GRmehpL5QLfHotv/XEsr1Iz5ipnwX4EujnghhXr6DJuBzwBGHDHmuprsBKNnbw1cn3r+4cvK1WKWJ3MyI=
X-Received: by 2002:a05:6214:495:b0:6d8:a76d:b66c with SMTP id
 6a1803df08f44-6df9b2b33b0mr208426806d6.30.1736616577635; Sat, 11 Jan 2025
 09:29:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-5-derekjohn.clark@gmail.com> <333019ec-524d-4933-aa6e-459cd1f7b10f@gmx.de>
 <CAFqHKTnM6Bs6AdPFisRZ1d3yFx_eFZap4Y-42=kSth9VSoAU0A@mail.gmail.com> <403ebdd5-1659-467e-b883-1369360ce973@gmx.de>
In-Reply-To: <403ebdd5-1659-467e-b883-1369360ce973@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 11 Jan 2025 09:29:26 -0800
X-Gm-Features: AbW1kvb3z6R_ryapU0lXAVqVsFRgv5inqbpDDHScB3QfnQ0wwDFESkPaqGZhbcg
Message-ID: <CAFqHKTnGpMbXYVcP-7k+kCJMxPcLa0QGZ2u4-s7a7cYgjA=NwA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 4:10=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:

> >> Would it make sense to do something similar with each attribute, so th=
at each attribute
> >> can use container_of() to access lenovo_wmi_om_priv without having to =
use a list lookup?
> >>
> >> This would of course mean that each attribute as to be allocated dynam=
ically.
> >>
> >> Heep in mind that we are currently working on a new API for registerin=
g firmware-atrtibute class
> >> devices which should fix this.
> >>
> > I'm not sure I understand what you mean exactly. I think what you're
> > saying is, instead of an attr_group, allocate each attribute as a
> > struct in priv?
>
> Kind of. I envisioned something like this (pseudo code):
>
>         struct firmware_attribute {
>                 struct kobj_attribute attr;
>                 struct lenovo_wmi_om_priv;
>         }
>
> This would allow you to use container_of() to access priv, but would forc=
e you to allocate each attribute separately.

Ah, I see. Since we have the kobj in the functions we're accessing the
list in, we could get the firmware_attribute struct instead which
gives the pointer to priv. This will take a bit of refactoring for the
probe & macro sections but I agree that it would be worth it.

> Maybe you can wait with the lenovo-wmi-other driver until the improved fi=
rmware-attribute class device API has landed.
> Meanwhile we can focus on the lenovo-wmi-gamezone driver.

I'm not opposed to that. The API update seems to be progressing
quickly and with the multiple other changes I need to figure out v3
might come after that is in for_next anyway. I'll play it by ear and
work on the gamezone changes first.

> >> Is there a reason why this needs to be put inside the header? If no th=
en please put this
> >> inside the driver.
> > To clarify, you mean the macros? I was under the impression they
> > belonged in headers but I can move them. I will move some of the
> > enums/structs as well which are referenced here and the driver only.
>
> I mean both the macros and the show functions. They are only used inside =
lenovo-wmi-other, so there
> is no reason to expose them inside the public header.
>
> Thanks,
> Armin Wolf

Make sense. I'll move those as well.

Thanks again Armin,
Derek

> >
> >> Thanks,
> >> Armin Wolf
> >>
> >>> +
> >>>    #endif /* !_LENOVO_WMI_H_ */

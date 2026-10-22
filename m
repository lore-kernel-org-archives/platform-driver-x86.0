Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792638655;
	b=tV1imG5Ya1UAGUdYOc1qCQa8NUcUu3kP7hsgGw+Xyi/XW/GHmRzukgPX1xkgJLTUvfOb
	 5aRneohpIE1VwC+qZlKdOS/Wdz0dt0c6XN8XhstrXqm29FPXvpTK5R4SJyi9eCegZhRG1
	 VnQNo4Rauktgmj/vaJavGS8nHA3b1ApsVyVmimOtApbXYNzw8c/r9aLdSdPNPbABFBu/g
	 IvfTgLWTP6FHEXSbuEQiWZg3KYivhf5D/9MIC3SBxMsGu7CAVXEEUh9YjsNZACfDCFstL
	 1eLWI/tPd3hrRRJNAzHv7UZF5tITIUZkwwBYlLJuCvG95Q1FMZt/c7Wyu5DjIjajoKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792638655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=N8Ea41+SdK1MSS8N896heysbFCM8ofJWuVIhKU/ONO4=;
	b=wLY02Ucxx9faSsW47DvPeKZA3MIyEbBGRURctbSqBJzKwIc45Gt9lr2zN3PiXvdjV9ok
	 OGHquYSTsXAKMV9IDjMupc7P9/p043Vna1VwuA8BDBVK8Vj9ZEdHgkldFUf4DEmEtBWNj
	 BLv7HfZpUk/xDNkZeTorCVnA00M2r9es9UBEdpOSemVn45tTjUMg1jf7qftYDBkoBKkNe
	 bU9kTiIRE5QU/rzBjnV+M09HDzCfhPKccKzkJqq76YWQS+p7fmehWlEx3wy9NsJWV8AXa
	 tM0XeyOgrI/fTxajVrb3HyZFnokkSM0Mn/m8fkj0192i358paPJijR5ZiM1NMzkX9Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PSsGcwen;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54882606A31B
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 03:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54882606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=PSsGcwen
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A39EF40275
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 03:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792638651;
	bh=N8Ea41+SdK1MSS8N896heysbFCM8ofJWuVIhKU/ONO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PSsGcwen53bMdBIX/w60/KZyhpG8UWF4SRu88Zox8GNyEOqAwwtoP0Md7hhzqnX/N
	 QaXzK6XAMM5ohGK3ZKEAuZQBvXrHTbMaE/1+YTJdD4oVMykv3oAR20ngyMI7qsY3Vv
	 oMowyXmf9q+LGKGpZjbuawkva97s3zHw090oLBDt2lYl+DQhSMt6EBi40fOCSACH6n
	 S6XTa+hSnp5A/MWuqhLygl8WN9R0DNzWVN8ErCjx3U7Ng5a6qYxPOnK4JtfwexSvgV
	 n0wERJn4/CgoMsd1XFBikvUqSmDvxeqh8lPpGPRxAanmz+dy2PVduFZVh0Uf1cS78z
	 IogLt2wGSrJV+U0hyhD4+JjhtAih27FudMfG8Wb8G1GeRRo4/AYkEN/lP7gtF9rQgp
	 XziH2+tJku3JJKbiVjFyqFma6kJL1JgJb8rAksk5uO/5bpfaSFMrfGHg+vnwIffJjP
	 1N258gedHGBPWAR8zkL46MgGTKuGwgDzBsiHiBsxRu7c1HFb1mTjCFhmDgmqOWO9CP
	 GZYf/nHiP5jDy9nNbk+p2Y06ohOlhbLlCOCQBtpoOIvUkw9Q3GurpuxApQBBKq4CzA
	 hmMhdd8X5R2YpMD2/HPh1CUYN5wN+gX0L84Zno27AI2NFuutJe1EPnSnW0d1qbMPuP
	 1EQk+IxoCTzIBfzMfW95uwZg=
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f957990edaso314970b6e.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 20:10:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792638650; cv=none;
        d=google.com; s=arc-20260327;
        b=BM5rUnnpGV3QzVGR9BK98JL2E3STWmqNRCm8KhFEWfhCEjQAcL4Puh2938hv968nyY
         1BeMhN/+hnZudiFkTYPzGItFG1VYRoIgExV1HpIh/FGlX3n5/SxMipcTi3iRt2qDCitQ
         AR/zircOsHd7H2gk6GyZ/hbPq+4Op0AgSjuKYKQkEi9xgcqyfTduJ275bVT7uWNLjP3l
         OX/ettK+jSwrgrrJyHHeMaK52MeTSsGabn4AvW9AObyAmCMGTj0Egw+qPKN3QoXph7q7
         YSQBRHIDzWEW+3JlX+51bBsVn3rtAKZ5ZUtwaDWc8V0fa72euH4rHtpCW4onomyhAlGj
         RU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=N8Ea41+SdK1MSS8N896heysbFCM8ofJWuVIhKU/ONO4=;
        fh=2WutSZTYCKQa0LOH2XeocwFV6eirgO031gVsmSzz3NI=;
        b=C0dkul88jFE2m6mHYyvsGeu3l7vaGd7DIbKfMRytegPZF+7yAOeJdcfSg0j8Vbuozm
         hOUaOaXmyb7zBYVExmg29lazDidtiQoXQJlEGECasxPVgkXlGoqoUsmfF0mf6lFcOgri
         d4umLlgd1JKqK4rCElkx9A6m3WTbZUhCsOk9UWUrzbIV23tAM6xAWX4kTGaPqi0p5PPJ
         pzh+vv8cZR4WaCsSaKNByV4DTLWi8HdPQ/pwrSBXPEQikAsuqzW47FLBJuot4QrYeRET
         8B8ghOTJHyAj0VmybUpy26CWCCtEFoENJ/fj40xfzSN68WJeQuJk9KxLwMfMxImz47gK
         7kgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792638650; x=1793243450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8Ea41+SdK1MSS8N896heysbFCM8ofJWuVIhKU/ONO4=;
        b=cvZEmeEw4xjSeaEUF+DS2hBieTcZwu8fVCX3cDKq2Zard1Lm/dLLWBRq1muLSQurF5
         8vDsNllMoi7yT0nYNax21a4hXbyGIz4wv7qgP+QitpK47j0jAoMA38Wt3EA5zyXFEfUe
         Pd4ZGxlaQoOLDIxbJoVsQpng/RhxgU++1OnO8lpSdGpqF7lft6EjWQ6AMzg5kusHwFae
         F1L6h0oK9q52gnuQlSj/LrhStU9fgWfe8ZHBnhA3XDqzwX0ARaUMX3roBFCHn4YtcEV+
         Xj0l2wAljtD6bvPZQUsq3wbrtqp7OklPg8c0t5j0p62Ai9FEH2Wsyh/6PQRr+rdPFqS3
         kbsw==
X-Forwarded-Encrypted: i=1; AKwUvByj2f5AkFVfaBhwbtdUgaq4tr86rcIdbzGX4UG8OEIFxFWRi1B6JKByltmOWFM1uiF08K86n4azjHFSauzzD4OSCeMR@vger.kernel.org
X-Gm-Message-State: AFq9FYJjxa0vidNYWO3p0VDG+mzB07AMnMID+l0ODxtPt0xqW7WZitPH
	sVMLiNaCAPrEVFqea4LPyO1vhCke9TpSXu6tpJRjDbMouZvAhCKpcoXfQ+zYgQbJmwc4Zzj4fqZ
	3QdLIAq+gMRewimYuS2JkISJ+56/dvR6yZjHEC94HuWt684aeuQq8joep//vWj7iwCNpOnBr2ND
	2MkTvhcu+XL4BuhsTGhyR8W9zG7sQ84C2/kbsECPUw4gysYyGuc6wEMKMQjya2X1+/z0UTgAXAq
	2MT
X-Gm-Gg: AYBFou08DNpSSU4vnxivrz2W67nSa3ArGGDnZeWcaqQ0li60bC1YniVyHfOpk+rW1x/
	C2mNFTO6fXHC1aohMMG8As3fEyd0j/atkgGpNfrX/XdkvYtsscw/J7bIHbmxGxKpW4IDHkHoFlq
	Y1bFW65/h+XDfmmeULTgXjfAVLSzFyzgBhkWcEKtce2C+DzyqlWb2jwxU71e+LPoiiNvuNMzSNJ
	Ah31fA7f0InDFiszBRbyK+5bC/PrfsvnFmYa8sg1JP+1CZ3elph6S0jgizkac5Lvr4Vg/4wYwVz
	bbyXAXDAznmYfw==
X-Received: by 2002:a05:6808:1786:b0:4e9:73ce:e2a5 with SMTP id 5614622812f47-55362b22e67mr4291890b6e.6.1792638650206;
        Wed, 21 Oct 2026 20:10:50 -0700 (PDT)
X-Received: by 2002:a05:6808:1786:b0:4e9:73ce:e2a5 with SMTP id
 5614622812f47-55362b22e67mr4291883b6e.6.1792638649755; Wed, 21 Oct 2026
 20:10:49 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021092124.2306053-1-an.wu@canonical.com> <250bded6-2a51-457d-9bf2-24c299dbd7a9@kernel.org>
 <59137675cf11f7b034220c3b71c5ababab48f8d0.camel@posteo.de>
 <97dd05c2-0a6f-4856-a473-59183a5b3424@kernel.org> <90df4e3068d89c37b4c6813aacae02fcf9fc188a.camel@posteo.de>
In-Reply-To: <90df4e3068d89c37b4c6813aacae02fcf9fc188a.camel@posteo.de>
From: An Wu <an.wu@canonical.com>
Date: Thu, 22 Oct 2026 11:10:38 +0800
X-Gm-Features: AclHuK9WBaS4DBeR4kX66w64t57mRBpPY4QtlFF1qvU85_oKuVCuiUpCRRzhBJ4
Message-ID: <CAO4Mv0a8QerDHBsVGsPMxdP0UCGm2oKCriccO4-S7KY=ERj6Kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] serdev: handle devices without an ACPI or device
 tree node
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, linux-serial@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca, 
	derekjohn.clark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans

> I see. Makes me wonder though how that -ENODEV is a problem,
> it is weird. But is it a problem?
>
> The v1 patch writes the following about this:
>
> "This makes the modalias sysfs read fail and suppresses the device
> add uevent, even though the device is registered and bound to its driver.=
"
>
> Ok, but the backlight driver ultimately ends up adding a
> /sys/class/backlight device which I assume does get
> a uevent, or is the problem that one never getting a uevent
> because of its parent not getting one ?
>
> And the lenovo-yoga-tab2-pro-1380-fastcharger driver does all
> it needs to do fully in kernel and does not even export
> a userspace interface.

You are right: the backlight class device is registered independently, so
the missing add uevent for the serdev client does not prevent the
backlight from working. I would not consider the missing uevent itself a
user-visible problem.

However, as Markus pointed out, serial0-0 is an existing serdev device
whose modalias read fails with -ENODEV. That is inappropriate core
behavior.

BR
    An

On Thu, Oct 22, 2026 at 2:14=E2=80=AFAM Markus Probst <markus.probst@posteo=
.de> wrote:
>
> On Wed, 2026-10-21 at 20:07 +0200, Hans de Goede wrote:
> > Hi,
> >
> > On 21-Oct-26 17:08, Markus Probst wrote:
> > > On Wed, 2026-10-21 at 16:32 +0200, Hans de Goede wrote:
> > > > Hi,
> > > >
> > > > On 21-Oct-26 11:21, ChunAn Wu wrote:
> > > > > Driver-created serdev clients may lack an ACPI companion or devic=
e tree
> > > > > node.
> > > > >
> > > > > Add a creator-supplied name for these clients. Use it as a serial
> > > > > modalias fallback and to match a serdev driver of the same name. =
Keep
> > > > > returning -ENODEV for unnamed clients.
> > > > >
> > > > > Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> > > >
> > > > For v3 of this series please include a cover-letter and explain
> > > > why this series is an improvement over the` existing situation.
> > > >
> > > > The dell-uart-backlight and lenovo-yoga-tab2-pro-1380-fastcharger
> > > > drivers are both pretty special cases and here you are adding
> > > > a chunk of code to the serdev-core for those special cases,
> > > > so I wonder: why?
> > > >
> > > > The current manual attach approach taking in these 2 special
> > > > drivers works fine.
> > > >
> > > > What does this new approach gain us ?
> > >
> > > That was my review comment [1] that resulted in this.
> >
> > Thanks, that is useful info and the kinda info I would
> > expect in a cover-letter :)
> > > From what I can tell from revision 1, ChunAn Wu is trying to fix that
> > > accessing uevent and modalias of the device (via sysfs) results in a =
-
> > > ENODEV error.
> >
> > I see. Makes me wonder though how that -ENODEV is a problem,
> > it is weird. But is it a problem?
> >
> > The v1 patch writes the following about this:
> >
> > "This makes the modalias sysfs read fail and suppresses the device
> > add uevent, even though the device is registered and bound to its drive=
r."
> >
> > Ok, but the backlight driver ultimately ends up adding a
> > /sys/class/backlight device which I assume does get
> > a uevent, or is the problem that one never getting a uevent
> > because of its parent not getting one ?
> >
> > And the lenovo-yoga-tab2-pro-1380-fastcharger driver does all
> > it needs to do fully in kernel and does not even export
> > a userspace interface.
> I am not sure which issue is solves precisely. Maybe udev doesn't like
> it?
>
> ChunAn Wu has to answer that.
>
> Returning -ENODEV on an existing device there is likely not intended.
>
>
> >
> > > As mentioned in my review:
> > >
> > > - "/* TODO: platform modalias */"
> > > - "/* TODO: platform matching */"
> > > still exist in the serdev codebase (drivers/tty/serdev/core.c) and ar=
e
> > > unresolved. Resolving those also fixes the issue mentioned above.
> > > Therefore I think this would be a better approach.
> >
> > With that said given that there are TODO comments for this
> > I guess addressing the TODO-s is ok.
> > > A cover letter is ofc still needed.
> >
> > Ack.
> >
> > > > Also if you are going to do this may I suggest looking at doing
> > > > some sort of of-compatible matching based on a compatible string
> > > > inside a swnode ? I do not know what that would look like but
> > > > that is something which seems like it might be generally useful
> > > > also outside these 2 special cases.
> > >
> > > I haven't used them before, but I don't think of-compatible string
> > > matching inside a swnode is done anywhere in the kernel (At least I
> > > haven't found a case).
> > >
> > > They can be added supplementary if needed.
> >
> > The idea was to make this a generic match mechanism / helper
> > function busses can call, like the current of and acpi
> > match (and modalias) helpers. And then have matching by
> > a compatible string instead of by name since matching by name
> > only works if there is only 1 instance.
> Please take a look at my previous review comment [1].
>
> In this I suggested adding a `id_table` field to `serdev_driver`.
> This allows to match multiple instances, including providing different
> private datas.
>
> software node is only relevant I think if you already use
> `fwnode_property_read_string` inside a driver next to acpi and of, and
> also want to handle devices without of or acpi.
>
> Thanks
> - Markus Probst
>
> [1]
> https://lore.kernel.org/linux-serial/0be5624e3778c3426f88daf2d67376435f47=
4497.camel@posteo.de/
>
> >
> > Anyways this is just an idea and somewhat out of scope for
> > this patch-set.
> >
> > Regards,
> >
> > Hans
> >

Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D1913D539
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782757; cv=none; b=L5QPdrKOFZ+hoYv2hI05+Hcuso6HGyUAJdMNT478B/3J2mGqmNKkudjcgEi0tY2Xm4i9bfbLzAm4HaV+rf5gX7z9pY769PCiyOo5S9BjrcsK7IGGAqxPRzmXPvF5So6DpVE/bggVYCs/99ZDDctR/Tz3H96eNQSoDRbb6sTkJd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782757; c=relaxed/simple;
	bh=Ps9qTqmo79GI4OkJiEco7YqLY/fMbiliLAVMkxm0YU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMm+LskSd5VwiYANjVIrmdeye7Zb67mByT64yvlCn/jN9lt/Qzjpqdpc5squ/Iey4JYNBuT6roWdb0IyWicY0S4K9glumtdJ7Yd4fYpDBM+3978559a+kDgwZDtm5X4F+tFN+RtVynxvT4RwJZyqeHi6dWXCVPtfd2e7ceQvEXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NRFHIh8p; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NRFHIh8p"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 9614EBDA79
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 12:45:53 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 8C526BCF4D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 12:45:52 +0200 (EET)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id F07F22024DF
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 12:45:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767782752;
	bh=UPJqUBsu8J6PaUXvQzvKo8/QsD8sXV/qiiqM8ei6DNw=;
	h=Received:From:Subject:To;
	b=NRFHIh8pREVeqbSjAXcOjmUQ87GsTCbRD0f3K9FLaQj8QAoNqRiU2qQLwmz8i+ynv
	 /rrru1GU6gv6U/36B1TySLF0lRNZIjPTz+ldi8dwpxZv2iyUAymDi2VgtXbTixRxI1
	 4HNVm68zzP+BVB644PGQOK74GgH7QBUdAekPk18YyzsKtAWUMc3JGy0vLXU1sqDVzH
	 ilb4SVRMmehRKcjD/UmrSKa6Fh8ng90v+9Q6ylUGWbmpfEITxkfBdgQAuFEG0dlPXa
	 0uOZ13Q8Re5HpDP9pXsiDSGyvsZ1WvF9anUlhgtHp4zh+IGXPQ6sPwUmE7WQUMfOhm
	 EdQKiRFMSpLuQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-382fea4a160so6008441fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 07 Jan 2026 02:45:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX2Tzo/XyUmsmNED2mUULdAjo18OYrwXzeY1gLVxC+d41eLRxVRO9R/ziS2gRoL84OQnodZekqhA3nu2AR0RQ4onNve@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPGcaxi2lMdVS3rkV13pWxXAATMZ7Ybv7cNZv7mgyR2tGAG0V
	H0vDxuznxxlY4lmv86NpFPEo0/14ouMhzA3cMt/ZRrDVguywm99MkBhJiXFXtwkMFiZOet//Eyz
	trmmalLnSftFcJsFVLVyLPqzObNeloEg=
X-Google-Smtp-Source: 
 AGHT+IHbMDVsmXrfo3Kwh8F5r0Coxxs3PxbChd/QtQ5ssN61Ccbu+x6jyWazCZP7Qk0EfBV3ViA3oF7Wvl6e4+5Z/MI=
X-Received: by 2002:a05:651c:2229:b0:378:d5dc:17c2 with SMTP id
 38308e7fff4ca-382ff677592mr6064931fa.11.1767782751490; Wed, 07 Jan 2026
 02:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me>
 <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com>
 <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com>
 <1adcffd1-2381-654d-b9b5-966306758509@linux.intel.com>
 <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
 <d169655b-4e15-fab6-0ce8-7a6bfd6a47a5@linux.intel.com>
In-Reply-To: <d169655b-4e15-fab6-0ce8-7a6bfd6a47a5@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 7 Jan 2026 12:45:39 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEE0TXZqKy1W0zPjP=6+oog1ATfGJeLFqyLwr8kMZ56Lg@mail.gmail.com>
X-Gm-Features: AQt7F2qGi_Ib-l_BkhSdFBmsl2C4nJR9G3ErPBxu5U5NEYUxXg7eniaXsipzZ30
Message-ID: 
 <CAGwozwEE0TXZqKy1W0zPjP=6+oog1ATfGJeLFqyLwr8kMZ56Lg@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kelsios <K3lsios@proton.me>, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>, Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176778275219.936046.7124158238098268394@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 7 Jan 2026 at 12:42, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 9 Dec 2025, Antheas Kapenekakis wrote:
> > On Tue, 9 Dec 2025 at 10:17, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > On Sat, 6 Dec 2025, Antheas Kapenekakis wrote:
> > > > On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev>=
 wrote:
> > > > > On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
> > > > > >
> > > > > > I would like to report a regression affecting keyboard backligh=
t brightness control on my ASUS ROG Zephyrus G16 (model GU605CW).
> > > > > >
> > > > > > Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patc=
hset v10, keyboard *color* control works correctly, but *brightness* contro=
l no longer responds at all. The issue is reproducible on every boot. This =
problem is not present when using patchset v8, where both color and brightn=
ess work as expected.
> > > > > >
> > > > > > Important detail: the issue occurs even **without** asusctl ins=
talled, so it must be within the kernel HID/WMI handling and is unrelated t=
o userspace tools.
> > > > > >
> > > > > > Output of dmesg is available here [1], please let me know if an=
y additional information is required.
> > > > > >
> > > > > > Thank you for your time and work on supporting these ASUS lapto=
ps.
> > > > > >
> > > > > > Best regards,
> > > > > > Kelsios
> > > > > >
> > > > > > [1] https://pastebin.com/ZFC13Scf
> > > > >
> > > > > [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive hand=
shake ack: -32
> > > > >
> > > > > Oh yeah, asus_kbd_init no longer works with spurious inits so it =
broke
> > > > > devices marked with QUIRK_ROG_NKEY_LEGACY
> > > > >
> > > > > There are three ways to approach this. One is to ignore the error=
...
> > > > > second is to drop the quirk... third is to check for the usages f=
or ID1, ID2...
> > > > >
> > > > > I would tend towards dropping the ID2 init and ignoring the error=
 for
> > > > > ID1... Unless an EPIPE would cause the device to close
> > > >
> > > > Benjamin correctly caught the deviation
> > >
> > > BTW, we want to record this knowledge also into the changelog so that=
 the
> > > next person who'd want to make the check stricter does not need to gu=
ess
> > > whether it was based on a real observed problem or mere guessing ther=
e
> > > could be a problem.
> >
> > If we keep the spurious inits, the stricter check will catch them and
> > throw errors. This is problematic.
> >
> > Kelsios, you have a device that allegedly would not work without those
> > inits. Perhaps you could try removing the legacy quirk from your
> > device and see if everything is ok?
> >
> > If it is, then we have a tested device and a case for removing the
> > legacy quirk altogether
>
> Hi all,
>
> Is there any progress on this?

Hi,
I plan to revise the patch series and fix this issue next week.
Currently on holidays

I am unsure how I will tackle this issue, I might make the init not
fail for 0x5d/0x5e, and try to avoid printing errors if the endpoint
is missing.

Best,
Antheas

> --
>  i.


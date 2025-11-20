Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4434A3DC
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648175; cv=none; b=rcuSRGhThzhE29DI596S70DjW9h3q7fuOBvO4M6t/m0E+l0SXPF+Oc4Dv8u9nPpDxUC3RlpqYcK5t5l39s3C+3FE3OT84mCxr6+QLwHTMtgxG1YmYmUOSN6sanNgHgHm6nohEdmoOJa6DkIX91rXNqCavimTJmTuVqlyeTOlWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648175; c=relaxed/simple;
	bh=LcdmC8BWjSRfnP1JsZPnb1OcIizxXuDrfcT5q0q86oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQGB1YGwTblrsnG2BWNDu4aT8UE8oQEY2Eq/y1fnNdxSP7RquDuffXgRb1R4l43NxMMqUflfh7/caL9Wfnws/DC3siF0YPy6m3XIVhAmjX8DOgQ/thP6socMttnLdykFAloF+Sv8wEuR7ZpoAyJGt3fhovzqSlTBhHWW23fsk8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=gkP3/Q7C; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="gkP3/Q7C"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id 119A643F42
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 14:16:09 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id BAB874404B
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 14:16:07 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2EBC91FD263
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 16:16:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763648167;
	bh=+3FlKU7kMhRhP7PLm69wTNV9J2vjBQaBUz9iKEsYq78=;
	h=Received:From:Subject:To;
	b=gkP3/Q7CuTa+b2FDjXrTI3+nv4Gin7khH7RfehC6ie9PlBHoNwBmolldfc7WRBhpq
	 o3Oxrl3cPV581cbkEqX5kIggEcgbIHnkaF05831qjFzrlcyRSI5OIn2wMoPfaMrMu/
	 h2qBqUADdBCjqGTI4wCgMkeApWh5dG7EzRiFoDbV0roRa3HoIc47P4L1IlviwoRv6o
	 5xWbNYL3DmgSMIXnoUk01U7zRKD9dJdLFrRYutzvbkWKtNQ/ffhK3f1bcZyx5P+ypB
	 E/tna2J2HkCRF6GyljpiLPtYF9j/xn88FK4E+rjQOPnns7sv+dh7h/A/BMVEw02wdE
	 X3yM4aRt2Usmw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37a34702a20so7678551fa.3
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 20 Nov 2025 06:16:07 -0800 (PST)
X-Gm-Message-State: AOJu0YxKW2EtekkqxKQaSvvfmotsq/+CgzLDHFDdZXNXNFeckBn0MC8c
	iqIPJ2SjLZ0XEVTXKeshWncEYcj7wxelRwNgdVoBO4WV8pLPaHMgb9GjeP+5olk8xWq+Ygnj4G2
	RC0ZFvXGie4Qr6R5ekjyvFDJ6z5Dk5OE=
X-Google-Smtp-Source: 
 AGHT+IFzbbgguDckno7DAED1XLqfHcvCwYp7aaETheTG7gNlPneDY5E5gil3V5Dj8g2V/HLmUuzVlCtvJaN0fxgf5ps=
X-Received: by 2002:a2e:8645:0:b0:375:ffc2:1b40 with SMTP id
 38308e7fff4ca-37cc68ca9a9mr9575291fa.35.1763648166743; Thu, 20 Nov 2025
 06:16:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-7-lkml@antheas.dev>
 <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
In-Reply-To: <f13a53d9-e5b8-4380-b134-16aa81eb0a88@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Nov 2025 15:15:54 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
X-Gm-Features: AWmQ_bnuY39r4tTrRYDKH82bP8pVnBKMWQargzD1tTa0iYJIlpKxzhc199bI7pk
Message-ID: 
 <CAGwozwEk0k3K8v2GOX2+9Rrcx_pp4xAmiJExzoRNADeridRTfA@mail.gmail.com>
Subject: Re: [PATCH v9 06/11] HID: asus: early return for ROG devices
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176364816735.2642188.17641761349430499609@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Nov 2025 at 14:29, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/20/25 10:46, Antheas Kapenekakis wrote:
> > Some ROG devices have a new dynamic backlight interface for control by
> > Windows. This interface does not create an ->input device, causing the
> > kernel to print an error message and to eject it. In addition, ROG
> > devices have proper HID names in their descriptors so renaming them is
> > not necessary.
> Is this patchset supposed to work without the renaming, correct?
>
> If so consider dropping the drop of renames, taking required time
> to organize with Derek and resubmit when things are ready:
> there is no point for the rename to stall the rest and quit renaming
> is not urgent at all.

I feel like two months is enough of a timeframe for a simple rename
fix to go in.

I do not want to have to reorder the checks just so the rename can
stay in _for now_. Skipping the ->input check is important for both
Xbox Ally/Z13 as it causes errors and the device to stay partially
uninitialized.

> > Therefore, if a device is identified as ROG, early return from probe to
> > skip renaming and ->input checks.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 3047bc54bf2e..6193c9483bec 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -1236,6 +1236,13 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >           asus_kbd_register_leds(hdev))
> >               hid_warn(hdev, "Failed to initialize backlight.\n");
> >
> > +     /*
> > +      * For ROG keyboards, skip rename for consistency and ->input check as
> > +      * some devices do not have inputs.
> > +      */
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> > +             return 0;
> > +
> >       /*
> >        * Check that input registration succeeded. Checking that
> >        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> Just for clarity is this supposed to fix this: https://gitlab.com/asus-linux/asusctl/-/issues/700 ?
> This model works once in windows users disable  that new feature.
>
> Note: that kernel the person submitting the bug is using contains your v8
> and asus-armoury.
>

No. This user has a laptop that has at least a WMI implementation of
RGB controls (this is why you can see rgb settings). Since you did not
ask for logs, it is not clear if it also has a HID implementation that
is skipped due to e.g., a missing product ID. Very likely it is a bug
on the WMI implementation that is out of scope for this series.


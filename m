Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309560;
	b=foKyoetrcNhCrXnjMANwkSqeHGjsU/LqndrfmAdtfTC8hzmFCFObNupJigdxPHEr3S5j
	 z79SOF+ot0ktyMSqfhHUVNXSaTJ4ZxFxyPwcCVvJ1sosze5Bt2fm5JxpVdYt3/dJqP/ZB
	 OfQvsRdAY77U0XJRWVN22WbaGdcmdw72bdrOE3ttVJ08/g1TxnhYKH+G6TQZys/xANS8U
	 euwrdLkIlj0vXShLaXfs8cYVcQJYIDmf+donH+DXgmBoK10XqjbkOm47afYOH5k9FabsN
	 3eZCbWgYtRVT9XIvef3u2HJEKwfq7QX7YDIlnLJ1NrfHV8iSvJbNidzxz84Kn14ke4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
	b=fInxt1pAkZAQREeTKFyGnmlRFONXWKfY/xQtHxLdpxAuU3e/iYRQqqfxo6LLJKNY7I78
	 QN5hCh+JrularcH88Z3DNwD1K4t4AsUzF6g15pYztIRXEUw7vJDLNF2vA9n7jgfWN+cXr
	 /zDQ9QXGPatnTcIErF5uOnOSuo1FYxuciAXwS76aNyO7CVKWgiRsZ0u+xKR6gesY/Umz4
	 gMWZLs2nEZW1EoqvfjNuKaB5Ixs5EOl+5CoQuuWFFD1J2/XSfSIENAmTYgrGqsu7uKYQX
	 iPzovgwVpEBIeY8eHErFp2JSL5E0NuoI/v775CByK6ppYcj5hstR5lwY+yh8nJaGj/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoH5oROd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433BB606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 21:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 433BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FoH5oROd
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91c76540d0bso888926d6.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 14:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309559; cv=none;
        d=google.com; s=arc-20260327;
        b=c+e6bgBH2PdHtEjATTkhfpyG1JVAn1qKLP4NjpSCm2L1lBoisdcPoms4AWTPUdkiPt
         SHQPfxon1WkqwVcEn+Sjn1JPQVfVm28WLHn7HMmVj/ngyF8wskbR2LOaOBlhSVQ3apiz
         A7y2spfE0JISPB68+IglWafkkcvxMoZYo153VHkPsFf1UrwZWYsQVFVe1oyK3LQSygBw
         eYvYGnESYXwnjVc1OH1FGL36SvoOXxjEv1LUOAju0cznjvvN0TdoRBYkcoGXFhJOTJV5
         +5yqPsh+AZJncqGeExpxVT9Kvd/FAMsGErpq2R+HOGLaNe5R0a/3yx0rbpB2a2yNF21G
         GlQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
        fh=H//D/j3GKrcojTnFu+hBdU+PrQa8AC8vL7iHNnzy6SY=;
        b=TcDUtIrZf/L2hLjc8fPj8Rj9GJvIUXinfwn4YKJVGqWTs0BTmV1ktk0ppEGqy2620x
         roQvdm6AdG1xP+qhPPI42n8UdGof8U4RupIV7ryYxqEuurFnSUJBAsHOiXJMZGwM/6P2
         1+vYJSZC+EOS+WR3c/6Zeft+Gq10ujsl/BU4Bmn1hmsXdzWlcaKQuPYoIWo7ZEbNRy0L
         OYmPgbREcTdl6K41fNTFhq9oJluxHeTecsVDvvkB5SnXNrXmlNvB0oGCU1nY8XMNwJYs
         I2RXu519YkErBJtx6OamFoRVMznSakcRwHlz0F8JtL8HfY4HL4kBjJxgLNwpjODwr5UC
         aeiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793309559; x=1793914359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
        b=FoH5oROdV9+WJ5k6hA261DYMVshQPYVG4ZphwjWrjafAlLgBGbTRQvjMzeEUENl2/a
         K8hqasjWw4MrkgTPC84fv7iF/1cmXraW+DodC2nDPnia99A4DLC84vnLC1wvE/6nVGuY
         QAbWy3zkdAk/BcAJ+AD725GXyicOOTA/sLPZJNae8fJc9iAdXMMrm+0x0so79kCeTUoO
         A8olktc/t2snkr0xQpDTFU0AHGTKFCVsnmFtCiNUe8xW8v3q4IbKfKYnBirGVeoqOxjD
         Ech0i+SX2DtvesuIBzofFJXlE9F6LEAxn96ZnamJtSsZcYcxcrd83GokVvNnwsK2wLXI
         bk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309559; x=1793914359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkKUFvVZRYZEOBb5LAuzn/u1ouktFg104JryDTvOi2s=;
        b=RiRgPBcKrWFkyrCIzdYlNbQ47wvg6E0693YJg/H4jw1pL3TD61FX/g2Y/CB53vLjhA
         XhRIGtgym+zSgLiE0EPpWLgI/eklfWrqGug+7xuFOtRY+7H/E5B4h5JugBuAyT0NWwME
         wcs0/1kmeIlqiYNw2wS6q5NbFzOlfBFR/MdHzhQi2o98B7qd/3mkaOkUF/Sg+IBVkW+o
         Ma7yd3j42Qhf/h20LGp54erqDPntMjSUbU1vMdShUEdrTmUbOIXu/ak2qxRYbI5TjQ14
         hnUzcZTvBTnk3CXxXZrf9TUtheUV1YjivaVSIlkJBpMj5JBrVWqvPOB+GZjHrFADU8RW
         IDzw==
X-Forwarded-Encrypted: i=1; AKwUvBzAEmpolou6aIJLU4GXPjiBS6+BSiCyiUHtIP8SkeEnYJYZ7W7yamMU99TRX9KYjL1ksYhqN1ny8Jh+3EilrNu4+Lax@vger.kernel.org
X-Gm-Message-State: AFq9FYJYbTPGbkS/2F2ZHxG/FL6hSfXBSJKS8aBB+6LX/+4RiJ/hEPTx
	oe3wAMi6+m0+CK+0MUkVxH6ygh+q8X+vOUrMreOPCYSoagPN5x0Vxtdc4tRUDoeei+bA9XkVAwv
	qPbU47YfQXoIy1/Su0nr7hZcD9QNlJXm7YL4YNzEAAw==
X-Gm-Gg: AYBFou14m+rh4MD4OBCxueVEJrG9EtIK7W0vsPqUHbt4/99a68j44EBCBkprmpxV1J3
	irMVM09ZabU09wUN35dx1ohFqyGjRQujDsKuVFm6msWon/9YJU9Zh/qZ10O10SWBaDw6xBZGPJD
	9nsQ8H9pwNrQ1/FC8StIqNIdWhJw6KqprGYGxmF1gNN9SMxcZmD1QTJnihnyLFAKBROpjtVQ7T1
	2qjApbJXRk3ag9QD+bPEwfIyr+9m8PFxfvP8mhHSG1caKaB9UtTFDXZ2GTEXg1IaCsVAK0I1OWm
	Nqm/GzGNpfp6nxoFAzYo0lIEzsLzwv3qTYmRjlCKAo+MjdW/3vYvQOxsXkCuT+Rde0wGkoeImLl
	eGdYz7/HKnQq+fcw99RxjicpiJGf++2Z4muN9wwHsfvzO1WFWSq95CJrow0yentiKh7an
X-Received: by 2002:a05:6214:1d0c:b0:91b:5d3a:4fcd with SMTP id
 6a1803df08f44-91ca4c29c9bmr3565326d6.58.1793309558970; Thu, 29 Oct 2026
 14:32:38 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com>
 <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe>
In-Reply-To: <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe>
From: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Fri, 30 Oct 2026 03:32:27 +0600
X-Gm-Features: AclHuK-li7Kz1CGiaWPIm5jwPJr-xw07xpCpyrsNv6RaBX_PUzDNGTbYN34Uo0k
Message-ID: <CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com>
Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in tablet
 mode; EC expects VPC 0x2A with posture data
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Andrew Kallmeyer <kallmeyeras@gmail.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Swapnil Devesh <me@sidevesh.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in
tablet mode; EC expects VPC 0x2A with posture data

Hi Rong,

Thanks for looking into this. I ran each case on the 14IRL8 (82YL,
BIOS LHCN30WW) with my userspace daemon stopped. Commands were sent
through acpi_call as VPCW 0 <data>, VPCW 1 0x2a; the EC cleared VCMD
within ~10 ms every time. Keyboard/touchpad state was measured by
counting evdev events from the internal devices (AT Translated Set 2
keyboard, ELAN327E:00 04F3:327E Touchpad) during timed windows while
I typed and used the touchpad. Backlight state is by eye.

One observation up front, because it affects how the commands should
be used: the commands set the keyboard/touchpad lock directly, but the
backlight only changes when the command agrees with the physical
posture (details under the 0x08/0x09 cases below).

> What if:
>
> - 0x0A is not sent on start

Not needed here. Fresh boot with nothing sent since power-on (the
previous shutdown had sent 0x0B): folding alone left the backlight on;
0x08 while folded turned it off; unfolding plus 0x09 restored the
keyboard (19 presses counted) and the backlight at its previous level.

> - 0x08/0x09 is sent after sending 0x0B

Both still work. After 0x0B, folding alone did not turn the backlight
off, 0x08 while folded did, and unfolding plus 0x09 restored the
keyboard (34 presses) and the backlight.

> - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times

Harmless. 0x0A x3, then 0x08 x3 while folded, then 0x09 x3 after
unfolding (0.5 s apart) behaved the same as single commands: backlight
off while folded, keyboard working afterwards (18 presses), no flicker
or delay.

> What if 0x0B is sent when the keyboard backlight is on?

In laptop mode: nothing visible changes. The backlight stays on and the
keyboard keeps working (27 presses afterwards).

While folded with the backlight already off after 0x08: the backlight
stays off and the keyboard stays disabled while folded (0 presses).
On unfolding, with no 0x09 sent, the keyboard (24 presses) and the
backlight came back on their own.

> What if:
> - 0x08 is sent when unfolded

The keyboard and touchpad are disabled in laptop mode (0 key presses,
0 touchpad events over 10 s), but the backlight stays on. After one
0x09 the touchpad and keyboard were back.

> - 0x09 is sent when folded

With the backlight off after 0x08, a 0x09 while still folded
re-enables the keyboard and touchpad (37 key presses and 3798
touchpad events while folded), but the backlight stays off.

So on this EC, a driver that sends the wrong posture would lock the
internal keyboard and touchpad in laptop mode, while the backlight
depends on the physical posture as well. Sending 0x08/0x09 strictly
from the posture reported in the YMC event looks safe; 0x0A and
repeated commands are not needed but do no harm.

I also tested unfolding after 0x08 without sending 0x09 (0x0A sent
before, no 0x0B). On unfolding, the backlight came back on, but the
keyboard and touchpad stayed disabled: 0 key presses and 0 touchpad
events over 10 s. They worked again after 0x0A + 0x09 (sent together,
so this run alone doesn't show which one was needed; in the other
tests 0x09 alone was enough).

Compare the 0x0B-while-folded case above, where unfolding alone
restored the keyboard. So once 0x08 is sent, the EC keeps the input
lock until it gets 0x09; after 0x0B it follows the hinge again. For a
driver this suggests re-sending the current posture on resume (the
posture can change during suspend), and sending 0x0B on remove or
shutdown, so a missed 0x09 can't leave the internal keyboard locked
in laptop mode.

> An acpidump would be helpful.

The compressed dump is ~390 KB, so I'm sending it to you off-list
rather than to the lists. The MSDM table is stripped from it.

Thanks,
Mahir

On Thu, Oct 29, 2026 at 11:18=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Hi Mahir,
>
> Thanks for the report.
>
> On Thu, 2026-10-29 at 03:21 +0600, Mahir Faisal wrote:
> > Hello,
> >
> > On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
> > laptop is folded into tablet/tent/stand mode under Linux, while on
> > Windows it turns off. I traced the difference to a VPC command that
> > the Windows YMC service sends on every posture change and that Linux
> > does not send. Details below; I'd appreciate your view on whether
> > lenovo-ymc/ideapad-laptop should send it.
> >
> > System
> > ------
> >   Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
> >   BIOS:   LHCN30WW (latest)
> >   Kernel: 7.2.11-300.fc45.x86_64 (Fedora)
> >
> > Symptom
> > -------
> > When folded, the EC disables the keyboard (no input reaches a VT) and
> > SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
> > backlight, however, stays at its previous level. Writes through
> > KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored in
> > the EC (KBLS reads back the new value) but are not applied while
> > folded, so there is no way to turn the backlight off without
> > unfolding.
> >
> > The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW,
> > "EC Notification":
> >   "Fix the issue of keyboard backlight is on when turn on in notebook
> >    mode and change NoteBook mode to Yoga mode."
> >
> > The DSDT contains no tablet-mode handling in KBLC, and _Q1B only does
> > Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.
> >
> > What Windows does
> > -----------------
> > The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
> > ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byte
> > buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
> > Management". Its handler for that IOCTL maps function 0x0C to VPC
> > command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as the
> > data byte, using the same VDAT/VCMD sequence as write_ec_cmd().
> >
> > Values of X observed in YMC.exe:
> >   0x0A  service start
> >   0x08  posture !=3D laptop (tent/stand/tablet)
> >   0x09  posture =3D=3D laptop
> >   0x0B  service stop
>
> What if:
>
> - 0x0A is not sent on start
> - 0x08/0x09 is sent after sending 0x0B
> - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
>
> >
> > Current Linux behaviour
> > -----------------------
> > ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and only
> > for models in ymc_ec_trigger_quirk_dmi_table. Booting with
> > ideapad_laptop.ymc_ec_trigger=3D1 on this machine has no effect on the
> > backlight.
> >
> > Test
> > ----
> > Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data>
> > followed by VPCW 1 0x2a, then polling VPCR 1 until 0:
> >
> >   data 0x0A, then fold      -> no change, backlight stays on
> >   fold, then data 0x08      -> EC turns the keyboard backlight off
> >   unfold, then data 0x09    -> keyboard and backlight work normally
>
> What if 0x0B is sent when the keyboard backlight is on?
>
> >
> > I'm currently running a small userspace daemon that sends 0x0A at
> > start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
> > reliably so far.
>
> What if:
> - 0x08 is sent when unfolded
> - 0x09 is sent when folded
>
> >
> > Suggestion
> > ----------
> > On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported posture
> > is anything other than laptop and 0x09 for laptop, instead of 1. This
> > might also be worth doing outside the quirk table, since it matches
> > what the Windows driver does on every model it supports. I can't tell
> > whether data 1 is still needed on the models already in the quirk
> > table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
> > that hardware would need to check.
>
> There is a chance that the 0x0A[start] =3D> (0x08[fold] <=3D> 0x09[unfold=
])
> =3D> 0x0B[stop] sequence is generic. Derek, Mark, could you confirm if th=
e
> sequence exists in the documentation? If so, I think we can replace the
> quirk table and the module parameter with the standard sequence. I will
> prepare a patch once I get enough information.
>
> +CC Gergo, Andrew, Andr=C3=A9, Swapnil
>
> I believe the quirk was concluded by trial and error. Could you test if
> the above sequence works on your devices?
>
> >
> > I can provide an acpidump, the disassembly excerpts, or test patches
> > on this machine.
>
> An acpidump would be helpful.
>
> Thanks,
> Rong
>
> >
> > Disclosure: AI assistance was used to troubleshoot the issue and draft
> > this email.
> >
> > Thanks,
> > Mahir

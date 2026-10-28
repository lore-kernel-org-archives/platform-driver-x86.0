Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793222513;
	b=sLbBndJQ+PKamzN/tmJ3WyqSYM1R3SLlvgwXy9GUXmP62VYAJZLEIhVbrqzua2gMGrvB
	 9utctijIEkhQ1mcJ4f/3a/vD+QrLn0/+zkZeomPJU0JVBCGLN/WtcyBTVlHEaiVDEv2iy
	 N1JKRs54bZuJpz4ldlEKnbpZ45d+OLGA57gpoagb13XkAx/yv4Jz2Q8v0qDaeUc7o45z6
	 Iauy4JESljLArOnsimNodTgSHzvElRn/N5uFDU4P452+m+Qei+ckS7b2HdZOnsugCOmDT
	 hV0GUQ1om9wNsSJEGJfOfMAUSExl3YtuNOx3VHL/3uXXpGkG1hs5UdTVBFIOHuqIJMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
	b=MY0lJTPX84t2e3NK8mdfO1DcJPutOyZ5I4ezxS+SM7jCwJ+U9Q4xil6zXrkTIAEQYHpS
	 LX3QixEIGdBnEIJ6Ll3lg7sdALXfG9YmcgbH6nWKigSFBNRJdmvlXPI+b4GbBp2iKCasv
	 oNUuecuqXynIcIb0V7rwkEuoGkP+9YKnmzgpjTZAeZXRYXlPzKLlSz7wnwg4LNa+QH0A6
	 9ikuBjqG8neCSLirEcg6VDXt+C0XCP+PRIuy+cIYWrV6RdUUI0Jak70yQt19x06WDop0u
	 o7uKfX1WMt9VYVg6iozOvHeDPlFra7eStdlBXgk5uz8sbDfF+D1Whb1IPRqLiipP1Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMVnz7L5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4BD606A31D
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 21:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gMVnz7L5
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-917a707f37eso14945466d6.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 14:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793222512; cv=none;
        d=google.com; s=arc-20260327;
        b=SKCZ5XNk27UBq849qkDIxmTsw3BO5WX/NFczybJ3P5QpiWcSAJMyVkDGhvToVifcX2
         HPHHnx1STqu8ka619rY0w5tfYdtv0L21NUnW92dBHIWOfZNf4uprK6x2c/AiYnmx+SMC
         UVfjRN0LFpp97nuPZxBNSg3Bh4nTzNvaYb/C5XCV4jPTu2snsI+i5ihWvySJs4BoeogJ
         aHvoLBGIyZTwmoQrCAe+kjtsX6fo3RRNC3YLlwwHZ7Ttlp3PtbPy3GLbaexB99PA/zpV
         KL8H4m1in5P0dnRUCzxIL2mxLyG+V80LwIrKWtRuHmj7Dm06NGg2CGCA58AfrNOUFI8z
         hZhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
        fh=16tpOr4agZC1C9ZDcHRKRoGYhca28ZUB6LMSpipQ6d8=;
        b=JuzC0bMUThGVh5jHmGgKaQ9TKDLowdFpnUIb6K3gAfWjFvjwDjYt3rasLXszcrjpTY
         bvwJ+xtopQuHCkAsAekFSshC0bAb8Ms0vaEyM/7taZx2yuxe9HC5mZA2vo6GGjPnSxwu
         HRGPkNRpzQdu+eaubdWipgshNLQZPILmVHPrwpfr3X9yEHI2X+l/pN5EUck/caZh4AFg
         eeowZX8++NTyw9DKo8jTzROgdUHlG+hbmmTCaaipmK4R8JlRhWDDFB7mvqnM6RcfBUUE
         dNcGBFp6Eta+56DWOkCLu6iCEFmIE0RNhqRbvb/Jgbv/D0qgUjvyN02SxwMe/SgUjpcE
         kj5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793222512; x=1793827312; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
        b=gMVnz7L5ieqJUx2OQeFTamuf2oJLu2mqxfBqwqa8rUOK1RCdR4MO0jhKH2dgQaVc7M
         tLeKVp7cKr46dhqXP41zMdWqApWe04qAJTvDRREy0satsiRCM9WypgSIMJz2dS4d/lqt
         VXwzK0tNV0OGsTi0ClKGxAyQ5czqwqUt6QMHn8IUpJDGkAx3A9A/ettXv5XQKOSgfHpp
         ZM/e9bWihZCv4V9GTO0F/wrX7eUI8bQmUCO65vQjKB8/IiEcIInlEs2IoQzQJdqBF6u1
         bxXKbYqIhRRl7bqJEv6RaDZyduf2WCjRNJ+8lh4Y5hPgY6nE5Xd4E+wWTae+4nMkSplL
         ujRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793222512; x=1793827312;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qarja5PXnP73rFVRv7cQGeplA1yMmhkrsY1Jqb9V5Ug=;
        b=bVem7EE8gXMuv4PZ2XAlOXbVMFpBccIMXdTy4CuqglgOukFhCvEqt3dHqt/4Qb7R6q
         wqNhRN5RMIYgcHbCXYxu6AyAlDP6fa+irGhOltqT6mGMcmmf8276PDSlYRzcnp3tScRj
         v5c2D4rwyrke+kaMMUDVUHO590r8510tv+ALgM8tjrD4rlGcZbPFZ6m5wMd2XLIuHMZQ
         tPvktXRHxT4Osj2S9BCRG7usuOLHMFk+JSxMuCOpbHAyFenavxPvXn4JLWLdY83CLGav
         mXfKzJaptqVbbkbUnbogPPh18NGslwKwniykvdw1Oo7vM9xSXrBtNLjFgz4DuDlBfZ4H
         RF/A==
X-Gm-Message-State: AFq9FYKrcOCXJmpA9/Fiv8BI/uDZVojubQbU0QLt9qBMZkb4PsItDImq
	ecsCAkpK7+njjsJsEGlNwulUv+LfYHSi6rgNiECWpD8U1JZ2IsAh8d0Y25IRrrGhGUOZVkxtfoB
	XkYIki5E+jpqP9XrI+9pmFMsXwPxMaZE=
X-Gm-Gg: AYBFou3sWY1mCgH0NVjv8u6V6dq4r3PA2It80Ph75Eil+yrvRdaTzCV20bLYvBsyHDt
	CAXH7JuCFFGIjA8Oj0z92H7Q5Y0LQLeYkQ/L05tfhgrdveGnNL32/DOcPLSKw70fK9l/c8jsw7f
	mwL2SjKN4Z+jeLMCNdxG6zesS5ctO36QQFRhUplNoPsIsLGk9mreEf/tA6D4zohZzeMVrownDET
	7W/eYkd302Y89aQlu2ppx5wx5dnb3am+9h/22+515f8gAZpH9nRtVAGQA/zzz2W4kMywueMGaF9
	Eiv/RO0QTbvwVz/LFyxCvcFG0bsUMxrFED66PjKp0MAvC7LSr8tL426PAft8Chlt08TSwbmHTop
	bl0anNDXm4U1abd9i50KM1s9UTAfs3q6B/2UXxqO1a8GhB+U=
X-Received: by 2002:ad4:5c61:0:b0:91c:75df:6512 with SMTP id
 6a1803df08f44-91c7d1d2830mr61812056d6.45.1793222511553; Wed, 28 Oct 2026
 14:21:51 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Thu, 29 Oct 2026 03:21:40 +0600
X-Gm-Features: AclHuK-SBa0LZAObr8ICal18-r-5HSSQlJ2zHc2E4EIOPab0xbGreYw338udJMw
Message-ID: <CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com>
Subject: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in tablet mode;
 EC expects VPC 0x2A with posture data
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
laptop is folded into tablet/tent/stand mode under Linux, while on
Windows it turns off. I traced the difference to a VPC command that
the Windows YMC service sends on every posture change and that Linux
does not send. Details below; I'd appreciate your view on whether
lenovo-ymc/ideapad-laptop should send it.

System
------
  Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
  BIOS:   LHCN30WW (latest)
  Kernel: 7.2.11-300.fc45.x86_64 (Fedora)

Symptom
-------
When folded, the EC disables the keyboard (no input reaches a VT) and
SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
backlight, however, stays at its previous level. Writes through
KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored in
the EC (KBLS reads back the new value) but are not applied while
folded, so there is no way to turn the backlight off without
unfolding.

The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW,
"EC Notification":
  "Fix the issue of keyboard backlight is on when turn on in notebook
   mode and change NoteBook mode to Yoga mode."

The DSDT contains no tablet-mode handling in KBLC, and _Q1B only does
Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.

What Windows does
-----------------
The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byte
buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
Management". Its handler for that IOCTL maps function 0x0C to VPC
command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as the
data byte, using the same VDAT/VCMD sequence as write_ec_cmd().

Values of X observed in YMC.exe:
  0x0A  service start
  0x08  posture != laptop (tent/stand/tablet)
  0x09  posture == laptop
  0x0B  service stop

Current Linux behaviour
-----------------------
ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and only
for models in ymc_ec_trigger_quirk_dmi_table. Booting with
ideapad_laptop.ymc_ec_trigger=1 on this machine has no effect on the
backlight.

Test
----
Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data>
followed by VPCW 1 0x2a, then polling VPCR 1 until 0:

  data 0x0A, then fold      -> no change, backlight stays on
  fold, then data 0x08      -> EC turns the keyboard backlight off
  unfold, then data 0x09    -> keyboard and backlight work normally

I'm currently running a small userspace daemon that sends 0x0A at
start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
reliably so far.

Suggestion
----------
On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported posture
is anything other than laptop and 0x09 for laptop, instead of 1. This
might also be worth doing outside the quirk table, since it matches
what the Windows driver does on every model it supports. I can't tell
whether data 1 is still needed on the models already in the quirk
table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
that hardware would need to check.

I can provide an acpidump, the disassembly excerpts, or test patches
on this machine.

Disclosure: AI assistance was used to troubleshoot the issue and draft
this email.

Thanks,
Mahir

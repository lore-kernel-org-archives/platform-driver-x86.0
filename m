Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FD633D6CB
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771408559; cv=none; b=hijSlrYH5tWyzeHCSGh8a/k0kUPh4ouDqbpFgES/x8KtYbK7F4CMi9lUa+ZfjdyiroZI1vsSYIULhQnTgYVpjYKJ+bYtKJegQ4z0MPuNMxtD+Z0NrBtYn4QHtivZfeVmSr4ajcV7/JaN+BsSdrH6+4U6dx2pDd3XNT5r+vkeDVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771408559; c=relaxed/simple;
	bh=NRpQhMohh6WsKxrrSGq1M9D/siF1vRsTHqItwmavLvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yyt4hR7hJ+K2XFOqHSdcuffFIc8NcerrrcTpiG8i4rJ1TuL7y5GAXc75lsvffbRuX3i/bvxdKOL+svd9F23OvJ0pUvKFQY4ToFCi/pJZEzbjz86/NK69MzR6f2PJpcApDJtRtHQ9fz9QP9Y9HbzXuuTPWIWWUg7KNeMewVjizfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=um22DUfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="um22DUfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351CEC2BC86
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771408559;
	bh=NRpQhMohh6WsKxrrSGq1M9D/siF1vRsTHqItwmavLvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=um22DUfD5TcqAsKNXhDGaYG1sbtAI8KOuwKJ+NBtaZPCOaCeuBc3uZ8IIJkZJzVnj
	 M2/3uaaLpmNPNpr1nN5tg00iP6/te9txpu0yv7vecqfI/OUUV4KfKs1Uqaje3/Cgsc
	 CvQtRdg2PmqstZtLcbvcolNukcLZ1uTjz/VhsZd13WGFYNu1gGilOv7voJbO0FnfDD
	 rfBfe9qkFKCKm5uJ0MCtVBYzbRl3OkKrhQBTFG70+MGmDBkzCN0I1stqbjTunJj2kN
	 tRg4o+hN9HiUbd9MNNULVDNQeQ2a/RS3jEsiethnvfR8ntr7tRkbVuh0MxAWSMHWWn
	 PoPEbTuHAWnIA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3871017fea2so6578701fa.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 01:55:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWt/5F5xdp58HaK/i3kAAoCeXxWaqoT7e4oHeh+YBctgCMmdqtMKgBJP2CY4b1ePgEuMCpchlZtirhdebXBWBh3wgb0@vger.kernel.org
X-Gm-Message-State: AOJu0YzVjU7P9HIdpCZDOoafrPqz+AE/ZOfa9GrjerwcHb4PSNLqS00j
	ibsIJ+uBoBHGZ4cQt8icbMnu5HaZ9i9et7baEx+/tNhBhesVAmRM6VPQqRJlDfZH9Cmn07ASN9g
	Djn4D1Rx6/trwRSrBAaay0ntdKvItKY8RpH82cWCb/Q==
X-Received: by 2002:a05:6512:3415:b0:59e:6312:bf31 with SMTP id
 2adb3069b0e04-59f83b0bbf8mr531389e87.19.1771408557828; Wed, 18 Feb 2026
 01:55:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
 <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org> <54082217-0eff-49f6-b4f1-0daed58c2568@proton.me>
 <aZSkqGTqMp_57qC7@google.com>
In-Reply-To: <aZSkqGTqMp_57qC7@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 10:55:46 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mfd1dD7XL4smPtRTVD8vhGR=PmLLcNz2t1Q8+jwKbm5Mg@mail.gmail.com>
X-Gm-Features: AaiRm524czFdjlNwe0i51ZfItUOgkJpBREFIZiJy6HIsyqOh-P53W_BgxqN4b3c
Message-ID: <CAMRc=Mfd1dD7XL4smPtRTVD8vhGR=PmLLcNz2t1Q8+jwKbm5Mg@mail.gmail.com>
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Tj <tj.iam.tj@proton.me>, Hans de Goede <hansg@kernel.org>, 
	metux IT consult <info@metux.net>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 6:29=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Feb 17, 2026 at 03:25:01PM +0000, Tj wrote:
> > On 17/02/2026 11:42, Hans de Goede wrote:
> > > On 16-Feb-26 20:01, Tj wrote:
> > >> Installed v6.19 recently and realised the heartbeat/network LED
> > >> configuration I'd set wasn't working. Checking the log I see:
> > >>
> > >> kernel: platform gpio-keys-polled: deferred probe pending:
> > >> gpio-keys-polled: failed to get gpio
> > >> kernel: platform leds-gpio: deferred probe pending: leds-gpio: Faile=
d to
> > >> get GPIO 'apu2-leds/led-1'
> > >>
> > >> Looking through commits I found b8754092dfed4fc2fc
> > >>
> > >> platform/x86: pcengines-apuv2: Use static device properties
> > >>
> > >> After reverting it the LEDs operate as expected. This entered in v6.=
18
> > >> so will affect it as well.
> > >>
> > >> In v6.17 I see:
> > >>
> > >> kernel: platform gpio-keys-polled: deferred probe pending:
> > >> gpio-keys-polled: unable to claim gpio 0
> > >>
> > >> that is a slight variation on the v6.19 report. I've not pin-pointed=
 the
> > >> cause yet.
> > > This should be fixed by this patch:
> > >
> > > https://lore.kernel.org/linux-gpio/20260211085313.16792-1-bartosz.gol=
aszewski@oss.qualcomm.com/
> > >
> > > If possible, please give a kernel with that patch added a spin
> > > and confirm if it fixes things.
> >
> > It fixes the LED issue but causes massive log spamming (10's per second=
)
> > related to the gpio-keys-polled:
> >
> > [    0.000000] Linux version 6.19.2+debian+tj (linux@iam.tj) (gcc
> > (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #404
> > SMP PREEMPT_DYNAMIC Tue Feb 17 14:19:16 UTC 2026
> > ...
> > [    0.000000] DMI: PC Engines apu2/apu2, BIOS v4.19.0.1 01/31/2023
> > ...
> > [    6.025741] input: gpio-keys-polled as
> > /devices/platform/gpio-keys-polled/input/input0
> > [    6.035231] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > state: -52
> > ...
> > [   19.545273] input: Power Button as
> > /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
> > ...
> > [   21.742226] input: PC Speaker as /devices/platform/pcspkr/input/inpu=
t2
> > ...
> > [  OK  ] Started dbus.service - D-Bus System Message Bus.
> > [  OK  ] Finished e2scrub_reap.service - Re=E2=80=A6line ext4 Metadata =
Check
> > Snapshots.
> > [  OK  ] Started virtlockd.service - libvirt locking daemon.
> > [  OK  ] Started 819142] gpio   32.-keys-polled gpio  32.-keys-polled:
> > failed to get gpio   32. state: -52
> > 1;39msystemd-machined.service -=E2=80=A6and Container Registration Serv=
ice.
> > [  OK  ] Started systemd-logind.service - User Login Management.
> > [   32.930711] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > state: -52
> > [  OK  ] Finished grub2-common.service - Record successful boot for GRU=
B.
> > [   33.050784] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > state: -52
> > [  OK  ] Started polkit.service - Authorization Manager.
> >           Starting ModemManager.service - Modem Manager...
> > [  OK  ] Started virtlogd.service - libvirt logging daemon.
> > [   33.158927] gpio-keys-polled gpio-keys-polled: failed to get gpio
> > state: -52
>
> I think the patch below should fix it.
>
> Bartosz, I think you should revert
> 86ef402d805d606a10e6da8e5a64a51f6f5fb7e2 until after you audit all
> existing gpio drivers. Breakign the kernel like that is not great.
>

Hi Dmitry!

This change has been upstream for close to a year - it first appeared
in v6.15-rc1. There have been very few reports (I think a couple
initially and then none for months) and fixing this is typically
trivial. It addressed an actual problem where these retvals would be
propagated to user-space and misinterpreted. I think we should fix
this driver and keep this change. "Auditing" typically means never
fixing things entirely.

Bartosz

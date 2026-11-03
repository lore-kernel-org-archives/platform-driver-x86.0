Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793725641;
	b=k3xe1G61qufRWj87cFTGhPOjWWw2o7pcfGe9U9z5LhoUG0R7OPsj7lxgJJxST/SX5Bhi
	 VRHK0zM0c0UgKAsD13VUoMAR+jyn3TTjTBRmBb46e/J23FggFg2YmY/myZV2Bo8WjNp8C
	 VGd54/vwDW67SgPOdSP0EnHfSWRtDI50NHDYaIqKgwYO2HAZETIAUcAbIjJNF3hUVL5xv
	 /jjcW4NP06IO6m7ZYhF09q8zKfkGAIe6GSg9IQe5aUjFN3ASjwT0WbkB0z6c3TsuszlMa
	 l8bNNkEEBHWzjLHkVWD32bTDybvhq9968Hh6JaRwAXYLxkhuusp21G/mNnsAVMGCmTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793725641;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=gRnLed9VQSLdnH58mLs+a4kx4U6I0Ux8DAjMMJuI8Po=;
	b=4Fmz2Ib7Nk/7N1/NwwyvbvHzgHJ+PebrRJ47ipLv9xk/lyHqzOTHb6Ju76f1rWow4O+9
	 5VyAPek/e+QnSMjyao0luWvNycnoq10tS7Mbn6VBgRdpKBwvWk5uB7wdNL/MDamYUuUkd
	 lBxuCSLYZtykVN1F6H33Dq+0wIlUlz835aUF5SEzVNRcfpC+Kf7PHniCH2zyZMVqKj0SF
	 hoN7y09SrOONtZsZOHrUp8sT4XXBmHMeGVXz1nMYRINB92UqanpC37XniTJMAiSucQsea
	 dfvFK8kvozBgDU52vRb/awU/RiubCYzmc3uYTvsMrMxEzjFBtsH1U4OFwxu6ACqSzvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=i4J+UBSz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABF606A327;
	Tue,  3 Nov 2026 17:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23ABF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=i4J+UBSz
ARC-Seal: i=1; a=rsa-sha256; t=1793725607; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DYnuNxuM9wNbjFSigLEseK7RbfcB/4KxGQ0De5eGaIx+gCPYREK71f21ehB2ngtumYGLK6aqhC72xXHDIr7WPColp82QbvuM7b7bpUxFvph+lzOnHg5qV+MVUqhJ1Ebp9PDEhetm918mwDw6cy0PLD/JIfD6LU+8ftF3ANG5lE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793725607; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gRnLed9VQSLdnH58mLs+a4kx4U6I0Ux8DAjMMJuI8Po=; 
	b=bNY3nU8zw4Es+td4/u5Fud4eebZU0adFGTh1sLr/IRjszhPSy+pbQdS4zN4WQ+DbqoOVZGtuIumd+KlKwbwpYW60Yys2mPvpCfOXLLU7eUzfc7ABgMvinkj7vSRNCCFsSXPvYQp/nVwelky96w6EIfFxhrqfP3+VlNisQmn2MZg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=i4J+UBSzERADlUScZcUZy4ha+5g345fYvkLpFqLxIZZxiR38TGefby5vcnV7KFiPsIQ0cl+2/uq6lD7Q4/7WtDGUsw7NYxo+IFfGCr5X2Dlz1A5hF0lNgGvJCZ/IwCfDqV9zU3miz8aP68wFRti+QYZd3oXxSIw2L//w1v/WSpB8pHuWT6bKLJ7Upnw0wXMy02pXS/SIins4WSy/KfqwHGsWgGHfv9ew+3ZE7aWue3uHvc70G94yrGkTvPHabnjNqBfMyfFHPHM1XglyXCBW8OiH2dzg31m3FJEdwwAYR9k//2LfwsqxSBQt4HN4a1pquTjiFjTadTllDaavb7jwtw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=gRnLed9VQSLdnH58mLs+a4kx4U6I0Ux8DAjMMJuI8Po=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793725605873107.46763878215052;
	Tue, 3 Nov 2026 09:06:45 -0800 (PST)
Message-ID: <527f9dbc20bf921f35108af60bbdebd2737698c4.camel@rong.moe>
Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in
 tablet mode; EC expects VPC 0x2A with posture data
From: Rong Zhang <i@rong.moe>
To: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede	
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Gergo Koteles <soyer@irl.hu>, Andrew
 Kallmeyer	 <kallmeyeras@gmail.com>, =?ISO-8859-1?Q?Andr=E9?= Apitzsch
 <git@apitzsch.eu>,  Swapnil Devesh	 <me@sidevesh.com>,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org
In-Reply-To: <CAGAHqH6GmTamRzM7twRSJmOCMYmAJ+j25585P6UVeF1eROjYNw@mail.gmail.com>
References: 
	<CAGAHqH6o0TUa1HXMrNV6e+HNYwU3xxHkOM665756n8Cp3AzhVQ@mail.gmail.com>
	 <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe>
	 <CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com>
	 <CAGAHqH6GmTamRzM7twRSJmOCMYmAJ+j25585P6UVeF1eROjYNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 01:01:39 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Mahir,

On Tue, 2026-11-03 at 12:55 +0600, Mahir Faisal wrote:
> Hello,
> It's been quite a while. Any updates on the issue? Just a reminder, I
> sent the required information you requested after testing it on my
> hardware. Good day.

Usually, it is normal to have a one-week delay before receiving a
response from LKML participants. Folks may be busy these days (me too).
Try not to be in a hurry.

As for the acpidump, I didn't find anything interesting, so we'd have to
rely on your and others' experiments.

>=20
> Thanks,
> Mahir
> (Resending in plain text mode as html text is not accepted. Sorry if
> you receive duplicates.)
>=20
> On Fri, Oct 30, 2026 at 3:32=E2=80=AFAM Mahir Faisal
> <mahirfaisalantiq33@gmail.com> wrote:
> >=20
> > Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in
> > tablet mode; EC expects VPC 0x2A with posture data
> >=20
> > Hi Rong,
> >=20
> > Thanks for looking into this. I ran each case on the 14IRL8 (82YL,
> > BIOS LHCN30WW) with my userspace daemon stopped. Commands were sent
> > through acpi_call as VPCW 0 <data>, VPCW 1 0x2a; the EC cleared VCMD
> > within ~10 ms every time. Keyboard/touchpad state was measured by
> > counting evdev events from the internal devices (AT Translated Set 2
> > keyboard, ELAN327E:00 04F3:327E Touchpad) during timed windows while
> > I typed and used the touchpad. Backlight state is by eye.
> >=20
> > One observation up front, because it affects how the commands should
> > be used: the commands set the keyboard/touchpad lock directly, but the
> > backlight only changes when the command agrees with the physical
> > posture (details under the 0x08/0x09 cases below).
> >=20
> > > What if:
> > >=20
> > > - 0x0A is not sent on start
> >=20
> > Not needed here. Fresh boot with nothing sent since power-on (the
> > previous shutdown had sent 0x0B): folding alone left the backlight on;
> > 0x08 while folded turned it off; unfolding plus 0x09 restored the
> > keyboard (19 presses counted) and the backlight at its previous level.
> >=20
> > > - 0x08/0x09 is sent after sending 0x0B
> >=20
> > Both still work. After 0x0B, folding alone did not turn the backlight
> > off, 0x08 while folded did, and unfolding plus 0x09 restored the
> > keyboard (34 presses) and the backlight.
> >=20
> > > - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
> >=20
> > Harmless. 0x0A x3, then 0x08 x3 while folded, then 0x09 x3 after
> > unfolding (0.5 s apart) behaved the same as single commands: backlight
> > off while folded, keyboard working afterwards (18 presses), no flicker
> > or delay.
> >=20
> > > What if 0x0B is sent when the keyboard backlight is on?
> >=20
> > In laptop mode: nothing visible changes. The backlight stays on and the
> > keyboard keeps working (27 presses afterwards).
> >=20
> > While folded with the backlight already off after 0x08: the backlight
> > stays off and the keyboard stays disabled while folded (0 presses).
> > On unfolding, with no 0x09 sent, the keyboard (24 presses) and the
> > backlight came back on their own.
> >=20
> > > What if:
> > > - 0x08 is sent when unfolded
> >=20
> > The keyboard and touchpad are disabled in laptop mode (0 key presses,
> > 0 touchpad events over 10 s), but the backlight stays on. After one
> > 0x09 the touchpad and keyboard were back.
> >=20
> > > - 0x09 is sent when folded
> >=20
> > With the backlight off after 0x08, a 0x09 while still folded
> > re-enables the keyboard and touchpad (37 key presses and 3798
> > touchpad events while folded), but the backlight stays off.
> >=20
> > So on this EC, a driver that sends the wrong posture would lock the
> > internal keyboard and touchpad in laptop mode, while the backlight
> > depends on the physical posture as well. Sending 0x08/0x09 strictly
> > from the posture reported in the YMC event looks safe; 0x0A and
> > repeated commands are not needed but do no harm.
> >=20
> > I also tested unfolding after 0x08 without sending 0x09 (0x0A sent
> > before, no 0x0B). On unfolding, the backlight came back on, but the
> > keyboard and touchpad stayed disabled: 0 key presses and 0 touchpad
> > events over 10 s. They worked again after 0x0A + 0x09 (sent together,
> > so this run alone doesn't show which one was needed; in the other
> > tests 0x09 alone was enough).
> >=20
> > Compare the 0x0B-while-folded case above, where unfolding alone
> > restored the keyboard. So once 0x08 is sent, the EC keeps the input
> > lock until it gets 0x09; after 0x0B it follows the hinge again. For a
> > driver this suggests re-sending the current posture on resume (the
> > posture can change during suspend), and sending 0x0B on remove or
> > shutdown, so a missed 0x09 can't leave the internal keyboard locked
> > in laptop mode.

Let me conclude:

- the EC refreshes the backlight according to the physical posture, but
an 0x08/0x09 is needed to initiate the refresh
- 0x08 disables the touchpad and the keyboard
- 0x09 enables the touchpad and the keyboard
- 0x0a/0x0b doesn't matter

With the information, I should be able to prepare a patch. I would still
like to defer to others' opinions and experiments, though.

Thanks,
Rong

> >=20
> > > An acpidump would be helpful.
> >=20
> > The compressed dump is ~390 KB, so I'm sending it to you off-list
> > rather than to the lists. The MSDM table is stripped from it.
> >=20
> > Thanks,
> > Mahir
> >=20
> > On Thu, Oct 29, 2026 at 11:18=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
> > >=20
> > > Hi Mahir,
> > >=20
> > > Thanks for the report.
> > >=20
> > > On Thu, 2026-10-29 at 03:21 +0600, Mahir Faisal wrote:
> > > > Hello,
> > > >=20
> > > > On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
> > > > laptop is folded into tablet/tent/stand mode under Linux, while on
> > > > Windows it turns off. I traced the difference to a VPC command that
> > > > the Windows YMC service sends on every posture change and that Linu=
x
> > > > does not send. Details below; I'd appreciate your view on whether
> > > > lenovo-ymc/ideapad-laptop should send it.
> > > >=20
> > > > System
> > > > ------
> > > >   Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
> > > >   BIOS:   LHCN30WW (latest)
> > > >   Kernel: 7.2.11-300.fc45.x86_64 (Fedora)
> > > >=20
> > > > Symptom
> > > > -------
> > > > When folded, the EC disables the keyboard (no input reaches a VT) a=
nd
> > > > SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
> > > > backlight, however, stays at its previous level. Writes through
> > > > KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored=
 in
> > > > the EC (KBLS reads back the new value) but are not applied while
> > > > folded, so there is no way to turn the backlight off without
> > > > unfolding.
> > > >=20
> > > > The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW=
,
> > > > "EC Notification":
> > > >   "Fix the issue of keyboard backlight is on when turn on in notebo=
ok
> > > >    mode and change NoteBook mode to Yoga mode."
> > > >=20
> > > > The DSDT contains no tablet-mode handling in KBLC, and _Q1B only do=
es
> > > > Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.
> > > >=20
> > > > What Windows does
> > > > -----------------
> > > > The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
> > > > ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byt=
e
> > > > buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
> > > > Management". Its handler for that IOCTL maps function 0x0C to VPC
> > > > command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as th=
e
> > > > data byte, using the same VDAT/VCMD sequence as write_ec_cmd().
> > > >=20
> > > > Values of X observed in YMC.exe:
> > > >   0x0A  service start
> > > >   0x08  posture !=3D laptop (tent/stand/tablet)
> > > >   0x09  posture =3D=3D laptop
> > > >   0x0B  service stop
> > >=20
> > > What if:
> > >=20
> > > - 0x0A is not sent on start
> > > - 0x08/0x09 is sent after sending 0x0B
> > > - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
> > >=20
> > > >=20
> > > > Current Linux behaviour
> > > > -----------------------
> > > > ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and onl=
y
> > > > for models in ymc_ec_trigger_quirk_dmi_table. Booting with
> > > > ideapad_laptop.ymc_ec_trigger=3D1 on this machine has no effect on =
the
> > > > backlight.
> > > >=20
> > > > Test
> > > > ----
> > > > Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data=
>
> > > > followed by VPCW 1 0x2a, then polling VPCR 1 until 0:
> > > >=20
> > > >   data 0x0A, then fold      -> no change, backlight stays on
> > > >   fold, then data 0x08      -> EC turns the keyboard backlight off
> > > >   unfold, then data 0x09    -> keyboard and backlight work normally
> > >=20
> > > What if 0x0B is sent when the keyboard backlight is on?
> > >=20
> > > >=20
> > > > I'm currently running a small userspace daemon that sends 0x0A at
> > > > start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
> > > > reliably so far.
> > >=20
> > > What if:
> > > - 0x08 is sent when unfolded
> > > - 0x09 is sent when folded
> > >=20
> > > >=20
> > > > Suggestion
> > > > ----------
> > > > On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported postu=
re
> > > > is anything other than laptop and 0x09 for laptop, instead of 1. Th=
is
> > > > might also be worth doing outside the quirk table, since it matches
> > > > what the Windows driver does on every model it supports. I can't te=
ll
> > > > whether data 1 is still needed on the models already in the quirk
> > > > table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
> > > > that hardware would need to check.
> > >=20
> > > There is a chance that the 0x0A[start] =3D> (0x08[fold] <=3D> 0x09[un=
fold])
> > > =3D> 0x0B[stop] sequence is generic. Derek, Mark, could you confirm i=
f the
> > > sequence exists in the documentation? If so, I think we can replace t=
he
> > > quirk table and the module parameter with the standard sequence. I wi=
ll
> > > prepare a patch once I get enough information.
> > >=20
> > > +CC Gergo, Andrew, Andr=C3=A9, Swapnil
> > >=20
> > > I believe the quirk was concluded by trial and error. Could you test =
if
> > > the above sequence works on your devices?
> > >=20
> > > >=20
> > > > I can provide an acpidump, the disassembly excerpts, or test patche=
s
> > > > on this machine.
> > >=20
> > > An acpidump would be helpful.
> > >=20
> > > Thanks,
> > > Rong
> > >=20
> > > >=20
> > > > Disclosure: AI assistance was used to troubleshoot the issue and dr=
aft
> > > > this email.
> > > >=20
> > > > Thanks,
> > > > Mahir

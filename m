Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793688923;
	b=hzx6NNWzrRJl1W4B5ySIBDqYg3VgiiyHESS7BMNiqTXA1bdHKS874ikgjgKwHQevBxxy
	 0ruwu9pMSlBNBhBZuHZkoA0+518lXyX6DUuaR1iLqnDZf7UR9gzXCQEPVSfvL0jJ2tk++
	 TldH+quMm/mSrHChyHkOCIO+xxaLX3t68bnx9wvgolXjXkCLchgqAF9nRnPi9laBHfZQ5
	 FR16JJCXGWzNaYvo9uWAcV51JegxJY7HMXkv0Bp6KLsZzUigcyfF2o4tNeYtouuLtGJRB
	 rH6R3BiHjFPkImUF4M70dSZ5x5XGbTk5Oeff/GeQgJedCskzWDr/0vg/sSAiQG9c78g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
	b=CAEx1gQJSExTXNMWWaTEzXOGe3rtWDgLJq1dF2YHTfjkdAVPWUB7IuSSpIjpq5wG1X2I
	 MJMAdrBVoVTeQ5jq8B2SNvdLLjfwjspoPLc2u5kpqp8by/+QdvpsUVwZkRQALOS1BZOM2
	 sfZWx4/2Fm1pyTjYE/lxpqfRazh00YmmQFlcF1zZi3fWDA8SGy+qRIonSBs+7okjKCte+
	 C+ahH4TNvX401AUUm19CGvxYzoLlR1AAe/hwnskzm/0g2A3UgdXO50ZOjT3eu6BlOXpLn
	 1972A9LZm/NDQapbxShAhLkCx4Fdi+szl5k22QwrBgXTVqFkki2SBu4UcJaVAZrFxVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4uEeRKH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F60606A32E
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 06:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95F60606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4uEeRKH
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c11468b5fso40617906d6.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 22:55:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793688916; cv=none;
        d=google.com; s=arc-20260327;
        b=LFFUoVgAGB53MPJAs7sXzgPCYftFCDsyvluziEtE/e5DHgk7bxn5wEY6l6V+k3buVj
         1Q7WHER0pQ3V8l9fQvlaGI3my0dlEvWJO8EDtJzINosZTNcTgF0NJZJuh5ppfkyGuvdh
         XzqH/EK71ujOJxhKmD2ysDI6s5/hP/NLYEfS6PYu3T8QGeMEMIvTgtuofH/XwXqDFDjA
         Sg0kmoU07J2gboCKdQO0yDAb7+QAUNGhLr0EwVJ4C+bibbEvnCo50GRfiGcEmvqHUW5R
         1EG+dk8CWOb3iLdVkK1Pt/86VTjmP8sQGQyFT0KDgu0itdrzdQgPdQf30nWUSbEfQke0
         kUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
        fh=91wkn6u4z/lcPLUXh4OrCvUq9cXltjiAWNI5XuckDcE=;
        b=YoEVBQAnJHPO44KTwKMLFD+J5y6AAJNNgUHy72uTzFKi9yRaLdNNyTc3Nikq1M7Fvy
         ckRBGNseP5WqhFjr3G8/ysfCaKKjAHrAqdbUwzl08SOtbRG3wYLeIbtMznJi51/mAdYM
         61Gdw27CBZDN4dGPwX0AJ0BrLUy7EHX2RtrY8JIH2y0Nj1RvzZAbjPyZpKIscsOTryJR
         uFMBii185YJ3FmpItHHeph3dnvXzB5rTusfZqharH3JbvFijJ6j2iwpauEPFQhB+SJL8
         dk+q6hat7rcDnPEsT4FvpRH+7oXeCAvlNEJKQLJ2+MhYbOivrHCY6s6OhcrY0IyNffTg
         4ZIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793688916; x=1794293716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
        b=k4uEeRKHTJHxwhDRwJPuJg4i/2Dusuu3HUDj34UlCNSqAiy7vukOXpTVsztDNTNxLl
         5zkwFNJ2fPlT6AhmJ0ikByjXNiq72Cnfu+vwssDFoFmYc4AGeTS3UrovxtEtfK24izT2
         xxlToLBCZO3jearb6CwNxHb3smQiezziHQKKThpqLL61KyebtbZvWompgX71TqnS2KQ5
         nB/mi+0GfMucxRj8gR9fc4lqSeIRNGGn0NIWnaTIKyLPsYA9wvoa1cMRwSRWMiCXsztF
         VylnG54EAhbrMVi2CVDRauM9nsG5dwOrKsUf94cXUnIswsMfLmIiJAFJ5N60/KP5KAMG
         vjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793688916; x=1794293716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTTJKFiSv80mdTo5yTIu4Pejc3TXez6Nsjiu0+vqLww=;
        b=dgu+WOuO4TF5dvQ/ZnpLJUQtVTEEVE4Q6e0GaTEhU4eEGoPe5nfPMeUAjvpQVlHgmp
         eXFyqmEoIQokhuThSliIqgcnIACG5sd61Rx/e3TQOxAPSbxxwawLpmfSHYqyld+sAwGf
         uYaVLsi06AbRXEtYobNaIXuIlYP139eDwsoOFij8ZPOhNR/tUbB7MrnTKRl7dFgOpNDR
         YZTMQvZ2Q9jcT+4knLfa6yUQfOJ2NkR0O19kGbsZSRG3B+VsJXw27zDc2OWA9sfesxGq
         /U/Fx93BBCswzMlzXPnJO/dVKKDzkFNK0rSvALra/KYYfHkWoCS+slc5+7652cl/LFSM
         SB7g==
X-Forwarded-Encrypted: i=1; AKwUvBzWMbIO96uVnvrphEeVauM7ozVDWEwUi95ehlWroy0YqIIxq47AY+67V6yH5y8IpK9gKG1IWNcRnA0kZ8OQ65qNCeeH@vger.kernel.org
X-Gm-Message-State: APuU4Z+/mHuG6j33bjEHB0x6UuI+Q2qLTPtXccJkfrzV07Pfz5BIwRE9
	kXNyhwf6pkevbg6bPpAryz08gMl/g3RpSLyThrKw08huBZDDHRyHN6YxbKhL6QTZdRptTOEtgF9
	D+JYCSoTze+h2Ti128Ja6xs3/jMSGbNQ=
X-Gm-Gg: AYBFou01I8Xx5DO3TxouOxrIZwOH/3AcVO65OGwtiHxl4fUgKjc51IF83rSe8SkU0hd
	DLIJ+TNPwL2Wqn4K+77t5o5QUcbVEJ4aZo+JDik46kDpRxPVvkZtgN4et3DA8WT097mXvYRtvs1
	fBoWvxQ1WAZh73tkp+PAUTSCtWBnPsBC4/NufoUCyFlHdQGZO0pEs2BmHfq5pojcg6ZL8OmlFVS
	gYp93G+iMGZDlN38XzgUkCzT530M1NOCUsJSHX+e13lT0Azd5qTyQertDAEc+RDDhWHK2F6CwH2
	bpKo2oqJ22s5G7ojjGDx3kgwndqk0hMmlkDgjTGEwsL/Azu+t9LQ79KEUtKsX2SlJY3ixTdBVLD
	i0yqB9lCf2WpUmCY23zpCpnsYN4f3QG1rHR5hLp0Eix/r+hN/1PHsQi1hSsY=
X-Received: by 2002:a05:6214:5b07:b0:917:c904:4ae7 with SMTP id
 6a1803df08f44-91ca4b6378amr177385546d6.42.1793688916399; Mon, 02 Nov 2026
 22:55:16 -0800 (PST)
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
 <c15f1bc47c470036c096689ea1411e324409a971.camel@rong.moe> <CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com>
In-Reply-To: <CAGAHqH62UiDKktoqg6cJ_oqj02NqH6FDjj32ucw7w+L2-_-NOg@mail.gmail.com>
From: Mahir Faisal <mahirfaisalantiq33@gmail.com>
Date: Tue, 3 Nov 2026 12:55:04 +0600
X-Gm-Features: AclHuK9ZYGQEzTD77WMjoZV83YHbSvZqWTfB65cmF63ZSTp5hJ0K_i9Gct3Q7e0
Message-ID: <CAGAHqH6GmTamRzM7twRSJmOCMYmAJ+j25585P6UVeF1eROjYNw@mail.gmail.com>
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

Hello,
It's been quite a while. Any updates on the issue? Just a reminder, I
sent the required information you requested after testing it on my
hardware. Good day.

Thanks,
Mahir
(Resending in plain text mode as html text is not accepted. Sorry if
you receive duplicates.)

On Fri, Oct 30, 2026 at 3:32=E2=80=AFAM Mahir Faisal
<mahirfaisalantiq33@gmail.com> wrote:
>
> Subject: Re: lenovo-ymc: Yoga 7 14IRL8 keyboard backlight stays on in
> tablet mode; EC expects VPC 0x2A with posture data
>
> Hi Rong,
>
> Thanks for looking into this. I ran each case on the 14IRL8 (82YL,
> BIOS LHCN30WW) with my userspace daemon stopped. Commands were sent
> through acpi_call as VPCW 0 <data>, VPCW 1 0x2a; the EC cleared VCMD
> within ~10 ms every time. Keyboard/touchpad state was measured by
> counting evdev events from the internal devices (AT Translated Set 2
> keyboard, ELAN327E:00 04F3:327E Touchpad) during timed windows while
> I typed and used the touchpad. Backlight state is by eye.
>
> One observation up front, because it affects how the commands should
> be used: the commands set the keyboard/touchpad lock directly, but the
> backlight only changes when the command agrees with the physical
> posture (details under the 0x08/0x09 cases below).
>
> > What if:
> >
> > - 0x0A is not sent on start
>
> Not needed here. Fresh boot with nothing sent since power-on (the
> previous shutdown had sent 0x0B): folding alone left the backlight on;
> 0x08 while folded turned it off; unfolding plus 0x09 restored the
> keyboard (19 presses counted) and the backlight at its previous level.
>
> > - 0x08/0x09 is sent after sending 0x0B
>
> Both still work. After 0x0B, folding alone did not turn the backlight
> off, 0x08 while folded did, and unfolding plus 0x09 restored the
> keyboard (34 presses) and the backlight.
>
> > - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
>
> Harmless. 0x0A x3, then 0x08 x3 while folded, then 0x09 x3 after
> unfolding (0.5 s apart) behaved the same as single commands: backlight
> off while folded, keyboard working afterwards (18 presses), no flicker
> or delay.
>
> > What if 0x0B is sent when the keyboard backlight is on?
>
> In laptop mode: nothing visible changes. The backlight stays on and the
> keyboard keeps working (27 presses afterwards).
>
> While folded with the backlight already off after 0x08: the backlight
> stays off and the keyboard stays disabled while folded (0 presses).
> On unfolding, with no 0x09 sent, the keyboard (24 presses) and the
> backlight came back on their own.
>
> > What if:
> > - 0x08 is sent when unfolded
>
> The keyboard and touchpad are disabled in laptop mode (0 key presses,
> 0 touchpad events over 10 s), but the backlight stays on. After one
> 0x09 the touchpad and keyboard were back.
>
> > - 0x09 is sent when folded
>
> With the backlight off after 0x08, a 0x09 while still folded
> re-enables the keyboard and touchpad (37 key presses and 3798
> touchpad events while folded), but the backlight stays off.
>
> So on this EC, a driver that sends the wrong posture would lock the
> internal keyboard and touchpad in laptop mode, while the backlight
> depends on the physical posture as well. Sending 0x08/0x09 strictly
> from the posture reported in the YMC event looks safe; 0x0A and
> repeated commands are not needed but do no harm.
>
> I also tested unfolding after 0x08 without sending 0x09 (0x0A sent
> before, no 0x0B). On unfolding, the backlight came back on, but the
> keyboard and touchpad stayed disabled: 0 key presses and 0 touchpad
> events over 10 s. They worked again after 0x0A + 0x09 (sent together,
> so this run alone doesn't show which one was needed; in the other
> tests 0x09 alone was enough).
>
> Compare the 0x0B-while-folded case above, where unfolding alone
> restored the keyboard. So once 0x08 is sent, the EC keeps the input
> lock until it gets 0x09; after 0x0B it follows the hinge again. For a
> driver this suggests re-sending the current posture on resume (the
> posture can change during suspend), and sending 0x0B on remove or
> shutdown, so a missed 0x09 can't leave the internal keyboard locked
> in laptop mode.
>
> > An acpidump would be helpful.
>
> The compressed dump is ~390 KB, so I'm sending it to you off-list
> rather than to the lists. The MSDM table is stripped from it.
>
> Thanks,
> Mahir
>
> On Thu, Oct 29, 2026 at 11:18=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
> >
> > Hi Mahir,
> >
> > Thanks for the report.
> >
> > On Thu, 2026-10-29 at 03:21 +0600, Mahir Faisal wrote:
> > > Hello,
> > >
> > > On a Lenovo Yoga 7 14IRL8 the keyboard backlight stays on when the
> > > laptop is folded into tablet/tent/stand mode under Linux, while on
> > > Windows it turns off. I traced the difference to a VPC command that
> > > the Windows YMC service sends on every posture change and that Linux
> > > does not send. Details below; I'd appreciate your view on whether
> > > lenovo-ymc/ideapad-laptop should send it.
> > >
> > > System
> > > ------
> > >   Model:  Lenovo Yoga 7 14IRL8 (DMI product name: 82YL)
> > >   BIOS:   LHCN30WW (latest)
> > >   Kernel: 7.2.11-300.fc45.x86_64 (Fedora)
> > >
> > > Symptom
> > > -------
> > > When folded, the EC disables the keyboard (no input reaches a VT) and
> > > SW_TABLET_MODE is reported correctly by lenovo-ymc. The keyboard
> > > backlight, however, stays at its previous level. Writes through
> > > KBLC (via the ideapad-laptop kbd_backlight LED / UPower) are stored i=
n
> > > the EC (KBLS reads back the new value) but are not applied while
> > > folded, so there is no way to turn the backlight off without
> > > unfolding.
> > >
> > > The BIOS changelog suggests this is meant to be EC-driven. LHCN10WW,
> > > "EC Notification":
> > >   "Fix the issue of keyboard backlight is on when turn on in notebook
> > >    mode and change NoteBook mode to Yoga mode."
> > >
> > > The DSDT contains no tablet-mode handling in KBLC, and _Q1B only does
> > > Notify (WMIY, 0xD0). WMIY.WMAB just returns PCMD.
> > >
> > > What Windows does
> > > -----------------
> > > The "Lenovo Yoga Mode Control" package (YMC.exe 3.0.1.5, bound to
> > > ACPI\YMC2017) sends IOCTL 0x831020C0 to \\.\EnergyDrv with a 12-byte
> > > buffer {0x0C, 1, X}. EnergyDrv is AcpiVpc.sys from "Lenovo Energy
> > > Management". Its handler for that IOCTL maps function 0x0C to VPC
> > > command 0x2A (VPCCMD_W_YMC) and issues it through VPCW with X as the
> > > data byte, using the same VDAT/VCMD sequence as write_ec_cmd().
> > >
> > > Values of X observed in YMC.exe:
> > >   0x0A  service start
> > >   0x08  posture !=3D laptop (tent/stand/tablet)
> > >   0x09  posture =3D=3D laptop
> > >   0x0B  service stop
> >
> > What if:
> >
> > - 0x0A is not sent on start
> > - 0x08/0x09 is sent after sending 0x0B
> > - 0x0A/0x08/0x09/0x0B is repeatedly sent multiple times
> >
> > >
> > > Current Linux behaviour
> > > -----------------------
> > > ideapad_laptop_trigger_ec() sends VPCCMD_W_YMC with data 1, and only
> > > for models in ymc_ec_trigger_quirk_dmi_table. Booting with
> > > ideapad_laptop.ymc_ec_trigger=3D1 on this machine has no effect on th=
e
> > > backlight.
> > >
> > > Test
> > > ----
> > > Using acpi_call against \_SB.PC00.LPCB.H_EC.VPC0, with VPCW 0 <data>
> > > followed by VPCW 1 0x2a, then polling VPCR 1 until 0:
> > >
> > >   data 0x0A, then fold      -> no change, backlight stays on
> > >   fold, then data 0x08      -> EC turns the keyboard backlight off
> > >   unfold, then data 0x09    -> keyboard and backlight work normally
> >
> > What if 0x0B is sent when the keyboard backlight is on?
> >
> > >
> > > I'm currently running a small userspace daemon that sends 0x0A at
> > > start, then 0x08/0x09 on each SW_TABLET_MODE change. It has worked
> > > reliably so far.
> >
> > What if:
> > - 0x08 is sent when unfolded
> > - 0x09 is sent when folded
> >
> > >
> > > Suggestion
> > > ----------
> > > On a YMC event, send VPCCMD_W_YMC with 0x08 when the reported posture
> > > is anything other than laptop and 0x09 for laptop, instead of 1. This
> > > might also be worth doing outside the quirk table, since it matches
> > > what the Windows driver does on every model it supports. I can't tell
> > > whether data 1 is still needed on the models already in the quirk
> > > table (Yoga 7 14ARB7 / 14ACN6) for event re-arming, so someone with
> > > that hardware would need to check.
> >
> > There is a chance that the 0x0A[start] =3D> (0x08[fold] <=3D> 0x09[unfo=
ld])
> > =3D> 0x0B[stop] sequence is generic. Derek, Mark, could you confirm if =
the
> > sequence exists in the documentation? If so, I think we can replace the
> > quirk table and the module parameter with the standard sequence. I will
> > prepare a patch once I get enough information.
> >
> > +CC Gergo, Andrew, Andr=C3=A9, Swapnil
> >
> > I believe the quirk was concluded by trial and error. Could you test if
> > the above sequence works on your devices?
> >
> > >
> > > I can provide an acpidump, the disassembly excerpts, or test patches
> > > on this machine.
> >
> > An acpidump would be helpful.
> >
> > Thanks,
> > Rong
> >
> > >
> > > Disclosure: AI assistance was used to troubleshoot the issue and draf=
t
> > > this email.
> > >
> > > Thanks,
> > > Mahir

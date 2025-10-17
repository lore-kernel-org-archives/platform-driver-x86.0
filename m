Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3925A324
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760687697; cv=none; b=n8PxB0wOSXbk+SJF4sA8YsaBCquBqJVmc9aOND0ulD4aL/wnwm+am4YK9S1GRXrLziMoZrYPwExltp6QFyxbu70+mM+mbFFFKSbyy2Jd6Xjhl1qU1T7Xlvv1WzqrbOiHK2FRKxFl1ZeV137jX4dVzt7bKVEkcMZ5GdTXGFYG0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760687697; c=relaxed/simple;
	bh=LLSGTDDpMdaPw2AY1q/tryOB06iCvFxNdHq9h6MR3Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+3LpdBn63g78wxr/+y7XFwrk8SFAyswvzF+jyC1Wdd6R96u9QGecg9mbgBNuSrdGj0vi8x9U3OjS5zmw6uhPsKZyRNyiulltMTRZZ2MIetpS4mhOL1f+TBMwclsmqHPPK5ZFIRirCKgFAOc156qZ2apEP3w1SB41ymG4w7Hp8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=gMSU747k; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="gMSU747k"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 0D7605E6DC
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:54:52 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 912865E6EF
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:54:49 +0300 (EEST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 87F3E200C05
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:54:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760687688;
	bh=qjqXT1Gnn58O+Bbs8lKe43lBmBOc/sCLpY4L/VLFJqI=;
	h=Received:From:Subject:To;
	b=gMSU747kUwQHeFtxvEQ2LSUJoh9zJlQMtz8tqfoQFwNdSyi17bL5jylt8lMCOaKhT
	 p1+EVG7HEvl/fgtUbTb13eJoxopreWGErTm7f4o3wXV1ENOTjLkhlg6doTspNUdtQh
	 mLHPl97cpblVxKXjcA6inRWI8yh+85SOyPOAmQ4aRCvXlzejaWScXbtroXThbnzYot
	 lOstxJOki4cSLdTOQKyvddN75Dg80Ml1rABHZv9l3LAVbi2dPjYXwTG/1SOdc2fnEU
	 6/SjIOgEqgsjmAKRmhkamQDVpKxGDesWeygeI35gPeWHIuV5tju9D6RKurr8le/lS4
	 pbZTjCsKwMEWQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-375ff2b3ba4so16610321fa.0
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 17 Oct 2025 00:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWojcouycUDuxT9qK6i1pQKi+7jI7nPxLI5SvtwbK8b33b/hdWI2POQV1lfBTyLPg/6y5hzK5t/PL3JKjQ7YTShmaQI@vger.kernel.org
X-Gm-Message-State: AOJu0YxUiqRQy9/j4kijLPAnQKXzGPi00pstMWmGgoMXCj1cW9B0ULJA
	BSDvXotocUC5FqlLbqE33+03I6qTrZRuMQirQxWlGTeO1pz/nyqZ3c5/m7dDLxyw7mLcWfGX9NN
	G95wYKucC1sUusCqylPGE96NcPA7MIlg=
X-Google-Smtp-Source: 
 AGHT+IFyf5WmwJHYyOEMwRqnRF1xHLH7SADW3THIPeFiDi5+/7P1lrGa7v48wWBuTZlIvRnGzUFAGt4uxmoOOBDKW0M=
X-Received: by 2002:a2e:a99d:0:b0:372:80ac:a33a with SMTP id
 38308e7fff4ca-37797a3b204mr10208551fa.28.1760687687885; Fri, 17 Oct 2025
 00:54:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <160c3adf-9333-4486-ba4c-d3359ea73337@gmail.com>
 <CAGwozwGzOQ-LCk6B202-CuKq=gepn6Mt4LitJJZ7dfMLaDVs7Q@mail.gmail.com>
 <c075a9f4-8103-dbcc-a1e7-4eaec5e90597@linux.intel.com>
 <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com>
In-Reply-To: 
 <CAGwozwH3VnTsx8p5N6S1yp4Z9mFfPUdZ4frrnPAveLH2a00K6g@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 17 Oct 2025 09:54:36 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
X-Gm-Features: AS18NWC7wJQcBBP8f_8qfaO8FI-Ep2M33ZNdSAlX-mIhYsQFXVaCju_8woer5f0
Message-ID: 
 <CAGwozwGqZ_yuNQ+TgtW4R79g4JWxZg-Q-vA7thKy_vSdpbY_yA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <benato.denis96@gmail.com>,
 platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176068768877.3460194.4280231535360950382@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 16 Oct 2025 at 18:16, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Thu, 16 Oct 2025 at 17:09, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Thu, 16 Oct 2025, Antheas Kapenekakis wrote:
> > > On Thu, 16 Oct 2025 at 13:57, Denis Benato <benato.denis96@gmail.com>=
 wrote:
> > > > On 10/13/25 22:15, Antheas Kapenekakis wrote:
> > > > > This is a two part series which does the following:
> > > > >   - Clean-up init sequence
> > > > >   - Unify backlight handling to happen under asus-wmi so that all=
 Aura
> > > > >     devices have synced brightness controls and the backlight but=
ton works
> > > > >     properly when it is on a USB laptop keyboard instead of one w=
/ WMI.
> > > > >
> > > > > For more context, see cover letter of V1. Since V5, I removed som=
e patches
> > > > > to make this easier to merge.
> > > > >
> > > > > All comments with these patches had been addressed since V4.
> > > > I have loaded this patchset for users of asus-linux project to try =
out.
> > > >
> > > > One of them opened a bug report about a kernel bug that happens
> > > > consistently when closing the lid of his laptop [1].
> > > >
> > > > He also sent another piece of kernel log, but didn't specify anythi=
ng more
> > > > about this [2].
> > > >
> > > > [1] https://pastebin.com/akZx1w10
> > > > [2] https://pastebin.com/sKdczPgf
> > >
> > > Can you provide a link to the bug report? [2] seems unrelated.
> > >
> > > As for [1], it looks like a trace that stems from a sysfs write to
> > > brightness stemming from userspace that follows the same chain it
> > > would on a stock kernel and times out. Is it present on a stock
> > > kernel?
> > >
> > > Ilpo should know more about this, could the spinlock be interfering?
> >
> > [1] certainly seems to do schedule() from do_kbd_led_set() so it's not
> > possible to use spinlock there.
> >
> > So we're back to what requires the spinlock? And what the spinlock
> > protects?
>
> For that invocation, since it is coming from the cdev device owned by
> asus_wmi, it protects asus_ref.listeners under do_kbd_led_set.
> asus_wmi is protected by the fact it is owned by that device. Spinlock
> is not required in this invocation due to not being an IRQ.
>
> Under asus_hid_event (second to last patch), which is called from an
> IRQ, a spinlock is required for protecting both listeners and the
> asus_ref.asus, and I suspect that scheduling from an IRQ is not
> allowed either. Is that correct?

So it is a bit tricky here. When the IRQ fires, it needs to know
whether asus-wmi will handle the keyboard brightness event so that it
falls back to emitting it.

If we want it to know for sure, it needs to access asus_wmi, so it
needs a spinlock or an IRQ friendly lock. This way, currently,
asus_hid_event will return -EBUSY if there is no led device so the
event propagates through hid.

If we say that it is good enough to know that it was compiled with
IS_REACHABLE(CONFIG_ASUS_WMI), ie the actual implementation of
asus_hid_event in asus-wmi will never return an error, then,
asus_hid_event can schedule a task to fire the event without a lock,
and that task can use a normal locking primitive.

If the task needs to be assigned to a device or have a handle,
asus_hid_listener can be provided to asus_hid_event, so that it is
owned by the calling device.

What would the appropriate locking primitive be in this case?

> Antheas
> >
> > Not related to this particular email in this thread, if the users are
> > testing something with different kernels, it's also important to make s=
ure
> > that the lockdep configs are enabled in both. As it could be that in on=
e
> > kernel lockdep is not enabled and thus it won't do the splat.
> >
> > --
> >  i.
> >
> >
> > > My testing on devices that have WMI led controls is a bit limited
> > > unfortunately. However, most of our asus users have been happy with
> > > this series for around half a year now.
> > >
> > > > > ---
> > > > > V5: https://lore.kernel.org/all/20250325184601.10990-1-lkml@anthe=
as.dev/
> > > > > V4: https://lore.kernel.org/lkml/20250324210151.6042-1-lkml@anthe=
as.dev/
> > > > > V3: https://lore.kernel.org/lkml/20250322102804.418000-1-lkml@ant=
heas.dev/
> > > > > V2: https://lore.kernel.org/all/20250320220924.5023-1-lkml@anthea=
s.dev/
> > > > > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@anthe=
as.dev/
> > > > >
> > > > > Changes since V5:
> > > > >   - It's been a long time
> > > > >   - Remove addition of RGB as that had some comments I need to wo=
rk on
> > > > >   - Remove folio patch (already merged)
> > > > >   - Remove legacy fix patch 11 from V4. There is a small chance t=
hat
> > > > >     without this patch, some old NKEY keyboards might not respond=
 to
> > > > >     RGB commands according to Luke, but the kernel driver does no=
t do
> > > > >     RGB currently. The 0x5d init is done by Armoury crate softwar=
e in
> > > > >     Windows. If an issue is found, we can re-add it or just remov=
e patches
> > > > >     1/2 before merging. However, init could use the cleanup.
> > > > >
> > > > > Changes since V4:
> > > > >   - Fix KConfig (reported by kernel robot)
> > > > >   - Fix Ilpo's nits, if I missed anything lmk
> > > > >
> > > > > Changes since V3:
> > > > >   - Add initializer for 0x5d for old NKEY keyboards until it is v=
erified
> > > > >     that it is not needed for their media keys to function.
> > > > >   - Cover init in asus-wmi with spinlock as per Hans
> > > > >   - If asus-wmi registers WMI handler with brightness, init the b=
rightness
> > > > >     in USB Asus keyboards, per Hans.
> > > > >   - Change hid handler name to asus-UNIQ:rgb:peripheral to match =
led class
> > > > >   - Fix oops when unregistering asus-wmi by moving unregister out=
side of
> > > > >     the spin lock (but after the asus reference is set to null)
> > > > >
> > > > > Changes since V2:
> > > > >   - Check lazy init succeds in asus-wmi before setting register v=
ariable
> > > > >   - make explicit check in asus_hid_register_listener for listene=
r existing
> > > > >     to avoid re-init
> > > > >   - rename asus_brt to asus_hid in most places and harmonize ever=
ything
> > > > >   - switch to a spinlock instead of a mutex to avoid kernel ooops
> > > > >   - fixup hid device quirks to avoid multiple RGB devices while s=
till exposing
> > > > >     all input vendor devices. This includes moving rgb init to pr=
obe
> > > > >     instead of the input_configured callbacks.
> > > > >   - Remove fan key (during retest it appears to be 0xae that is a=
lready
> > > > >     supported by hid-asus)
> > > > >   - Never unregister asus::kbd_backlight while asus-wmi is active=
, as that
> > > > >   - removes fds from userspace and breaks backlight functionality=
. All
> > > > >   - current mainline drivers do not support backlight hotplugging=
, so most
> > > > >     userspace software (e.g., KDE, UPower) is built with that ass=
umption.
> > > > >     For the Ally, since it disconnects its controller during slee=
p, this
> > > > >     caused the backlight slider to not work in KDE.
> > > > >
> > > > > Changes since V1:
> > > > >   - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z=
13
> > > > >   - Fix ifdef else having an invalid signature (reported by kerne=
l robot)
> > > > >   - Restore input arguments to init and keyboard function so they=
 can
> > > > >     be re-used for RGB controls.
> > > > >   - Remove Z13 delay (it did not work to fix the touchpad) and re=
place it
> > > > >     with a HID_GROUP_GENERIC quirk to allow hid-multitouch to loa=
d. Squash
> > > > >     keyboard rename into it.
> > > > >   - Unregister brightness listener before removing work queue to =
avoid
> > > > >     a race condition causing corruption
> > > > >   - Remove spurious mutex unlock in asus_brt_event
> > > > >   - Place mutex lock in kbd_led_set after LED_UNREGISTERING check=
 to avoid
> > > > >     relocking the mutex and causing a deadlock when unregistering=
 leds
> > > > >   - Add extra check during unregistering to avoid calling unregis=
ter when
> > > > >     no led device is registered.
> > > > >   - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as =
it causes
> > > > >     the driver to create 4 RGB handlers per device. I also suspec=
t some
> > > > >     extra events sneak through (KDE had the @@@@@@).
> > > > >
> > > > > Antheas Kapenekakis (7):
> > > > >   HID: asus: refactor init sequence per spec
> > > > >   HID: asus: prevent binding to all HID devices on ROG
> > > > >   platform/x86: asus-wmi: Add support for multiple kbd RGB handle=
rs
> > > > >   HID: asus: listen to the asus-wmi brightness device instead of
> > > > >     creating one
> > > > >   platform/x86: asus-wmi: remove unused keyboard backlight quirk
> > > > >   platform/x86: asus-wmi: add keyboard brightness event handler
> > > > >   HID: asus: add support for the asus-wmi brightness handler
> > > > >
> > > > >  drivers/hid/hid-asus.c                     | 235 +++++++++++----=
------
> > > > >  drivers/platform/x86/asus-wmi.c            | 157 ++++++++++++--
> > > > >  include/linux/platform_data/x86/asus-wmi.h |  69 +++---
> > > > >  3 files changed, 291 insertions(+), 170 deletions(-)
> > > > >
> > > > >
> > > > > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > > >
> > >
> >
> >


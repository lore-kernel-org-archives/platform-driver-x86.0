From: Andrei Borzenkov <arvidjaar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Wed, 25 Nov 2015 06:53:56 +0300
Message-ID: <565530D4.3080809@gmail.com>
References: <5650BE8E.2080506@gmail.com> <201511212008.46761@pali>
 <5650D693.6050808@gmail.com> <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali> <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com> <20151123192943.GY7413@malice.jf.intel.com>
 <56539427.5090304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:36675 "EHLO
	mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755058AbbKYDyA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Nov 2015 22:54:00 -0500
Received: by lfs39 with SMTP id 39so43815915lfs.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2015 19:53:58 -0800 (PST)
In-Reply-To: <56539427.5090304@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

24.11.2015 01:33, Gabriele Mazzotta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> I'll try to write a summary that should explain why dell-rbtn exists
> and what are the current problems.
>=20
> There are several mechanisms to control radio devices, so let's
> consider different categories/cases.
>=20
> A) The function keys of new Dell laptops do nothing on their own, but
> when pressed, the BIOS sends a notification to an ACPI device
> (DELLABCE/DELRBTN). One of the tasks of dell-rbtn is to catch those
> notifications and send an input event to userspace. Without dell-rbtn=
,
> the function keys of these laptops wouldn't work.
>=20
> B) There are then some other laptops which support two different
> mechanisms to control radio devices: the one here above (A) and
> "the old one", i.e. the BIOS does everything. (These are probably
> laptops that were released during the transition Windows 7 -> 8). The=
se
> laptops can switch between the two modes through an ACPI method call.
> What we do with dell-rbtn is to make them behave like (A) since we
> can't tell apart laptops of (A) and (B) and we need to know how each
> laptop behaves. The function key of these laptops work perfectly
> without dell-rbtn.
>=20
> C) There are then some other laptops for which it's required to use a=
n
> i8042 filter to detect keypresses and do some SMI calls to toggle
> the state of radio devices. This filter is created by dell-laptop and
> has been there since a long time.
>=20
> D) This category is something in between (C) and (A) and exists only
> because of dell-rbtn. Some of the laptops of category (C) also have a
> DELLABCE/DELLRBTN device.

I'm pretty confident that my Dell Latitude falls into this category.
What happens here apparently is

- user presses hotkey on keyboard
- hotkey is handled by BIOS to toggle radio
- BIOS sends notification to OS via ACPI that something changed and OS
must query current radio state

Adding debug print do dell-laptop and dell-rbtn

[43345.599909] dell-laptop: got keyboard event
[43345.704558] dell-rbtn DELLABCE:00: Received event (0x80)

So ACPI event comes rather later after key press.

This makes those notifications at wake up not spurious at all - they ar=
e
actually pretty logical, and serve to make OS ascertain current status
of radio kill switch. But I am pretty much confident that those events
do NOT mean to be used as request to toggle kill switch state.


> When dell-rbtn is loaded, the i8042 filter is
> removed and dell-rbtn starts listening for ACPI notification. We do
> this instead because the i8042 filter doesn't work properly on some
> laptops.
>
>

And here is the actual bug. dell-rbtn handles category D as if it were
category A. For category D it should *not* send input event, but rather
hook and notify dell-laptop to query current kill switch state (because
at least on my system there is no way to do it via ACPI RBTN).

So the actual problem is to differentiate between categories A and D. I=
s
it possible to do based on ACPI name (DELRBTN vs DELLABCE) or may be on
return value of CRBT? If not we really need black/white list here based
on DMI or something.

And BTW these input events are consumed by kernel in filter installed b=
y
net/rfkill/input.c, so they are not really user space.

> The problem reported in [1] is that some laptops of (A) and (B) send =
a
> notification on resume and some others don't. [2] should fix this
> problem, but we need to make sure that the extra notification is alwa=
ys
> caught before the resume of dell-rbtn.=20

If dell-rbtn did the right thing for my laptop, those notifications wer=
e
harmless.

> This seems to be what happens
> here on my laptop, but Andrei says otherwise. So we need to figure ou=
t
> if [2] doesn't fix the problem because it's not guaranteed that ACPI
> notifications sent while the system is resuming are received by devic=
e
> drivers before they are resumed (assumption that I made for the first
> patch and that dropped with the updated one I sent in this thread) or
> because Andrei's problem is something different.
>=20

Are you sure the laptops in bugzilla are actually of type A and not of
type D? That would match what I observe here.

>=20
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> [2]
> http://lkml.kernel.org/r/1448115375-7315-1-git-send-email-gabriele.mz=
t@gmail.com
>=20

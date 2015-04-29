From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Wed, 29 Apr 2015 20:00:18 +0200
Message-ID: <20150429180018.GQ24346@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <2564950.goQdGu3mlb@xps13>
 <20150429162840.GN24346@pali>
 <1960842.uafsuQ5JOF@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:32921 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031702AbbD2SAW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Apr 2015 14:00:22 -0400
Content-Disposition: inline
In-Reply-To: <1960842.uafsuQ5JOF@xps13>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Hung <alex.hung@canonical.com>

On Wednesday 29 April 2015 19:54:43 Gabriele Mazzotta wrote:
> On Wednesday 29 April 2015 18:28:40 Pali Roh=C3=A1r wrote:
> > On Wednesday 29 April 2015 15:57:58 Gabriele Mazzotta wrote:
> > > On Wednesday 29 April 2015 15:08:40 Pali Roh=C3=A1r wrote:
> > > > On Wednesday 29 April 2015 12:30:32 Gabriele Mazzotta wrote:
> > > > > On Wednesday 29 April 2015 11:51:04 Pali Roh=C3=A1r wrote:
> > > > > > This is an ACPI driver for Dell laptops which receive HW sw=
itch events.
> > > > > > It exports rfkill device dell-rbtn which provide correct ha=
rd rfkill state.
> > > > > >=20
> > > > > > Alex Hung added code for supporting Dell laptops which have=
 toggle button
> > > > > > instead HW slider switch. On these laptops toggle button ev=
ent is reported
> > > > > > by new input device (instead rfkill) as they do not have hw=
 radio switch.
> > > > > >=20
> > > > > > It looks like those are two different functions (rfkill, in=
put device), but
> > > > > > Dell BIOS exports them via same ACPI device and uses same A=
CPI functions.
> > > > > > So code is in one kernel driver.
> > > > >=20
> > > > > I made a patch some time ago that I've just adapted. It allow=
s to
> > > > > prefer RBTN_SLIDER over RBTN_TOGGLE. The main reason why I'd =
like to
> > > > > have the hardware switch is that the BIOS doesn't alter the s=
oft state
> > > > > of the devices. This comes in handy when the function key con=
trols
> > > > > multiple radio devices.
> > > > >=20
> > > >=20
> > > > Now I'm thinking... is't this bug in wifi kernel driver (which =
exports
> > > > phy rfkill)? Or problem somewhere else (userspace or kernel)?
> > >=20
> > > What is the presumed bug you are referring to? The fact that the =
soft state
> > > doesn't change?
> >=20
> > Can you remind me whats the problem on your laptop?
>=20
> CRBT returns 0 (so RBTN_TOGGLE), but by default my laptop acts as if
> it returned 2 or 3, so we have to call ARBT.
>=20
> As said before, there's no way to know when a platform whose CRBT
> method returns 0 or 1 also has the hardware switch, so to be sure tha=
t
> all the platforms have working function keys, some of them (such as
> mine) have to give up on the hardware switch.

Ok, and what happens when you load this v2 version? What stopped workin=
g
on your laptop?

Alex, can you help? Code for toggle laptop version is originally yours.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

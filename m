From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH 0/3] Dell Airplane Mode Switch driver
Date: Fri, 05 Dec 2014 22:12:42 +0100
Message-ID: <94523420.RuhoUzmTQs@xps13>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <3160202.BXgrhrDjJo@xps13> <201412052203.25016@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:38247 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751239AbaLEVMp convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Dec 2014 16:12:45 -0500
In-Reply-To: <201412052203.25016@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

On Friday 05 December 2014 22:03:24 Pali Roh=E1r wrote:
> On Friday 05 December 2014 21:53:10 Gabriele Mazzotta wrote:
> > On Friday 05 December 2014 21:38:17 Pali Roh=E1r wrote:
> > > On Wednesday 03 December 2014 14:00:23 Darren Hart wrote:
> > > > On Thu, Dec 04, 2014 at 10:55:32AM +0100, Pali Roh=E1r wrote:
> > > > > Darren, I think that if we do not solve problem with
> > > > > duplicate key events (in dell-wireless.c) we should
> > > > > postpone these patches to later kernel version. It is
> > > > > better to not have such regression as it confuse
> > > > > software like NetworkManager which is widely used.
> > > >=20
> > > > OK, that's what I needed. Thanks. Ignore my previous
> > > > request, you answered it here. I will drop
> > > > dell-wireless.c and look for a combined solution from you
> > > > and Alex for the next release.
> > > >=20
> > > > Thanks,
> > >=20
> > > And according to discussion about Side effect of pressing
> > > special keys at [1] [2] we should not report this wireless
> > > key event (as input device) to userspace. And Alex's driver
> > > is doing that.
> > >=20
> > > [1] -
> > > http://www.spinics.net/lists/platform-driver-x86/msg05922.h
> > > tml [2] -
> > > http://www.spinics.net/lists/platform-driver-x86/msg05924.h
> > > tml
> >=20
> > Alex's patch is for those laptop whose BIOS only sends a
> > notification to DELLABCE when Fn keys are pressed. His patch
> > simply translates these ACPI notifications to KEY_RFKILL
> > keypresses.
> >=20
>=20
> Yes, and your last patch disables sending such KEY events to=20
> userspace (in dell-wmi driver). BIOS already handle changes, so=20
> key press should not be reported to userspace... [1] (from=20
> previous email).

This is not true if ARBT (with 1 as parameter) is called. When this
is done, the BIOS stops managing the radio devices completely and
reporting KEY_RFKILL to userspace becomes a necessity. I guess that
the laptops on which this patch was tested behaved like mine after
ARBT is called, given that the call was missing completely in the
original patch.

> > Correct if I'm wrong, but shouldn't his patch have no effects
> > on your laptop? If I'm not wrong, CRBT returns 2 on your
> > laptop, so the input device is not even created. Am I missing
> > something?
> >=20
> > Gabriele
>=20
> Yes, it has no effect for my laptop.
>=20
>=20

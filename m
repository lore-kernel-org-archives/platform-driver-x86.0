From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Wed, 13 Jan 2016 09:54:55 +0100
Message-ID: <20160113085455.GD11560@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
 <20160112215804.GA12869@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:37505 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932294AbcAMIy6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Jan 2016 03:54:58 -0500
Content-Disposition: inline
In-Reply-To: <20160112215804.GA12869@amd>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Tuesday 12 January 2016 22:58:04 Pavel Machek wrote:
> Hi!
>=20
> On Mon 2016-01-11 21:03:01, Pali Roh=C3=A1r wrote:
> > On Monday 11 January 2016 20:28:00 Henrique de Moraes Holschuh wrot=
e
> > > The two features are not the same (and are handled differently by=
 the
> > > firmware, for whatever reason), although they do serve the same
> > > purpose. I don't think a thinkpad will ever have both features at
> > > the same time, so I have no idea why they changed the firmware
> > > interface.
> >=20
> > Maybe we should decide if ::kbd_backlight LED suffix could be used =
also=20
> > for other LED devices and not only for those which are physically u=
nder=20
> > the keyboard.
>=20
> Another problem is that N900 has _6_ backlight LEDs. Named
> lp5523::kb1..6. ... Which does means desktop software will probably
> not pick them up :-(.=20
>=20
> I guess we could have "/sys/class/kbd_light/brightness" that would
> control all of them with one write.

Probably... But there is problem that lp5523 is not ordinary on/off
light, it can be programmed to execute own "light" application.

> Next question is.. apparently there are some keyboards that have
> per-key RGB backlight... but maybe we can just call that "weird
> enough" and ignore...

=46irst we need to defines stable kernel ABI for keyboard backlight. An=
d I
suggest to use existing convention used by upower/console-kit and other
userspace apps...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

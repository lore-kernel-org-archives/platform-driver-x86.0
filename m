From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Wed, 13 Jan 2016 20:07:36 +0100
Message-ID: <20160113190736.GD9821@amd>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
 <20160112215804.GA12869@amd>
 <20160113085455.GD11560@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54879 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753747AbcAMTHi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Jan 2016 14:07:38 -0500
Content-Disposition: inline
In-Reply-To: <20160113085455.GD11560@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Wed 2016-01-13 09:54:55, Pali Roh=E1r wrote:
> On Tuesday 12 January 2016 22:58:04 Pavel Machek wrote:
> > Hi!
> >=20
> > On Mon 2016-01-11 21:03:01, Pali Roh=E1r wrote:
> > > On Monday 11 January 2016 20:28:00 Henrique de Moraes Holschuh wr=
ote
> > > > The two features are not the same (and are handled differently =
by the
> > > > firmware, for whatever reason), although they do serve the same
> > > > purpose. I don't think a thinkpad will ever have both features =
at
> > > > the same time, so I have no idea why they changed the firmware
> > > > interface.
> > >=20
> > > Maybe we should decide if ::kbd_backlight LED suffix could be use=
d also=20
> > > for other LED devices and not only for those which are physically=
 under=20
> > > the keyboard.
> >=20
> > Another problem is that N900 has _6_ backlight LEDs. Named
> > lp5523::kb1..6. ... Which does means desktop software will probably
> > not pick them up :-(.=20
> >=20
> > I guess we could have "/sys/class/kbd_light/brightness" that would
> > control all of them with one write.
>=20
> Probably... But there is problem that lp5523 is not ordinary on/off
> light, it can be programmed to execute own "light" application.

Yeah, but that's not a problem, right. lp5523 can still set brightness
by hand.

> > Next question is.. apparently there are some keyboards that have
> > per-key RGB backlight... but maybe we can just call that "weird
> > enough" and ignore...
>=20
> First we need to defines stable kernel ABI for keyboard backlight. An=
d I
> suggest to use existing convention used by upower/console-kit and oth=
er
> userspace apps...

Hmm... I'm not sure that can be done. What were the masks used by
upower again? Will upower write to all 6 leds if we present them?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html

From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Tue, 12 Jan 2016 22:58:04 +0100
Message-ID: <20160112215804.GA12869@amd>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54785 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890AbcALV6G (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 16:58:06 -0500
Content-Disposition: inline
In-Reply-To: <201601112103.01145@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

Hi!

On Mon 2016-01-11 21:03:01, Pali Roh=E1r wrote:
> On Monday 11 January 2016 20:28:00 Henrique de Moraes Holschuh wrote
> > The two features are not the same (and are handled differently by t=
he
> > firmware, for whatever reason), although they do serve the same
> > purpose. I don't think a thinkpad will ever have both features at
> > the same time, so I have no idea why they changed the firmware
> > interface.
>=20
> Maybe we should decide if ::kbd_backlight LED suffix could be used al=
so=20
> for other LED devices and not only for those which are physically und=
er=20
> the keyboard.

Another problem is that N900 has _6_ backlight LEDs. Named
lp5523::kb1..6. ... Which does means desktop software will probably
not pick them up :-(.=20

I guess we could have "/sys/class/kbd_light/brightness" that would
control all of them with one write.

Next question is.. apparently there are some keyboards that have
per-key RGB backlight... but maybe we can just call that "weird
enough" and ignore...

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html

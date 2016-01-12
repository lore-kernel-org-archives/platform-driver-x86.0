From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Tue, 12 Jan 2016 14:04:35 -0200
Message-ID: <1452614675.376008.489962970.24E13AB9@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36700 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753342AbcALQEg convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 11:04:36 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id E9647208E4
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jan 2016 11:04:35 -0500 (EST)
In-Reply-To: <201601112103.01145@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Pavel Machek <pavel@ucw.cz>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Mon, Jan 11, 2016, at 18:03, Pali Roh=E1r wrote:
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

Maybe, but that doesn't matter for thinkpad-acpi: the "thinklight" LED
name is kernel-userspace ABI so frozen by years and years of use that i=
t
is not even funny.  It cannot be changed.

> At least I understand "keyboard backlight" as light which is under th=
e=20
> keyboard...

So do I...

> And more important, I was told that ThinkPad x230 comes in variant wi=
th=20
> both ThinkLight (that LED upper the display) and keyboard backlight=20
> (under they keyboard).

Ok, so there is yet another damn good reason to keep both separate.

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

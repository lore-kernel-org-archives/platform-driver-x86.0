From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Sat, 09 Jan 2016 15:39:14 -0200
Message-ID: <1452361154.673684.487414482.6CCEAE4B@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160104201231.GB5847@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56495 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754332AbcAIRjP convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jan 2016 12:39:15 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 353AA207DE
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jan 2016 12:39:15 -0500 (EST)
In-Reply-To: <20160104201231.GB5847@amd>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>, =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Mon, Jan 4, 2016, at 18:12, Pavel Machek wrote:
> > This patch adds support for controlling keyboard backlight via stan=
dard
> > linux led class interface (::kbd_backlight). It uses ACPI HKEY devi=
ce with
> > MLCG and MLCS methods.
> >=20
> > Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> > Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>
>=20
> On my thinkpad, keyboard light is controlled by
>=20
> /sys/class/leds/tpacpi\:\:thinklight/brightness
>=20
> (that's a bad name).

That's because the driver was not updated to support your laptop, AND I
don't recall if someone mapped the full behavior of the ACPI thinklight
interface in your thinkpad :-(

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

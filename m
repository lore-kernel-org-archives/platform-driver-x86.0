From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 21:12:31 +0100
Message-ID: <20160104201231.GB5847@amd>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48371 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799AbcADUMf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:12:35 -0500
Content-Disposition: inline
In-Reply-To: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

Hi1

> This patch adds support for controlling keyboard backlight via standa=
rd
> linux led class interface (::kbd_backlight). It uses ACPI HKEY device=
 with
> MLCG and MLCS methods.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>

On my thinkpad, keyboard light is controlled by

/sys/class/leds/tpacpi\:\:thinklight/brightness

(that's a bad name).

On n900, it is .../leds/kb0..kb6. Now we'd have kbd_backlight. I guess
we should standartize on one name for this light, so that userspace
has the chance to handle it automatically...

Also, neccessity of workqueues for LED setting is slowly being removed
from the kernel, see LED mailing list for details.

Thanks,
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html

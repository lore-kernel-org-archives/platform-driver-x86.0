From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Wed, 6 Jan 2016 09:45:13 +0100
Message-ID: <20160106084513.GA11364@pali>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20151227231417.GB8731@khazad-dum.debian.net>
 <201512281548.14411@pali>
 <201512302328.48620@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35249 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbcAFIpV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jan 2016 03:45:21 -0500
Content-Disposition: inline
In-Reply-To: <201512302328.48620@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Wednesday 30 December 2015 23:28:48 Pali Roh=C3=A1r wrote:
> On Monday 28 December 2015 15:48:14 Pali Roh=C3=A1r wrote:
> > > Also, is it working properly across suspend+resume?
> >=20
> > When doing resume from suspend or hibernate BIOS turning keyboard
> > backlight automatically off.
>=20
> Fixed in v2.
>=20

Now I see that BIOS try to be too intelligent and automatically turn of
keyboard backlight when LID is closed. When LID is open again then
keyboard backlight stay turned off. Sysfs show correct state (brightnes=
s
is zero).

Should thinkpad acpi driver do something? Or let BIOS do that job?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

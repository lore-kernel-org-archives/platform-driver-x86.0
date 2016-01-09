From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Sat, 09 Jan 2016 15:36:16 -0200
Message-ID: <1452360976.673310.487413586.60AA12B9@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20151227231417.GB8731@khazad-dum.debian.net> <201512281548.14411@pali>
 <201512302328.48620@pali> <20160106084513.GA11364@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36100 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754682AbcAIRgR convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jan 2016 12:36:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 230C52052F
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jan 2016 12:36:17 -0500 (EST)
In-Reply-To: <20160106084513.GA11364@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Wed, Jan 6, 2016, at 06:45, Pali Roh=E1r wrote:
> On Wednesday 30 December 2015 23:28:48 Pali Roh=E1r wrote:
> > On Monday 28 December 2015 15:48:14 Pali Roh=E1r wrote:
> > > > Also, is it working properly across suspend+resume?
> > >=20
> > > When doing resume from suspend or hibernate BIOS turning keyboard
> > > backlight automatically off.
> >=20
> > Fixed in v2.
> >=20
>=20
> Now I see that BIOS try to be too intelligent and automatically turn =
of
> keyboard backlight when LID is closed. When LID is open again then
> keyboard backlight stay turned off. Sysfs show correct state (brightn=
ess
> is zero).
>=20
> Should thinkpad acpi driver do something? Or let BIOS do that job?

Either is fine, as long as you ensure the driver knows the BIOS turned
off the backlight, which you did.

So, really, I don't mind if we follow the BIOS.

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

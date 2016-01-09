From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for keyboard backlight
Date: Sat, 09 Jan 2016 15:34:35 -0200
Message-ID: <1452360875.672905.487413202.45C93A5C@webmail.messagingengine.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <1451514461-31999-1-git-send-email-pali.rohar@gmail.com>
 <20160104200425.GC26072@malice.jf.intel.com> <201601042126.19417@pali>
 <20160104204020.GC4219@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54596 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755209AbcAIReg convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jan 2016 12:34:36 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 398BC203BC
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jan 2016 12:34:36 -0500 (EST)
In-Reply-To: <20160104204020.GC4219@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Mon, Jan 4, 2016, at 18:40, Darren Hart wrote:
> On Mon, Jan 04, 2016 at 09:26:19PM +0100, Pali Roh=E1r wrote:
> > On Monday 04 January 2016 21:04:25 Darren Hart wrote:
> > > On Wed, Dec 30, 2015 at 11:27:41PM +0100, Pali Roh=E1r wrote:
> > > > This patch adds support for controlling keyboard backlight via
> > > > standard linux led class interface (::kbd_backlight). It uses A=
CPI
> > > > HKEY device with MLCG and MLCS methods.
> > >=20
> > > Which laptops is this intended to support?
> >=20
> > Thinkpad ??30 series and new which have backlight keyboard.
>=20
> Thanks, we should include that in the commit message as well as the
> comments
> surrounding the driver section.
>=20
> Henrique, are your concerns surrounding suspend/resume resolved?

Yes.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

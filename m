From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and restore it
 on resume
Date: Tue, 24 May 2016 12:27:51 -0300
Message-ID: <1464103671.3536046.617301193.668855E8@webmail.messagingengine.com>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
 <20160523215752.GC2735@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41368 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752518AbcEXP1x convert rfc822-to-8bit
	(ORCPT <rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 11:27:53 -0400
In-Reply-To: <20160523215752.GC2735@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Marco Trevisan <mail@3v1n0.net>
Cc: platform-driver-x86@vger.kernel.org, =?ISO-8859-1?Q?Pali=20Roh=E1r?= <pali.rohar@gmail.com>

On Mon, May 23, 2016, at 18:57, Darren Hart wrote:
> On Thu, May 19, 2016 at 03:23:02AM +0200, Marco Trevisan wrote:
> > From: Marco Trevisan (Trevi=F1o) <mail@3v1n0.net>
> >=20
> > Override default LED class suspend/resume handles, by keeping track=
 of
> > the brightness level before suspending so that it can be automatica=
lly
> > restored on resume by calling default resume handler.
> >=20
> > Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>=20
> The patch requires a Signed-off-by. I presume that should be from Mar=
co?
>=20
> Henrique, is this Acked-by from you accurate? I need to see maintaine=
rs
> respond
> on list as they would likely object to me just taking other people's =
word
> for it
> in other scenarios ;-)

Yeah, I acked it.  Sorry it took a few days to reply to this email.

This is not the "best" fix, but it is by far the less troublesome one:
hooking to the internal event from the thinkpad DSDT and updating the
brightness shadow register in the driver should work, but that will
require testing as we cannot really take for granted that we will get
that event on every firmware out there without going over the DSDT AML
of a lot of models.

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

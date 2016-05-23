From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and
 restore it on resume
Date: Mon, 23 May 2016 14:57:52 -0700
Message-ID: <20160523215752.GC2735@f23x64.localdomain>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55933 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751284AbcEWV5z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 17:57:55 -0400
Content-Disposition: inline
In-Reply-To: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Trevisan <mail@3v1n0.net>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Thu, May 19, 2016 at 03:23:02AM +0200, Marco Trevisan wrote:
> From: Marco Trevisan (Trevi=F1o) <mail@3v1n0.net>
>=20
> Override default LED class suspend/resume handles, by keeping track o=
f
> the brightness level before suspending so that it can be automaticall=
y
> restored on resume by calling default resume handler.
>=20
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

The patch requires a Signed-off-by. I presume that should be from Marco=
?

Henrique, is this Acked-by from you accurate? I need to see maintainers=
 respond
on list as they would likely object to me just taking other people's wo=
rd for it
in other scenarios ;-)

--=20
Darren Hart
Intel Open Source Technology Center

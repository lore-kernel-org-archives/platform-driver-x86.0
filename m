From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and
 restore it on resume
Date: Mon, 23 May 2016 15:09:29 -0700
Message-ID: <20160523220929.GD2735@f23x64.localdomain>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
 <20160519075243.GI29844@pali>
 <CAALaSc=b821TsgB1FZGy9nmP-ZG0jjycdP2ktE1hFZUFg_ACog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57416 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853AbcEWWJb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 18:09:31 -0400
Content-Disposition: inline
In-Reply-To: <CAALaSc=b821TsgB1FZGy9nmP-ZG0jjycdP2ktE1hFZUFg_ACog@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Trevisan =?iso-8859-1?B?KFRyZXZp8W8p?= <mail@3v1n0.net>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

On Fri, May 20, 2016 at 05:03:52AM +0200, Marco Trevisan (Trevi=F1o) wr=
ote:
> 2016-05-19 9:52 GMT+02:00 Pali Roh=E1r <pali.rohar@gmail.com>:
> > For me whole patch looks like a big hack because LED_CORE_SUSPENDRE=
SUME
> > does not work correctly... I would rather see fixed support for fla=
g
> > LED_CORE_SUSPENDRESUME, not adding another suspend/resume hook if
> > possible. Any idea?
>=20
> As I wrote you in private mail I think the only way we have is to kee=
p
> the led_cdev->brightness in sync with actual state. And to do this, w=
e
> can listen the ACPI event, keeping this like a private event that we
> just consume to update led brightness value, without delivering it to
> userspace.
>=20
> However, the custom code needed for getting this done, is probably wa=
y
> more than the one I added here.
> Maybe it could be useful to others to read the brightness level befor=
e
> suspending, and in this case we could add a new flag to the led
> subsystem, but not sure it's really worth.
>=20

At the risk of contributing to "the platform platform", I agree with a =
local fix
here in the near term. If this becomes a pattern, we can look to move t=
his into
the LED subsystem. As it is, this is working as designed, overriding wh=
en
necessary.

--=20
Darren Hart
Intel Open Source Technology Center

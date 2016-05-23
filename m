From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and
 restore it on resume
Date: Mon, 23 May 2016 15:21:29 -0700
Message-ID: <20160523222129.GG2735@f23x64.localdomain>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
 <20160523215752.GC2735@f23x64.localdomain>
 <201605240004.09829@pali>
 <CAALaScnavfThOtXeb1FRJAqxzMhtV-KmtZt71-pFL0rr23nzhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57957 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751352AbcEWWVb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 18:21:31 -0400
Content-Disposition: inline
In-Reply-To: <CAALaScnavfThOtXeb1FRJAqxzMhtV-KmtZt71-pFL0rr23nzhA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Trevisan =?iso-8859-1?B?KFRyZXZp8W8p?= <mail@3v1n0.net>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>

On Tue, May 24, 2016 at 12:10:44AM +0200, Marco Trevisan (Trevi=F1o) wr=
ote:
> 2016-05-24 0:04 GMT+02:00 Pali Roh=E1r <pali.rohar@gmail.com>:
> > Darren, I'm not sure if this is really correct approach in current
> > patch... Anyway as Marco wrote, there is ACPI event when keyboard
> > backlight change and maybe we should handle it...
>=20
> I'll be happy to work on that as well, but I've not much time at the =
moment.
> However I think this could be an ok way to handle things in the mean =
time.
>=20

I believe so, and Henrique has approved.

--=20
Darren Hart
Intel Open Source Technology Center

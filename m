From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and
 restore it on resume
Date: Mon, 23 May 2016 15:20:49 -0700
Message-ID: <20160523222049.GF2735@f23x64.localdomain>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
 <20160523215752.GC2735@f23x64.localdomain>
 <CAALaSc=dtXhPgqxQCWx40JxrwJECjH22EGq6p2rv_9w0+kQoHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57950 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751352AbcEWWUv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2016 18:20:51 -0400
Content-Disposition: inline
In-Reply-To: <CAALaSc=dtXhPgqxQCWx40JxrwJECjH22EGq6p2rv_9w0+kQoHA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Trevisan =?iso-8859-1?B?KFRyZXZp8W8p?= <mail@3v1n0.net>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

On Tue, May 24, 2016 at 12:08:46AM +0200, Marco Trevisan (Trevi=F1o) wr=
ote:
> 2016-05-23 23:57 GMT+02:00 Darren Hart <dvhart@infradead.org>:
> > On Thu, May 19, 2016 at 03:23:02AM +0200, Marco Trevisan wrote:
> >> From: Marco Trevisan (Trevi=F1o) <mail@3v1n0.net>
> >>
> >> Override default LED class suspend/resume handles, by keeping trac=
k of
> >> the brightness level before suspending so that it can be automatic=
ally
> >> restored on resume by calling default resume handler.
> >>
> >> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> >
> > The patch requires a Signed-off-by. I presume that should be from M=
arco?
>=20
> I'm quite new to this, so please let me know how I should proceed.

Any time you submit a patch, you must provide a Signed-off-by in the co=
mmit
message. Git will do this for you with "git commit --signoff". See:

Documentation/SubmittingPatches, Section 11: Sign your work

>=20
> > Henrique, is this Acked-by from you accurate? I need to see maintai=
ners respond
> > on list as they would likely object to me just taking other people'=
s word for it
> > in other scenarios ;-)
>=20
> I've added it based on this reply (on ibm-acpi ML):
>  - http://thread.gmane.org/gmane.linux.acpi.ibm-acpi.devel/4006/focus=
=3D4007
>=20

Ah, excellent. I didn't have the original since I wasn't on Cc initiall=
y. That's
all I need from Henrique.

--=20
Darren Hart
Intel Open Source Technology Center

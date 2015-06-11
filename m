From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 0/3] Dell Airplane Mode Switch driver
Date: Wed, 10 Jun 2015 21:55:08 -0700
Message-ID: <20150611045508.GA17170@fury.dvhart.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1433579010-10509-1-git-send-email-pali.rohar@gmail.com>
 <20150608041238.GA9930@fury.dvhart.com>
 <20150608073022.GA12078@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42574 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718AbbFKEzK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 11 Jun 2015 00:55:10 -0400
Content-Disposition: inline
In-Reply-To: <20150608073022.GA12078@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu

On Mon, Jun 08, 2015 at 09:30:36AM +0200, Pali Roh=E1r wrote:
> On Sunday 07 June 2015 21:12:38 Darren Hart wrote:
> > On Sat, Jun 06, 2015 at 10:23:27AM +0200, Pali Roh=E1r wrote:
> > > This patch series add new acpi Dell Airplane Mode Switch driver (=
DELLABCE and
> > > DELRBTN acpi devices). It provides radio HW switch events (togeth=
er with current
> > > state of radio devices) and export them via rfkill interface. The=
se events are
> > > also used in dell-laptop driver instead i8042 filter hook functio=
n (when acpi
> > > device is available).
> > >=20
> > > In v2 was added support for laptops which have toggle button inst=
ead HW slider
> > > switch. For that I reused code done by Alex Hung.
> > >=20
> > > v3 is just cleanup.
> > >=20
> > > In v4 was fixed dependency problems.
> >=20
> > Please be more specific in the future. You want people that haven't=
 looked at
> > this for a couple of weeks to be able to quickly identify what chan=
ged and
> > confirm they agree. You want people to review your code, you want t=
o reduce the
> > barrier to do so. Easy to do while it's fresh in your mind.
> >=20
> > Thanks for the update, I have these qeueud to testing.
> >=20
>=20
> I wrote more details into individual patches above diffstat lines. Bu=
t
> if you want detailed description also to cover letter email, I can do
> that in the future...

The individual patches is better. It's typical to leave the entire chan=
gelog
after the ---, and not just the current version. I found what I was act=
ually
looking for was in the v4 changelog.

It's not a huge deal, but if the goal is to get people (and not just me=
) to
review the code, we want to make it as easy for them as possible to get=
 the
necessary context to start reviewing. No doubt certain maintainer may f=
eel
differently.

--=20
Darren Hart
Intel Open Source Technology Center

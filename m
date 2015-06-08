From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 0/3] Dell Airplane Mode Switch driver
Date: Mon, 8 Jun 2015 09:30:36 +0200
Message-ID: <20150608073022.GA12078@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1433579010-10509-1-git-send-email-pali.rohar@gmail.com>
 <20150608041238.GA9930@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:35163 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133AbbFHHan (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Jun 2015 03:30:43 -0400
Content-Disposition: inline
In-Reply-To: <20150608041238.GA9930@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu

On Sunday 07 June 2015 21:12:38 Darren Hart wrote:
> On Sat, Jun 06, 2015 at 10:23:27AM +0200, Pali Roh=C3=A1r wrote:
> > This patch series add new acpi Dell Airplane Mode Switch driver (DE=
LLABCE and
> > DELRBTN acpi devices). It provides radio HW switch events (together=
 with current
> > state of radio devices) and export them via rfkill interface. These=
 events are
> > also used in dell-laptop driver instead i8042 filter hook function =
(when acpi
> > device is available).
> >=20
> > In v2 was added support for laptops which have toggle button instea=
d HW slider
> > switch. For that I reused code done by Alex Hung.
> >=20
> > v3 is just cleanup.
> >=20
> > In v4 was fixed dependency problems.
>=20
> Please be more specific in the future. You want people that haven't l=
ooked at
> this for a couple of weeks to be able to quickly identify what change=
d and
> confirm they agree. You want people to review your code, you want to =
reduce the
> barrier to do so. Easy to do while it's fresh in your mind.
>=20
> Thanks for the update, I have these qeueud to testing.
>=20

I wrote more details into individual patches above diffstat lines. But
if you want detailed description also to cover letter email, I can do
that in the future...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

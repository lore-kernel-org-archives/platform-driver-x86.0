From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 0/3] Dell Airplane Mode Switch driver
Date: Sun, 7 Jun 2015 21:12:38 -0700
Message-ID: <20150608041238.GA9930@fury.dvhart.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1433579010-10509-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:32938 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750815AbbFHEMj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Jun 2015 00:12:39 -0400
Content-Disposition: inline
In-Reply-To: <1433579010-10509-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu

On Sat, Jun 06, 2015 at 10:23:27AM +0200, Pali Roh=E1r wrote:
> This patch series add new acpi Dell Airplane Mode Switch driver (DELL=
ABCE and
> DELRBTN acpi devices). It provides radio HW switch events (together w=
ith current
> state of radio devices) and export them via rfkill interface. These e=
vents are
> also used in dell-laptop driver instead i8042 filter hook function (w=
hen acpi
> device is available).
>=20
> In v2 was added support for laptops which have toggle button instead =
HW slider
> switch. For that I reused code done by Alex Hung.
>=20
> v3 is just cleanup.
>=20
> In v4 was fixed dependency problems.

Please be more specific in the future. You want people that haven't loo=
ked at
this for a couple of weeks to be able to quickly identify what changed =
and
confirm they agree. You want people to review your code, you want to re=
duce the
barrier to do so. Easy to do while it's fresh in your mind.

Thanks for the update, I have these qeueud to testing.

--=20
Darren Hart
Intel Open Source Technology Center

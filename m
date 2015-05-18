From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/3] Dell Airplane Mode Switch driver
Date: Mon, 18 May 2015 11:07:19 -0700
Message-ID: <20150518180719.GA51961@vmdeb7>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1431600868-11737-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41997 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752414AbbERSHW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 May 2015 14:07:22 -0400
Content-Disposition: inline
In-Reply-To: <1431600868-11737-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>

On Thu, May 14, 2015 at 12:54:24PM +0200, Pali Roh=E1r wrote:
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
> Pali Roh=E1r (3):
>   dell-rbtn: Dell Airplane Mode Switch driver
>   dell-rbtn: Export notifier for other kernel modules
>   dell-laptop: Use dell-rbtn instead i8042 filter when possible

Queued for 4.2, thanks for sticking with it Pali, Gabriele, and Alex.

--=20
Darren Hart
Intel Open Source Technology Center

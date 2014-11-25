From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] Dell Airplane Mode Switch driver
Date: Tue, 25 Nov 2014 15:05:28 -0800
Message-ID: <20141125230527.GC32102@vmdeb7>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55792 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932267AbaLBHzx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Dec 2014 02:55:53 -0500
Content-Disposition: inline
In-Reply-To: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

On Sun, Nov 23, 2014 at 04:09:18PM +0100, Pali Roh=E1r wrote:
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
> Pali Roh=E1r (3):
>   platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
>   platform: x86: dell-rbtn: Export notifier for other kernel modules
>   platform: x86: dell-laptop: Use dell-rbtn instead i8042 filter when
>     possible
>=20
>  drivers/platform/x86/Kconfig       |   14 ++
>  drivers/platform/x86/Makefile      |    1 +
>  drivers/platform/x86/dell-laptop.c |   67 +++++++++-
>  drivers/platform/x86/dell-rbtn.c   |  260 ++++++++++++++++++++++++++=
++++++++++
>  drivers/platform/x86/dell-rbtn.h   |   35 +++++
>  5 files changed, 372 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/platform/x86/dell-rbtn.c
>  create mode 100644 drivers/platform/x86/dell-rbtn.h

Alex, it is my understanding that this solution from Pali is a more com=
plete
solution to dealing with the variety of dell wireless buttons and rfkil=
l
mechanisms in the world today.

I currently have:
7c4d961 dell-wireless: new driver for dell wireless button for Windows =
8
queued in for-next. If I have read your responses on this correctly, ar=
e we all
in agreement that I should drop the above patch, and apply these?

--=20
Darren Hart
Intel Open Source Technology Center

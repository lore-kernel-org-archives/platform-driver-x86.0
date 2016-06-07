From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Wed, 8 Jun 2016 00:06:11 +0200
Message-ID: <20160607220611.GO29844@pali>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <1463916983-12562-4-git-send-email-pali.rohar@gmail.com>
 <20160602104153.GB2456@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37056 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbcFGWGO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2016 18:06:14 -0400
Content-Disposition: inline
In-Reply-To: <20160602104153.GB2456@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 02 June 2016 12:41:53 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> I have one more entry to add here:
>=20
>     { KE_IGNORE, 0xe06e, { KEY_RESERVED } },
>=20
> WMI event 0xe06e is emitted on a Vostro V131 when the Dell Support
> Center hotkey is pressed, along with an i8042 interrupt.

Ok, I will add it to this list.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

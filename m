From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Mon, 27 Jul 2015 21:27:54 +0200
Message-ID: <20150727192754.GA5650@eudyptula.hq.kempniu.pl>
References: <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
 <20150703114356.GL1841@pali>
 <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
 <20150703133227.GM1841@pali>
 <20150703135047.GA3530@eudyptula.hq.kempniu.pl>
 <20150703140901.GN1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:35560 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751587AbbG0T16 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 Jul 2015 15:27:58 -0400
Received: by lahh5 with SMTP id h5so55284394lah.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2015 12:27:56 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703140901.GN1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Yes, "vendor does not say anything" is also what could happen...
>=20
> Then in your case, I would need to know format of *all* events which =
can
> your laptop via WMI receive. If we collect as more as possible events
> from different laptops we can try to abstract format/interface.

Darek Stojaczyk reported [1] that his Dell Inspiron M5110 (Q15R) needs
the same special SMI as the Vostro V131 in order for the Instant Launch
hotkey to be reported using WMI. He also prepared a WMI event listing
for his machine [2]. It's worth noting that in his case the Instant
Launch hotkey produces yet another WMI event, 0xe029, which isn't
currently handled by dell-wmi.c.

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1205791/commen=
ts/12
[2] https://launchpadlibrarian.net/212841338/M5110_wmi_events.txt

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 2/2] dell-laptop: Expose auxiliary MAC address if
 available
Date: Thu, 12 May 2016 13:31:17 +0200
Message-ID: <20160512113117.GA4390@eudyptula.hq.kempniu.pl>
References: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
 <1462811099-16897-2-git-send-email-mario_limonciello@dell.com>
 <20160511133251.GA3440@eudyptula.hq.kempniu.pl>
 <201605111841.54411@pali>
 <3afbad44903b4da88b1362e938850da8@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:36436 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497AbcELLbW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 May 2016 07:31:22 -0400
Received: by mail-lf0-f67.google.com with SMTP id y84so7524787lfc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 May 2016 04:31:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <3afbad44903b4da88b1362e938850da8@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com
Cc: pali.rohar@gmail.com, mjg59@srcf.ucam.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

> Mical - if you think patch 1/2 could still be useful to have as a gen=
eral interface I'll update it for your other comments and get it resubm=
itted.

If there is no practical use for it today, then let's call it quits for
now.  Once the need emerges, you can simply pick up where you left off.

> We do mirror the information in ACPI under the system bus:
>=20
>     Scope (_SB)
>     {
>         Name (AMAC, Buffer (0x17)
>         {
>             "_AUXMAC_#847BEB5992D2#"
>         })
>     }
>=20
> I don't know how to properly access this from the kernel side.  I not=
iced that most drivers that reference ACPI nodes refer to devices, not =
something hanging off the system bus.=20
> If you could advise the right way to go about that, I would appreciat=
e it.
>=20
> If I can access that, maybe it's better to do this directly as a patc=
h to the Ethernet driver in question (r8152). =20

As Pali said, this sounds like the cleaner option.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

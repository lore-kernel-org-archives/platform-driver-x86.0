From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/4] dell-wmi: Changes in WMI event code handling
Date: Thu, 9 Jun 2016 13:57:37 +0200
Message-ID: <20160609115737.GB2461@eudyptula.hq.kempniu.pl>
References: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:38433 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbcFIL5m (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jun 2016 07:57:42 -0400
Received: by mail-wm0-f41.google.com with SMTP id m124so56905036wme.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2016 04:57:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> First patch describe problem about 0xe045 code. Second and third are =
just
> cosmetic and last rework code which processing WMI events. It should =
be
> properly tested on more Dell machines, to check that everything is st=
ill
> working correctly.
>=20
> Changes since v1:
> * Fixed comments
> * Fixed memory leak
> * Added Tested-By lines
> * Added event 0xe06e

Pali, assuming that you will address Darren's concerns (empty commit
message for patch 2/4, switch fall-through in patch 4/4 and some
comments over 80 characters in patches 2/4 and 4/4), feel free to add:

Reviewed-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

as I don't see any further issues with this series.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

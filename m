From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/4] dell-wmi: Changes in WMI event code handling
Date: Thu, 2 Jun 2016 12:52:34 +0200
Message-ID: <20160602105234.GE2456@eudyptula.hq.kempniu.pl>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34841 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751833AbcFBKwk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 06:52:40 -0400
Received: by mail-lf0-f67.google.com with SMTP id q63so4720481lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jun 2016 03:52:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
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

On a Vostro V131:

Tested-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

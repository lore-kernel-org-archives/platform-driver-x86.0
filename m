From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant
 Launch hotkey processing
Date: Mon, 30 Nov 2015 15:54:58 +0100
Message-ID: <20151130145458.GA5524@eudyptula.hq.kempniu.pl>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
 <20151126144130.GI14190@pali>
 <20151126145556.GA9371@eudyptula.hq.kempniu.pl>
 <201511292050.18883@pali>
 <20151130141400.GA5398@eudyptula.hq.kempniu.pl>
 <20151130143756.GC29576@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34248 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754160AbbK3OzE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 Nov 2015 09:55:04 -0500
Received: by lffu14 with SMTP id u14so200360495lff.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Nov 2015 06:55:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151130143756.GC29576@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> The best would be if embedded controller could be configured to send
> events via i8042 bus...

Yes, but if I correctly understand Mario's message back from July [1],
V131's EC simply does not support generating scancodes at all.

> I'm starting to thing that blacklist or whitelist of machines is need=
ed
> to collect. And via it decide if WMI event will be accepted or droppe=
d.

If you believe this is the way to go, I'm perfectly fine with that.

[1] http://www.spinics.net/lists/platform-driver-x86/msg07220.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

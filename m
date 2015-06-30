From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Tue, 30 Jun 2015 09:38:35 +0200
Message-ID: <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
 <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
 <201506272050.24352@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:33348 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750718AbbF3Hii (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Jun 2015 03:38:38 -0400
Received: by laar3 with SMTP id r3so2422364laa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2015 00:38:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201506272050.24352@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> now I looked deeply at your problem. I read that part of ACPI code an=
d=20
> it really looks like that NEVT method does not handle all possible=20
> events.

Thank you for taking your time to review my findings.

> But how can windows driver handle that? In my opinion it either do so=
me
> init magic so NEVT will receive event with mask 0x0800 or it overwrit=
e
> some ACPI method and handle it locally...

I have no idea, but Kyle Evans had a few in a message I referenced
earlier in this thread [1].

> You can try to play with overwriting ACPI function NEVT at runtime an=
d=20
> patch it to call WMIA also for other masks.

I already tried that before writing the first message in this thread,
which includes the following quote:

"However, even when I customized the NEVT method to call WMIA for value=
s
0x1000 and 0x2000, the dell-wmi driver reported all zeros for the event
data retrieved using _WED."

> Are you 100% sure that keypress is not sent to i8042 controller and t=
hat=20
> linux kbd driver does not filter it somehow? Ideally test events with=
=20
> userspace application input-events and not with some X utility (to be=
=20
> sure that X does not consume that keypress too).

Yes, I'm sure. First I booted the kernel with i8042.debug=3D1. Interrup=
ts
were raised as expected for hotkey #2, but not for hotkey #3. Then I
enabled CONFIG_INPUT_EVBUG. As expected, events were generated for
hotkey #2, but not for hotkey #3.

[1] http://www.spinics.net/lists/linux-acpi/msg34577.html=20

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84

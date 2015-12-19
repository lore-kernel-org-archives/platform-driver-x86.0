From: Mousou Yuu <guogaishiwo@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: New driver for asus wireless button
Date: Sat, 19 Dec 2015 17:30:23 +0800
Message-ID: <20151219173023.2fde2cf95a76aaf70779c1b2@gmail.com>
References: <20151219093429.7ae867dccd81cad37ff51d8f@gmail.com>
	<CA+A7VXWtoy3sDqYNSXD0L5Yhvc5CrQ-=FXtGhSgcvY7wqPcx4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:33930 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932158AbbLSJa0 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 04:30:26 -0500
Received: by mail-wm0-f42.google.com with SMTP id l126so13361167wml.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Dec 2015 01:30:26 -0800 (PST)
In-Reply-To: <CA+A7VXWtoy3sDqYNSXD0L5Yhvc5CrQ-=FXtGhSgcvY7wqPcx4A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net

On Sat, 19 Dec 2015 00:59:58 -0500
Jo=E3o Paulo Rechi Vita <jprvita@gmail.com> wrote:

> I have sent a patch series to this list to drive the exact same devic=
e
> your proposed module is driving, about 4 days ago. The first message
> in the thread is titled "[RFC 0/4] Asus Wireless Radio Control
> driver". Could you check if that works on your laptop as well? After =
a
> quick glance through your patch I think it will work just fine. My
> series also deals with the airplane mode LED, does your laptop has an
> LED as well? If so, can you check if the LED is being driven as
> expected? In one of the systems I have access to there is a conflict
> with asus-wmi (Asus re-used the previous WLAN LED id for this one) an=
d
> the LED is inverted.

Oh, I should have searched the archive before submitting, it's the firs=
t
time I use mailing list...

I tested your patch on my U303LB model: there is no conflict, and airpl=
ane
hotkey works. But the patch has no effect on LED (still "inverted").

If I have to fix LED problem, I will consider modifying only asus-wmi a=
nd
asus-nb-wmi.

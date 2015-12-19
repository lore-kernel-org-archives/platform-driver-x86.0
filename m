From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: New driver for asus wireless button
Date: Sat, 19 Dec 2015 00:59:58 -0500
Message-ID: <CA+A7VXWtoy3sDqYNSXD0L5Yhvc5CrQ-=FXtGhSgcvY7wqPcx4A@mail.gmail.com>
References: <20151219093429.7ae867dccd81cad37ff51d8f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f181.google.com ([209.85.160.181]:34801 "EHLO
	mail-yk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751480AbbLSGAi convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 01:00:38 -0500
Received: by mail-yk0-f181.google.com with SMTP id p130so82231278yka.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Dec 2015 22:00:37 -0800 (PST)
In-Reply-To: <20151219093429.7ae867dccd81cad37ff51d8f@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mousou Yuu <guogaishiwo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net

Hello Mousou,

On 18 December 2015 at 20:34, Mousou Yuu <guogaishiwo@gmail.com> wrote:
> Some asus laptop models (zenbook UX303/U303) have their wireless cont=
rol
> button as a ACPI device, but make all other hotkeys in WMI, so ASUS_N=
B_WMI
> failed to handle it. Maybe it's better to modify ASUS_LAPTOP, but it'=
s
> too complex (for me) and device id is different, so a new driver is m=
ade.
>

I have sent a patch series to this list to drive the exact same device
your proposed module is driving, about 4 days ago. The first message
in the thread is titled "[RFC 0/4] Asus Wireless Radio Control
driver". Could you check if that works on your laptop as well? After a
quick glance through your patch I think it will work just fine. My
series also deals with the airplane mode LED, does your laptop has an
LED as well? If so, can you check if the LED is being driven as
expected? In one of the systems I have access to there is a conflict
with asus-wmi (Asus re-used the previous WLAN LED id for this one) and
the LED is inverted.

Thanks and best regards,

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita

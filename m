From: Tobias Stegmann <stegmannt@gmail.com>
Subject: Re: [PROBLEM][PATCH] thinkpad_acpi: propagate acpi event for hardware
 radio switch (Thinkpad X220)
Date: Tue, 10 Jun 2014 15:02:36 +0200
Message-ID: <CAGC361APORxQeeqgnebGYTUif36xoNJFn1d7GFC1ayGmVOsaww@mail.gmail.com>
References: <CAGC361CVCLMxc-0vNG-WqWK0zH6fG+wi3W7=swPKs2-FC_q2xg@mail.gmail.com>
 <20140609154522.GB28174@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:40996 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752041AbaFJNC5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Jun 2014 09:02:57 -0400
Received: by mail-ie0-f172.google.com with SMTP id lx4so3855310iec.31
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2014 06:02:56 -0700 (PDT)
In-Reply-To: <20140609154522.GB28174@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org

2014-06-09 17:45 GMT+02:00 Henrique de Moraes Holschuh <hmh@hmh.eng.br>:
> On Mon, 09 Jun 2014, Tobias Stegmann wrote:
>> After upgrading the kernel toggling the hardware radio switch doesn't
>> generate an acpi event anylonger.
>
> Ideed.  But it should be generating an input event, and also whatever event
> the rfkill core generates, if any (it used to generate an uevent, which udev
> receives.  Nowadays, I don't know).
>
> Can you test that?  You should receive a SW_EV SW_RFKILL_ALL event on the
> thinkpad-acpi input event device, where all hotkeys go.
>
> You will also receive a poll() event on the thinkpad-specific sysfs node for
> the radio switch, but that's not a nice interface for shell script use.
>
> You might also receive some sort of uevent over udev, if the rfkill core did
> not stop issuing those, and I belive you can use "udevadm" to verify it.
> Udev can launch scripts.

There are indeed both rfkill udev events and SW_EV SW_RFKILL_ALL input
events. I couldn't find any documentation how to use input device
events for triggering scripts except using crazy udev key mappings.
Using rfkill udev rules works fine. Thanks for pointing that out.

> Well, the logic is like this: there is a generic event for this type of
> information, and it is an input event.  The thinkpad-acpi-specific event has
> been, therefore, deprecated way back in 2007.

Thanks for clarification. No need to patch it then.

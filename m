From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Some buttons on the Fujitsu u7[25]7 laptops are not working
Date: Sat, 10 Feb 2018 22:22:17 +0100
Message-ID: <20180210212217.GA2070@larwa.localdomain>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:46641 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbeBJVWV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 16:22:21 -0500
Received: by mail-lf0-f51.google.com with SMTP id q194so15713227lfe.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2018 13:22:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> I'm still pondering about the microphone mute. Should this be handled like the all the other volume buttons, which seem to work without touching the fujitsu-laptop.c driver? I have no idea how these other buttons are forwarded to the sound drivers.

They are not forwarded to sound drivers.  Your desktop environment is
supposed to listen to these input events and apply the requested changes
to mixer settings.

> P.P.S. if someone has a good idea how to "route" the touchpad toggle key to the touchpad drivers without involving the userspace via evrouter, that would be nice too.

Like inside the kernel?  Erm, no, please, no.  Userspace is the place to
do this, same as for brightness hotkeys.  If you ask me, I would just
prefer the firmware to handle all hotkeys by itself, without even
notifying the OS, but this is the brave new world we live in and if the
firmware is only able to produce input events instead of changing
hardware state, let's at least not make these events trigger some sort
of inter-module interaction because that way lies madness.

-- 
Best regards,
Michał Kępień

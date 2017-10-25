From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
Date: Wed, 25 Oct 2017 06:39:57 +0200
Message-ID: <20171025043957.GA13202@kmp-mobile.hq.kempniu.pl>
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
 <bec5d8be-fa0b-be42-7af3-fa01fb071663@gmx.de>
 <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>
 <e8477251-1f12-43c2-3760-fdf8fb221b7a@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:52338 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbdJYEkB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Oct 2017 00:40:01 -0400
Received: by mail-lf0-f53.google.com with SMTP id b190so26290914lfg.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Oct 2017 21:40:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <e8477251-1f12-43c2-3760-fdf8fb221b7a@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Harvey <harv@gmx.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> >   - Investigating the E LED.  This requires taking a look at the DSDT
> >     dump from your laptop and searching for clues as to how this LED is
> >     handled.  I will be happy to do that, but again, no promises about
> >     how much time it will take.  (And given the nature of this task, I
> >     cannot promise I will find anything reasonable at all.  I also might
> >     ask you to do some further experiments as I do not have an E751
> >     myself.)

I feel stupid for only suggesting this now, but can this simply be the
eco LED?  The DSDT dump from your laptop suggests so, as well as the
description of the E LED in the manual.  Have you tried playing around
with /sys/class/leds/fujitsu::eco_led?

> Don't forget to take a look at the I LED...

I could not find anything in the DSDT dump from your laptop that would
suggest this LED can be controlled using ACPI.

-- 
Best regards,
Michał Kępień

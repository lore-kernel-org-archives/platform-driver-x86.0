From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/4] fujitsu-laptop: acpi_fujitsu_hotkey_notify() cleanup
Date: Wed, 11 Jan 2017 13:26:49 +0100
Message-ID: <20170111122649.GA929@ozzy.nask.waw.pl>
References: <20170111085933.2486-1-kernel@kempniu.pl>
 <20170111115820.GF17476@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33876 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756360AbdAKM0y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2017 07:26:54 -0500
Received: by mail-lf0-f67.google.com with SMTP id q89so11311757lfi.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2017 04:26:53 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170111115820.GF17476@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Wed, Jan 11, 2017 at 09:59:29AM +0100, Micha?? K??pie?? wrote:
> > I am currently preparing a patch series which makes fujitsu-laptop use a
> > sparse keymap for hotkey handling.  Before that will happen, though,
> > acpi_fujitsu_hotkey_notify() could use a revamp because it is pretty
> > hard to read as it is.  To avoid posting everything at once, here are a
> > few patches which IMHO make that function easier to read.  Some of these
> > changes might be a matter of taste, so feel free to NACK them or suggest
> > a preferred alternative.
> 
> This patch series provides a significant clean up to the functions it
> focuses on.  As such I have no real objections to them.  However, because my
> Fujitsu laptop doesn't have any of the hotkeys of later models I am unable
> to test these patches with real hardware.  Have you been able to do so?  If
> they have been verified I have no problem acking these.  Otherwise I will
> have to do as much as I can (given no access to relevant hardware) to ensure
> the overall behaviour isn't changed.

I tested these on a Lifebook E744, which is capable of generating
KEY4_CODE ("ECO on/off button") and KEY5_CODE ("Wireless/Bluetooth
on/off button").  I checked that these hotkeys still work fine with this
patch series applied.  By temporarily reversing some logical conditions,
I also did my best to ensure that unexpected behaviors (unknown ACPI
event code, kfifo failures) are still handled in the same way as
previously (apart from the "Push keycode into ringbuffer" debug message,
which is now only printed upon a successful push due to the last patch).

-- 
Best regards,
Michał Kępień

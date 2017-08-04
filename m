From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
Date: Fri, 4 Aug 2017 08:13:52 +0200
Message-ID: <20170804061352.GA7838@kmp-mobile.hq.kempniu.pl>
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
 <bec5d8be-fa0b-be42-7af3-fa01fb071663@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bec5d8be-fa0b-be42-7af3-fa01fb071663@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Harvey <harv@gmx.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Hi Michał,

Hi Harvey,

Thank you for providing us with further information.

> Now I had the time to change the harddisk in my laptop to the Win7 one
> (It's 35 degrees out there - nice excuse to stay inside ;))
> 
> What I found out:
> Neither the E nor the I LED work under Windows in my configuration.
> There is no Bluetooth LED (maybe because there is a combined
> WLAN/Bluetooth adapter used in the laptop?). There is only a Bluetooth
> Icon in the taskbar to indicate Bluetooth status.

Okay, this seems to be consistent with the manual I linked to in my
previous message.

> Pressing the E button brings up some kind of Energy saving applet and
> pressing the I button brings up an applet telling me about the hardware
> in my laptop and its current state.

These hotkeys should already work fine under Linux, i.e. pressing them
should generate input events which you can assign to any action you
please.  If they do not work for you, please let me know so that we can
debug further.

> Please tell me if I can provide more Information.

If I did not miss anything in your reports, there are two issues that
require some work:

  - Fixing radio LED detection.  I have an idea how to do this, but
    please mind that I am quite busy lately and cannot guarantee any
    specific time frame for submitting a patch.

  - Investigating the E LED.  This requires taking a look at the DSDT
    dump from your laptop and searching for clues as to how this LED is
    handled.  I will be happy to do that, but again, no promises about
    how much time it will take.  (And given the nature of this task, I
    cannot promise I will find anything reasonable at all.  I also might
    ask you to do some further experiments as I do not have an E751
    myself.)

-- 
Best regards,
Michał Kępień

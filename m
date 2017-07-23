From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Kernel error messages: leds fujitsu::radio_led: Setting an LED's
 brightness failed
Date: Sun, 23 Jul 2017 15:44:20 +0930
Message-ID: <20170723061420.GA32194@marvin.atrad.com.au>
References: <fede7169-e944-3ca8-8b8d-e17a95b8dcfe@gmx.de>
 <20170720064257.GA4942@larwa.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:43658 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751814AbdGWGOp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jul 2017 02:14:45 -0400
Content-Disposition: inline
In-Reply-To: <20170720064257.GA4942@larwa.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Harvey <harv@gmx.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michal

On Thu, Jul 20, 2017 at 08:42:57AM +0200, Micha?? K??pie?? wrote:
> > I found your mail address in https://patchwork.kernel.org/patch/8598801/
> > and it seems you are somehow involved in the improvement for
> > fujitsu-laptop LED handling. If this does not 'belong' to you, maybe you
> > can point me in the right direction where to report the issue.
> 
> No worries, that is fine, though I have CCed Jonathan Woithe, who is the
> maintainer of fujitsu-laptop, and both the platform-driver-x86 mailing
> list and LKML (both are open lists).

This is mainly to acknowledge that I have read this email.  Since my Fujitsu
does not have any LEDs I do not have any direct experience with their use
within the driver.  The existing LED code was contributed by others and
recently modified by Michal's patches as part of a broader tidy up of the
driver.  I'm more than happy for Michal to take the lead in investigating
this since I think he has a Fujitsu with LEDs.

> > I am using archlinux and as of kernel
> > 4.11 (IIRC) there has appeared an error message in the journalctl log
> > saying:
> > 
> > kernel: leds fujitsu::radio_led: Setting an LED's brightness failed
> > (-2147483648)
> > 
> > This appears for several times:
> > 
> > harvey@gruenix ~/Documents/scripts $ sudo journalctl -b | grep radio_led
> > 725:Jul 14 12:29:37 gruenix kernel: leds fujitsu::radio_led: Setting an
> > LED's brightness failed (-2147483648)
> :
> 4.11 included a patch which sets the default trigger for the radio LED
> to rfkill-any, which would explain why you only started seeing these
> errors after upgrading to that version.  See also below.
> 
> > Some of the LEDs are not working under linux, especially the bluetooth
> > one
> 
> Where is the Bluetooth LED located?  I cannot see it.  Can you show it
> on a photo?  How does it behave under other operating systems?

Also, how did these LEDs behave under earlier Linux kernel versions?  In
other words, is the non-functionality of these LEDs a regression in 4.11, or
have they never worked on your laptop?

Regards
  jonathan

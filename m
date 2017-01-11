From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4] fujitsu-laptop: acpi_fujitsu_hotkey_notify() cleanup
Date: Wed, 11 Jan 2017 23:18:13 +1030
Message-ID: <20170111124813.GH17476@marvin.atrad.com.au>
References: <20170111085933.2486-1-kernel@kempniu.pl>
 <20170111115820.GF17476@marvin.atrad.com.au>
 <20170111122649.GA929@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:34536 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966156AbdAKMss (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2017 07:48:48 -0500
Content-Disposition: inline
In-Reply-To: <20170111122649.GA929@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 11, 2017 at 01:26:49PM +0100, Micha?? K??pie?? wrote:
> > On Wed, Jan 11, 2017 at 09:59:29AM +0100, Micha?? K??pie?? wrote:
> > > I am currently preparing a patch series which makes fujitsu-laptop use a
> > > sparse keymap for hotkey handling.  Before that will happen, though,
> > > acpi_fujitsu_hotkey_notify() could use a revamp because it is pretty
> > > hard to read as it is.  To avoid posting everything at once, here are a
> > > few patches which IMHO make that function easier to read.  Some of these
> > > changes might be a matter of taste, so feel free to NACK them or suggest
> > > a preferred alternative.
> > 
> > This patch series provides a significant clean up to the functions it
> > focuses on.  As such I have no real objections to them.  However, because my
> > Fujitsu laptop doesn't have any of the hotkeys of later models I am unable
> > to test these patches with real hardware.  Have you been able to do so?  If
> > they have been verified I have no problem acking these.  Otherwise I will
> > have to do as much as I can (given no access to relevant hardware) to ensure
> > the overall behaviour isn't changed.
> 
> I tested these on a Lifebook E744, which is capable of generating
> KEY4_CODE ("ECO on/off button") and KEY5_CODE ("Wireless/Bluetooth
> on/off button").  I checked that these hotkeys still work fine with this
> patch series applied.  By temporarily reversing some logical conditions,
> I also did my best to ensure that unexpected behaviors (unknown ACPI
> event code, kfifo failures) are still handled in the same way as
> previously (apart from the "Push keycode into ringbuffer" debug message,
> which is now only printed upon a successful push due to the last patch).

Thanks for clarifying.  It may be worth adding a comment to the effect that
the patches were tested on a Lifebook E744.  That aside, I'm happy with
these clean ups.

Acked-by: Jonathan Woithe <jwoithe@just42.net>

Darren: do you want me to explicitly ack all 4 parts, or the above
sufficient for your processes?

Regards
  jonathan

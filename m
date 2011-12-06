From: Baptiste Jonglez <baptiste@jonglez.org>
Subject: Re: Dual-LVDS Acer Iconia laptop
Date: Tue, 6 Dec 2011 20:30:45 +0100
Message-ID: <20111206193044.GA13499@archminux>
References: <4EDE5561.5050005@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lvps80-90-199-152.vps.webfusion.co.uk ([80.90.199.152]:47657
	"EHLO lvps80-90-199-152.vps.webfusion.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752622Ab1LFTbX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Dec 2011 14:31:23 -0500
Content-Disposition: inline
In-Reply-To: <4EDE5561.5050005@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: jlee@suse.com, mjg59@srcf.ucam.org, mathieu.magnaudet@enac.fr, baptiste@jonglez.org, platform-driver-x86@vger.kernel.org, intel-gfx@lists.freedesktop.org

Cc-ing to intel-gfx@

On Tue, Dec 06, 2011 at 06:48:17PM +0100, Benjamin Tissoires wrote:
> Hi Guys,
> 
> I've seen on the list that some of you (as we were) have troubles with
> the second screen on the iconia laptop.
> 
> In our lab, we managed to make it work by using two patches:
> * http://web.archiveorange.com/archive/v/rNRcWX4nB2U5uRmbLm9h (LVDS are
> digital as well), this solved the "xrandr disconnected" issue
> * a small patch we are finalizing to call the right DMI function to
> light up the second LCD.

Awesome, thank you! It's quite frustrating to see that this patch was written
almost 6 months ago then forgotten...

It's already compiling, let's see if it works :)

> So, as soon as we have clean this code, this bug will be solved.

This first patch seems indeed based on an old tree, it requires some
small changes to apply.

> Cheers,
> Benjamin
> 
> PS: I'm sorry to start a new thread as I just registered myself on the
> list and was not able to get the previous Message-ID.

No problem, I'll post on the original thread for the record.

Thank you again,
Baptiste

From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 17:56:03 +0200
Message-ID: <20171013155603.GA3491@kroah.com>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop>
 <20171013004645.GB1470@fury>
 <20171013094314.GB29864@kroah.com>
 <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43221 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753442AbdJMPzz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 11:55:55 -0400
Content-Disposition: inline
In-Reply-To: <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, gnomes@lxorguk.ukuu.org.uk, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

Just want to respond to this part first:

On Fri, Oct 13, 2017 at 03:03:10PM +0000, Mario.Limonciello@dell.com wrote:
> Take off your "kernel" hat and put on a "customer" hat for a few moments
> while I try to put this in practical terms why the whitelist approach doesn't
> scale for what I'm trying to do.

Heh, you do know my background in running an enterprise kernel team,
right? :)

> Let's say hypothetically a future version of this series that has only whitelisted
> commands and tokens lands in a kernel that's in the next Ubuntu LTS, RHEL
> release etc.
> Hardware coming out about that time works fine, you can control the various
> knobs.  Then later that year some new headless hardware is released that has
> zigbee controllers that work with inbox kernel drivers but you can't turn them 
> on and off any way BUT through the manageability interface (it's headless!).
> In the manageability interface we also offer a new class/select or token that 
> can control the GPIO that turns on/off these radios.

It's the "later" that you are missing here.  We only have code today for
hardware we have today.  If you come out with new hardware, you need new
kernel drivers for it, and as such, "old" enterprise kernels will just
not work properly.

It's always been that way, this is nothing new, we can't predict the
future, and is one big reason why I think the whole "enterprise" distro
market is wrong and going to fail in the end :)

Same goes for that new device id for the wifi chip, or the video camera
or the fingerprint reader.  Those have to be added to the kernel, and if
the distro so desires, backported to their old and crufty version.

This has been happening for two decades now, somehow coming up with a
"raw" pipe from userspace to the kernel to control the hardware just
because you don't want to update the kernel code, isn't going to solve
the issue here (hint, you now have to update your userspace code, why is
that suddenly easier than the kernel?)

I know hardware companies want to stop writing software for their new
hardware designs.  I too want a pony :)

Sorry, this argument isn't going to fly.

greg k-h

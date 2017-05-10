From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 9 May 2017 23:11:52 -0700
Message-ID: <20170510061026.GA6232@fury>
References: <20170509231639.GB11404@fury>
 <20170510051341.GA17835@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:54502 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751123AbdEJGL5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2017 02:11:57 -0400
Content-Disposition: inline
In-Reply-To: <20170510051341.GA17835@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Wed, May 10, 2017 at 07:13:41AM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 09, 2017 at 04:16:39PM -0700, Darren Hart wrote:
> > Linus and Greg,
> > 
> > We are in the process of redesigning the Windows Management Instrumentation
> > (WMI) [1] system in the kernel. WMI is the Microsoft implementation of Web-Based
> > Enterprise Management (WBEM). We are looking to provide WMI access to userspace,
> > while allowing the kernel to filter requests that conflict with its own usage.
> > We'd like your take on how this approach relates to our commitment to not break
> > userspace.
> > 
> > For this discussion, we are specifically referring to ACPI PNP0C14 WMI
> > devices, consisting of a GUID and a set of methods and events, as well as a
> > precompiled intermediate description of the methods and arguments (MOF). Exposed
> > to userspace, these methods provide for BIOS interaction and are used for system
> > management as well as LEDs, hot keys, radio switches, etc. There is vendor
> > interest in achieving feature parity with Windows by exposing WMI methods to
> > userspace for system management.
> > 
> > While it appears WMI intended to be accessed from userspace, we have
> > made use of it in the kernel to support various laptop features by connecting
> > the WMI methods to other subsystems, notably input, leds, and rfkill [2]. The
> > challenge is continuing to use WMI for these platform features, while allowing
> > userspace to use it for system management tasks. Unfortunately, the WMI methods
> > are not guaranteed to be split up along granular functional lines, and we will
> > certainly face situations where the same GUID::METHOD_ID will be needed for a
> > kernel feature (say LED support) as well as a system management task.
> > 
> > To address this, I have proposed [3] that exporting WMI be opt-in, only done at
> > the request of and in collaboration with a vendor, with the kernel platform
> > driver given the opportunity to filter requests. This filtering would need to be
> > at the method and argument inspection level, such as checking for specific bits
> > in the input buffer, and rejecting the request if they conflict with an in
> > kernel usage (that's worst case, in some cases just GUID or method ID could be
> > sufficient).
> > 
> > Because the kernel and the platform drivers are under continual development, and
> > new systems appear regularly, we will encounter necessary changes to the
> > platform driver WMI request filters. These changes could be considered a change
> > to the kernel provided WMI interface to userspace. For example, we could
> > regularly accept a call to $GUID::$METHOD_ID with bit 4 of the buffer set, and
> > later deny the call when we determine it interferes with kernel usage.
> > 
> > In your view, is it acceptable to provide a chardev interface, for example,
> > exposing WMI methods to userspace, with the understanding that the kernel may
> > choose to filter certain requests which conflict with its own use? And that this
> > filtering may change as new features are added to the platform drivers?
> 
> So, for example, if a new driver for a "brightness key" were added to
> the kernel, all of a sudden the "raw" access to the wmi data through the
> chardev would filtered away by the kernel and not seen by userspace?
> 

Pali provided some detail in the rather lengthy thread I linked to [3], but the
summary is that there is nothing to encourage vendors to separate out
functionality into separate method ids. Some do, the asus-wmi driver seems to
have a reasonable separation, others do a lot with a single method id.

In the scenario you mention, it could be that the brightness key shows up in a
new laptop. Because we've never seen it before, the kernel driver doesn't detect
it and send the input event. The clever user realizes they can write a userspace
program to deal with this [a] by writing a my-laptop-brightness-key-daemon which
also makes a WMI method call to affect the change in brightness in response to
the keypress.

Another user notices the dmesg is reporting "Unknown WMI Event" when they press
that key and send a patch to make the corresponding wmi call to affect the
brightness change (which depends on driver data to track the brightness value).
To avoid conflicting with userspace, they also blacklist the WMI_BRIGHTNESS_CMD
from being called by userspace.

Now the first user makes a call to set the brightness, and receives an error
code instead of a successful response. Their program no longer works - although
with a current kernel, their brightness key would.

I glossed over a few things there, but the description isn't too far off from a
plausible scenario.

> Why would you want to do that?  What's wrong with providing "raw" access
> through a chardev, and the current in-kernel access as well at the same
> time?
> 
> I don't really understand what would "break" over time here.

Like the scenario above, if the behavior has state, if userspace and the kernel
attempt to control it, neither will have an accurate state representation.

We could allow both and if things start not working, the user would have to
choose between the kernel driver and the userspace management application. This
was the scenario Pali was particularly keen to avoid.

That said, to date I haven't come across anything that states there can only be
one userspace application accessing WMI at any given time. It should be
straightforward to serialize WMI calls such that they cannot "cross the
streams".

> 
> thanks,
> 
> greg k-h
> 

a. This is perhaps a contrived scenario since hotkeys generate events, and as
far as I understand it, there is no interest in exporting events to userspace,
just the methods.

-- 
Darren Hart
VMware Open Source Technology Center

From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Fri, 9 Jun 2017 17:46:41 -0700
Message-ID: <20170610004641.GC22981@fury>
References: <20170509231639.GB11404@fury>
 <20170510051341.GA17835@kroah.com>
 <20170603195058.GH4854@fury>
 <20170609064151.GC17685@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:58844 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751578AbdFJAqq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 20:46:46 -0400
Content-Disposition: inline
In-Reply-To: <20170609064151.GC17685@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Fri, Jun 09, 2017 at 08:41:51AM +0200, Greg Kroah-Hartman wrote:
> On Sat, Jun 03, 2017 at 12:50:58PM -0700, Darren Hart wrote:
> > On Wed, May 10, 2017 at 07:13:41AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, May 09, 2017 at 04:16:39PM -0700, Darren Hart wrote:
> > > > Linus and Greg,
> > > > 
> > > > We are in the process of redesigning the Windows Management Instrumentation
> > > > (WMI) [1] system in the kernel. WMI is the Microsoft implementation of Web-Based
> > > > Enterprise Management (WBEM). We are looking to provide WMI access to userspace,
> > > > while allowing the kernel to filter requests that conflict with its own usage.
> > > > We'd like your take on how this approach relates to our commitment to not break
> > > > userspace.
> > > > 
> > > > For this discussion, we are specifically referring to ACPI PNP0C14 WMI
> > > > devices, consisting of a GUID and a set of methods and events, as well as a
> > > > precompiled intermediate description of the methods and arguments (MOF). Exposed
> > > > to userspace, these methods provide for BIOS interaction and are used for system
> > > > management as well as LEDs, hot keys, radio switches, etc. There is vendor
> > > > interest in achieving feature parity with Windows by exposing WMI methods to
> > > > userspace for system management.
> > > > 
> > > > While it appears WMI intended to be accessed from userspace, we have
> > > > made use of it in the kernel to support various laptop features by connecting
> > > > the WMI methods to other subsystems, notably input, leds, and rfkill [2]. The
> > > > challenge is continuing to use WMI for these platform features, while allowing
> > > > userspace to use it for system management tasks. Unfortunately, the WMI methods
> > > > are not guaranteed to be split up along granular functional lines, and we will
> > > > certainly face situations where the same GUID::METHOD_ID will be needed for a
> > > > kernel feature (say LED support) as well as a system management task.
> > > > 
> > > > To address this, I have proposed [3] that exporting WMI be opt-in, only done at
> > > > the request of and in collaboration with a vendor, with the kernel platform
> > > > driver given the opportunity to filter requests. This filtering would need to be
> > > > at the method and argument inspection level, such as checking for specific bits
> > > > in the input buffer, and rejecting the request if they conflict with an in
> > > > kernel usage (that's worst case, in some cases just GUID or method ID could be
> > > > sufficient).
> > > > 
> > > > Because the kernel and the platform drivers are under continual development, and
> > > > new systems appear regularly, we will encounter necessary changes to the
> > > > platform driver WMI request filters. These changes could be considered a change
> > > > to the kernel provided WMI interface to userspace. For example, we could
> > > > regularly accept a call to $GUID::$METHOD_ID with bit 4 of the buffer set, and
> > > > later deny the call when we determine it interferes with kernel usage.
> > > > 
> > > > In your view, is it acceptable to provide a chardev interface, for example,
> > > > exposing WMI methods to userspace, with the understanding that the kernel may
> > > > choose to filter certain requests which conflict with its own use? And that this
> > > > filtering may change as new features are added to the platform drivers?
> > > 
> > > So, for example, if a new driver for a "brightness key" were added to
> > > the kernel, all of a sudden the "raw" access to the wmi data through the
> > > chardev would filtered away by the kernel and not seen by userspace?
> > > 
> > > Why would you want to do that?  What's wrong with providing "raw" access
> > > through a chardev, and the current in-kernel access as well at the same
> > > time?
> > > 
> > > I don't really understand what would "break" over time here.
> > > 
> > 
> > Just a bump now that we're out of the merge window in case either Greg or Linus
> > care to follow up with the responses to this.
> > 
> > To Greg's last point - any kernel state that is built up in conjunction with the
> > WMI interface could be invalidated by a userspace application. It may or may not
> > be recoverable, depending on the WMI implementation. This would be true for
> > multiple WMI userspace applications as well, and I suppose the question is, do
> > we defend the kernel drivers against this, or do we consider the kernel drivers
> > on equal footing with WMI applications, and say "don't do that then" when some
> > combination of apps and drivers don't play well together?
> 
> In the end, this shouldn't really matter, as long as nothing breaks as
> far as a user notices.  And that's the key here, apis can change, but if
> you do it in a way that breaks something, or anyone notices, then it's
> not ok.
> 
> So I don't have a solid answer other than "good luck!" :)
> 
> greg k-h
> 

Fair enough, thanks Greg.

To all involved. I propose we move forward with:

* Design the API
  - character device per WMI device
  - calling convention
  - platform proof of concept

Let's see this in practice. I hope this proves the point that we do not have to
filter these interfaces, since there is no clean way to do this, and the kernel
module is arguably no more valid a user of WMI than a userspace application
(perhaps less so given the intent of the vendor and the mechanism itself).

-- 
Darren Hart
VMware Open Source Technology Center

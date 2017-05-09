From: Darren Hart <dvhart@infradead.org>
Subject: WMI and Kernel:User interface
Date: Tue, 9 May 2017 16:16:39 -0700
Message-ID: <20170509231639.GB11404@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:38585 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbdEIXQo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 19:16:44 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

Linus and Greg,

We are in the process of redesigning the Windows Management Instrumentation
(WMI) [1] system in the kernel. WMI is the Microsoft implementation of Web-Based
Enterprise Management (WBEM). We are looking to provide WMI access to userspace,
while allowing the kernel to filter requests that conflict with its own usage.
We'd like your take on how this approach relates to our commitment to not break
userspace.

For this discussion, we are specifically referring to ACPI PNP0C14 WMI
devices, consisting of a GUID and a set of methods and events, as well as a
precompiled intermediate description of the methods and arguments (MOF). Exposed
to userspace, these methods provide for BIOS interaction and are used for system
management as well as LEDs, hot keys, radio switches, etc. There is vendor
interest in achieving feature parity with Windows by exposing WMI methods to
userspace for system management.

While it appears WMI intended to be accessed from userspace, we have
made use of it in the kernel to support various laptop features by connecting
the WMI methods to other subsystems, notably input, leds, and rfkill [2]. The
challenge is continuing to use WMI for these platform features, while allowing
userspace to use it for system management tasks. Unfortunately, the WMI methods
are not guaranteed to be split up along granular functional lines, and we will
certainly face situations where the same GUID::METHOD_ID will be needed for a
kernel feature (say LED support) as well as a system management task.

To address this, I have proposed [3] that exporting WMI be opt-in, only done at
the request of and in collaboration with a vendor, with the kernel platform
driver given the opportunity to filter requests. This filtering would need to be
at the method and argument inspection level, such as checking for specific bits
in the input buffer, and rejecting the request if they conflict with an in
kernel usage (that's worst case, in some cases just GUID or method ID could be
sufficient).

Because the kernel and the platform drivers are under continual development, and
new systems appear regularly, we will encounter necessary changes to the
platform driver WMI request filters. These changes could be considered a change
to the kernel provided WMI interface to userspace. For example, we could
regularly accept a call to $GUID::$METHOD_ID with bit 4 of the buffer set, and
later deny the call when we determine it interferes with kernel usage.

In your view, is it acceptable to provide a chardev interface, for example,
exposing WMI methods to userspace, with the understanding that the kernel may
choose to filter certain requests which conflict with its own use? And that this
filtering may change as new features are added to the platform drivers?

1. https://msdn.microsoft.com/en-us/library/aa384642(v=vs.85).aspx
2. https://lwn.net/Articles/391230/
3. https://lists.gt.net/linux/kernel/2671309/?page=1;

-- 
Darren Hart
VMware Open Source Technology Center

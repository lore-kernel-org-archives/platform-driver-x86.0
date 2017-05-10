From: Darren Hart <dvhart@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Wed, 10 May 2017 16:27:47 -0700
Message-ID: <20170510232747.GE11404@fury>
References: <20170509231639.GB11404@fury>
 <20170510051341.GA17835@kroah.com>
 <20170510061026.GA6232@fury>
 <e346b0f0c5684102aa571b166e21a47e@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41290 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752965AbdEJX1v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2017 19:27:51 -0400
Content-Disposition: inline
In-Reply-To: <e346b0f0c5684102aa571b166e21a47e@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: gregkh@linuxfoundation.org, torvalds@linux-foundation.org, pali.rohar@gmail.com, andriy.shevchenko@linux.intel.com, rjw@rjwysocki.net, luto@amacapital.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Wed, May 10, 2017 at 10:02:46PM +0000, Mario.Limonciello@dell.com wrote:
> This above discussion is confusing because it's referring specifically to "WMI events".
> related to brightness keypresses that don't make sense to go to userspace.

Let's elaborate on this point. Why are events not interesting to user space?

I don't think it would be too problematic to create a chardev for an Event GUID,
give platform drivers first chance to handle an event, and pass it up to
userspace for exported GUIDs if the kernel doesn't consume the event.

-- 
Darren Hart
VMware Open Source Technology Center

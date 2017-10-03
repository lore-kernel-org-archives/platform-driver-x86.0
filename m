From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 4/8] platform/x86: wmi: create character devices when
 requested by drivers
Date: Tue, 3 Oct 2017 11:23:23 +0200
Message-ID: <20171003092323.GA13295@kroah.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50011 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751190AbdJCJXN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Oct 2017 05:23:13 -0400
Content-Disposition: inline
In-Reply-To: <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com

On Wed, Sep 27, 2017 at 11:02:16PM -0500, Mario Limonciello wrote:
> For WMI operations that are only Set or Query read or write sysfs
> attributes created by WMI vendor drivers make sense.
> 
> For other WMI operations that are run on Method, there needs to be a
> way to guarantee to userspace that the results from the method call
> belong to the data request to the method call.  Sysfs attributes don't
> work well in this scenario because two userspace processes may be
> competing at reading/writing an attribute and step on each other's
> data.
> 
> When a WMI vendor driver declares a set of functions in a
> file_operations object the WMI bus driver will create a character
> device that maps to those file operations.
> 
> That character device will correspond to this path:
> /dev/wmi/$driver
> 
> This policy is selected as one driver may map and use multiple
> GUIDs and it would be better to only expose a single character
> device.
> 
> The WMI vendor drivers will be responsible for managing access to
> this character device and proper locking on it.
> 
> When a WMI vendor driver is unloaded the WMI bus driver will clean
> up the character device.

Ok, thanks to Darren, I've gone and dug these up while my boxes were
building stable kernels...

Why are you not just using the misc device interface here?  Why do you
need a whole new major and minor range?  Why not just register misc
devices dynamically as-needed?  Should be much simpler and easier to
maintain and reduce your code size a lot.

thanks,

greg k-h

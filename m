From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 4/8] platform/x86: wmi: create character devices when
 requested by drivers
Date: Fri, 29 Sep 2017 18:52:28 -0700
Message-ID: <20170930015228.GC13307@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39425 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752639AbdI3Bwd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2017 21:52:33 -0400
Content-Disposition: inline
In-Reply-To: <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rafael Wysocki <rjw@rjwysocki.net>, Matthew Garrett <mjg59@google.com>, Christoph Hellwig <hch@lst.de>


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
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/wmi.c | 98 +++++++++++++++++++++++++++++++++++++++++++---
>  include/linux/wmi.h        |  1 +
>  2 files changed, 94 insertions(+), 5 deletions(-)

+Greg, Rafael, Matthew, and Christoph

You each provided feedback regarding the method of exposing WMI methods
to userspace. This and subsequent patches from Mario lay some of the
core groundwork.

They implement an implicit whitelist as only drivers requesting the char
dev will see it created.

https://lkml.org/lkml/2017/9/28/8

-- 
Darren Hart
VMware Open Source Technology Center

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 4/8] platform/x86: wmi: create character devices when
 requested by drivers
Date: Mon, 2 Oct 2017 11:24:53 +0200
Message-ID: <20171002092453.GA23295@kroah.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <17fcf9748e83ede2751a00d8248cb32cbdc610d6.1506571188.git.mario.limonciello@dell.com>
 <20170930015228.GC13307@fury>
 <20170930081205.GA22980@kroah.com>
 <20171002005720.GA10424@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:47790 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750878AbdJBJYp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Oct 2017 05:24:45 -0400
Content-Disposition: inline
In-Reply-To: <20171002005720.GA10424@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, Rafael Wysocki <rjw@rjwysocki.net>, Matthew Garrett <mjg59@google.com>, Christoph Hellwig <hch@lst.de>

On Sun, Oct 01, 2017 at 05:57:20PM -0700, Darren Hart wrote:
> On Sat, Sep 30, 2017 at 10:12:05AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 29, 2017 at 06:52:28PM -0700, Darren Hart wrote:
> > > 
> > > On Wed, Sep 27, 2017 at 11:02:16PM -0500, Mario Limonciello wrote:
> > > > For WMI operations that are only Set or Query read or write sysfs
> > > > attributes created by WMI vendor drivers make sense.
> > > > 
> > > > For other WMI operations that are run on Method, there needs to be a
> > > > way to guarantee to userspace that the results from the method call
> > > > belong to the data request to the method call.  Sysfs attributes don't
> > > > work well in this scenario because two userspace processes may be
> > > > competing at reading/writing an attribute and step on each other's
> > > > data.
> > > > 
> > > > When a WMI vendor driver declares a set of functions in a
> > > > file_operations object the WMI bus driver will create a character
> > > > device that maps to those file operations.
> > > > 
> > > > That character device will correspond to this path:
> > > > /dev/wmi/$driver
> > > > 
> > > > This policy is selected as one driver may map and use multiple
> > > > GUIDs and it would be better to only expose a single character
> > > > device.
> > > > 
> > > > The WMI vendor drivers will be responsible for managing access to
> > > > this character device and proper locking on it.
> > > > 
> > > > When a WMI vendor driver is unloaded the WMI bus driver will clean
> > > > up the character device.
> > > > 
> > > > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > > > ---
> > > >  drivers/platform/x86/wmi.c | 98 +++++++++++++++++++++++++++++++++++++++++++---
> > > >  include/linux/wmi.h        |  1 +
> > > >  2 files changed, 94 insertions(+), 5 deletions(-)
> > > 
> > > +Greg, Rafael, Matthew, and Christoph
> > > 
> > > You each provided feedback regarding the method of exposing WMI methods
> > > to userspace. This and subsequent patches from Mario lay some of the
> > > core groundwork.
> > > 
> > > They implement an implicit whitelist as only drivers requesting the char
> > > dev will see it created.
> > > 
> > > https://lkml.org/lkml/2017/9/28/8
> > 
> > If you want patchs reviewed, it's best to actually cc: us on the patch
> > itself :(
> > 
> 
> Of course. I didn't send the series, but thought you should see it. I
> could have asked Mario to resend, but I thought a pointer would have
> made it easy enough to find in your lkml folder, and it would avoid
> splitting the conversation which resending would inevitably lead to. I
> pruned this one because Christoph gets upset if I don't.
> 
> We can wait for v4 I guess. And next time I want to get your take on
> something someone doesn't Cc you on, I'll just ask them to resend the
> whole series with you on Cc.

Dude, that's the way it's always been, you know this!  Nothing new here,
respining a patch series is normal, and asking people to review patch
sets that you know already needs to be changed is strange.  Just do the
fixes, and resend it, that's the simplest, quickest, and easiest thing
to do for everyone involved.

Asking someone to review a patch based on a url just doesn't work, as
how can I point out where the memory leak is exactly?  :)

Reviewers get thousands of emails a week (or a day in some cases), and
making it as easy as possible for them to review the code is the key
here.

thanks,

greg k-h

From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] Introduce Intel RAPL cooling device driver
Date: Fri, 5 Apr 2013 13:24:02 -0700
Message-ID: <20130405202402.GB3303@kroah.com>
References: <1364940936-20846-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <20130402230042.GA8713@kroah.com>
 <20130402163357.72dac902@chromoly>
 <20130402234805.GA11880@kroah.com>
 <20130402171714.7309cdf2@chromoly>
 <20130403163052.GB21969@kroah.com>
 <20130403110308.2bbcf7ec@chromoly>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:41161 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162685Ab3DEUYG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Apr 2013 16:24:06 -0400
Received: by mail-pa0-f46.google.com with SMTP id lb1so2230044pab.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Apr 2013 13:24:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130403110308.2bbcf7ec@chromoly>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Wed, Apr 03, 2013 at 11:03:08AM -0700, Jacob Pan wrote:
> On Wed, 3 Apr 2013 09:30:52 -0700
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Apr 02, 2013 at 05:17:14PM -0700, Jacob Pan wrote:
> > > On Tue, 2 Apr 2013 16:48:05 -0700
> > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > 
> > > > On Tue, Apr 02, 2013 at 04:33:57PM -0700, Jacob Pan wrote:
> > > > > On Tue, 2 Apr 2013 16:00:42 -0700
> > > > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > 
> > > > > > > +#include "intel_rapl.h"
> > > > > > > +#include "../../../fs/sysfs/sysfs.h"  
> > > > > > 
> > > > > > WTF?
> > > > > > 
> > > > > > Oh, that's a sure sign you are not doing something properly,
> > > > > > if you think it's ok to muck around with the internals of
> > > > > > sysfs.
> > > > > > 
> > > > > > There's a reason that file is "private", why do you think
> > > > > > it's ok to use it directly?  Did you just think that I
> > > > > > somehow "forgot" to put it in the proper include directory?
> > > > > I did feel unsure about this but i saw some precedence in the
> > > > > kernel.
> > > > 
> > > > Someone else is doing this with the sysfs api?  I don't see any
> > > > other code in Linus's tree doing this at the moment, where did
> > > > you see this? Let me know and I'll fix it up right away.
> > > > 
> > > no, i did not mean sysfs api. I mean include internal header files
> > > via #include ../../ 
> > > e.g.in drivers/usb/image/microtek.c
> > > 
> > > #include "../../scsi/scsi.h"
> > > #include <scsi/scsi_host.h>
> > 
> > That is because this is a scsi host driver.  Your code is not part of
> > sysfs itself.
> > 
> > > > > Anyway, I needed a way to validate a userspace file passed to
> > > > > rapl driver belong to the same sysfs directory. I will look for
> > > > > alternative ways.
> > > > 
> > > > What do you mean by this?  What exactly are you trying to do?  No
> > > > normal driver code should _ever_ call sysfs functions directly,
> > > > nor should they ever care about sysfs internals.
> > > > 
> > > i did not call sysfs internal calls, just need to use 
> > > struct sysfs_dirent {}
> > > 
> > > to do the following sanity check against user passed event control
> > > file, it is still not a 100% strong check. 
> > > 	/* check if the cfile belongs to the same rapl domain */
> > > 	if (strcmp(rd->kobj.sd->s_name,
> > > 			cfile->f_dentry->d_parent->d_name.name)) {
> > > 		pr_debug("cfile does not belong to domain %s\n",
> > > 			rd->kobj.sd->s_name);
> > > 		ret = -EINVAL;
> > > 		goto exit_cleanup_fds;
> > > 	}
> > 
> > This made it through a code review at Intel?  Seriously?  Come on,
> > there's just so much wrong here, I don't know where to begin.
> > 
> > Hint, if you find yourself caring about the internals of sysfs in a
> > device driver, you are doing something so wrong it's not funny.  Do
> > you see _any_ other driver doing anything like this?  What makes this
> > driver so special that it can do unexpected, and totally different
> > things with sysfs?
> > 
> I admit that my knowledge in this area are limited. I appreciate your
> help and straightforward comments.
> 
> Perhaps the reason is that not many drivers use eventfd and its way to
> arm event thresholds.

sysfs should not be using eventfs, that's the issue here.  Don't do
that, sysfs has other apis to do this type of thing, if you somehow
think it is something that you really need to do (hint, I doubt it...)

greg k-h

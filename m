From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 2 Apr 2013 16:04:35 -0700
Message-ID: <20130402230435.GA9462@kroah.com>
References: <1364940936-20846-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
 <515B51F7.6070901@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-da0-f51.google.com ([209.85.210.51]:43182 "EHLO
	mail-da0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758396Ab3DBXEi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Apr 2013 19:04:38 -0400
Received: by mail-da0-f51.google.com with SMTP id g27so386431dan.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Apr 2013 16:04:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <515B51F7.6070901@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, Apr 02, 2013 at 02:47:35PM -0700, Randy Dunlap wrote:
> On 04/02/13 15:15, Jacob Pan wrote:
> > diff --git a/drivers/platform/x86/intel_rapl.c b/drivers/platform/x86/intel_rapl.c
> > new file mode 100644
> > index 0000000..56ee928
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_rapl.c
> > @@ -0,0 +1,1323 @@
> > +/*
> > + *  intel_rapl.c - Intel Running Average Power Limit Driver for MSR based
> > + *                 RAPL interface
> > + *
> > + *  Copyright (c) 2013, Intel Corporation.
> > + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +#include <linux/sysfs.h>
> > +
> 
> > +#include "../../../fs/sysfs/sysfs.h"
> 
> 
> What does this driver need from ^^^^^^ that file, which says:
> 
>  * fs/sysfs/sysfs.h - sysfs internal header file
> 
> and should that be moved to include/linux/sysfs.h ?

See my other complain about this already, I beat you to it :)

greg k-h

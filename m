From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/12] x86/platform/uv: Update UV MMRs for UV5
Date: Tue, 8 Sep 2020 17:44:30 +0200
Message-ID: <20200908154430.GA4171853@kroah.com>
References: <20200907185430.363197758@hpe.com>
 <20200907185430.782245884@hpe.com>
 <20200908152314.GD4114051@kroah.com>
 <3e93b858-f74d-8e93-e444-fd85fc5856e4@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3e93b858-f74d-8e93-e444-fd85fc5856e4@hpe.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Travis <mike.travis@hpe.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 08, 2020 at 08:35:37AM -0700, Mike Travis wrote:
> 
> 
> On 9/8/2020 8:23 AM, Greg KH wrote:
> > On Mon, Sep 07, 2020 at 01:54:34PM -0500, Mike Travis wrote:
> > > --- linux.orig/drivers/misc/sgi-gru/grufile.c
> > > +++ linux/drivers/misc/sgi-gru/grufile.c
> > > @@ -7,7 +7,8 @@
> > >    * This file supports the user system call for file open, close, mmap, etc.
> > >    * This also incudes the driver initialization code.
> > >    *
> > > - *  Copyright (c) 2008-2014 Silicon Graphics, Inc.  All Rights Reserved.
> > > + * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
> > > + * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.
> > 
> > Please drop all copyright changes from this series, as these do not look
> > correct at all, sorry.
> > 
> > You can send an add-on patch for all of that if it's really necessary,
> > and you get legal approval for it :)
> 
> I can move them all to a single patch.  The HPE one is straight from their
> guidance on Copyrights.  The older SGI one is also from SGI's guidance
> though I'm not sure if I can find it anymore.  I also wasn't sure if it
> should be retained since the HPE one didn't take effect until SGI was
> legally part of HPE (circa 2018).  2017/18 was also the last time we did
> this big a change (for the UV4A).

If you haven't touched a file in a year, you don't get to claim
copyright on that year.  If you wish to disagree on this, great, I'll
gladly take a patch that modifies the lines that has a signed-off-by
from one of your lawyers for it :)

thanks,

greg k-h

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: fix rfkill functionality
Date: Wed, 3 Apr 2019 15:03:58 -0700
Message-ID: <20190403220358.GD39081@wrath>
References: <1553696734-31282-1-git-send-email-mario.limonciello@dell.com>
 <20190403202338.GB39081@wrath>
 <643bcf131bc642cb821ba57f69707fc9@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <643bcf131bc642cb821ba57f69707fc9@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Apr 03, 2019 at 09:54:27PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart <dvhart@infradead.org>
> > Sent: Wednesday, April 3, 2019 3:24 PM
> > To: Limonciello, Mario
> > Cc: Andy Shevchenko; LKML; platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH] platform/x86: dell-laptop: fix rfkill functionality
> > 
> > 
> > [EXTERNAL EMAIL]
> > 
> > On Wed, Mar 27, 2019 at 09:25:34AM -0500, Mario Limonciello wrote:
> > > When converting the driver two arguments were transposed leading
> > > to rfkill not working.
> > >
> > > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=201427
> > > Reported-by: Pepijn de Vos <pepijndevos@gmail.com>
> > > Fixes: 549b49 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
> > > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > > Acked-by: Pali Rohár <pali.rohar@gmail.com>
> > 
> > Looks like this broken in 4.14? So Cc stable back to then? I'm surprised it's
> > been broken that long :-(
> > 
> 
> Not many "newer" platforms actually use this radio control anymore.  It's been
> superseded by other technologies.  So I think that would be the main reason.
> 
> Can you CC it to stable when it's committed or do I need to re-send or anything?
> 

I will add the Cc to stable. Just wanted to confirm our expectations were
aligned.

-- 
Darren Hart
VMware Open Source Technology Center

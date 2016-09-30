From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 17/26] intel_telemetry_debugfs: constify local structures
Date: Thu, 29 Sep 2016 17:07:50 -0700
Message-ID: <20160930000750.GB24642@f23x64.localdomain>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
 <1473599168-30561-18-git-send-email-Julia.Lawall@lip6.fr>
 <20160928235235.GD7630@f23x64.localdomain>
 <alpine.DEB.2.10.1609290716550.3288@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1609290716550.3288@hadrien>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, joe@perches.com, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 29, 2016 at 07:19:21AM +0200, Julia Lawall wrote:
> 
> 
> On Wed, 28 Sep 2016, Darren Hart wrote:
> 
> > On Sun, Sep 11, 2016 at 03:05:59PM +0200, Julia Lawall wrote:
> >
> > Hi Julia,
> >
> > > For structure types defined in the same file or local header files, find
> > > top-level static structure declarations that have the following
> > > properties:
> > > 1. Never reassigned.
> > > 2. Address never taken
> >
> > Hrm. telem_apl_debugfs_conf is passed to the TELEM_DEBUGFS_CPU macro as the
> > second argument "data":
> >
> > #define TELEM_DEBUGFS_CPU(model, data) \
> > 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
> >
> > And the address is taken, and later assigned to the debugfs_conf pointer.
> >
> > The usage still seems OK, but did I misunderstand the conditions?
> 
> OK, this is definitely a weakness of the script and my methodology for
> checking the results.  There was already a case of a cast that I have
> fixed up my script for, but this one is worse because it's under a macro.
> I can look into whether the cast can be changed to add a const, but for
> the time being, I think you should just drop this patch.
> 

Done! :-)

> Thanks for the careful review.
> 

Sure thing, thanks for all your work with cocci.
-- 
Darren Hart
Intel Open Source Technology Center

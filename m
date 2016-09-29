From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 17/26] intel_telemetry_debugfs: constify local
 structures
Date: Thu, 29 Sep 2016 07:19:21 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1609290716550.3288@hadrien>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr> <1473599168-30561-18-git-send-email-Julia.Lawall@lip6.fr> <20160928235235.GD7630@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20160928235235.GD7630@f23x64.localdomain>
Sender: kernel-janitors-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, joe@perches.com, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On Wed, 28 Sep 2016, Darren Hart wrote:

> On Sun, Sep 11, 2016 at 03:05:59PM +0200, Julia Lawall wrote:
>
> Hi Julia,
>
> > For structure types defined in the same file or local header files, find
> > top-level static structure declarations that have the following
> > properties:
> > 1. Never reassigned.
> > 2. Address never taken
>
> Hrm. telem_apl_debugfs_conf is passed to the TELEM_DEBUGFS_CPU macro as the
> second argument "data":
>
> #define TELEM_DEBUGFS_CPU(model, data) \
> 	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
>
> And the address is taken, and later assigned to the debugfs_conf pointer.
>
> The usage still seems OK, but did I misunderstand the conditions?

OK, this is definitely a weakness of the script and my methodology for
checking the results.  There was already a case of a cast that I have
fixed up my script for, but this one is worse because it's under a macro.
I can look into whether the cast can be changed to add a const, but for
the time being, I think you should just drop this patch.

Thanks for the careful review.

julia

>
>
> > 3. Not passed to a top-level macro call
> > 4. No pointer or array-typed field passed to a function or stored in a
> > variable.
> > Declare structures having all of these properties as const.
> >
> > Done using Coccinelle.
> > Based on a suggestion by Joe Perches <joe@perches.com>.
>
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> > The semantic patch seems too long for a commit log, but is in the cover
> > letter.
> >
> >  drivers/platform/x86/intel_telemetry_debugfs.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
> > index ef29f18..d0761f3 100644
> > --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> > +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> > @@ -297,7 +297,7 @@ struct telemetry_debugfs_conf {
> >
> >  static struct telemetry_debugfs_conf *debugfs_conf;
> >
> > -static struct telemetry_debugfs_conf telem_apl_debugfs_conf = {
> > +static const struct telemetry_debugfs_conf telem_apl_debugfs_conf = {
> >  	.pss_idle_data = telem_apl_pss_idle_data,
> >  	.pcs_idle_blkd_data = telem_apl_pcs_idle_blkd_data,
> >  	.pcs_s0ix_blkd_data = telem_apl_pcs_s0ix_blkd_data,
> >
> >
>
> --
> Darren Hart
> Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

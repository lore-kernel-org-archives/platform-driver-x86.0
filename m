From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: update debug message
 logged by call_fext_func()
Date: Fri, 7 Apr 2017 10:51:07 -0700
Message-ID: <20170407175107.GA2229@fury>
References: <20170406064610.13984-1-kernel@kempniu.pl>
 <20170407114019.GA15240@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35377 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932905AbdDGRvL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 13:51:11 -0400
Content-Disposition: inline
In-Reply-To: <20170407114019.GA15240@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 07, 2017 at 09:10:19PM +0930, Jonathan Woithe wrote:
> On Thu, Apr 06, 2017 at 08:46:10AM +0200, Micha?? K??pie?? wrote:
> > Update debug message logged when the acpi_evaluate_integer() call inside
> > call_fext_func() fails so that it covers a broader set of possible
> > errors.
> > 
> > Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> > ---
> > This patch is a follow-up to v1 of the call_fext_func() cleanup series
> > and as such, it should be applied to for-next.
> > 
> >  drivers/platform/x86/fujitsu-laptop.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > index 26149f58dba7..928778ccc4c1 100644
> > --- a/drivers/platform/x86/fujitsu-laptop.c
> > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > @@ -232,7 +232,7 @@ static int call_fext_func(int func, int op, int feature, int state)
> >  	status = acpi_evaluate_integer(fujitsu_laptop->acpi_handle, "FUNC",
> >  				       &arg_list, &value);
> >  	if (ACPI_FAILURE(status)) {
> > -		vdbg_printk(FUJLAPTOP_DBG_ERROR, "FUNC interface is not present\n");
> > +		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate FUNC\n");
> >  		return -ENODEV;
> >  	}
> 
> As per discussions on the list, this change is fine, is consistent with the
> generic nature of possible failure modes and makes sense in the context of
> the other recent changes.
> 
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Queued to testing, thanks.

-- 
Darren Hart
VMware Open Source Technology Center

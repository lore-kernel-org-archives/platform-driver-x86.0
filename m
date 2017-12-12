From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-wmi: check for kmalloc() errors
Date: Mon, 11 Dec 2017 16:35:39 -0800
Message-ID: <20171212003539.GE27831@fury>
References: <20171211105427.ed6wmdsz2s4xxfht@mwanda>
 <ed9fa3c8c5bc45f58ff6844e628791a2@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42479 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751379AbdLLAfq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Dec 2017 19:35:46 -0500
Content-Disposition: inline
In-Reply-To: <ed9fa3c8c5bc45f58ff6844e628791a2@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dan.carpenter@oracle.com, mjg59@srcf.ucam.org, pali.rohar@gmail.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 11, 2017 at 02:58:28PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > Sent: Monday, December 11, 2017 4:54 AM
> > To: Matthew Garrett <mjg59@srcf.ucam.org>; Limonciello, Mario
> > <Mario_Limonciello@Dell.com>
> > Cc: Pali Rohár <pali.rohar@gmail.com>; Darren Hart <dvhart@infradead.org>;
> > Andy Shevchenko <andy@infradead.org>; platform-driver-x86@vger.kernel.org;
> > kernel-janitors@vger.kernel.org
> > Subject: [PATCH] platform/x86: dell-wmi: check for kmalloc() errors
> > 
> > This allocation won't fail in the current kernel because it's small but
> > not checking for kmalloc() failures introduces static checker warnings
> > so let's fix it.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> > index 39d2f4518483..fb25b20df316 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -639,6 +639,8 @@ static int dell_wmi_events_set_enabled(bool enable)
> >  	int ret;
> > 
> >  	buffer = kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL);
> > +	if (!buffer)
> > +		return -ENOMEM;
> >  	buffer->cmd_class = CLASS_INFO;
> >  	buffer->cmd_select = SELECT_APP_REGISTRATION;
> >  	buffer->input[0] = 0x10000;
> 
> Thanks for that.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>

Queued for testing, and I'll pull it back to fixes for rc3/4 as well.

-- 
Darren Hart
VMware Open Source Technology Center

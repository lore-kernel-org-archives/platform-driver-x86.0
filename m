From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 4/4] platform/x86: wmi: Fix check for method instance
 number
Date: Thu, 17 Aug 2017 23:13:19 +0200
Message-ID: <20170817211319.GA20526@pali>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
 <1502523858-25716-5-git-send-email-pali.rohar@gmail.com>
 <20170817152431.GA19276@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33631 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752609AbdHQVN2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Aug 2017 17:13:28 -0400
Content-Disposition: inline
In-Reply-To: <20170817152431.GA19276@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 17 August 2017 08:24:31 Darren Hart wrote:
> On Sat, Aug 12, 2017 at 09:44:18AM +0200, Pali Rohár wrote:
> > instance_count defines number of instances of data block and instance
> > itself is indexed from zero, which means first instance has number 0.
> > Therefore check for invalid instance should be non-strict inequality.
> > 
> > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> 
> This is correct per the WMI specification. Pali, now that Andy has
> applied 1-3 of this series, is that all the required driver updates?

Hmmm... I have not understood your question.

I checked that all drivers which uses instance id 1 have comment
explaining why is id 1 used.

Problematic drivers without comment have either patch to use instance id
0 in this series or somebody else already supplied patch which is part
of linus tree.

> Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>
> 
> 
> > ---
> >  drivers/platform/x86/wmi.c |    6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> > index e32ba57..0765b17 100644
> > --- a/drivers/platform/x86/wmi.c
> > +++ b/drivers/platform/x86/wmi.c
> > @@ -218,7 +218,7 @@ acpi_status wmi_evaluate_method(const char *guid_string, u8 instance,
> >  	if (!(block->flags & ACPI_WMI_METHOD))
> >  		return AE_BAD_DATA;
> >  
> > -	if (block->instance_count < instance)
> > +	if (block->instance_count <= instance)
> >  		return AE_BAD_PARAMETER;
> >  
> >  	input.count = 2;
> > @@ -265,7 +265,7 @@ static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
> >  	block = &wblock->gblock;
> >  	handle = wblock->acpi_device->handle;
> >  
> > -	if (block->instance_count < instance)
> > +	if (block->instance_count <= instance)
> >  		return AE_BAD_PARAMETER;
> >  
> >  	/* Check GUID is a data block */
> > @@ -392,7 +392,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 instance,
> >  	block = &wblock->gblock;
> >  	handle = wblock->acpi_device->handle;
> >  
> > -	if (block->instance_count < instance)
> > +	if (block->instance_count <= instance)
> >  		return AE_BAD_PARAMETER;
> >  
> >  	/* Check GUID is a data block */
> > -- 
> > 1.7.9.5
> > 
> > 
> 

-- 
Pali Rohár
pali.rohar@gmail.com

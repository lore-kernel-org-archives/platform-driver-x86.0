From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] fujitsu-laptop: remove unnecessary input_free_device
Date: Sun, 4 Jul 2010 01:37:42 -0700
Message-ID: <20100704083742.GF32427@core.coreip.homeip.net>
References: <1278055248.12339.5.camel@mola>
 <201007020735.o627Z2E1025678@mercury.physics.adelaide.edu.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:32948 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755847Ab0GDIhr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 4 Jul 2010 04:37:47 -0400
Content-Disposition: inline
In-Reply-To: <201007020735.o627Z2E1025678@mercury.physics.adelaide.edu.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Cc: Axel Lin <axel.lin@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, platform-driver-x86@vger.kernel.org

On Fri, Jul 02, 2010 at 05:05:02PM +0930, Jonathan Woithe wrote:
> Acked-by: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>

Looks good to me too.

Acked-by: Dmitry Torokhov <dtor@mail.ru>

>  
> > input_free_device should only be used if input_register_device()
> > was not called yet or if it failed.
> > This patch removes unnecessary input_free_device calls.
> > 
> > Signed-off-by: Axel Lin <axel.lin@gmail.com>
> > ---
> >  drivers/platform/x86/fujitsu-laptop.c |    6 ++----
> >  1 files changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > index e325aeb..4346d26 100644
> > --- a/drivers/platform/x86/fujitsu-laptop.c
> > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > @@ -725,6 +725,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
> >  
> >  err_unregister_input_dev:
> >  	input_unregister_device(input);
> > +	input = NULL;
> >  err_free_input_dev:
> >  	input_free_device(input);
> >  err_stop:
> > @@ -738,8 +739,6 @@ static int acpi_fujitsu_remove(struct acpi_device *device, int type)
> >  
> >  	input_unregister_device(input);
> >  
> > -	input_free_device(input);
> > -
> >  	fujitsu->acpi_handle = NULL;
> >  
> >  	return 0;
> > @@ -930,6 +929,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
> >  
> >  err_unregister_input_dev:
> >  	input_unregister_device(input);
> > +	input = NULL;
> >  err_free_input_dev:
> >  	input_free_device(input);
> >  err_free_fifo:
> > @@ -953,8 +953,6 @@ static int acpi_fujitsu_hotkey_remove(struct acpi_device *device, int type)
> >  
> >  	input_unregister_device(input);
> >  
> > -	input_free_device(input);
> > -
> >  	kfifo_free(&fujitsu_hotkey->fifo);
> >  
> >  	fujitsu_hotkey->acpi_handle = NULL;
> > -- 
> > 1.5.4.3
> > 
> > 
> > 
> 
> 
> -- 
> * Jonathan Woithe    jwoithe@physics.adelaide.edu.au                        *
> *                    http://www.physics.adelaide.edu.au/~jwoithe            *
> ***-----------------------------------------------------------------------***
> ** "Time is an illusion; lunchtime doubly so"                              **
> *  "...you wouldn't recognize a subtle plan if it painted itself purple and *
> *   danced naked on a harpsichord singing 'subtle plans are here again'"    *
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Dmitry

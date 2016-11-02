From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: setup accelerometer when machine has
 appropriate notify event
Date: Wed, 2 Nov 2016 15:30:47 +0800
Message-ID: <20161102073047.GD18823@linux-rxt1.site>
References: <1477974812-12657-1-git-send-email-jlee@suse.com>
 <20161101172851.GA4494@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:53242 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750720AbcKBHa7 (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Wed, 2 Nov 2016 03:30:59 -0400
Content-Disposition: inline
In-Reply-To: <20161101172851.GA4494@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Darren,

Thanks for your review!

On Tue, Nov 01, 2016 at 10:28:51AM -0700, Darren Hart wrote:
> On Tue, Nov 01, 2016 at 12:33:32PM +0800, Lee, Chun-Yi wrote:
> > The accelerometer event relies on on the ACERWMID_EVENT_GUID notify.
> > So, this patch changes the codes to setup accelerometer input device
> > when detected ACERWMID_EVENT_GUID. It avoids that the accel input
> > device created on every acer machines.
> > 
> > In addition, patch adds a clearly parsing logic of accelerometer hid
> > to acer_wmi_get_handle_cb callback function. It is positive matching
> > the "SENR" name with "BST0001" device to avoid non-supported hardware.
> > 
> > Reported-by: Bjørn Mork <bjorn@mork.no>
> > Tested-by: Bjørn Mork <bjorn@mork.no>
> > Cc: Darren Hart <dvhart@infradead.org>
> > Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> > ---
> >  drivers/platform/x86/acer-wmi.c | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> > index 79d64ea..3bb3162 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -1808,11 +1808,24 @@ static int __init acer_wmi_enable_lm(void)
> >  	return status;
> >  }
> >  
> > +#define ACER_WMID_ACCEL_HID	"BST0001"
> > +
> >  static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
> >  						void *ctx, void **retval)
> >  {
> > +	struct acpi_device *dev;
> > +
> > +	if (strcmp(ctx, "SENR")) {

Here must be "if (!strcmp(ctx, "SENR"))", it's my mistake.
I will send v2 patch.

> > +		if (acpi_bus_get_device(ah, &dev))
> > +			return AE_OK;
> > +		if (!strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
> > +			return AE_OK;
> > +	} else
> > +		return AE_OK;
> > +
> >  	*(acpi_handle *)retval = ah;
> > -	return AE_OK;
> > +
> > +	return AE_CTRL_TERMINATE;
> 
> I don't understand this change. Previously, we assigned retval to ah and
> returned AE_OK. Now, we either do not assign retval and still return AE_OK, or
> we do assign it and then return AE_CTRL_TERMINATE....
> 
> I would have expected to see something more like:
> 
> 	if (we should setup the accelerometer)
> 		reval = ah
> 		return AE_OK
> 	
> 	return AE_CTRL_TERMINATE
> 
> If I'm misunderstanding this, can you please try to explain - a comment in the
> function would be useful.
> 
> Thanks,
>

Base on the function name "acer_wmi_get_handle_cb", it will be a generic
callback function for any caller who uses acer_wmi_get_handle(). And
acer_wmi_get_handle() uses acpi_get_devices(), the acpi_get_devices() allows
that HID is NULL. So that's better to check the context name and HID in callback.

Like this (after my mistake got fixed):

 static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
                                                void *ctx, void **retval)
 {
+       struct acpi_device *dev;
+
	/* if context is "SENR", then make sure that HID matches with BST0001 */
+       if (!strcmp(ctx, "SENR")) {
+               if (acpi_bus_get_device(ah, &dev))
+                       return AE_OK;
		/* if HID doesn't match then skip this device to next */
+               if (!strcmp(ACER_WMID_ACCEL_HID, acpi_device_hid(dev)))
+                       return AE_OK;
	/* if this device do not match any context, then just skip it to next */
+       } else
+               return AE_OK;
+
	/* if match with context and HID, then return handler */
        *(acpi_handle *)retval = ah;
-       return AE_OK;
+
	/* return AE_CTRL_TERMINATE to exit acpi_ns_walk_namespace() because we found handler */
+       return AE_CTRL_TERMINATE;
 }


Thanks a lot!
Joey Lee

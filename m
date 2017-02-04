From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][V2] intel-hid: support 5 array button
Date: Sat, 4 Feb 2017 02:26:05 +0100
Message-ID: <20170204012605.GA43075@f23x64.localdomain>
References: <1485415981-20487-1-git-send-email-alex.hung@canonical.com>
 <20170204011439.GD38511@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49234 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752944AbdBDB0H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Feb 2017 20:26:07 -0500
Content-Disposition: inline
In-Reply-To: <20170204011439.GD38511@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>

Apologies, this time with Pali's correct email address (aliases fail).

> 
> On Thu, Jan 26, 2017 at 03:33:01PM +0800, Alex Hung wrote:
> > New firmwares include a feature called 5 button array that supports
> > super key, volume up/down, rotation lock and power button. Especially,
> > support for this feature is required to fix power button on some recent
> > systems.
> > 
> > This patch was tested on a Dell Latitude 7280.
> 
> 
> Hi Alex,
> 
> Minor nit below (no need to resend, but a pair of follow-up cleanups would be
> nice).
> 
> Queued to testing.
> 
> > 
> > Signed-off-by: Alex Hung <alex.hung@canonical.com>
> 
> Pali, would you care to offer a review or some testing to verify no unexpected
> conflicts with the other dell drivers?
> 
> > ---
> >  drivers/platform/x86/intel-hid.c | 107 +++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 102 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> > index cb3ab2b..6e796a5 100644
> > --- a/drivers/platform/x86/intel-hid.c
> > +++ b/drivers/platform/x86/intel-hid.c
> > @@ -1,5 +1,5 @@
> >  /*
> > - *  Intel HID event driver for Windows 8
> > + *  Intel HID event & 5 button array driver
> >   *
> >   *  Copyright (C) 2015 Alex Hung <alex.hung@canonical.com>
> >   *  Copyright (C) 2015 Andrew Lutomirski <luto@kernel.org>
> > @@ -57,8 +57,24 @@ static const struct key_entry intel_hid_keymap[] = {
> >  	{ KE_END },
> >  };
> >  
> > +/* 5 button array notification value. */
> > +static const struct key_entry intel_array_keymap[] = {
> > +	{ KE_KEY,    0xC2, { KEY_LEFTMETA} },                /* Press */
> > +	{ KE_IGNORE, 0xC3, { KEY_LEFTMETA} },                /* Release */
> > +	{ KE_KEY,    0xC4, { KEY_VOLUMEUP} },                /* Press */
> > +	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP} },                /* Release */
> > +	{ KE_KEY,    0xC6, { KEY_VOLUMEDOWN} },              /* Press */
> > +	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN} },	             /* Release */
> > +	{ KE_SW,     0xC8, { .sw = {SW_ROTATE_LOCK, 1} } },   /* Press */
> > +	{ KE_SW,     0xC9, { .sw = {SW_ROTATE_LOCK, 0} } },   /* Release */
> > +	{ KE_KEY,    0xCE, { KEY_POWER} },                   /* Press */
> > +	{ KE_IGNORE, 0xCF, { KEY_POWER} },                   /* Release */
> > +	{ KE_END },
> > +};
> > +
> >  struct intel_hid_priv {
> >  	struct input_dev *input_dev;
> > +	struct input_dev *array;
> >  };
> >  
> >  static int intel_hid_set_enable(struct device *device, int enable)
> > @@ -78,15 +94,43 @@ static int intel_hid_set_enable(struct device *device, int enable)
> >  	return 0;
> >  }
> >  
> > +static void intel_button_array_enable(struct device *device, int enable)
> > +{
> 
> As enable is always explicitly passed and is used solely as a boolean value, it
> would preferable for both this and the previous usage above to define it as a
> bool. Being self-consistent is important however, so please consider this for a
> cleanup as a separate patch.
> 
> > +	struct intel_hid_priv *priv = dev_get_drvdata(device);
> > +	acpi_handle handle = ACPI_HANDLE(device);
> > +	unsigned long long button_cap;
> > +	acpi_status status;
> > +
> > +	if (!priv->array)
> > +		return;
> > +
> > +	/* Query supported platform features */
> > +	status = acpi_evaluate_integer(handle, "BTNC", NULL, &button_cap);
> > +	if (ACPI_FAILURE(status)) {
> > +		dev_warn(device, "failed to get button capability\n");
> > +		return;
> > +	}
> > +
> > +	/* Enable|disable features - power button is always enabled */
> > +	status = acpi_execute_simple_method(handle, "BTNE",
> > +					    enable ? button_cap : 1);
> > +	if (ACPI_FAILURE(status))
> > +		dev_warn(device, "failed to set button capability\n");
> > +}
> > +
> >  static int intel_hid_pl_suspend_handler(struct device *device)
> >  {
> >  	intel_hid_set_enable(device, 0);
> > +	intel_button_array_enable(device, 0);
> > +
> >  	return 0;
> >  }
> >  
> >  static int intel_hid_pl_resume_handler(struct device *device)
> >  {
> >  	intel_hid_set_enable(device, 1);
> > +	intel_button_array_enable(device, 1);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -126,11 +170,43 @@ static int intel_hid_input_setup(struct platform_device *device)
> >  	return ret;
> >  }
> >  
> > +static int intel_button_array_input_setup(struct platform_device *device)
> > +{
> > +	struct intel_hid_priv *priv = dev_get_drvdata(&device->dev);
> > +	int ret;
> > +
> > +	/* Setup input device for 5 button array */
> > +	priv->array = input_allocate_device();
> > +	if (!priv->array)
> > +		return -ENOMEM;
> > +
> > +	ret = sparse_keymap_setup(priv->array, intel_array_keymap, NULL);
> > +	if (ret)
> > +		goto err_free_array_device;
> > +
> > +	priv->array->dev.parent = &device->dev;
> > +	priv->array->name = "Intel HID 5 button array";
> > +	priv->array->id.bustype = BUS_HOST;
> > +
> > +	ret = input_register_device(priv->array);
> > +	if (ret)
> > +		goto err_free_array_device;
> > +
> > +	return 0;
> > +
> > +err_free_array_device:
> > +	input_free_device(priv->array);
> > +	return ret;
> 
> This return path is more complex than it could be, since you test for ret before
> return anyway:
> 
>  out:
>  if (ret)
> 	 input_free_device(priv->array);
>  return ret;
> 
> There is no need for a second return point that I can see. Same for the
> hid_input_setup function. We can remove 8 lines.
> 
> This follows the previous nit - it's self consistent, but a follow-on cleanup
> patch would be worthwhile.
> 
> Thanks Alex, I've queued this to testing and it will go to for-next unless the
> CI, Pali, or a user reports a problem. Appreciate all your effort on this one.
> 
> -- 
> Darren Hart
> Intel Open Source Technology Center

-- 
Darren Hart
Intel Open Source Technology Center

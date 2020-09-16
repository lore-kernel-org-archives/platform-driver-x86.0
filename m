From: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH v2] platform/x86: Add Driver to set up lid GPEs on MS
 Surface device
Date: Wed, 16 Sep 2020 03:22:32 +0200
Message-ID: <355dae14-2508-706b-53f8-48b78f84e7cc@gmail.com>
References: <20200910211520.1490626-1-luzmaximilian@gmail.com>
 <EMZQgUl1xLN4o0hV9ZkCD563O85SuOYB5kNFZ5_hlxLQXbJCXpQfrM2afyFIr28h31tXMxD1mxE4DkA5Wy60A0Z2mDnstwF17tEdnX4IRas=@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <EMZQgUl1xLN4o0hV9ZkCD563O85SuOYB5kNFZ5_hlxLQXbJCXpQfrM2afyFIr28h31tXMxD1mxE4DkA5Wy60A0Z2mDnstwF17tEdnX4IRas=@protonmail.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 9/16/20 1:58 AM, Barnabás Pőcze wrote:
> Hi
> 
> 
>> [...]
>> +static int surface_lid_enable_wakeup(struct device *dev, bool enable)
>> +{
>> +	const struct surface_lid_device *lid = dev_get_drvdata(dev);
>> +	int action = enable ? ACPI_GPE_ENABLE : ACPI_GPE_DISABLE;
>> +	acpi_status status;
>> +
>> +	status = acpi_set_gpe_wake_mask(NULL, lid->gpe_number, action);
>> +	if (status) {
> 
> I think 'if (ACPI_FAILURE(status))' would be better.

Okay, I'll change that (here and below).

>> +		dev_err(dev, "failed to set GPE wake mask: %d\n", status);
> 
> I'm not sure if it's technically safe to print acpi_status with the %d format
> specifier since 'acpi_status' is defined as 'u32' at the moment.
>   func("%lu", (unsigned long) status)
> would be safer. You could also use 'acpi_format_exception()', which is possibly
> the most correct approach since it assumes nothing about what 'acpi_status'
> actually is.

I wasn't aware of acpi_format_exception(). That looks like a good thing
to do here, thanks!
  
> 
>> +		return -EINVAL;
> 
> I'm not sure if -EINVAL is the best error to return here.

I'd argue that if this fails, it's most likely due to the GPE number
being invalid (which I'd argue is an input), although I'm open for
suggestions. Same reasoning for the -EINVALs below.

> 
>> +	}
>> +
>> +	return 0;
>> +}
>> [...]
>> +static int surface_gpe_probe(struct platform_device *pdev)
>> +{
>> +	struct surface_lid_device *lid;
>> +	u32 gpe_number;
>> +	int status;
>> +
>> +	status = device_property_read_u32(&pdev->dev, "gpe", &gpe_number);
>> +	if (status)
>> +		return -ENODEV;
> 
> 'device_property_read_u32()' returns an error code, you could simply return that
> instead of hiding it.

My thought there was that if the "gpe" property isn't present or of a
different type, this is not a device that we want to/can handle. Thus
the -ENODEV. Although I think a debug print statement may be useful
here.

>> +
>> +	status = acpi_mark_gpe_for_wake(NULL, gpe_number);
>> +	if (status) {
>> +		dev_err(&pdev->dev, "failed to mark GPE for wake: %d\n", status);
>> +		return -EINVAL;
>> +	}
>> +
>> +	status = acpi_enable_gpe(NULL, gpe_number);
>> +	if (status) {
>> +		dev_err(&pdev->dev, "failed to enable GPE: %d\n", status);
>> +		return -EINVAL;
>> +	}
> 
> My previous comments about ACPI and the returned value apply here as well.
> Furthermore, 'acpi_mark_gpe_for_wake()' and 'acpi_enable_gpe()' both return
> a value of type 'acpi_status', not 'int'.

Noted, I'll use acpi_status and acpi_format_exception(). See my
reasoning above for the -EINVAL. Again, I'm open for suggestions on
better values here.

>> +
>> +	lid = devm_kzalloc(&pdev->dev, sizeof(struct surface_lid_device),
>> +			   GFP_KERNEL);
> 
>   lid = devm_kzalloc(..., sizeof(*lid), ...)
> is preferred.

Okay, I'll change that.

>> +	if (!lid)
>> +		return -ENOMEM;
> 
> Isn't that problematic that the side effects of the previous two ACPI calls are
> not undone when returning here with -ENOMEM? Allocating this struct right after
> querying 'gpe_number' could prevent it.

Yes, I think switching those would be cleaner. Also yes, the
acpi_enable_gpe() call is missing a acpi_disable_gpe() here, thanks! I'm
not aware of any counter-part to acpi_mark_gpe_for_wake(), but I think
the side-effects of that are fairly negligible when the GPE is disabled.

>> +
>> +	lid->gpe_number = gpe_number;
>> +	platform_set_drvdata(pdev, lid);
>> +
>> +	status = surface_lid_enable_wakeup(&pdev->dev, false);
>> +	if (status) {
>> +		acpi_disable_gpe(NULL, gpe_number);
>> +		platform_set_drvdata(pdev, NULL);
> 
> Why is 'platform_set_drvdata(pdev, NULL)' needed?

Is this not required for clean-up once the driver data has been set? Or
does the driver-base take care of that for us when the driver is
removed/fails to probe? My reasoning was that I don't want to leave
stuff around for any other driver to trip on (and rather have that
driver oops on a NULL-pointer). If the driver-core already takes care of
NULL-ing that, that line is not needed. Unfortunately that behavior
doesn't seem to be explained in the documentation.

>> +		return status;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int surface_gpe_remove(struct platform_device *pdev)
>> +{
>> +	struct surface_lid_device *lid = dev_get_drvdata(&pdev->dev);
>> +
>> +	/* restore default behavior without this module */
>> +	surface_lid_enable_wakeup(&pdev->dev, false);
>> +	acpi_disable_gpe(NULL, lid->gpe_number);
>> +
>> +	platform_set_drvdata(pdev, NULL);
> 
> I'm wondering why this is needed?

See my question above.

>> +	return 0;
>> +}
>> [...]
>> +static int __init surface_gpe_init(void)
>> +{
>> +	const struct dmi_system_id *match;
>> +	const struct property_entry *props;
>> +	struct platform_device *pdev;
>> +	struct fwnode_handle *fwnode;
>> +	int status;
>> +
>> +	match = dmi_first_match(dmi_lid_device_table);
>> +	if (!match) {
>> +		pr_info(KBUILD_MODNAME": no device detected, exiting\n");
> 
> If you put
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> before including any headers, you can simply write 'pr_info("no device...")' and it'll
> be prefixed by the module name. This is the "usual" way of achieving what you want.

Right, thanks!

>> +		return 0;
> 
> Shouldn't it return -ENODEV?

How does module auto-loading behave with a -ENODEV return value in init?
I know that in the driver's probe callback it signals that the driver
isn't intended for the device. Is this the same for modules or would a
user get an error message in the kernel log? As I couldn't find any
documentation on this, I assumed it didn't behave the same and would
emit an error message.

The reason I don't want to emit an error message here is that the module
can be loaded for devices that it's not intended (and that's not
something we can fix with a better MODULE_ALIAS as Microsoft cleverly
named their 5th generation Surface Pro "Surface Pro", without any
version number). Mainly, I don't want users to get a random error
message that doesn't indicate an actual error.

>> +	}
>> +
>> +	props = match->driver_data;
>> +
>> +	status = platform_driver_register(&surface_gpe_driver);
>> +	if (status)
>> +		return status;
>> +
>> +	pdev = platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
>> +	if (!pdev) {
>> +		platform_driver_unregister(&surface_gpe_driver);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	fwnode = fwnode_create_software_node(props, NULL);
>> +	if (IS_ERR(fwnode)) {
>> +		platform_device_put(pdev);
>> +		platform_driver_unregister(&surface_gpe_driver);
>> +		return PTR_ERR(fwnode);
>> +	}
>> +
>> +	pdev->dev.fwnode = fwnode;
>> +
>> +	status = platform_device_add(pdev);
>> +	if (status) {
>> +		platform_device_put(pdev);
>> +		platform_driver_unregister(&surface_gpe_driver);
>> +		return status;
>> +	}
>> +
> 
> It may be a matter of preference, but I think the 'if (err) goto X' pattern would
> be better in this function (at least for the last 3 or so error paths).

Noted, I'll change that.

>> +	surface_gpe_device = pdev;
>> +	return 0;
>> +}
>> +module_init(surface_gpe_init);
>> +
>> +static void __exit surface_gpe_exit(void)
>> +{
>> +	if (!surface_gpe_device)
>> +		return;
> 
> If you returned -ENODEV in init when no DMI match is found,
> then this check would be redundant.

Yes. See my question regarding -ENODEV above.

Thank you for your time,
Max

From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH v2 4/5] Add support for deep sleep control.
Date: Tue, 2 Feb 2016 12:09:22 -0600
Message-ID: <56B0F0D2.10606@dell.com>
References: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
 <1454380131-24662-5-git-send-email-mario_limonciello@dell.com>
 <20160202173208.GC1779@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160202173208.GC1779@malice.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



On 02/02/2016 11:32 AM, Darren Hart wrote:
> On Mon, Feb 01, 2016 at 08:28:50PM -0600, Mario Limonciello wrote:
>> This allows configuration the system for wakeup with a controller.
> Hrm, I'm happy to clean up English grammar in commit messages... but I'm
> struggling with the intent of the above... Is this correct:
>
> Allow for user configuration, via sysfs, for wakeup with a controller.
>
> If so, great - but also, what do we mean by "with a controller" ?

I see how this is confusing to someone who isn't in the know what's
going on.
A better description is:

Allow for user configuration of BIOS settings that allow the system to
turned on via HID devices.

If that's concise enough I'll update in next submission.

>> The feature requires hardware architectural modifications and can
>> not be supported on on existing systems.
>>
>> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
>> ---
>>  drivers/platform/x86/alienware-wmi.c | 100 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 100 insertions(+)
>>
>> diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
>> index e6f6322..f5ebcae 100644
>> --- a/drivers/platform/x86/alienware-wmi.c
>> +++ b/drivers/platform/x86/alienware-wmi.c
>> @@ -34,6 +34,8 @@
>>  #define WMAX_METHOD_ZONE_CONTROL	0x4
>>  #define WMAX_METHOD_HDMI_CABLE		0x5
>>  #define WMAX_METHOD_AMPLIFIER_CABLE	0x6
>> +#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
>> +#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
>>  
>>  MODULE_AUTHOR("Mario Limonciello <mario_limonciello@dell.com>");
>>  MODULE_DESCRIPTION("Alienware special feature control");
>> @@ -62,6 +64,7 @@ struct quirk_entry {
>>  	u8 num_zones;
>>  	u8 hdmi_mux;
>>  	u8 amplifier;
>> +	u8 deepslp;
>>  };
>>  
>>  static struct quirk_entry *quirks;
>> @@ -70,24 +73,28 @@ static struct quirk_entry quirk_unknown = {
>>  	.num_zones = 2,
>>  	.hdmi_mux = 0,
>>  	.amplifier = 0,
>> +	.deepslp = 0,
>>  };
>>  
>>  static struct quirk_entry quirk_x51_r1_r2 = {
>>  	.num_zones = 3,
>>  	.hdmi_mux = 0,
>>  	.amplifier = 0,
>> +	.deepslp = 0,
>>  };
>>  
>>  static struct quirk_entry quirk_x51_r3 = {
>>  	.num_zones = 4,
>>  	.hdmi_mux = 0,
>>  	.amplifier = 1,
>> +	.deepslp = 0,
>>  };
>>  
>>  static struct quirk_entry quirk_asm100 = {
>>  	.num_zones = 2,
>>  	.hdmi_mux = 1,
>>  	.amplifier = 0,
>> +	.deepslp = 0,
>>  };
>>  
>>  static int __init dmi_matched(const struct dmi_system_id *dmi)
>> @@ -650,6 +657,92 @@ error_create_amplifier:
>>  	return ret;
>>  }
>>  
>> +/* Deep Sleep Control support
>> + * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
>> +*/
>> +static ssize_t show_deepsleep_status(struct device *dev,
>> +				     struct device_attribute *attr, char *buf)
>> +{
>> +	acpi_status status;
>> +	u32 out_data;
>> +	struct wmax_basic_args in_args = {
>> +		.arg = 0,
>> +	};
>> +	status =
>> +	    alienware_wmax_command(&in_args, WMAX_METHOD_DEEP_SLEEP_STATUS,
>> +				   (u32 *) &out_data);
>> +	if (ACPI_SUCCESS(status)) {
>> +		if (out_data == 0)
>> +			return scnprintf(buf, PAGE_SIZE,
>> +					 "[disabled] s5 s5_s4\n");
>> +		else if (out_data == 1)
>> +			return scnprintf(buf, PAGE_SIZE,
>> +					 "disabled [s5] s5_s4\n");
>> +		else if (out_data == 2)
>> +			return scnprintf(buf, PAGE_SIZE,
>> +					 "disabled s5 [s5_s4]\n");
>> +	}
>> +	pr_err("alienware-wmi: unknown deep sleep status: %d\n", status);
>> +	return scnprintf(buf, PAGE_SIZE, "disabled s5 s5_s4 [unknown]\n");
>> +}
>> +
>> +static ssize_t toggle_deepsleep(struct device *dev,
>> +				struct device_attribute *attr,
>> +				const char *buf, size_t count)
>> +{
>> +	acpi_status status;
>> +	struct wmax_basic_args args;
>> +
>> +	if (strcmp(buf, "disabled\n") == 0)
>> +		args.arg = 0;
>> +	else if (strcmp(buf, "s5\n") == 0)
>> +		args.arg = 1;
>> +	else
>> +		args.arg = 2;
>> +	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
>> +
>> +	status =
>> +	    alienware_wmax_command(&args, WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
> Prefer to wrap the arguments:
>
> 	status = alienware_wmax_command(&args, WMAX_METHOD_DEEP_SLEEP_CONTROL,
> 					NULL);

OK.

>> +
>> +	if (ACPI_FAILURE(status))
>> +		pr_err
>> +		    ("alienware-wmi: deep sleep control failed: results: %u\n",
> Here, I don't consider the above to be "breakable" in terms of line wrapping.
>
> 		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
>
> Please.

OK.

>> +		     status);
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status, toggle_deepsleep);
>> +
>> +static struct attribute *deepsleep_attrs[] = {
>> +	&dev_attr_deepsleep.attr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute_group deepsleep_attribute_group = {
>> +	.name = "deepsleep",
>> +	.attrs = deepsleep_attrs,
>> +};
>> +
>> +static void remove_deepsleep(struct platform_device *dev)
>> +{
>> +	if (quirks->deepslp > 0)
>> +		sysfs_remove_group(&dev->dev.kobj, &deepsleep_attribute_group);
>> +}
>> +
>> +static int create_deepsleep(struct platform_device *dev)
>> +{
>> +	int ret;
>> +
>> +	ret = sysfs_create_group(&dev->dev.kobj, &deepsleep_attribute_group);
>> +	if (ret)
>> +		goto error_create_deepsleep;
>> +	return 0;
>> +
>> +error_create_deepsleep:
>> +	remove_deepsleep(dev);
>> +	return ret;
> As i the previous patch, this goto label is unnecessary.

OK.

>> +}
>> +
>>  static int __init alienware_wmi_init(void)
>>  {
>>  	int ret;
>> @@ -691,6 +784,12 @@ static int __init alienware_wmi_init(void)
>>  			goto fail_prep_amplifier;
>>  	}
>>  
>> +	if (quirks->deepslp > 0) {
>> +		ret = create_deepsleep(platform_device);
>> +		if (ret)
>> +			goto fail_prep_deepsleep;
>> +	}
>> +
>>  	ret = alienware_zone_init(platform_device);
>>  	if (ret)
>>  		goto fail_prep_zones;
>> @@ -699,6 +798,7 @@ static int __init alienware_wmi_init(void)
>>  
>>  fail_prep_zones:
>>  	alienware_zone_exit(platform_device);
>> +fail_prep_deepsleep:
>>  fail_prep_amplifier:
>>  fail_prep_hdmi:
>>  	platform_device_del(platform_device);
>> -- 
>> 1.9.1
>>
>>

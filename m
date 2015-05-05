From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFC v2] asus-wmi: add fan control
Date: Tue, 5 May 2015 12:48:45 -0700
Message-ID: <20150505194845.GA19863@fury.dvhart.com>
References: <cover.1429653764.git.kastbernd@gmx.de>
 <20150504225800.GA9362@ASUS-Bernd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46836 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbbEETsv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 May 2015 15:48:51 -0400
Content-Disposition: inline
In-Reply-To: <20150504225800.GA9362@ASUS-Bernd>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kast Bernd <kastbernd@gmx.de>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, rjw@rjwysocki.net

On Tue, May 05, 2015 at 12:58:00AM +0200, Kast Bernd wrote:
> This patch is partially based on Felipe Contrera's earlier patch, that
> was discussed here: https://lkml.org/lkml/2013/10/8/800
> Some problems of that patch are solved, now:
> 
> 1) The main obstacle for the earlier patch seemed to be the use of
> virt_to_phys, which is accepted, now
> 
> 2) random memory corruption occurred on my notebook, thus DMA-able memory
> is allocated now, which solves this problem
> 
> 3) hwmon interface is used instead of the thermal interface, as a
> hwmon device is already set up by this driver and seemed more
> appropriate than the thermal interface
> 
> 4) Calling the ACPI-functions was modularized thus it's possible to call
> some multifunctions easily, now (by using
> asus_wmi_evaluate_method_agfn).
> 
> Unfortunately the WMI doesn't support controlling both fans on
> a dual-fan notebook because of an restriction in the acpi-method
> "SFNS", that is callable through the wmi. If "SFNV" would be called
> directly even dual fan configurations could be controlled, but not by using
> wmi.
> 
> Speed readings only work on auto-mode, thus "-1" will be reported in
> manual mode.
> Additionally the speed readings are reported as hundreds of RPM thus
> they are not too precise.
> 
> This patch is tested only on one notebook (N551JK) but a similar module,
> that contained some code to try to control the second fan also, was
> reported to work on an UX32VD, at least for the first fan.
> 
> As Felipe already mentioned the low-level functions are described here:
> http://forum.notebookreview.com/threads/fan-control-on-asus-prime-ux31-ux31a-ux32a-ux32vd.705656/
> 
> Signed-off-by: Kast Bernd <kastbernd@gmx.de>
> Cc: Corentin Chary <corentin.chary@gmail.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> ---
> Changes for v2:
> 	suggested by Darren Hart:
> 		- variable ordering from longest to shortest
> 		- fail label removed in asus_wmi_evaluate_method_agfn
> 		- removed unnecessary ternary operator
> 		- used NULL instead of 0
> 		- used DEVICE_ATTR_(RO|RW) 
> 	suggested by Corentin Chary:
> 		- asus_hwmon_agfn_fan_speed split to two functions
> 		- added some logging
> 		- used existing function to clamp values
> 	suggested by both:
> 		- updated comments
> 		- tried to return proper error codes
> 		- removed some magic numbers
> Thank you very much for your feedback!
> 

Thanks Kast,

Well documented, thank you.

Some nits below.

>  drivers/platform/x86/asus-wmi.c | 336 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 315 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7543a56..719e340 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -78,6 +78,7 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_METHODID_GPID		0x44495047 /* Get Panel ID?? (Resol) */
>  #define ASUS_WMI_METHODID_QMOD		0x444F4D51 /* Quiet MODe */
>  #define ASUS_WMI_METHODID_SPLV		0x4C425053 /* Set Panel Light Value */
> +#define ASUS_WMI_METHODID_AGFN		0x4E464741 /* FaN? */
>  #define ASUS_WMI_METHODID_SFUN		0x4E554653 /* FUNCtionalities */
>  #define ASUS_WMI_METHODID_SDSP		0x50534453 /* Set DiSPlay output */
>  #define ASUS_WMI_METHODID_GDSP		0x50534447 /* Get DiSPlay output */
> @@ -150,11 +151,37 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_DSTS_BRIGHTNESS_MASK	0x000000FF
>  #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
>  
> +#define ASUS_FAN_DESC			"cpu_fan"
> +#define ASUS_FAN_MFUN			0x13
> +#define ASUS_FAN_SFUN_READ		0x06
> +#define ASUS_FAN_SFUN_WRITE		0x07
> +#define ASUS_FAN_CTRL_MANUAL		1
> +#define ASUS_FAN_CTRL_AUTO		2
> +
> +
>  struct bios_args {
>  	u32 arg0;
>  	u32 arg1;
>  } __packed;
>  
> +/* struct that's used for all methods called via AGFN. Naming is
> + * identically to the AML code
> +*/

Start multi-line comment blocks with a /* on its own line:

/*
 * Comment line 1
 * Comment line 2
 */

^ note beginning space on closing */

I thought checkpatch caught this, but I checked and it didn't.

Apply throughout the patch. I prefer multiline comments to use complete sentence
formatting. Start with a capital, end with a period.

This is nit-picky, but this is your first patch, so we're going to hammer you on
details now so your next one is that much easier :-)

> +struct agfn_args {
> +	u16 mfun; /* probably "Multi-function" to be called */
> +	u16 sfun; /* probably "Sub-function" to be called */
> +	u16 len;  /* size of the hole struct, including subfunction fields */
> +	u8 stas;  /* not used by now */
> +	u8 err;   /* zero on success */
> +} __packed;
> +
> +/* struct used for calling fan read and write methods */
> +struct fan_args {
> +	struct agfn_args agfn;	/* common fields */
> +	u8 fan;			/* fan number: 0: set auto mode 1: 1st fan */
> +	u32 speed;		/* read: RPM/100 - write: 0-255 */
> +} __packed;
> +
>  /*
>   * <platform>/    - debugfs root directory
>   *   dev_id      - current dev_id
> @@ -204,6 +231,10 @@ struct asus_wmi {
>  	struct asus_rfkill gps;
>  	struct asus_rfkill uwb;
>  
> +	int asus_hwmon_pwm;
> +	int asus_hwmon_num_fans;
> +	bool asus_hwmon_fan_manual_mode;
> +
>  	struct hotplug_slot *hotplug_slot;
>  	struct mutex hotplug_lock;
>  	struct mutex wmi_lock;
> @@ -294,6 +325,35 @@ exit:
>  	return 0;
>  }
>  
> +static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
> +{
> +	struct acpi_buffer input;
> +	u64 phys_addr;
> +	u32 retval;
> +	u32 status = -1;
> +
> +	/* copy to dma capable address otherwise memory corruption occurs as
> +	 * bios has to be able to access it
> +	*/
> +	input.pointer = kzalloc(args.length, GFP_DMA | GFP_KERNEL);
> +	input.length = args.length;
> +	if (!input.pointer)
> +		return -ENOMEM;
> +	phys_addr = virt_to_phys(input.pointer);
> +	memcpy(input.pointer, args.pointer, args.length);
> +
> +	status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_AGFN,
> +					phys_addr, 0, &retval);
> +	if (!status)
> +		memcpy(args.pointer, input.pointer, args.length);
> +
> +	kfree(input.pointer);
> +	if (!status)
> +		return retval;
> +	else
> +		return -ENXIO;


And here the else is not necessary. Dropping it is commonplace as it makes the
final return explicit. Also, we tend to prefer handling errors in the
conditional block, and having the successful path be the norm.

So in this case:


	if (status)
		return -ENXIO;

	return retval;

> +}
> +
>  static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>  {
>  	return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval);
> @@ -1022,35 +1082,221 @@ exit:
>  /*
>   * Hwmon device
>   */
> -static ssize_t asus_hwmon_pwm1(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buf)
> +static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
> +					  int *speed)
> +{
> +	struct fan_args args = {
> +		.agfn.len = sizeof(args),
> +		.agfn.mfun = ASUS_FAN_MFUN,
> +		.agfn.sfun = ASUS_FAN_SFUN_READ,
> +		.fan = fan,
> +		.speed = 0,
> +	};
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +	int status;
> +
> +	if (fan != 1)
> +		return -EINVAL;
> +
> +	status = asus_wmi_evaluate_method_agfn(input);
> +
> +	if (status || args.agfn.err)
> +		return -ENXIO;
> +
> +	if (!speed)
> +		return 0;
> +
> +	*speed = args.speed;
> +	return 0;

And here, avoid multiple return statements with the same value by:

	if (speed)
		*speed = args.speed;

	return 0;

> +}
> +
> +static int asus_hwmon_agfn_fan_speed_write(struct asus_wmi *asus, int fan,
> +				     int *speed)
> +{
> +	int status;
> +
> +	struct fan_args args = {
> +		.agfn.len = sizeof(args),
> +		.agfn.mfun = ASUS_FAN_MFUN,
> +		.agfn.sfun = ASUS_FAN_SFUN_WRITE,
> +		.fan = fan,
> +		.speed = speed ?  *speed : 0,
> +	};
> +
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +
> +	/* 1: for setting 1st fan's speed 0: setting auto mode */
> +	if (fan != 1 && fan != 0)
> +		return -EINVAL;
> +
> +	status = asus_wmi_evaluate_method_agfn(input);
> +
> +	if (status || args.agfn.err)
> +		return -ENXIO;
> +
> +	if (!speed)
> +		return 0;
> +	if (fan == 1)
> +		asus->asus_hwmon_pwm = *speed;
> +
> +	return 0;

Again, multiple returns for the same thing. Consider:

	if (speed && fan == 1)
		asus->asus_hwmon_pwm = *speed;

	return 0;

> +}
> +
> +/*
> + * Check if we can read the speed of one fan. If true we assume we can also
> + * control it

                ^ period

> +*/

  ^ whitespace

> +static int asus_hwmon_get_fan_number(struct asus_wmi *asus, int *num_fans)
> +{
> +	int status;
> +	int speed = 0;
> +
> +	*num_fans = 0;
> +
> +	status = asus_hwmon_agfn_fan_speed_read(asus, 1, &speed);
> +	if (status)
> +		return 0;
> +
> +	*num_fans = 1;
> +	return 0;

You get the idea I think :-) Single return path here too please.

> +}
> +
> +static int asus_hwmon_fan_set_auto(struct asus_wmi *asus)
> +{
> +	int status;
> +
> +	status = asus_hwmon_agfn_fan_speed_write(asus, 0, NULL);
> +	if (!status) {
> +		asus->asus_hwmon_fan_manual_mode = false;
> +		return 0;
> +	} else {
> +		return -ENXIO;
> +	}

Invert and drop the else block.

> +}
> +
> +static int asus_hwmon_fan_rpm_show(struct device *dev, int fan)
>  {
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
> -	u32 value;
> +	int value;
> +	int state;
> +
> +	/* no speed readable on manual mode */
> +	if (asus->asus_hwmon_fan_manual_mode) {
> +		value = -ENXIO;
> +	} else {
> +		state = asus_hwmon_agfn_fan_speed_read(asus, fan+1, &value);
> +		if (state) {

An odd name, state. ret seems more appropriate, as we would typically expect
state to be a pointer to some struct.

> +			value = -ENXIO;
> +			pr_warn("reading fan speed failed: %d\n", state);
> +		}
> +	}
> +	return value;

Here you can drop the else block by returning -ENXIO directly in both places.
That might seem in contrast with what I've mentioned above, but I believe it
makes the code more readable. Generally speaking, reducing nesting is a good
thing.

> +}
> +
> +static void asus_hwmon_pwm_show(struct asus_wmi *asus, int fan, int *value)
> +{
>  	int err;
>  
> -	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_CTRL, &value);
> +	if (asus->asus_hwmon_pwm >= 0) {
> +		*value = asus->asus_hwmon_pwm;
> +		return;
> +	}
>  
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_FAN_CTRL, value);
>  	if (err < 0)
> -		return err;
> +		return;
>  
> -	value &= 0xFF;
> -
> -	if (value == 1) /* Low Speed */
> -		value = 85;
> -	else if (value == 2)
> -		value = 170;
> -	else if (value == 3)
> -		value = 255;
> -	else if (value != 0) {
> -		pr_err("Unknown fan speed %#x\n", value);
> -		value = -1;
> +	*value &= 0xFF;
> +
> +	if (*value == 1) /* Low Speed */
> +		*value = 85;
> +	else if (*value == 2)
> +		*value = 170;
> +	else if (*value == 3)
> +		*value = 255;
> +	else if (*value) {
> +		pr_err("Unknown fan speed %#x\n", *value);
> +		*value = -1;
>  	}
> +}
> +
> +static ssize_t pwm1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	int value;
>  
> +	asus_hwmon_pwm_show(asus, 0, &value);
>  	return sprintf(buf, "%d\n", value);
>  }
>  
> +static ssize_t pwm1_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count) {
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	int value;
> +	int state;
> +
> +	kstrtouint(buf, 10, &value);
> +	value = clamp(value, 0, 255);
> +
> +	state = asus_hwmon_agfn_fan_speed_write(asus, 1, &value);
> +	if (state)
> +		pr_warn("Setting fan speed failed: %d\n", state);
> +	else
> +		asus->asus_hwmon_fan_manual_mode = true;
> +
> +	return count;
> +}
> +
> +static ssize_t fan1_input_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	int value = asus_hwmon_fan_rpm_show(dev, 0);
> +
> +	return sprintf(buf, "%d\n", value < 0 ? -1 : value*100);
> +
> +}
> +
> +static ssize_t pwm1_enable_show(struct device *dev,
> +						 struct device_attribute *attr,
> +						 char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	if (asus->asus_hwmon_fan_manual_mode)
> +		return sprintf(buf, "%d\n", ASUS_FAN_CTRL_MANUAL);
> +	else
> +		return sprintf(buf, "%d\n", ASUS_FAN_CTRL_AUTO);

Drop the else.

You can respin with these, or wait until Corentin has a chance to respond. I'd
recommened giving them a few days to respond so you can only have to respin one
more time.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center

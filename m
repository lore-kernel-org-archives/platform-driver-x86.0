From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/2] toshiba_acpi: Add support for WWAN devices
Date: Fri, 20 Nov 2015 14:49:29 -0800
Message-ID: <20151120224929.GA7413@malice.jf.intel.com>
References: <1447948165-2343-1-git-send-email-coproscefalo@gmail.com>
 <1447948165-2343-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:53114 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759452AbbKTWta (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 17:49:30 -0500
Content-Disposition: inline
In-Reply-To: <1447948165-2343-2-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabian Koester <fabian.koester@bringnow.com>

On Thu, Nov 19, 2015 at 08:49:24AM -0700, Azael Avalos wrote:
> Toshiba laptops with WWAN devices installed cannot use the device unless
> it is attached and powered, similar to how Toshiba Bluetooth devices
> work.
> 
> This patch adds support to WWAN devices, introducing three functions,
> one to query the overall status of the wireless devices (RFKill, WLAN,
> BT, WWAN), the second queries WWAN support, and finally the third
> (de)activates the device.
> 
> Signed-off-by: Fabian Koester <fabian.koester@bringnow.com>
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Thanks Azael,

A few comments on code flow and one bug I think below.

> ---
>  drivers/platform/x86/toshiba_acpi.c | 92 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index c013029..60d1ad9 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
>  #define HCI_VIDEO_OUT			0x001c
>  #define HCI_HOTKEY_EVENT		0x001e
>  #define HCI_LCD_BRIGHTNESS		0x002a
> +#define HCI_WIRELESS			0x0056
>  #define HCI_ACCELEROMETER		0x006d
>  #define HCI_KBD_ILLUMINATION		0x0095
>  #define HCI_ECO_MODE			0x0097
> @@ -148,6 +149,10 @@ MODULE_LICENSE("GPL");
>  #define SCI_KBD_MODE_ON			0x8
>  #define SCI_KBD_MODE_OFF		0x10
>  #define SCI_KBD_TIME_MAX		0x3c001a
> +#define HCI_WIRELESS_STATUS		0x1
> +#define HCI_WIRELESS_WWAN		0x3
> +#define HCI_WIRELESS_WWAN_STATUS	0x2000
> +#define HCI_WIRELESS_WWAN_POWER		0x4000
>  #define SCI_USB_CHARGE_MODE_MASK	0xff
>  #define SCI_USB_CHARGE_DISABLED		0x00
>  #define SCI_USB_CHARGE_ALTERNATE	0x09
> @@ -197,12 +202,14 @@ struct toshiba_acpi_dev {
>  	unsigned int kbd_function_keys_supported:1;
>  	unsigned int panel_power_on_supported:1;
>  	unsigned int usb_three_supported:1;
> +	unsigned int wwan_supported:1;
>  	unsigned int sysfs_created:1;
>  	unsigned int special_functions;
>  
>  	bool kbd_led_registered;
>  	bool illumination_led_registered;
>  	bool eco_led_registered;
> +	bool killswitch;
>  };
>  
>  static struct toshiba_acpi_dev *toshiba_acpi;
> @@ -1085,6 +1092,87 @@ static int toshiba_hotkey_event_type_get(struct toshiba_acpi_dev *dev,
>  	return -EIO;
>  }
>  
> +/* Wireless status (RFKill, WLAN, BT, WWAN) */
> +static int toshiba_wireless_status(struct toshiba_acpi_dev *dev)
> +{
> +	u32 in[TCI_WORDS] = { HCI_GET, HCI_WIRELESS, 0, 0, 0, 0 };
> +	u32 out[TCI_WORDS];
> +	acpi_status status;
> +
> +	in[3] = HCI_WIRELESS_STATUS;
> +	status = tci_raw(dev, in, out);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("ACPI call to get Wireless status failed\n");
> +	} else if (out[0] == TOS_NOT_SUPPORTED) {
> +		return -ENODEV;
> +	} else if (out[0] == TOS_SUCCESS) {
> +		dev->killswitch =
> +			    (out[2] & HCI_WIRELESS_STATUS) ? true : false;

This should assign successfully without the need for the ternary operator. You
can also then drop the extra newline. You can always use:

!!(out[2] & HCI_WIRELESS_STATUS)

To ensure a 1 or 0 assignment.

> +		return 0;
> +	}
> +
> +	return -EIO;

Also, we should be testing for error and do the expected path outside the if
blocks.


	if (ACPI_FAILURE(status) {
		pr_err("ACPI call to get Wireless status failed\n");
		return -EIO;
	}

	if (out[0] == TOS_NOT_SUPPORTED)
		return -ENODEV;
	
	if (out[0] != TOS_SUCCESS)
		return -EIO;
	
	dev->killswitch = !!(out[2] & HCI_WIRELESS_STATUS);

	return 0;

> +}
> +
> +/* WWAN */
> +static void toshiba_wwan_available(struct toshiba_acpi_dev *dev)
> +{
> +	u32 in[TCI_WORDS] = { HCI_GET, HCI_WIRELESS, 0, 0, 0, 0 };
> +	u32 out[TCI_WORDS];
> +	acpi_status status;
> +
> +	dev->wwan_supported = 0;
> +
> +	/*
> +	 * WWAN support can be queried by setting the in[3] value to
> +	 * HCI_WIRELESS_WWAN (0x03).
> +	 *
> +	 * If supported, out[0] contains TOS_SUCCESS and out[2] contains
> +	 * HCI_WIRELESS_WWAN_STATUS (0x2000).
> +	 *
> +	 * If not supported, out[0] contains TOS_INPUT_DATA_ERROR (0x8300)
> +	 * or TOS_NOT_SUPPORTED (0x8000).
> +	 */
> +	in[3] = HCI_WIRELESS_WWAN;
> +	status = tci_raw(dev, in, out);
> +	if (ACPI_FAILURE(status))
> +		pr_err("ACPI call to get WWAN status failed\n");
> +	else if (out[0] == TOS_SUCCESS && out[2] == HCI_WIRELESS_WWAN_STATUS)
> +		dev->wwan_supported = 1;

This block similarly intermixes error checking with the primary functional
logic, making it less legible in my opinion. Consider:


	in[3] = HCI_WIRELESS_WWAN;
	status = tci_raw(dev, in, out);

	if (ACPI_FAILURE(status) || (out[0] != TOS_SUCCESS)) {
		pr_err("ACPI call to get WWAN status failed\n");
		return;
	}

	dev->wwan_supported = (out[2] == HCI_WIRELESS_WWAN_STATUS);

> +}
> +
> +static int toshiba_wwan_set(struct toshiba_acpi_dev *dev, u32 state)
> +{
> +	u32 in[TCI_WORDS] = { HCI_SET, HCI_WIRELESS, state, 0, 0, 0 };
> +	u32 out[TCI_WORDS];
> +	acpi_status status;
> +
> +	in[3] = HCI_WIRELESS_WWAN_STATUS;
> +	status = tci_raw(dev, in, out);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("ACPI call to set WWAN status failed\n");
> +		return -EIO;
> +	} else if (out[0] == TOS_NOT_SUPPORTED) {
> +		return -ENODEV;
> +	} else if (out[0] != TOS_SUCCESS) {
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * Some devices only need to call HCI_WIRELESS_WWAN_STATUS to
> +	 * (de)activate the device, but some others need the
> +	 * HCI_WIRELESS_WWAN_POWER call as well.
> +	 */
> +	in[3] = HCI_WIRELESS_WWAN_POWER;
> +	status = tci_raw(dev, in, out);
> +	if (ACPI_FAILURE(status))
> +		pr_err("ACPI call to set WWAN power failed\n");

I believe you want a return -EIO here?

> +	else if (out[0] == TOS_NOT_SUPPORTED)
> +		return -ENODEV;
> +
> +	return out[0] == TOS_SUCCESS ? 0 : -EIO;

So much ternary! :-) I suppose this one is OK.

> +}
> +
>  /* Transflective Backlight */
>  static int get_tr_backlight_status(struct toshiba_acpi_dev *dev, u32 *status)
>  {
> @@ -2561,6 +2649,8 @@ static void print_supported_features(struct toshiba_acpi_dev *dev)
>  		pr_cont(" panel-power-on");
>  	if (dev->usb_three_supported)
>  		pr_cont(" usb3");
> +	if (dev->wwan_supported)
> +		pr_cont(" wwan");
>  
>  	pr_cont("\n");
>  }
> @@ -2736,6 +2826,8 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  	ret = get_fan_status(dev, &dummy);
>  	dev->fan_supported = !ret;
>  
> +	toshiba_wwan_available(dev);
> +
>  	print_supported_features(dev);
>  
>  	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
> -- 
> 2.6.2
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center

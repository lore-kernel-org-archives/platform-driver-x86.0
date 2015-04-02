From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/3] toshiba_acpi: Update and fix USB Sleep and Charge
 modes
Date: Wed, 1 Apr 2015 22:21:25 -0700
Message-ID: <20150402052125.GG37152@fury.dvhart.com>
References: <1427678740-5459-1-git-send-email-coproscefalo@gmail.com>
 <1427678740-5459-2-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48696 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751106AbbDBFV0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Apr 2015 01:21:26 -0400
Content-Disposition: inline
In-Reply-To: <1427678740-5459-2-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 29, 2015 at 07:25:39PM -0600, Azael Avalos wrote:
> This patch fixes the USB Sleep and Charge mode on certain models
> where the value returned by the BIOS is different, and thus, making
> this feature not to work for those models.
> 
> Also, the "Typical" charging mode was added as a supported mode.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 69 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 17a259e..c8ad61c 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -150,9 +150,10 @@ MODULE_LICENSE("GPL");
>  #define SCI_KBD_MODE_OFF		0x10
>  #define SCI_KBD_TIME_MAX		0x3c001a
>  #define SCI_USB_CHARGE_MODE_MASK	0xff
> -#define SCI_USB_CHARGE_DISABLED		0x30000
> -#define SCI_USB_CHARGE_ALTERNATE	0x30009
> -#define SCI_USB_CHARGE_AUTO		0x30021
> +#define SCI_USB_CHARGE_DISABLED		0x00
> +#define SCI_USB_CHARGE_ALTERNATE	0x09
> +#define SCI_USB_CHARGE_TYPICAL		0x11
> +#define SCI_USB_CHARGE_AUTO		0x21
>  #define SCI_USB_CHARGE_BAT_MASK		0x7
>  #define SCI_USB_CHARGE_BAT_LVL_OFF	0x1
>  #define SCI_USB_CHARGE_BAT_LVL_ON	0x4
> @@ -177,6 +178,7 @@ struct toshiba_acpi_dev {
>  	int kbd_mode;
>  	int kbd_time;
>  	int usbsc_bat_level;
> +	int usbsc_mode_base;
>  	int hotkey_event_type;
>  
>  	unsigned int illumination_supported:1;
> @@ -800,6 +802,52 @@ static int toshiba_accelerometer_get(struct toshiba_acpi_dev *dev,
>  }
>  
>  /* Sleep (Charge and Music) utilities support */
> +static void toshiba_usb_sleep_charge_available(struct toshiba_acpi_dev *dev)
> +{
> +	u32 in[TCI_WORDS] = { SCI_GET, SCI_USB_SLEEP_CHARGE, 0, 0, 0, 0 };
> +	u32 out[TCI_WORDS];
> +	acpi_status status;
> +
> +	/* Set the feature to "not supported" in case of error */
> +	dev->usb_sleep_charge_supported = 0;
> +
> +	if (!sci_open(dev))
> +		return;
> +
> +	status = tci_raw(dev, in, out);
> +	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
> +		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
> +		sci_close(dev);
> +		return;
> +	} else if (out[0] == TOS_NOT_SUPPORTED) {
> +		pr_info("USB Sleep and Charge not supported\n");
> +		sci_close(dev);
> +		return;
> +	}

Sorry Azael for not asking the first time, and maybe this is just how it is -
but it occurs to me that after the above tci_raw call, we check for 3 error
cases, but we never test for success. Can we not check for out[0] == TOS_SUCCESS
or similar? The above logic seems like the kind to lead to failure going
unnoticed as success is assumed and not confirmed.

> +	dev->usbsc_mode_base = out[4];
> +
> +	in[5] = SCI_USB_CHARGE_BAT_LVL;
> +	status = tci_raw(dev, in, out);
> +	if (ACPI_FAILURE(status) || out[0] == TOS_FAILURE) {
> +		pr_err("ACPI call to get USB Sleep and Charge mode failed\n");
> +		sci_close(dev);
> +		return;
> +	} else if (out[0] == TOS_NOT_SUPPORTED) {
> +		pr_info("USB Sleep and Charge not supported\n");
> +		sci_close(dev);
> +		return;
> +	}

Here too.

-- 
Darren Hart
Intel Open Source Technology Center

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH resend 2/6] toshiba_acpi: Add fan entry to sysfs
Date: Mon, 9 Feb 2015 20:02:35 -0800
Message-ID: <20150210040235.GA37927@fury.dvhart.com>
References: <1423539294-2941-1-git-send-email-coproscefalo@gmail.com>
 <1423539294-2941-3-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40917 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463AbbBJECg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Feb 2015 23:02:36 -0500
Content-Disposition: inline
In-Reply-To: <1423539294-2941-3-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 09, 2015 at 08:34:50PM -0700, Azael Avalos wrote:
> This patch adds a fan entry to sysfs, enabling the user to get and
> set the fan status.
> 

Hi Azael,

I was finally getting around to these when you resent them. Apologies for the
delay. Travel and still fighting a cold/flu/bug. Sigh. Anyway... on to patch
review :-)

> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 51 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 334b65e..413af60 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -1516,6 +1516,11 @@ static const struct backlight_ops toshiba_backlight_data = {
>   */
>  static ssize_t toshiba_version_show(struct device *dev,
>  				    struct device_attribute *attr, char *buf);
> +static ssize_t toshiba_fan_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count);
> +static ssize_t toshiba_fan_show(struct device *dev,
> +				struct device_attribute *attr, char *buf);
>  static ssize_t toshiba_kbd_bl_mode_store(struct device *dev,
>  					 struct device_attribute *attr,
>  					 const char *buf, size_t count);
> @@ -1569,6 +1574,8 @@ static ssize_t toshiba_usb_sleep_music_store(struct device *dev,
>  					     const char *buf, size_t count);
>  
>  static DEVICE_ATTR(version, S_IRUGO, toshiba_version_show, NULL);
> +static DEVICE_ATTR(fan, S_IRUGO | S_IWUSR,
> +		   toshiba_fan_show, toshiba_fan_store);
>  static DEVICE_ATTR(kbd_backlight_mode, S_IRUGO | S_IWUSR,
>  		   toshiba_kbd_bl_mode_show, toshiba_kbd_bl_mode_store);
>  static DEVICE_ATTR(kbd_type, S_IRUGO, toshiba_kbd_type_show, NULL);

At some point, before we add too much more, it would be nice to convert these
over to DEVICE_ATTR_RW and DEVICE_ATTR_RO. Any reason not to do this sooner
rather than later?

> @@ -1594,6 +1601,7 @@ static DEVICE_ATTR(usb_sleep_music, S_IRUGO | S_IWUSR,
>  
>  static struct attribute *toshiba_attributes[] = {
>  	&dev_attr_version.attr,
> +	&dev_attr_fan.attr,
>  	&dev_attr_kbd_backlight_mode.attr,
>  	&dev_attr_kbd_type.attr,
>  	&dev_attr_available_kbd_modes.attr,
> @@ -1621,6 +1629,45 @@ static ssize_t toshiba_version_show(struct device *dev,
>  	return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
>  }
>  
> +static ssize_t toshiba_fan_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct toshiba_acpi_dev *toshiba = dev_get_drvdata(dev);
> +	u32 result;
> +	int state;
> +	int ret;
> +
> +	ret = kstrtoint(buf, 0, &state);
> +	if (ret)
> +		return ret;
> +
> +	if (state != 0 && state != 1)
> +		return -EINVAL;
> +
> +	result = hci_write1(toshiba, HCI_FAN, state);
> +	if (result == TOS_FAILURE)
> +		return -EIO;
> +	else if (result == TOS_NOT_SUPPORTED)
> +		return -ENODEV;
> +

A quick scan of hci_write1 makes me wonder if there are more than two possible
failures. Should we also have an "else if (result)" or "else if (result !=
WHATEVER_SUCCESS_IS)" before we assume success and return count?

-- 
Darren Hart
Intel Open Source Technology Center

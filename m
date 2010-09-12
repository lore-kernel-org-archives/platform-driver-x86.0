From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 09/10] WMI: make use of class device's attributres
Date: Sun, 12 Sep 2010 18:50:23 +0100
Message-ID: <201009121850.23852.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain> <20100826071525.7976.28120.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:58444 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418Ab0ILRux (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:50:53 -0400
Received: by wwb13 with SMTP id 13so2042461wwb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:50:51 -0700 (PDT)
In-Reply-To: <20100826071525.7976.28120.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:15:25 Dmitry Torokhov wrote:
> Instead of adding modalias attribute manually set it up as class's
> device attribute so driver core will create and remove it for us.
> 
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |   15 +++++++--------
>  1 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index b4e5bea..781321b 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -661,7 +661,7 @@ EXPORT_SYMBOL_GPL(wmi_has_guid);
>  /*
>   * sysfs interface
>   */
> -static ssize_t show_modalias(struct device *dev, struct device_attribute
> *attr, +static ssize_t modalias_show(struct device *dev, struct
> device_attribute *attr, char *buf)
>  {
>  	char guid_string[37];
> @@ -675,7 +675,11 @@ static ssize_t show_modalias(struct device *dev,
> struct device_attribute *attr,
> 
>  	return sprintf(buf, "wmi:%s\n", guid_string);
>  }
> -static DEVICE_ATTR(modalias, S_IRUGO, show_modalias, NULL);
> +
> +static struct device_attribute wmi_dev_attrs[] = {
> +	__ATTR_RO(modalias),
> +	__ATTR_NULL
> +};
> 
>  static int wmi_dev_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
> @@ -708,6 +712,7 @@ static struct class wmi_class = {
>  	.name = "wmi",
>  	.dev_release = wmi_dev_free,
>  	.dev_uevent = wmi_dev_uevent,
> +	.dev_attrs = wmi_dev_attrs,
>  };
> 
>  static int wmi_create_devs(void)
> @@ -740,10 +745,6 @@ static int wmi_create_devs(void)
>  		result = device_register(guid_dev);
>  		if (result)
>  			return result;
> -
> -		result = device_create_file(guid_dev, &dev_attr_modalias);
> -		if (result)
> -			return result;
>  	}
> 
>  	return 0;
> @@ -763,8 +764,6 @@ static void wmi_remove_devs(void)
>  		guid_dev = wblock->dev;
>  		gblock = &wblock->gblock;
> 
> -		device_remove_file(guid_dev, &dev_attr_modalias);
> -
>  		device_unregister(guid_dev);
>  	}
>  }
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> platform-driver-x86" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D

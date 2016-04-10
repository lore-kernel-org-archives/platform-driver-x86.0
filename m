From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: provide access to ALS control
Date: Sat, 9 Apr 2016 20:06:33 -0700
Message-ID: <20160410030633.GB18689@dvhart-mobl5.amr.corp.intel.com>
References: <1459510521-4682-1-git-send-email-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:47793 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750837AbcDJDJw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Apr 2016 23:09:52 -0400
Content-Disposition: inline
In-Reply-To: <1459510521-4682-1-git-send-email-linux@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Fri, Apr 01, 2016 at 01:35:21PM +0200, Oleksij Rempel wrote:
> Asus Zenbook ux31a is providing ACPI0008 interface for ALS
> (Ambient Light Sensor), which is accessible for OS => Win 7.
> This sensor can be used with iio/acpi-als driver.
> Since it is disabled by default, we should use asus-wmi
> interface to enable it.
> 

Corentin, any concerns?

> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  drivers/platform/x86/asus-wmi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a96630d..a26dca3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_DEVID_LED6		0x00020016
>  
>  /* Backlight and Brightness */
> +#define ASUS_WMI_DEVID_ALS_ENABLE	0x00050001 /* Ambient Light Sensor */
>  #define ASUS_WMI_DEVID_BACKLIGHT	0x00050011
>  #define ASUS_WMI_DEVID_BRIGHTNESS	0x00050012
>  #define ASUS_WMI_DEVID_KBD_BACKLIGHT	0x00050021

Following this is:

#define ASUS_WMI_DEVID_LIGHT_SENSOR	0x00050022 /* ?? */

Is there any relationship with this patch and that device? It would be useful to
understand the difference between these two DEVIDs (a comment in the source).

Otherwise, I'm happy with the patch.

> @@ -1730,6 +1731,7 @@ ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS_WMI_DEVID_TOUCHPAD);
>  ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA);
>  ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADER);
>  ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESUME);
> +ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, 0644, ASUS_WMI_DEVID_ALS_ENABLE);
>  
>  static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
>  			   const char *buf, size_t count)
> @@ -1756,6 +1758,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_cardr.attr,
>  	&dev_attr_touchpad.attr,
>  	&dev_attr_lid_resume.attr,
> +	&dev_attr_als_enable.attr,
>  	NULL
>  };
>  
> @@ -1776,6 +1779,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_TOUCHPAD;
>  	else if (attr == &dev_attr_lid_resume.attr)
>  		devid = ASUS_WMI_DEVID_LID_RESUME;
> +	else if (attr == &dev_attr_als_enable.attr)
> +		devid = ASUS_WMI_DEVID_ALS_ENABLE;
>  
>  	if (devid != -1)
>  		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
> -- 
> 2.5.0
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center

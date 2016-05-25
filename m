From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-wmi: provide access to ALS control
Date: Wed, 25 May 2016 09:08:25 +0200
Message-ID: <CAHR064hWV8v826gGzQYUOe2Zv8w9mYxo1sg90Gz4M32E6ojuQA@mail.gmail.com>
References: <1459510521-4682-1-git-send-email-linux@rempel-privat.de>
	<20160410030633.GB18689@dvhart-mobl5.amr.corp.intel.com>
	<570D2C0B.1010409@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34630 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752653AbcEYHI1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2016 03:08:27 -0400
Received: by mail-wm0-f65.google.com with SMTP id n129so12568719wmn.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2016 00:08:26 -0700 (PDT)
In-Reply-To: <570D2C0B.1010409@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: Darren Hart <dvhart@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Apr 12, 2016 at 7:10 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
>
> Am 10.04.2016 um 05:06 schrieb Darren Hart:
> > On Fri, Apr 01, 2016 at 01:35:21PM +0200, Oleksij Rempel wrote:
> >> Asus Zenbook ux31a is providing ACPI0008 interface for ALS
> >> (Ambient Light Sensor), which is accessible for OS => Win 7.
> >> This sensor can be used with iio/acpi-als driver.
> >> Since it is disabled by default, we should use asus-wmi
> >> interface to enable it.
> >>
> >
> > Corentin, any concerns?
> >
> >> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> >> ---
> >>  drivers/platform/x86/asus-wmi.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> >> index a96630d..a26dca3 100644
> >> --- a/drivers/platform/x86/asus-wmi.c
> >> +++ b/drivers/platform/x86/asus-wmi.c
> >> @@ -114,6 +114,7 @@ MODULE_LICENSE("GPL");
> >>  #define ASUS_WMI_DEVID_LED6         0x00020016
> >>
> >>  /* Backlight and Brightness */
> >> +#define ASUS_WMI_DEVID_ALS_ENABLE   0x00050001 /* Ambient Light Sensor */
> >>  #define ASUS_WMI_DEVID_BACKLIGHT    0x00050011
> >>  #define ASUS_WMI_DEVID_BRIGHTNESS   0x00050012
> >>  #define ASUS_WMI_DEVID_KBD_BACKLIGHT        0x00050021
> >
> > Following this is:
> >
> > #define ASUS_WMI_DEVID_LIGHT_SENSOR   0x00050022 /* ?? */
> >
> > Is there any relationship with this patch and that device? It would be useful to
> > understand the difference between these two DEVIDs (a comment in the source).
>
> I don't have this ID on my laptop. Hard to say what is it.
>

I believe I found out this was somehow related to light sensors
because the WMI device contained that kind of information, but it's
likely that Asus didn't use this ID in a consistent way.

>
> >
> > Otherwise, I'm happy with the patch.
> >
> >> @@ -1730,6 +1731,7 @@ ASUS_WMI_CREATE_DEVICE_ATTR(touchpad, 0644, ASUS_WMI_DEVID_TOUCHPAD);
> >>  ASUS_WMI_CREATE_DEVICE_ATTR(camera, 0644, ASUS_WMI_DEVID_CAMERA);
> >>  ASUS_WMI_CREATE_DEVICE_ATTR(cardr, 0644, ASUS_WMI_DEVID_CARDREADER);
> >>  ASUS_WMI_CREATE_DEVICE_ATTR(lid_resume, 0644, ASUS_WMI_DEVID_LID_RESUME);
> >> +ASUS_WMI_CREATE_DEVICE_ATTR(als_enable, 0644, ASUS_WMI_DEVID_ALS_ENABLE);
> >>
> >>  static ssize_t store_cpufv(struct device *dev, struct device_attribute *attr,
> >>                         const char *buf, size_t count)
> >> @@ -1756,6 +1758,7 @@ static struct attribute *platform_attributes[] = {
> >>      &dev_attr_cardr.attr,
> >>      &dev_attr_touchpad.attr,
> >>      &dev_attr_lid_resume.attr,
> >> +    &dev_attr_als_enable.attr,
> >>      NULL
> >>  };
> >>
> >> @@ -1776,6 +1779,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
> >>              devid = ASUS_WMI_DEVID_TOUCHPAD;
> >>      else if (attr == &dev_attr_lid_resume.attr)
> >>              devid = ASUS_WMI_DEVID_LID_RESUME;
> >> +    else if (attr == &dev_attr_als_enable.attr)
> >> +            devid = ASUS_WMI_DEVID_ALS_ENABLE;
> >>
> >>      if (devid != -1)
> >>              ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
> >> --
> >> 2.5.0
> >>
> >>
> >
>
>
> --
> Regards,
> Oleksij
>



-- 
Corentin Chary
http://xf.iksaif.net

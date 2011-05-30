From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] acer-wmi: schedule threeg and interface sysfs for feature removal
Date: Mon, 30 May 2011 09:47:00 +0200
Message-ID: <201105300947.01009.trenn@suse.de>
References: <1306714900-26916-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42076 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755837Ab1E3HrE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 May 2011 03:47:04 -0400
In-Reply-To: <1306714900-26916-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>

On Monday, May 30, 2011 02:21:40 AM Lee, Chun-Yi wrote:
> we can now autodetect internal 3G device and already have the threeg
> rfkill device. So, we plan to remove threeg sysfs support for it's no
> longer necessary.
> 
> We also plan to remove interface sysfs file that exposed which ACPI-WMI
> interface that was used by acer-wmi driver. It will replaced by information
> log when acer-wmi initial.
> 
> We keep it around for userspace compatibility reasons, schedule removal
> in 2012.

...

> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 1495539..7e7e668 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1396,6 +1396,8 @@ static ssize_t show_bool_threeg(struct device *dev,
>  {
>  	u32 result; \
>  	acpi_status status;
> +
> +	pr_info("This threeg sysfs will be removed in 2012.");
You could also add:
            " - used by: %s\n", current->comm);
then it's easier to identify and fix the app still making use of it.


>  	if (wmi_has_guid(WMID_GUID3))
>  		status = wmid3_get_device_status(&result,
>  				ACER_WMID3_GDS_THREEG);
> @@ -1421,6 +1423,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
>  static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
>  	char *buf)
>  {
> +	pr_info("This interface sysfs will be removed in 2012.");
Same.
>  	switch (interface->type) {
>  	case ACER_AMW0:
>  		return sprintf(buf, "AMW0\n");

   Thomas

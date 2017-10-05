From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 09:16:19 +0200
Message-ID: <20171005071619.GA25960@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:48069 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751208AbdJEHQK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 03:16:10 -0400
Content-Disposition: inline
In-Reply-To: <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Wed, Oct 04, 2017 at 05:48:38PM -0500, Mario Limonciello wrote:
> For WMI operations that are only Set or Query read or write sysfs
> attributes created by WMI vendor drivers make sense.
> 
> For other WMI operations that are run on Method, there needs to be a
> way to guarantee to userspace that the results from the method call
> belong to the data request to the method call.  Sysfs attributes don't
> work well in this scenario because two userspace processes may be
> competing at reading/writing an attribute and step on each other's
> data.

And you protect this from happening in the ioctl?  I didn't see it, but
ok, I'll take your word for it :)

> When a WMI vendor driver declares an ioctl in a file_operations object
> the WMI bus driver will create a character device that maps to those
> file operations.
> 
> That character device will correspond to this path:
> /dev/wmi/$driver
> 
> The WMI bus driver will interpret the IOCTL calls, test them for
> a valid instance and pass them on to the vendor driver to run.
> 
> This creates an implicit policy that only driver per character
> device.  If a module matches multiple GUID's, the wmi_devices
> will need to be all handled by the same wmi_driver if the same
> character device is used.

Interesting "way out" but ok, I can buy it...

> The WMI vendor drivers will be responsible for managing access to
> this character device and proper locking on it.
> 
> When a WMI vendor driver is unloaded the WMI bus driver will clean
> up the character device.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  MAINTAINERS                |  1 +
>  drivers/platform/x86/wmi.c | 67 +++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/wmi.h        |  2 ++
>  include/uapi/linux/wmi.h   | 10 +++++++
>  4 files changed, 79 insertions(+), 1 deletion(-)
>  create mode 100644 include/uapi/linux/wmi.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0357e9b1cfaf..6db1d84999bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -372,6 +372,7 @@ ACPI WMI DRIVER
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Orphan
>  F:	drivers/platform/x86/wmi.c
> +F:	include/uapi/linux/wmi.h
>  
>  AD1889 ALSA SOUND DRIVER
>  M:	Thibaut Varene <T-Bone@parisc-linux.org>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index bcb41c1c7f52..5aef052b4aab 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -38,6 +38,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> +#include <linux/miscdevice.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -69,6 +70,7 @@ struct wmi_block {
>  	struct wmi_device dev;
>  	struct list_head list;
>  	struct guid_block gblock;
> +	struct miscdevice misc_dev;
>  	struct acpi_device *acpi_device;
>  	wmi_notify_handler handler;
>  	void *handler_data;
> @@ -765,22 +767,80 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
>  	return 0;
>  }
>  
> +static long wmi_ioctl(struct file *filp, unsigned int cmd,
> +		      unsigned long arg)
> +{
> +	struct wmi_driver *wdriver;
> +	struct wmi_block *wblock;
> +	const char *driver_name;
> +	struct list_head *p;
> +	bool found = false;
> +
> +	if (_IOC_TYPE(cmd) != WMI_IOC)
> +		return -ENOTTY;
> +
> +	driver_name = filp->f_path.dentry->d_iname;
> +
> +	list_for_each(p, &wmi_block_list) {
> +		wblock = list_entry(p, struct wmi_block, list);
> +		wdriver = container_of(wblock->dev.dev.driver,
> +			struct wmi_driver, driver);
> +		if (strcmp(driver_name, wdriver->driver.name) == 0) {
> +			found = true;
> +			break;
> +		}
> +	}

You can provide an open() call to handle this type of logic for you, so
you don't have to do it on every ioctl() call, but I guess it's not
really a big deal, right?

> +	if (!found ||
> +	    !wdriver->file_operations ||
> +	    !wdriver->file_operations->unlocked_ioctl)
> +		return -ENODEV;

Shouldn't you check for unlocked_ioctl() already?  No need to check it
here, right?

And if you are only passing down unlocked_ioctl, there's no need for a
whole empty file_operations structure in the driver, right?  Just have
an ioctl callback to make things smaller and simpler to understand.

> +	/* make sure we're not calling a higher instance */
> +	if (_IOC_NR(cmd) > wblock->gblock.instance_count)
> +		return -EINVAL;

What exactly does this protect from?

> +	/* driver wants a character device made */
> +	if (wdriver->file_operations) {

Check for unlocked_ioctl here, actually, drop the file_operations
entirely, and just have that one callback.

> +		buf = kmalloc(strlen(wdriver->driver.name) + 4, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;

No unwinding of other logic needed?

> +		strcpy(buf, "wmi/");
> +		strcpy(buf + 4, wdriver->driver.name);
> +		wblock->misc_dev.minor = MISC_DYNAMIC_MINOR;
> +		wblock->misc_dev.name = buf;
> +		wblock->misc_dev.fops = &wmi_fops;
> +		ret = misc_register(&wblock->misc_dev);
> +		if (ret) {
> +			dev_warn(dev, "failed to register char dev: %d", ret);
> +			kfree(buf);

Again, no unwinding needed?  Error message value returned?

> +		}
> +	}
> +
>  	if (wdriver->probe) {
>  		ret = wdriver->probe(dev_to_wdev(dev));
>  		if (ret != 0 && ACPI_FAILURE(wmi_method_enable(wblock, 0)))
>  			dev_warn(dev, "failed to disable device\n");
>  	}
> -
>  	return ret;
>  }
>  
> @@ -791,6 +851,11 @@ static int wmi_dev_remove(struct device *dev)
>  		container_of(dev->driver, struct wmi_driver, driver);
>  	int ret = 0;
>  
> +	if (wdriver->file_operations) {
> +		kfree(wblock->misc_dev.name);
> +		misc_deregister(&wblock->misc_dev);

Unregister before freeing the device name, right?

> --- /dev/null
> +++ b/include/uapi/linux/wmi.h
> @@ -0,0 +1,10 @@
> +#ifndef _UAPI_LINUX_WMI_H
> +#define _UAPI_LINUX_WMI_H
> +
> +#define WMI_IOC 'W'
> +#define WMI_IO(instance)	_IO(WMI_IOC, instance)
> +#define WMI_IOR(instance)	_IOR(WMI_IOC, instance, void*)
> +#define WMI_IOW(instance)	_IOW(WMI_IOC, instance, void*)
> +#define WMI_IOWR(instance)	_IOWR(WMI_IOC, instance, void*)

Ugh, void *, this is going to be "fun"...

My comments on just how fun is left for the actual driver that attempted
to implement these...

greg k-h

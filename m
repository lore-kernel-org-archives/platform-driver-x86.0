From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Wed, 4 Oct 2017 19:33:57 -0700
Message-ID: <20171005023357.GG25018@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46195 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751234AbdJECeA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 22:34:00 -0400
Content-Disposition: inline
In-Reply-To: <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

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
> 
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
> 
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
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
...
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

A bit of a nitpic, but the "found" variable isn't necessary. The wdriver
pointer is sufficient:

		if (strcmp(driver_name, wdriver->driver.name) == 0)
			break;
		wdriver = NULL;

> +	if (!found ||

	if (wdriver || ...

And you save a local variable and a couple lines.

...

>  static int wmi_dev_probe(struct device *dev)
>  {
>  	struct wmi_block *wblock = dev_to_wblock(dev);
>  	struct wmi_driver *wdriver =
>  		container_of(dev->driver, struct wmi_driver, driver);
>  	int ret = 0;
> +	char *buf;
>  
>  	if (ACPI_FAILURE(wmi_method_enable(wblock, 1)))
>  		dev_warn(dev, "failed to enable device -- probing anyway\n");
>  
> +	/* driver wants a character device made */
> +	if (wdriver->file_operations) {
> +		buf = kmalloc(strlen(wdriver->driver.name) + 4, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +		strcpy(buf, "wmi/");
> +		strcpy(buf + 4, wdriver->driver.name);

sprintf(buf, "wmi/%s", wdriver->driver.name)

-- 
Darren Hart
VMware Open Source Technology Center

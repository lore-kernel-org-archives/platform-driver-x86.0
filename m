From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 09:33:24 +0200
Message-ID: <20171005073324.GC25960@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58323 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751209AbdJEHdP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 03:33:15 -0400
Content-Disposition: inline
In-Reply-To: <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Wed, Oct 04, 2017 at 05:48:39PM -0500, Mario Limonciello wrote:
> +static long dell_smbios_wmi_ioctl(struct file *filp, unsigned int cmd,
> +	unsigned long arg)
> +{
> +	void __user *p = (void __user *) arg;
> +	struct wmi_smbios_ioctl *input;
> +	struct wmi_smbios_priv *priv;
> +	struct wmi_device *wdev;
> +	size_t ioctl_size;
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	/* we only operate on first instance */
> +	case DELL_WMI_SMBIOS_CMD:
> +		wdev = get_first_wmi_device();
> +		if (!wdev) {
> +			pr_err("No WMI devices bound\n");

dev_err(), you are a driver, never use "raw" pr_ calls.

> +			return -ENODEV;
> +		}
> +		ioctl_size = sizeof(struct wmi_smbios_ioctl);
> +		priv = dev_get_drvdata(&wdev->dev);
> +		input = kmalloc(ioctl_size, GFP_KERNEL);
> +		if (!input)
> +			return -ENOMEM;
> +		mutex_lock(&wmi_mutex);
> +		if (!access_ok(VERIFY_READ, p, ioctl_size)) {

Hm, any time I see an access_ok() call, I get scared.  You should almost
never need to make that call if you are using the correct kernel apis.

> +			pr_err("Unsafe userspace pointer passed\n");

dev_err().

> +			return -EFAULT;

Memory leak!


> +		}
> +		if (copy_from_user(input, p, ioctl_size)) {
> +			ret = -EFAULT;

So, why did you call access_ok() followed by copy_from_user()?
copy_from/to() handle all of that for you automatically.

> +			goto fail_smbios_cmd;
> +		}
> +		if (input->length != priv->buffer_size) {
> +			pr_err("Got buffer size %d expected %d\n",
> +				input->length, priv->buffer_size);

length is user provided, it can be whatever anyone sets it to.  I don't
understand this error.

> +			ret = -EINVAL;
> +			goto fail_smbios_cmd;
> +		}
> +		if (!access_ok(VERIFY_WRITE, input->buf, priv->buffer_size)) {
> +			pr_err("Unsafe userspace pointer passed\n");

Again, don't need this.

> +			ret = -EFAULT;
> +			goto fail_smbios_cmd;
> +		}
> +		if (copy_from_user(priv->buf, input->buf, priv->buffer_size)) {

Wait, input->buf is a user pointer?  Ick, see my previous email about
your crazy api here being a mess.  This should not be needed.

And as you "know" the buffer size already, why do you have userspace
specify it?  What good is it?

> +			ret = -EFAULT;
> +			goto fail_smbios_cmd;
> +		}
> +		ret = run_smbios_call(wdev);

No other checking of the values in the structure?  You just "trust"
userspace to get it all right?  Hah!

> +		if (ret != 0)
> +			goto fail_smbios_cmd;

You didn't run this through checkpatch :(


> +		if (copy_to_user(input->buf, priv->buf, priv->buffer_size))
> +			ret = -EFAULT;
> +fail_smbios_cmd:
> +		kfree(input);
> +		mutex_unlock(&wmi_mutex);
> +		break;
> +	default:
> +		pr_err("unsupported ioctl: %d.\n", cmd);
> +		ret = -ENOIOCTLCMD;
> +	}
> +	return ret;
> +}
> +
> +static ssize_t buffer_size_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct wmi_smbios_priv *priv = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%d\n", priv->buffer_size);
> +}
> +static DEVICE_ATTR_RO(buffer_size);
> +
> +static struct attribute *smbios_wmi_attrs[] = {
> +	&dev_attr_buffer_size.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group smbios_wmi_attribute_group = {
> +	.attrs = smbios_wmi_attrs,
> +};
> +
>  static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  {
>  	struct wmi_smbios_priv *priv;
> @@ -127,6 +209,11 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  	if (!priv->buf)
>  		return -ENOMEM;
>  
> +	ret = sysfs_create_group(&wdev->dev.kobj,
> +				 &smbios_wmi_attribute_group);

Hint, if a driver ever makes a call to sysfs_*(), something is wrong, it
should never be needed.

Also, you just raced with userspace and lost :(

There is a way to fix all of this, in a simple way, I'll leave that as
an exercise for the reader, I've reviewed enough of this code for
today...

> +static const struct file_operations dell_smbios_wmi_fops = {
> +	.owner		= THIS_MODULE,

And who uses that field?  Hint, no one is, which is another issue that I
forgot to review in your previous patch where you use this structure.
What is protecting this module from being unloaded while the ioctl call
is running?  (hint, nothing...)

I need more coffee...

greg k-h

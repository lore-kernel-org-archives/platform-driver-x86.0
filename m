From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce
 character device for userspace
Date: Tue, 3 Oct 2017 11:26:11 +0200
Message-ID: <20171003092611.GC13295@kroah.com>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53767 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751195AbdJCJ0C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Oct 2017 05:26:02 -0400
Content-Disposition: inline
In-Reply-To: <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com

On Wed, Sep 27, 2017 at 11:02:17PM -0500, Mario Limonciello wrote:
> +static int dell_wmi_smbios_open(struct inode *inode, struct file *file)
> +{
> +	return nonseekable_open(inode, file);
> +}
> +
> +static int dell_wmi_smbios_release(struct inode *inode, struct file *file)
> +{
> +	return 0;
> +}

Why even declare an open/release if you don't do anything with them?
Just leave them empty.

> +static long dell_wmi_smbios_ioctl(struct file *filp, unsigned int cmd,
> +	unsigned long arg)
> +{
> +	void __user *p = (void __user *) arg;
> +	size_t size;
> +	int ret = 0;
> +
> +	if (_IOC_TYPE(cmd) != DELL_WMI_SMBIOS_IOC)
> +		return -ENOTTY;
> +
> +	switch (cmd) {
> +	case DELL_WMI_SMBIOS_CALL_CMD:
> +		size = sizeof(struct wmi_calling_interface_buffer);
> +		mutex_lock(&buffer_mutex);
> +		if (copy_from_user(devfs_buffer, p, size)) {
> +			ret = -EFAULT;
> +			goto fail_smbios_cmd;
> +		}
> +		ret = run_wmi_smbios_call(devfs_buffer);

You _are_ checking that your structures are valid here, right?  I didn't
see you really were, so I'll let you go audit your code paths for the
next set of patches.

But really, ugh, this seems horrible.  It's a huge vague data blob going
both ways, this feels ripe for abuse and other bad things.  Do you have
a working userspace implementation for all of this to publish at the
same time?

thanks,

greg k-h

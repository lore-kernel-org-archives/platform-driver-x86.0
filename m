From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interface
 for drivers
Date: Fri, 20 Oct 2017 15:22:42 +0200
Message-ID: <20171020132242.GB23973@kroah.com>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34831 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750736AbdJTNWe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2017 09:22:34 -0400
Content-Disposition: inline
In-Reply-To: <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Thu, Oct 19, 2017 at 12:50:16PM -0500, Mario Limonciello wrote:
> +static ssize_t wmi_char_read(struct file *filp, char __user *buffer,
> +	size_t length, loff_t *offset)
> +{
> +	struct wmi_block *wblock = filp->private_data;
> +	size_t count;
> +
> +	if (*offset != 0)
> +		return 0;
> +
> +	count = sizeof(wblock->req_buf_size);
> +	count = length < count ? length : count;
> +
> +	if (copy_to_user(buffer, &wblock->req_buf_size, count))
> +		return -EFAULT;
> +
> +	*offset = count;
> +	return count;

simple_read_from_buffer()?  Library functions are your friend :)

thanks,

greg k-h

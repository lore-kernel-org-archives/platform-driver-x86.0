From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v6 13/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Tue, 10 Oct 2017 13:04:20 +0200
Message-ID: <20171010110420.GA16994@kroah.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35875 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755134AbdJJLEL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 07:04:11 -0400
Content-Disposition: inline
In-Reply-To: <897883f9b8c45dc2cb24de1bb4642513734852d3.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Mon, Oct 09, 2017 at 05:51:51PM -0500, Mario Limonciello wrote:
> +static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> +{
> +	struct wmi_driver *wdriver = NULL;
> +	struct wmi_block *wblock = NULL;
> +	const char *driver_name;
> +	struct list_head *p;
> +	int ret;
> +
> +	if (_IOC_TYPE(cmd) != WMI_IOC)
> +		return -ENOTTY;
> +
> +	driver_name = filp->f_path.dentry->d_iname;
> +
> +	list_for_each(p, &wmi_block_list) {

No locking while walking the list, you are brave :(

From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v6 14/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Tue, 10 Oct 2017 15:59:20 +0200
Message-ID: <20171010135920.GD8662@kroah.com>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <411980beb5697e312145ef268516f4cc7c585b8f.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35813 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755688AbdJJN7L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 09:59:11 -0400
Content-Disposition: inline
In-Reply-To: <411980beb5697e312145ef268516f4cc7c585b8f.1507589249.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Mon, Oct 09, 2017 at 05:51:52PM -0500, Mario Limonciello wrote:
> +	ret = device_create_file(&wdev->dev, &priv->req_buf_size_attr);
> +	if (ret)
> +		goto fail_create_sysfs;

Why isn't the "WMI core" creating this sysfs file?  Why have per-driver
sysfs files, making all of the different apis totally different?  It's a
"common" attribute that they are all going to have to provide, right?

That way you also don't race with userspace :)

thanks,

greg k-h

From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interface
 for drivers
Date: Fri, 20 Oct 2017 15:21:38 +0200
Message-ID: <20171020132138.GA23973@kroah.com>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47113 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751695AbdJTNVa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2017 09:21:30 -0400
Content-Disposition: inline
In-Reply-To: <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Thu, Oct 19, 2017 at 12:50:16PM -0500, Mario Limonciello wrote:
> +	wblock = container_of(wdev, struct wmi_block, dev);
> +	if (!wblock)
> +		return -ENODEV;

How can container_of() ever return NULL?  If so, you have a very odd
memory layout...

> +	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
> +		wdriver = container_of(wblock->dev.dev.driver,
> +					struct wmi_driver, driver);
> +		if (!wdriver)
> +			continue;

Same here.  And other places in this file.

thanks,

greg k-h

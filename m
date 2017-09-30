From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 6/8] platform/x86: dell-wmi-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Fri, 29 Sep 2017 19:10:59 -0700
Message-ID: <20170930021059.GE13307@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <64094c86a6083c3d4c34d1f005e8a71d07b61240.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:54864 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752639AbdI3CLC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2017 22:11:02 -0400
Content-Disposition: inline
In-Reply-To: <64094c86a6083c3d4c34d1f005e8a71d07b61240.1506571188.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com

On Wed, Sep 27, 2017 at 11:02:18PM -0500, Mario Limonciello wrote:
> Currently userspace tools can access system tokens via the dcdbas
> kernel module and a SMI call that will cause the platform to execute
> SMM code.
> 
> With a goal in mind of deprecating the dcdbas kernel module a different
> method for accessing these tokens from userspace needs to be created.
> 
> This is intentionally marked to only be readable as root as it can
> contain sensitive information about the platform's configuration.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
...
> +static ssize_t tokens_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	size_t off = 0;
> +	int i;
> +
> +	for (i = 0; i < da_num_tokens; i++) {
> +		if (off > PAGE_SIZE)
> +			break;
> +		off += scnprintf(buf+off, PAGE_SIZE-off, "%04x\t%04x\t%04x\n",

Minor Coding Style nit - spaces around binary operators: 3.1) Spaces

-- 
Darren Hart
VMware Open Source Technology Center

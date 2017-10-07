From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v5 08/14] platform/x86: dell-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Sat, 7 Oct 2017 08:54:21 +0200
Message-ID: <20171007065421.GA20756@kroah.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <f8c1a8f8f04773f54c37eb14614cba88cbd7cab9.1507350554.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59467 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751445AbdJGGyN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 02:54:13 -0400
Content-Disposition: inline
In-Reply-To: <f8c1a8f8f04773f54c37eb14614cba88cbd7cab9.1507350554.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Fri, Oct 06, 2017 at 11:59:52PM -0500, Mario Limonciello wrote:
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
> MAINTAINERS was missing for this driver.  Add myself and Pali to
> maintainers list for it.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  .../ABI/testing/sysfs-platform-dell-smbios         | 16 ++++++
>  MAINTAINERS                                        |  7 +++
>  drivers/platform/x86/dell-smbios.c                 | 64 ++++++++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-smbios b/Documentation/ABI/testing/sysfs-platform-dell-smbios
> new file mode 100644
> index 000000000000..d97f4bd5bd91
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-dell-smbios
> @@ -0,0 +1,16 @@
> +What:		/sys/devices/platform/<platform>/tokens
> +Date:		November 2017
> +KernelVersion:	4.15
> +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> +Description:
> +		A read-only description of Dell platform tokens
> +		available on the machine.
> +
> +		The tokens will be displayed in the following
> +		machine readable format with each token on a
> +		new line:
> +
> +		ID	Location	value
> +
> +		For example token:
> +		5	5	3

That's more than "one value per file" which is what sysfs requires, so
this isn't acceptable, sorry.

> +static ssize_t tokens_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	size_t off = 0;
> +	int to_print;
> +	int i;
> +
> +	to_print = min(da_num_tokens, (int)(PAGE_SIZE - 1) / 15);
> +	for (i = 0; i < to_print; i++) {
> +		off += scnprintf(buf+off, PAGE_SIZE-off, "%04x\t%04x\t%04x\n",
> +		da_tokens[i].tokenID, da_tokens[i].location,
> +		da_tokens[i].value);

Huge hint, if you are checking for the max size of the buffer for sysfs,
something is really wrong, and you need to redo your design.

thanks,

greg k-h

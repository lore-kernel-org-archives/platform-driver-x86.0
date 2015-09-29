From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] platform: acer-wmi: update notice about deprecated user
 interface
Date: Tue, 29 Sep 2015 17:50:32 +0800
Message-ID: <20150929095032.GF2115@linux-rxt1.site>
References: <1443509198-11655-1-git-send-email-martink@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:56729 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933869AbbI2Juo (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Tue, 29 Sep 2015 05:50:44 -0400
Content-Disposition: inline
In-Reply-To: <1443509198-11655-1-git-send-email-martink@posteo.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Martin Kepplinger <martink@posteo.de>
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Martin, 

On Tue, Sep 29, 2015 at 08:46:38AM +0200, Martin Kepplinger wrote:
> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
> This just looks odd in the logs. Feel free to ignore it or act on it
> differently ;)
> 
> 

Thanks for your patch and it reminds me to remove those interfaces in acer-wmi.
Please let me check and I am thinking direct remove those interfaces.


Thanks a lot!
Joey Lee

>  drivers/platform/x86/acer-wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index d773b9d..43d992e 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1671,7 +1671,7 @@ static ssize_t show_bool_threeg(struct device *dev,
>  	u32 result; \
>  	acpi_status status;
>  
> -	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
> +	pr_info("This threeg sysfs will be removed in 2016 - used by: %s\n",
>  		current->comm);
>  	status = get_u32(&result, ACER_CAP_THREEG);
>  	if (ACPI_SUCCESS(status))
> @@ -1684,7 +1684,7 @@ static ssize_t set_bool_threeg(struct device *dev,
>  {
>  	u32 tmp = simple_strtoul(buf, NULL, 10);
>  	acpi_status status = set_u32(tmp, ACER_CAP_THREEG);
> -	pr_info("This threeg sysfs will be removed in 2014 - used by: %s\n",
> +	pr_info("This threeg sysfs will be removed in 2016 - used by: %s\n",
>  		current->comm);
>  	if (ACPI_FAILURE(status))
>  		return -EINVAL;
> @@ -1696,7 +1696,7 @@ static DEVICE_ATTR(threeg, S_IRUGO | S_IWUSR, show_bool_threeg,
>  static ssize_t show_interface(struct device *dev, struct device_attribute *attr,
>  	char *buf)
>  {
> -	pr_info("This interface sysfs will be removed in 2014 - used by: %s\n",
> +	pr_info("This interface sysfs will be removed in 2016 - used by: %s\n",
>  		current->comm);
>  	switch (interface->type) {
>  	case ACER_AMW0:
> -- 
> 2.1.4
> 

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] platform/x86: surface3-wmi: Balance locking on error
 path
Date: Wed, 14 Dec 2016 22:38:17 -0800
Message-ID: <20161215063817.GB13207@f23x64.localdomain>
References: <20161215012458.501-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44137 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933125AbcLOGiZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Dec 2016 01:38:25 -0500
Content-Disposition: inline
In-Reply-To: <20161215012458.501-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>

On Thu, Dec 15, 2016 at 03:24:58AM +0200, Andy Shevchenko wrote:
> There is a possibility that lock will be left acquired.
> Consolidate error path under out_free_unlock label.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/surface3-wmi.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/surface3-wmi.c b/drivers/platform/x86/surface3-wmi.c
> index 5553b2b85e0a..ed7a3b77a0cc 100644
> --- a/drivers/platform/x86/surface3-wmi.c
> +++ b/drivers/platform/x86/surface3-wmi.c
> @@ -60,10 +60,10 @@ static DEFINE_MUTEX(s3_wmi_lock);
>  
>  static int s3_wmi_query_block(const char *guid, int instance, int *ret)
>  {
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	acpi_status status;
>  	union acpi_object *obj;
> -
> -	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	int error = 0;

I'd prefer ret throughout for consistency with the kernel in general, but as
error is used already, it's better to be self-consistent.

>  
>  	mutex_lock(&s3_wmi_lock);
>  	status = wmi_query_block(guid, instance, &output);
> @@ -77,13 +77,14 @@ static int s3_wmi_query_block(const char *guid, int instance, int *ret)
>  			       obj->type == ACPI_TYPE_BUFFER ?
>  						obj->buffer.length : 0);
>  		}
> -		kfree(obj);
> -		return -EINVAL;
> +		error = -EINVAL;
> +		goto out_free_unlock;
>  	}
>  	*ret = obj->integer.value;
> +out_free_unlock:

Please lead labels with a space:

 out_free_unlock:

This makes diffs a bit nicer as the label isn't used in lieu of the function
name. This is also consistent with the rest of the file.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center

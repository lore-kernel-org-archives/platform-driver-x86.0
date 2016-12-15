From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 1/1] platform/x86: surface3-wmi: Balance locking on error
 path
Date: Thu, 15 Dec 2016 09:14:10 +0100
Message-ID: <20161215081410.GB31881@mail.corp.redhat.com>
References: <20161215012458.501-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41908 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757445AbcLOIOk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Dec 2016 03:14:40 -0500
Content-Disposition: inline
In-Reply-To: <20161215012458.501-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>

On Dec 15 2016 or thereabouts, Andy Shevchenko wrote:
> There is a possibility that lock will be left acquired.
> Consolidate error path under out_free_unlock label.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

With Darren's remarks, the patch is:
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Sorry for missing this out in the first place.

Cheers,
Benjamin

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
>  	kfree(obj);
>  	mutex_unlock(&s3_wmi_lock);
> -	return 0;
> +	return error;
>  }
>  
>  static inline int s3_wmi_query_lid(int *ret)
> -- 
> 2.11.0
> 

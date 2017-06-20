From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] acer-wmi: Using zero as the first WMI instance number
Date: Tue, 20 Jun 2017 18:48:58 +0200
Message-ID: <20170620164851.GA32699@pali>
References: <20170620090623.18364-1-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170620090623.18364-1-jlee@suse.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 20 June 2017 17:06:23 Lee, Chun-Yi wrote:
> Pali Rohár found that there have some wmi query/evaluation
> code that they used 'one' as the first WMI instance number.
> But the number is indexed from zero that it's must less than
> the instance_count in _WDG.
> 
> This patch changes those instance number from one to zero.
> 
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Pali Rohár <pali.rohar@gmail.com> 
> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>

Looks good, Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> ---
>  drivers/platform/x86/acer-wmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 79fa5ab..ef420b6 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -700,7 +700,7 @@ struct acpi_buffer *result)
>  	input.length = sizeof(struct wmab_args);
>  	input.pointer = (u8 *)regbuf;
>  
> -	status = wmi_evaluate_method(AMW0_GUID1, 1, 1, &input, result);
> +	status = wmi_evaluate_method(AMW0_GUID1, 0, 1, &input, result);
>  
>  	return status;
>  }
> @@ -965,7 +965,7 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
>  	u32 tmp = 0;
>  	acpi_status status;
>  
> -	status = wmi_evaluate_method(WMID_GUID1, 1, method_id, &input, &result);
> +	status = wmi_evaluate_method(WMID_GUID1, 0, method_id, &input, &result);
>  
>  	if (ACPI_FAILURE(status))
>  		return status;
> @@ -1275,7 +1275,7 @@ static acpi_status __init WMID_set_capabilities(void)
>  	acpi_status status;
>  	u32 devices;
>  
> -	status = wmi_query_block(WMID_GUID2, 1, &out);
> +	status = wmi_query_block(WMID_GUID2, 0, &out);
>  	if (ACPI_FAILURE(status))
>  		return status;
>  
> @@ -2018,7 +2018,7 @@ static u32 get_wmid_devices(void)
>  	acpi_status status;
>  	u32 devices = 0;
>  
> -	status = wmi_query_block(WMID_GUID2, 1, &out);
> +	status = wmi_query_block(WMID_GUID2, 0, &out);
>  	if (ACPI_FAILURE(status))
>  		return 0;
>  

-- 
Pali Rohár
pali.rohar@gmail.com

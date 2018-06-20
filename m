From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: wmi: Do not mix pages and kmalloc
Date: Wed, 20 Jun 2018 16:37:36 -0700
Message-ID: <20180620233736.GA3250@fury>
References: <20180620213141.GA8957@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180620213141.GA8957@beast>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Mihai =?utf-8?B?RG9uyJt1?= <mihai.dontu@gmail.com>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 20, 2018 at 02:31:41PM -0700, Kees Cook wrote:
> The probe handler_data was being allocated with __get_free_pages()
> for no reason I could find. The error path was using kfree(). Since

v4 of Mario's series used kmalloc:
https://patchwork.kernel.org/patch/9985827/

This was changed in v10 to use __get_free_pages:
https://patchwork.kernel.org/patch/10018023/

But... I'm not finding the discussion that led to this change.... Mario,
do you recall? Something about contiguous memory? We had a similar
discussion on an earlier series:

https://patchwork.kernel.org/patch/9975277/


> other things are happily using kmalloc() in the probe path, switch to
> kmalloc() entirely. This fixes the error path mismatch and will avoid
> issues with CONFIG_HARDENED_USERCOPY_PAGESPAN=y.
> 
> Reported-by: Mihai Donțu <mihai.dontu@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/platform/x86/wmi.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 8e3d0146ff8c..04791ea5d97b 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -895,7 +895,6 @@ static int wmi_dev_probe(struct device *dev)
>  	struct wmi_driver *wdriver =
>  		container_of(dev->driver, struct wmi_driver, driver);
>  	int ret = 0;
> -	int count;
>  	char *buf;
>  
>  	if (ACPI_FAILURE(wmi_method_enable(wblock, 1)))
> @@ -917,9 +916,8 @@ static int wmi_dev_probe(struct device *dev)
>  			goto probe_failure;
>  		}
>  
> -		count = get_order(wblock->req_buf_size);
> -		wblock->handler_data = (void *)__get_free_pages(GFP_KERNEL,
> -								count);
> +		wblock->handler_data = kmalloc(wblock->req_buf_size,
> +					       GFP_KERNEL);
>  		if (!wblock->handler_data) {
>  			ret = -ENOMEM;
>  			goto probe_failure;
> @@ -964,8 +962,7 @@ static int wmi_dev_remove(struct device *dev)
>  	if (wdriver->filter_callback) {
>  		misc_deregister(&wblock->char_dev);
>  		kfree(wblock->char_dev.name);
> -		free_pages((unsigned long)wblock->handler_data,
> -			   get_order(wblock->req_buf_size));
> +		kfree(wblock->handler_data);
>  	}
>  
>  	if (wdriver->remove)
> -- 
> 2.17.1
> 
> 
> -- 
> Kees Cook
> Pixel Security
> 

-- 
Darren Hart
VMware Open Source Technology Center

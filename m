From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] compal-laptop: correct invalid hwmon name
Date: Wed, 9 Jul 2014 13:26:54 -0700
Message-ID: <20140709202654.GA25846@roeck-us.net>
References: <53BD942A.2070106@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53BD942A.2070106@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roald Frederickx <roald.frederickx@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 09, 2014 at 09:12:42PM +0200, Roald Frederickx wrote:
> From: Roald Frederickx <roald.frederickx@gmail.com>
> 
> Change the name of the hwmon interface from "compal-laptop" to
> "compal". A dash is an invalid character for a hwmon name and caused
> the call to hwmon_device_register_with_groups() to fail.
> 
> Signed-off-by: Roald Frederickx <roald.frederickx@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> diff --git a/drivers/platform/x86/compal-laptop.c
> b/drivers/platform/x86/compal-laptop.c
> index 7297df2..26bfd7b 100644
> --- a/drivers/platform/x86/compal-laptop.c
> +++ b/drivers/platform/x86/compal-laptop.c
> @@ -1028,7 +1028,7 @@ static int compal_probe(struct platform_device *pdev)
>  		return err;
> 
>  	hwmon_dev = hwmon_device_register_with_groups(&pdev->dev,
> -						      DRIVER_NAME, data,
> +						      "compal", data,
>  						      compal_hwmon_groups);
>  	if (IS_ERR(hwmon_dev)) {
>  		err = PTR_ERR(hwmon_dev);
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
> 

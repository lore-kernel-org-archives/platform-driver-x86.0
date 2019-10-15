From: ayman.bagabas@gmail.com
Subject: Re: [PATCH] platform/x86: huawei-wmi: Fix misuse of strcmp()
 function
Date: Tue, 15 Oct 2019 15:08:57 -0400
Message-ID: <336c7fa6eebdbada759c9ad30a0a6b85af6f6c58.camel@gmail.com>
References: <20191015182549.GA13772@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191015182549.GA13772@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Gustavo,

On Tue, 2019-10-15 at 13:25 -0500, Gustavo A. R. Silva wrote:
> Comparing the result of strcmp directly with 1 may cause it to be
> misinterpreted. Note that strcmp may return an integer besides -1,
> 0, or 1.
> 
> Fix this by returning -ENODEV only when strcmp() returns a value
> other than 0.
> 
> Addresses-Coverity-ID: 1487035 ("Misuse of memcmp-style function")
> Fixes: b7527d0f4502 ("platform/x86: huawei-wmi: Add battery charging
> thresholds")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/platform/x86/huawei-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c
> b/drivers/platform/x86/huawei-wmi.c
> index 6720f78c60c2..b43f76acbfea 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -470,7 +470,7 @@ static DEVICE_ATTR_RW(charge_control_thresholds);
>  static int huawei_wmi_battery_add(struct power_supply *battery)
>  {
>  	/* Huawei laptops come with one battery only */
> -	if (strcmp(battery->desc->name, "BAT") != 1)

Note we don't have a battery number in BATx, strcmp would return 1 if
battery->desc->name is "BAT0" or any one digit. This is a desired
behavior where some Huawei laptops identify the first battery as "BAT1"
and this would match if name is greater than "BAT" by one digit.

Maybe strcmp(battery->desc->name, "BAT") < 0 is a better way to go.

> +	if (strcmp(battery->desc->name, "BAT"))
>  		return -ENODEV;

Now this would always return ENODEV.

Thank you,
Ayman

>  
>  	device_create_file(&battery->dev,
> &dev_attr_charge_control_start_threshold);

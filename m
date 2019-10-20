From: ayman.bagabas@gmail.com
Subject: Re: [PATCH 2/2] platform/x86: huawei-wmi: No need to check for
 battery name
Date: Sat, 19 Oct 2019 20:33:14 -0400
Message-ID: <482708553d5dc6cec2d4513391d81a22928fd4b2.camel@gmail.com>
References: <20191018224221.15495-1-ayman.bagabas@gmail.com>
         <20191018224221.15495-2-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191018224221.15495-2-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Takashi Iwai <tiwai@suse.de>, Mattias Jacobsson <2pi@mok.nu>, Dan Carpenter <dan.carpenter@oracle.com>, kbuild test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2019-10-18 at 18:42 -0400, Ayman Bagabas wrote:
> No need to check for battery name, we already check if the WMI
> function is
> available in huawei_wmi_battery_setup.

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>

Thank you,
Ayman
> ---
>  drivers/platform/x86/huawei-wmi.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c
> b/drivers/platform/x86/huawei-wmi.c
> index 26041d44286a..7373a65a61d3 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -471,10 +471,6 @@ static
> DEVICE_ATTR_RW(charge_control_thresholds);
>  
>  static int huawei_wmi_battery_add(struct power_supply *battery)
>  {
> -	/* Huawei laptops come with one battery only */
> -	if (strcmp(battery->desc->name, "BAT") != 1)
> -		return -ENODEV;
> -
>  	device_create_file(&battery->dev,
> &dev_attr_charge_control_start_threshold);
>  	device_create_file(&battery->dev,
> &dev_attr_charge_control_end_threshold);
>  

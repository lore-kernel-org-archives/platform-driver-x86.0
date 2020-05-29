From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 01/11] acpi: thermal: Fix error handling in the
 register function
Date: Fri, 29 May 2020 07:50:13 -0700
Message-ID: <20200529145013.GA125062@roeck-us.net>
References: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
 <20200528192051.28034-1-andrzej.p@collabora.com>
 <20200528192051.28034-2-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200528192051.28034-2-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 28, 2020 at 09:20:41PM +0200, Andrzej Pietrasiewicz wrote:
> The acpi_thermal_register_thermal_zone() is missing any error handling.
> This needs to be fixed.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/acpi/thermal.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
> index 19067a5e5293..6de8066ca1e7 100644
> --- a/drivers/acpi/thermal.c
> +++ b/drivers/acpi/thermal.c
> @@ -901,23 +901,35 @@ static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz)
>  	result = sysfs_create_link(&tz->device->dev.kobj,
>  				   &tz->thermal_zone->device.kobj, "thermal_zone");
>  	if (result)
> -		return result;
> +		goto unregister_tzd;
>  
>  	result = sysfs_create_link(&tz->thermal_zone->device.kobj,
>  				   &tz->device->dev.kobj, "device");
>  	if (result)
> -		return result;
> +		goto remove_tz_link;
>  
>  	status =  acpi_bus_attach_private_data(tz->device->handle,
>  					       tz->thermal_zone);
> -	if (ACPI_FAILURE(status))
> -		return -ENODEV;
> +	if (ACPI_FAILURE(status)) {
> +		result = -ENODEV;
> +		goto remove_dev_link;
> +	}
>  
>  	tz->tz_enabled = 1;
>  
>  	dev_info(&tz->device->dev, "registered as thermal_zone%d\n",
>  		 tz->thermal_zone->id);
> +
>  	return 0;
> +
> +remove_dev_link:
> +	sysfs_remove_link(&tz->thermal_zone->device.kobj, "device");
> +remove_tz_link:
> +	sysfs_remove_link(&tz->device->dev.kobj, "thermal_zone");
> +unregister_tzd:
> +	thermal_zone_device_unregister(tz->thermal_zone);
> +
> +	return result;
>  }
>  
>  static void acpi_thermal_unregister_thermal_zone(struct acpi_thermal *tz)

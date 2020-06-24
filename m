From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4 01/11] acpi: thermal: Fix error handling in the
 register function
Date: Wed, 24 Jun 2020 10:16:07 +0200
Message-ID: <ecaae46b-5ba5-3c08-2451-34d0dba46143@samsung.com>
References: <Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
        <20200528192051.28034-1-andrzej.p@collabora.com>
        <CGME20200528192122eucas1p29d209ad5a885b31deb04dcad13f98ad5@eucas1p2.samsung.com>
        <20200528192051.28034-2-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200528192051.28034-2-andrzej.p@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org


On 5/28/20 9:20 PM, Andrzej Pietrasiewicz wrote:
> The acpi_thermal_register_thermal_zone() is missing any error handling.
> This needs to be fixed.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

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
> 

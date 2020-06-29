From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH v5 01/11] acpi: thermal: Fix error handling in the
 register function
Date: Mon, 29 Jun 2020 12:49:39 +0530
Message-ID: <CAHLCerOi-rme0p7gmPdzmMgDRkj8jVn5Skkh0d5FMVO+-BqOBA@mail.gmail.com>
References: <9cbffad6-69e4-0b33-4640-fde7c4f6a6e7@linaro.org>
 <20200626173755.26379-1-andrzej.p@collabora.com> <20200626173755.26379-2-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200626173755.26379-2-andrzej.p@collabora.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Linux PM list <linux-pm@vger.kernel.org>, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, lakml <linux-arm-kernel@lists.infradead.org>, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darr
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 26, 2020 at 11:08 PM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> The acpi_thermal_register_thermal_zone() is missing any error handling.
> This needs to be fixed.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  drivers/acpi/thermal.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
> index 19067a5e5293..6de8066ca1e7 100644
> --- a/drivers/acpi/thermal.c
> +++ b/drivers/acpi/thermal.c
> @@ -901,23 +901,35 @@ static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz)
>         result = sysfs_create_link(&tz->device->dev.kobj,
>                                    &tz->thermal_zone->device.kobj, "thermal_zone");
>         if (result)
> -               return result;
> +               goto unregister_tzd;
>
>         result = sysfs_create_link(&tz->thermal_zone->device.kobj,
>                                    &tz->device->dev.kobj, "device");
>         if (result)
> -               return result;
> +               goto remove_tz_link;
>
>         status =  acpi_bus_attach_private_data(tz->device->handle,
>                                                tz->thermal_zone);
> -       if (ACPI_FAILURE(status))
> -               return -ENODEV;
> +       if (ACPI_FAILURE(status)) {
> +               result = -ENODEV;
> +               goto remove_dev_link;
> +       }
>
>         tz->tz_enabled = 1;
>
>         dev_info(&tz->device->dev, "registered as thermal_zone%d\n",
>                  tz->thermal_zone->id);
> +
>         return 0;
> +
> +remove_dev_link:
> +       sysfs_remove_link(&tz->thermal_zone->device.kobj, "device");
> +remove_tz_link:
> +       sysfs_remove_link(&tz->device->dev.kobj, "thermal_zone");
> +unregister_tzd:
> +       thermal_zone_device_unregister(tz->thermal_zone);
> +
> +       return result;
>  }
>
>  static void acpi_thermal_unregister_thermal_zone(struct acpi_thermal *tz)
> --
> 2.17.1
>

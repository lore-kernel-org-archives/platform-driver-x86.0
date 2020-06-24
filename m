From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4 09/11] thermal: core: Stop polling DISABLED thermal
 devices
Date: Wed, 24 Jun 2020 12:02:19 +0200
Message-ID: <31d0e28b-adb3-3cf6-4cd9-ce273ba94b01@samsung.com>
References: <Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
        <20200528192051.28034-1-andrzej.p@collabora.com>
        <CGME20200528192216eucas1p19e192fbee4848c95c4077b10c46d8017@eucas1p1.samsung.com>
        <20200528192051.28034-10-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20200528192051.28034-10-andrzej.p@collabora.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org



On 5/28/20 9:20 PM, Andrzej Pietrasiewicz wrote:
> Polling DISABLED devices is not desired, as all such "disabled" devices
> are meant to be handled by userspace. This patch introduces and uses
> should_stop_polling() to decide whether the device should be polled or not.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/thermal/thermal_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 14baf0288759..e9c0b990e4a9 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -301,13 +301,22 @@ static void thermal_zone_device_set_polling(struct thermal_zone_device *tz,
>  		cancel_delayed_work(&tz->poll_queue);
>  }
>  
> +static inline bool should_stop_polling(struct thermal_zone_device *tz)
> +{
> +	return !thermal_zone_device_is_enabled(tz);
> +}
> +
>  static void monitor_thermal_zone(struct thermal_zone_device *tz)
>  {
> +	bool stop;
> +
> +	stop = should_stop_polling(tz);
> +
>  	mutex_lock(&tz->lock);
>  
> -	if (tz->passive)
> +	if (!stop && tz->passive)
>  		thermal_zone_device_set_polling(tz, tz->passive_delay);
> -	else if (tz->polling_delay)
> +	else if (!stop && tz->polling_delay)
>  		thermal_zone_device_set_polling(tz, tz->polling_delay);
>  	else
>  		thermal_zone_device_set_polling(tz, 0);
> @@ -517,6 +526,9 @@ void thermal_zone_device_update(struct thermal_zone_device *tz,
>  {
>  	int count;
>  
> +	if (should_stop_polling(tz))
> +		return;
> +
>  	if (atomic_read(&in_suspend))
>  		return;
>  
> 

From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4 03/11] thermal: Add current mode to thermal zone
 device
Date: Wed, 24 Jun 2020 11:39:09 +0200
Message-ID: <eda187b4-8b20-4fb4-bea8-84dc1fe1eee6@samsung.com>
References: <Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
        <20200528192051.28034-1-andrzej.p@collabora.com>
        <CGME20200528192153eucas1p1b0119928489e5fd22e17908d2bb0890b@eucas1p1.samsung.com>
        <20200528192051.28034-4-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20200528192051.28034-4-andrzej.p@collabora.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org


On 5/28/20 9:20 PM, Andrzej Pietrasiewicz wrote:
> Prepare for changing the place where the mode is stored: now it is in
> drivers, which might or might not implement get_mode()/set_mode() methods.
> A lot of cleanup can be done thanks to storing it in struct tzd. The
> get_mode() methods will become redundant.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  include/linux/thermal.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/thermal.h b/include/linux/thermal.h
> index 216185bb3014..5f91d7f04512 100644
> --- a/include/linux/thermal.h
> +++ b/include/linux/thermal.h
> @@ -128,6 +128,7 @@ struct thermal_cooling_device {
>   * @trip_temp_attrs:	attributes for trip points for sysfs: trip temperature
>   * @trip_type_attrs:	attributes for trip points for sysfs: trip type
>   * @trip_hyst_attrs:	attributes for trip points for sysfs: trip hysteresis
> + * @mode:		current mode of this thermal zone
>   * @devdata:	private pointer for device private data
>   * @trips:	number of trip points the thermal zone supports
>   * @trips_disabled;	bitmap for disabled trips
> @@ -170,6 +171,7 @@ struct thermal_zone_device {
>  	struct thermal_attr *trip_temp_attrs;
>  	struct thermal_attr *trip_type_attrs;
>  	struct thermal_attr *trip_hyst_attrs;
> +	enum thermal_device_mode mode;
>  	void *devdata;
>  	int trips;
>  	unsigned long trips_disabled;	/* bitmap for disabled trips */
> 

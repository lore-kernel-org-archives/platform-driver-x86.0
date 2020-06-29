From: Amit Kucheria <amit.kucheria@verdurent.com>
Subject: Re: [PATCH v7 09/11] thermal: core: Stop polling DISABLED thermal devices
Date: Mon, 29 Jun 2020 18:16:39 +0530
Message-ID: <CAHLCerNsXrkJqU5_Tw_PA8YQLGsHzDg7POrBRtvisBtJixU+CA@mail.gmail.com>
References: <20200629122925.21729-1-andrzej.p@collabora.com> <20200629122925.21729-10-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20200629122925.21729-10-andrzej.p@collabora.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Linux PM list <linux-pm@vger.kernel.org>, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, lakml <linux-arm-kernel@lists.infradead.org>, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darr
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jun 29, 2020 at 6:00 PM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> Polling DISABLED devices is not desired, as all such "disabled" devices
> are meant to be handled by userspace. This patch introduces and uses
> should_stop_polling() to decide whether the device should be polled or not.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/thermal_core.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
> index 52d136780577..e613f5c07bad 100644
> --- a/drivers/thermal/thermal_core.c
> +++ b/drivers/thermal/thermal_core.c
> @@ -301,13 +301,22 @@ static void thermal_zone_device_set_polling(struct thermal_zone_device *tz,
>                 cancel_delayed_work(&tz->poll_queue);
>  }
>
> +static inline bool should_stop_polling(struct thermal_zone_device *tz)
> +{
> +       return !thermal_zone_device_is_enabled(tz);
> +}
> +
>  static void monitor_thermal_zone(struct thermal_zone_device *tz)
>  {
> +       bool stop;
> +
> +       stop = should_stop_polling(tz);
> +
>         mutex_lock(&tz->lock);
>
> -       if (tz->passive)
> +       if (!stop && tz->passive)
>                 thermal_zone_device_set_polling(tz, tz->passive_delay);
> -       else if (tz->polling_delay)
> +       else if (!stop && tz->polling_delay)
>                 thermal_zone_device_set_polling(tz, tz->polling_delay);
>         else
>                 thermal_zone_device_set_polling(tz, 0);
> @@ -517,6 +526,9 @@ void thermal_zone_device_update(struct thermal_zone_device *tz,
>  {
>         int count;
>
> +       if (should_stop_polling(tz))
> +               return;
> +
>         if (atomic_read(&in_suspend))
>                 return;
>
> --
> 2.17.1
>

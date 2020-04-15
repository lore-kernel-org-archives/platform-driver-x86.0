From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC 7/8] thermal: of: Monitor thermal zone after enabling it
Date: Wed, 15 Apr 2020 12:18:28 +0200
Message-ID: <40316054-5e39-f1fa-81f2-bfda787d2167@samsung.com>
References: <20200407174926.23971-1-andrzej.p@collabora.com>
 <20200407174926.23971-8-andrzej.p@collabora.com>
 <CGME20200415101829eucas1p18e21324d3c39926fffc6c8b5dc52f206@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200407174926.23971-8-andrzej.p@collabora.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: "Rafael J .
 Wysocki" <rjw@rjwysocki.net>, platform-driver-x86@vger.kernel.org, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-acpi@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Ido Schimmel <idosch@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>, Peter Kaestle <peter@piie.net>, Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org, Enrico
List-Id: platform-driver-x86.vger.kernel.org


On 4/7/20 7:49 PM, Andrzej Pietrasiewicz wrote:
> thermal/of calls its own ->set_mode() method, so monitor thermal zone
> afterwards. This is needed for the DISABLED->ENABLED transition.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/thermal/of-thermal.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
> index b7621dfab17c..cf2c43ebcb78 100644
> --- a/drivers/thermal/of-thermal.c
> +++ b/drivers/thermal/of-thermal.c
> @@ -523,8 +523,11 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
>  		if (sensor_specs.np == sensor_np && id == sensor_id) {
>  			tzd = thermal_zone_of_add_sensor(child, sensor_np,
>  							 data, ops);
> -			if (!IS_ERR(tzd))
> +			if (!IS_ERR(tzd)) {
>  				tzd->ops->set_mode(tzd, THERMAL_DEVICE_ENABLED);
> +				thermal_zone_device_update(tzd,
> +						THERMAL_EVENT_UNSPECIFIED);
> +			}
>  
>  			of_node_put(sensor_specs.np);
>  			of_node_put(child);
> 

This patch is bogus/redundant, please look at ->set_mode implementation for
thermal/of drivers:

static int of_thermal_set_mode(struct thermal_zone_device *tz,
			       enum thermal_device_mode mode)
{
	struct __thermal_zone *data = tz->devdata;

	mutex_lock(&tz->lock);

	if (mode == THERMAL_DEVICE_ENABLED) {
		tz->polling_delay = data->polling_delay;
		tz->passive_delay = data->passive_delay;
	} else {
		tz->polling_delay = 0;
		tz->passive_delay = 0;
	}

	mutex_unlock(&tz->lock);

	data->mode = mode;
	thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);

	return 0;
}

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

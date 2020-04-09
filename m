From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [RFC 0/8] Stop monitoring disabled devices
Date: Thu, 9 Apr 2020 13:10:01 +0200
Message-ID: <aeec2ce8-8fb9-9353-f3dd-36a476ceeb3b@collabora.com>
References: <20200407174926.23971-1-andrzej.p@collabora.com>
 <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <2bc5a902-acde-526a-11a5-2357d899916c@linaro.org>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>, Gayatri Kammela <gayatri.kammela@intel.com>, Thomas Gleixner <tglx@lin>
List-Id: platform-driver-x86.vger.kernel.org

Hi Daniel,

W dniu 09.04.2020 o 12:29, Daniel Lezcano pisze:
> On 07/04/2020 19:49, Andrzej Pietrasiewicz wrote:
>> The current kernel behavior is to keep polling the thermal zone devices
>> regardless of their current mode. This is not desired, as all such "disabled"
>> devices are meant to be handled by userspace,> so polling them makes no sense.
> 
> Thanks for proposing these changes.
> 
> I've been (quickly) through the series and the description below. I have
> the feeling the series makes more complex while the current code which
> would deserve a cleanup.
> 
> Why not first:
> 
>   - Add a 'mode' field in the thermal zone device
>   - Kill all set/get_mode callbacks in the drivers which are duplicated code.
>   - Add a function:
> 
>   enum thermal_device_mode thermal_zone_get_mode( *tz)
>   {
> 	...
> 	if (tz->ops->get_mode)
> 		return tz->ops->get_mode();
> 
> 	return tz->mode;
>   }
> 
> 
>   int thermal_zone_set_mode(..*tz, enum thermal_device_mode mode)
>   {
> 	...
> 	if (tz->ops->set_mode)
> 		return tz->ops->set_mode(tz, mode);
> 
> 	tz->mode = mode;
> 
> 	return 0;
>   }
> 
>   static inline thermal_zone_enable(... *tz)
>   {
> 	thermal_zone_set_mode(tz, THERMAL_DEVICE_ENABLED);
>   }
> 
>   static inline thermal_zone_disable(... *tz) {
> 	thermal_zone_set_mode(tz, THERMAL_DEVICE_DISABLED);
>   }
> 
> And then when the code is consolidated, use the mode to enable/disable
> the polling and continue killing the duplicated code in of-thermal.c and
> anywhere else.
> 
> 

Thanks for feedback.

Anyone else?

Andrzej

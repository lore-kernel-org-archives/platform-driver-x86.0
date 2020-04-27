From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v3 2/2] thermal: core: Stop polling DISABLED thermal
 devices
Date: Mon, 27 Apr 2020 20:34:35 +0200
Message-ID: <da9f0547-226d-71cf-f508-f4669fb2f5c2@collabora.com>
References: <a3998ad2-19bc-0893-a10d-2bb5adf7d99f@samsung.com>
 <20200423165705.13585-1-andrzej.p@collabora.com>
 <20200423165705.13585-3-andrzej.p@collabora.com>
 <744357E9AAD1214791ACBA4B0B90926377CF60E3@SHSMSX108.ccr.corp.intel.com>
 <744357E9AAD1214791ACBA4B0B90926377CF9A10@SHSMSX108.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <744357E9AAD1214791ACBA4B0B90926377CF9A10@SHSMSX108.ccr.corp.intel.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: "Zhang, Rui" <rui.zhang@intel.com>, "'linux-pm@vger.kernel.org'" <linux-pm@vger.kernel.org>
Cc: "'Rafael J . Wysocki'" <rjw@rjwysocki.net>, 'Len Brown' <lenb@kernel.org>, 'Jiri Pirko' <jiri@mellanox.com>, 'Ido Schimmel' <idosch@mellanox.com>, "'David S . Miller'" <davem@davemloft.net>, 'Peter Kaestle' <peter@piie.net>, 'Darren Hart' <dvhart@infradead.org>, 'Andy Shevchenko' <andy@infradead.org>, 'Support Opensource' <support.opensource@diasemi.com>, 'Daniel Lezcano' <daniel.lezcano@linaro.org>, 'Amit Kucheria' <amit.kucheria@verdurent.com>, 'Shawn Guo' <shawnguo@kernel.org>, 'Sascha Hauer' <s.hauer@pengutronix.de>, 'Pengutronix Kernel Team' <kernel@pengutronix.de>, 'Fabio Estevam' <festevam@gmail.com>, 'NXP Linux Team' <linux-imx@nxp.com>, 'Heiko Stuebner' <heiko@sntech.de>, 'Orson Zhai' <orsonzhai@gmail.com>, 'Baolin Wang' <baolin.wang>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

W dniu 27.04.2020 o 16:20, Zhang, Rui pisze:
> 
> 
>> -----Original Message-----
>> From: Zhang, Rui
>> Sent: Friday, April 24, 2020 5:03 PM
>> To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>; linux-
>> pm@vger.kernel.org
>> Cc: Rafael J . Wysocki <rjw@rjwysocki.net>; Len Brown <lenb@kernel.org>;
>> Jiri Pirko <jiri@mellanox.com>; Ido Schimmel <idosch@mellanox.com>; David
>> S . Miller <davem@davemloft.net>; Peter Kaestle <peter@piie.net>; Darren
>> Hart <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
>> Support Opensource <support.opensource@diasemi.com>; Daniel Lezcano
>> <daniel.lezcano@linaro.org>; Amit Kucheria
>> <amit.kucheria@verdurent.com>; Shawn Guo <shawnguo@kernel.org>;
>> Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; NXP
>> Linux Team <linux-imx@nxp.com>; Heiko Stuebner <heiko@sntech.de>;
>> Orson Zhai <orsonzhai@gmail.com>; Baolin Wang
>> <baolin.wang7@gmail.com>; Chunyan Zhang <zhang.lyra@gmail.com>; linux-
>> acpi@vger.kernel.org; netdev@vger.kernel.org; platform-driver-
>> x86@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>> kernel@collabora.com; Barlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Subject: RE: [PATCH v3 2/2] thermal: core: Stop polling DISABLED thermal
>> devices
>>
>> Hi, Andrzej,
>>
>> Thanks for the patches. My Linux laptop was broken and won't get fixed till
>> next week, so I may lost some of the discussions previously.
>>
>>> -----Original Message-----
>>> From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>>> Sent: Friday, April 24, 2020 12:57 AM
>>> To: linux-pm@vger.kernel.org
>>> Cc: Zhang, Rui <rui.zhang@intel.com>; Rafael J . Wysocki
>>> <rjw@rjwysocki.net>; Len Brown <lenb@kernel.org>; Jiri Pirko
>>> <jiri@mellanox.com>; Ido Schimmel <idosch@mellanox.com>; David S .
>>> Miller <davem@davemloft.net>; Peter Kaestle <peter@piie.net>; Darren
>>> Hart <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
>>> Support Opensource <support.opensource@diasemi.com>; Daniel Lezcano
>>> <daniel.lezcano@linaro.org>; Amit Kucheria
>>> <amit.kucheria@verdurent.com>; Shawn Guo <shawnguo@kernel.org>;
>> Sascha
>>> Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
>>> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; NXP
>> Linux
>>> Team <linux-imx@nxp.com>; Heiko Stuebner <heiko@sntech.de>; Orson
>> Zhai
>>> <orsonzhai@gmail.com>; Baolin Wang <baolin.wang7@gmail.com>;
>> Chunyan
>>> Zhang <zhang.lyra@gmail.com>; linux- acpi@vger.kernel.org;
>>> netdev@vger.kernel.org; platform-driver- x86@vger.kernel.org;
>>> linux-arm-kernel@lists.infradead.org;
>>> kernel@collabora.com; Andrzej Pietrasiewicz <andrzej.p@collabora.com>;
>>> Barlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>>> Subject: [PATCH v3 2/2] thermal: core: Stop polling DISABLED thermal
>>> devices
>>> Importance: High
>>>
>>> Polling DISABLED devices is not desired, as all such "disabled"
>>> devices are meant to be handled by userspace. This patch introduces
>>> and uses
>>> should_stop_polling() to decide whether the device should be polled or
>> not.
>>>
>> Thanks for the fix, and IMO, this reveal some more problems.
>> Say, we need to define "DISABLED" thermal zone.
>> Can we read the temperature? Can we trust the trip point value?
>>
>> IMO, a disabled thermal zone does not mean it is handled by userspace,
>> because that is what the userspace governor designed for.
>> Instead, if a thermal zone is disabled, in thermal_zone_device_update(), we
>> should basically skip all the other operations as well.
>>
> I overlooked the last line of the patch. So thermal_zone_device_update() returns
> immediately if the thermal zone is disabled, right?
> 
> But how can we stop polling in this case?

It does stop. However, I indeed observe an extra call to
thermal_zone_device_update() before it fully stops.
I think what happens is this:

- storing "disabled" in mode ends up in thermal_zone_device_set_mode(),
which calls driver's ->set_mode() and then calls thermal_zone_device_update(),
which returns immediately and does not touch the tz->poll_queue delayed
work

- thermal_zone_device_update() is called from the delayed work when its
time comes and this time it also returns immediately, not modifying the
said delayed work, so polling effectively stops now.

> There is no chance to call into monitor_thermal_zone() in thermal_zone_device_update(),
> or do I miss something?

Without the last "if" statement in this patch polling stops with the
first call to thermal_zone_device_update() because it indeed disables
the delayed work.

So you are probably right - that last "if" should not be introduced.

> 
>> I'll try your patches and probably make an incremental patch.
> 
> I have finished a small patch set to improve this based on my understanding, and will post it
> tomorrow after testing.
> 

Is your small patchset based on top of this series or is it a completely
rewritten version?

Andrzej

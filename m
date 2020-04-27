From: "Zhang, Rui" <rui.zhang@intel.com>
Subject: RE: [PATCH v3 2/2] thermal: core: Stop polling DISABLED thermal
 devices
Date: Mon, 27 Apr 2020 14:20:17 +0000
Message-ID: <744357E9AAD1214791ACBA4B0B90926377CF9A10@SHSMSX108.ccr.corp.intel.com>
References: <a3998ad2-19bc-0893-a10d-2bb5adf7d99f@samsung.com>
 <20200423165705.13585-1-andrzej.p@collabora.com>
 <20200423165705.13585-3-andrzej.p@collabora.com>
 <744357E9AAD1214791ACBA4B0B90926377CF60E3@SHSMSX108.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <744357E9AAD1214791ACBA4B0B90926377CF60E3@SHSMSX108.ccr.corp.intel.com>
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
To: 'Andrzej Pietrasiewicz' <andrzej.p@collabora.com>, "'linux-pm@vger.kernel.org'" <linux-pm@vger.kernel.org>
Cc: 'Heiko Stuebner' <heiko@sntech.de>, 'Peter Kaestle' <peter@piie.net>, "'platform-driver-x86@vger.kernel.org'" <platform-driver-x86@vger.kernel.org>, "'kernel@collabora.com'" <kernel@collabora.com>, 'Fabio Estevam' <festevam@gmail.com>, 'Amit Kucheria' <amit.kucheria@verdurent.com>, 'Chunyan Zhang' <zhang.lyra@gmail.com>, 'Daniel Lezcano' <daniel.lezcano@linaro.org>, "'linux-acpi@vger.kernel.org'" <linux-acpi@vger.kernel.org>, 'NXP Linux Team' <linux-imx@nxp.com>, 'Orson Zhai' <orsonzhai@gmail.com>, 'Len Brown' <lenb@kernel.org>, 'Barlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Sascha Hauer' <s.hauer@pengutronix.de>, 'Ido Schimmel' <idosch@mellanox.com>, 'Jiri Pirko' <jiri@mellanox.com>, 'Darren Hart' <dvhart@infradead.org>, "'linux-arm-kernel@lists.infradead.org'" <linux-arm-kernel@lists.infradead.org>, 'Support Opensource' <support.opensource@diasemi.com>'
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Zhang, Rui
> Sent: Friday, April 24, 2020 5:03 PM
> To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>; linux-
> pm@vger.kernel.org
> Cc: Rafael J . Wysocki <rjw@rjwysocki.net>; Len Brown <lenb@kernel.org>;
> Jiri Pirko <jiri@mellanox.com>; Ido Schimmel <idosch@mellanox.com>; David
> S . Miller <davem@davemloft.net>; Peter Kaestle <peter@piie.net>; Darren
> Hart <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
> Support Opensource <support.opensource@diasemi.com>; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Amit Kucheria
> <amit.kucheria@verdurent.com>; Shawn Guo <shawnguo@kernel.org>;
> Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; NXP
> Linux Team <linux-imx@nxp.com>; Heiko Stuebner <heiko@sntech.de>;
> Orson Zhai <orsonzhai@gmail.com>; Baolin Wang
> <baolin.wang7@gmail.com>; Chunyan Zhang <zhang.lyra@gmail.com>; linux-
> acpi@vger.kernel.org; netdev@vger.kernel.org; platform-driver-
> x86@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> kernel@collabora.com; Barlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Subject: RE: [PATCH v3 2/2] thermal: core: Stop polling DISABLED thermal
> devices
> 
> Hi, Andrzej,
> 
> Thanks for the patches. My Linux laptop was broken and won't get fixed till
> next week, so I may lost some of the discussions previously.
> 
> > -----Original Message-----
> > From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > Sent: Friday, April 24, 2020 12:57 AM
> > To: linux-pm@vger.kernel.org
> > Cc: Zhang, Rui <rui.zhang@intel.com>; Rafael J . Wysocki
> > <rjw@rjwysocki.net>; Len Brown <lenb@kernel.org>; Jiri Pirko
> > <jiri@mellanox.com>; Ido Schimmel <idosch@mellanox.com>; David S .
> > Miller <davem@davemloft.net>; Peter Kaestle <peter@piie.net>; Darren
> > Hart <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
> > Support Opensource <support.opensource@diasemi.com>; Daniel Lezcano
> > <daniel.lezcano@linaro.org>; Amit Kucheria
> > <amit.kucheria@verdurent.com>; Shawn Guo <shawnguo@kernel.org>;
> Sascha
> > Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; NXP
> Linux
> > Team <linux-imx@nxp.com>; Heiko Stuebner <heiko@sntech.de>; Orson
> Zhai
> > <orsonzhai@gmail.com>; Baolin Wang <baolin.wang7@gmail.com>;
> Chunyan
> > Zhang <zhang.lyra@gmail.com>; linux- acpi@vger.kernel.org;
> > netdev@vger.kernel.org; platform-driver- x86@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org;
> > kernel@collabora.com; Andrzej Pietrasiewicz <andrzej.p@collabora.com>;
> > Barlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Subject: [PATCH v3 2/2] thermal: core: Stop polling DISABLED thermal
> > devices
> > Importance: High
> >
> > Polling DISABLED devices is not desired, as all such "disabled"
> > devices are meant to be handled by userspace. This patch introduces
> > and uses
> > should_stop_polling() to decide whether the device should be polled or
> not.
> >
> Thanks for the fix, and IMO, this reveal some more problems.
> Say, we need to define "DISABLED" thermal zone.
> Can we read the temperature? Can we trust the trip point value?
> 
> IMO, a disabled thermal zone does not mean it is handled by userspace,
> because that is what the userspace governor designed for.
> Instead, if a thermal zone is disabled, in thermal_zone_device_update(), we
> should basically skip all the other operations as well.
> 
I overlooked the last line of the patch. So thermal_zone_device_update() returns
immediately if the thermal zone is disabled, right?

But how can we stop polling in this case?
There is no chance to call into monitor_thermal_zone() in thermal_zone_device_update(),
or do I miss something?

> I'll try your patches and probably make an incremental patch.

I have finished a small patch set to improve this based on my understanding, and will post it
tomorrow after testing.

Thanks,
rui
> 
> Thanks,
> rui
> 
> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > ---
> >  drivers/thermal/thermal_core.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/thermal/thermal_core.c
> > b/drivers/thermal/thermal_core.c index a2a5034f76e7..03c4d8d23284
> > 100644
> > --- a/drivers/thermal/thermal_core.c
> > +++ b/drivers/thermal/thermal_core.c
> > @@ -305,13 +305,22 @@ static void
> > thermal_zone_device_set_polling(struct
> > thermal_zone_device *tz,
> >  		cancel_delayed_work(&tz->poll_queue);
> >  }
> >
> > +static inline bool should_stop_polling(struct thermal_zone_device
> > +*tz) {
> > +	return thermal_zone_device_get_mode(tz) ==
> > THERMAL_DEVICE_DISABLED; }
> > +
> >  static void monitor_thermal_zone(struct thermal_zone_device *tz)  {
> > +	bool stop;
> > +
> > +	stop = should_stop_polling(tz);
> > +
> >  	mutex_lock(&tz->lock);
> >
> > -	if (tz->passive)
> > +	if (!stop && tz->passive)
> >  		thermal_zone_device_set_polling(tz, tz->passive_delay);
> > -	else if (tz->polling_delay)
> > +	else if (!stop && tz->polling_delay)
> >  		thermal_zone_device_set_polling(tz, tz->polling_delay);
> >  	else
> >  		thermal_zone_device_set_polling(tz, 0); @@ -503,6 +512,9
> @@ void
> > thermal_zone_device_update(struct thermal_zone_device *tz,  {
> >  	int count;
> >
> > +	if (should_stop_polling(tz))
> > +		return;
> > +
> >  	if (atomic_read(&in_suspend))
> >  		return;
> >
> > --
> > 2.17.1

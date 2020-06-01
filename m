From: "=?utf-8?B?UGV0ZXIgS8Okc3RsZQ==?=" <peter@piie.net>
Subject: Re: [PATCH v4 07/11] thermal: Use mode helpers in drivers
Date: Mon, 01 Jun 2020 11:37:52 +0000
Message-ID: <05b890834efb5714a67a91afeabcd95d@piie.net>
References: <20200528192051.28034-8-andrzej.p@collabora.com> <Message-ID:
 <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
 <20200528192051.28034-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20200528192051.28034-8-andrzej.p@collabora.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: platform-driver-x86.vger.kernel.org

28. Mai 2020 21:22, "Andrzej Pietrasiewicz" <andrzej.p@collabora.com> schrieb:

> Use thermal_zone_device_{en|dis}able() and thermal_zone_device_is_enabled().
> 
> Consequently, all set_mode() implementations in drivers:
> 
> - can stop modifying tzd's "mode" member,
> - shall stop taking tzd's lock, as it is taken in the helpers
> - shall stop calling thermal_zone_device_update() as it is called in the
> helpers
> - can assume they are called when the mode truly changes, so checks to
> verify that can be dropped
> 
> Not providing set_mode() by a driver no longer prevents the core from
> being able to set tzd's mode, so the relevant check in mode_store() is
> removed.
> 
> Other comments:
> 
> - acpi/thermal.c: tz->thermal_zone->mode will be updated only after we
> return from set_mode(), so use function parameter in thermal_set_mode()
> instead, no need to call acpi_thermal_check() in set_mode()
> - thermal/imx_thermal.c: regmap writes and mode assignment are done in
> thermal_zone_device_{en|dis}able() and set_mode() callback
> - thermal/intel/intel_quark_dts_thermal.c: soc_dts_{en|dis}able() are a
> part of set_mode() callback, so they don't need to modify tzd->mode, and
> don't need to fall back to the opposite mode if unsuccessful, as the return
> value will be propagated to thermal_zone_device_{en|dis}able() and
> ultimately tzd's member will not be changed in thermal_zone_device_set_mode().
> - thermal/of-thermal.c: no need to set zone->mode to DISABLED in
> of_parse_thermal_zones() as a tzd is kzalloc'ed so mode is DISABLED anyway
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---

[...]

> drivers/platform/x86/acerhdf.c | 17 +++++----

Acked-by: Peter Kaestle <peter@piie.net>

From: "=?utf-8?B?UGV0ZXIgS8Okc3RsZQ==?=" <peter@piie.net>
Subject: Re: [PATCH v4 11/11] thermal: Rename set_mode() to change_mode()
Date: Mon, 01 Jun 2020 11:38:44 +0000
Message-ID: <49000a709ad0fd5c86005d43f776a8f4@piie.net>
References: <20200528192051.28034-12-andrzej.p@collabora.com> <Message-ID:
 <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
 <20200528192051.28034-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20200528192051.28034-12-andrzej.p@collabora.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>
List-Id: platform-driver-x86.vger.kernel.org

28. Mai 2020 21:22, "Andrzej Pietrasiewicz" <andrzej.p@collabora.com> schrieb:

> set_mode() is only called when tzd's mode is about to change. Actual
> setting is performed in thermal_core, in thermal_zone_device_set_mode().
> The meaning of set_mode() callback is actually to notify the driver about
> the mode being changed and giving the driver a chance to oppose such
> change.
> 
> To better reflect the purpose of the method rename it to change_mode()
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
> drivers/platform/x86/acerhdf.c | 6 +++---

Acked-by: Peter Kaestle <peter@piie.net>

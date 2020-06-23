From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 00/11] Stop monitoring disabled devices
Date: Tue, 23 Jun 2020 16:37:51 +0200
Message-ID: <9cbffad6-69e4-0b33-4640-fde7c4f6a6e7@linaro.org>
References: <Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
 <20200528192051.28034-1-andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200528192051.28034-1-andrzej.p@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org


Hi Andrzej,


On 28/05/2020 21:20, Andrzej Pietrasiewicz wrote:
> There is already a reviewed v3 (not to be confused with RFC v3), which can
> be considered for merging:
> 
> https://lore.kernel.org/linux-pm/20200423165705.13585-2-andrzej.p@collabora.com/
> 
> Let me cite Bartlomiej Zolnierkiewicz:
> 
> "I couldn't find the problems with the patch itself (no new issues
> being introduced, all changes seem to be improvements over the current
> situation).
> 
> Also the patch is not small but it also not that big and it mostly
> removes the code:
> 
> 17 files changed, 105 insertions(+), 244 deletions(-)"


Thanks for this nice cleanup. Given the series was tested, reviewed and
acked, I would like to merge it as soon as possible.

Can you send the V5 with the EXPORT_SYMBOL_GPL fixed ? So the series can
enter the integration loop.

Thanks

 -- Daniel



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

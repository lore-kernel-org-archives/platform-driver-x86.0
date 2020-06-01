From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 00/11] Stop monitoring disabled devices
Date: Mon, 1 Jun 2020 12:20:08 +0200
Message-ID: <adce13cb-e94c-ee43-0bc5-d4a0ec1746f4@collabora.com>
References: <20200528192051.28034-1-andrzej.p@collabora.com> <Message-ID:
 <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
 <23327363eae19d051b7c960d3cbc1523@piie.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <23327363eae19d051b7c960d3cbc1523@piie.net>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: =?UTF-8?Q?Peter_K=c3=a4stle?= <peter@piie.net>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.or>
List-Id: platform-driver-x86.vger.kernel.org

W dniu 01.06.2020 o 12:02, Peter Kästle pisze:
> Hi,
> 
> 28. Mai 2020 21:21, "Andrzej Pietrasiewicz" <andrzej.p@collabora.com> schrieb:
> 
> [...]
> 
>> This v4 series addresses those concerns: it takes a more gradual
>> approach and uses explicit tzd state initialization, hence there are more
>> insertions than in v3, and the net effect is -63 lines versus -139 lines
>> in v3.
> 
> I'd like to test it.  Which git repo / branch do you base this series of patches on?
> 
> [...]
> 
>> base-commit: 351f4911a477ae01239c42f771f621d85b06ea10
> 
> Can't find this hashref anywhere.
> 

git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git, branch "testing".

base-commit: 351f4911a477ae01239c42f771f621d85b06ea10

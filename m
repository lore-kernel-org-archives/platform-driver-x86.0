From: "=?utf-8?B?UGV0ZXIgS8Okc3RsZQ==?=" <peter@piie.net>
Subject: Re: [PATCH v4 00/11] Stop monitoring disabled devices
Date: Mon, 01 Jun 2020 10:02:43 +0000
Message-ID: <23327363eae19d051b7c960d3cbc1523@piie.net>
References: <20200528192051.28034-1-andrzej.p@collabora.com> <Message-ID:
 <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <20200528192051.28034-1-andrzej.p@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>, Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, Len Brown <lenb@kernel.org>, Johannes Berg <johannes.berg@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, Ido Schimmel <idosch@mellanox.com>, Baolin Wang <baolin.wang7@gmail.com>, Jiri Pirko <jiri@mellanox.com>, Orson Zhai <orsonzhai@gmail.com>, Thomas
List-Id: platform-driver-x86.vger.kernel.org

Hi,

28. Mai 2020 21:21, "Andrzej Pietrasiewicz" <andrzej.p@collabora.com> schrieb:

[...]

> This v4 series addresses those concerns: it takes a more gradual
> approach and uses explicit tzd state initialization, hence there are more
> insertions than in v3, and the net effect is -63 lines versus -139 lines
> in v3.

I'd like to test it.  Which git repo / branch do you base this series of patches on?

[...]

> base-commit: 351f4911a477ae01239c42f771f621d85b06ea10

Can't find this hashref anywhere.

-- 
thanks
--peter;

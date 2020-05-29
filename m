From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 02/11] thermal: Store thermal mode in a dedicated enum
Date: Fri, 29 May 2020 17:08:18 +0200
Message-ID: <b9aa246f-4534-db23-aea1-07aae2edbdd5@collabora.com>
References: <20200529150549.GA154196@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200529150549.GA154196@roeck-us.net>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>
List-Id: platform-driver-x86.vger.kernel.org

W dniu 29.05.2020 o 17:05, Guenter Roeck pisze:
> On Thu, May 28, 2020 at 09:20:42PM +0200, Andrzej Pietrasiewicz wrote:
>> Prepare for storing mode in struct thermal_zone_device.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> What is the baseline for this series ? I can't get this patch to apply
> on top of current mainline, nor on v5.6, nor on top of linux-next.
> 
> Thanks,
> Guenter
> 

git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git, branch "testing".

base-commit: 351f4911a477ae01239c42f771f621d85b06ea10

Andrzej

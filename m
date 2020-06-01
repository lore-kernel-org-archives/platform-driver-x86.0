From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 06/11] thermal: Add mode helpers
Date: Mon, 1 Jun 2020 06:40:11 -0700
Message-ID: <c5780899-c471-4ce3-7581-5ab39a3cf219@roeck-us.net>
References: <20200529155206.GA158553@roeck-us.net>
 <526286da-70d2-7c55-3c41-15fd2c969a39@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <526286da-70d2-7c55-3c41-15fd2c969a39@collabora.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>
List-Id: platform-driver-x86.vger.kernel.org

On 6/1/20 4:16 AM, Andrzej Pietrasiewicz wrote:
> Hi Guenter,
> 
> W dniu 29.05.2020 o 17:52, Guenter Roeck pisze:
>> On Thu, May 28, 2020 at 09:20:46PM +0200, Andrzej Pietrasiewicz wrote:
>>> Prepare for making the drivers not access tzd's private members.
>>>
>>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> <snip>
> 
>>> +
>> Nit: unnecessary empty line.
>>
>>> +        return ret;
> 
> <snip>
> 
>>> +    return thermal_zone_device_set_mode(tz, THERMAL_DEVICE_ENABLED);
>>> +}
>>> +EXPORT_SYMBOL(thermal_zone_device_enable);
>>
>> Other exports in thermal/ use EXPORT_SYMBOL_GPL.
> 
> Other than that does it look good to you?

Yes, it does.

> I can send a v5 where the two above will be corrected, but did you have
> a chance to review patches 7-11?
> 
Not yet. I got distracted, sorry. Hopefully I'll get to it
today or tomorrow.

Guenter

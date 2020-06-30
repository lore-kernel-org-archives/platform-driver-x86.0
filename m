From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v7 00/11] Stop monitoring disabled devices
Date: Tue, 30 Jun 2020 17:53:14 +0200
Message-ID: <4353a939-3f5e-8369-5bc0-ad8162b5ffc7@linaro.org>
References: <20200629122925.21729-1-andrzej.p@collabora.com>
 <aab40d90-3f72-657c-5e14-e53a34c4b420@linaro.org>
 <3d03d1a2-ac06-b69b-93cb-e0203be62c10@collabora.com>
 <47111821-d691-e71d-d740-e4325e290fa4@linaro.org>
 <be9b7ee3-cad0-e462-126d-08de9b226285@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <be9b7ee3-cad0-e462-126d-08de9b226285@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 30/06/2020 17:29, Andrzej Pietrasiewicz wrote:
> Hi Daniel,
> 
> W dniu 30.06.2020 o 16:53, Daniel Lezcano pisze:
>> On 30/06/2020 15:43, Andrzej Pietrasiewicz wrote:
>>> Hi Daniel,
>>>
>>> I am reading the logs and can't find anything specific to thermal.
>>>
>>> What I can see is
>>>
>>> "random: crng init done"
>>>
>>> with large times (~200s) and then e.g.
>>>
>>> 'auto-login-action timed out after 283 seconds'
>>>
>>> I'm looking at e.g.
>>> https://storage.kernelci.org/thermal/testing/v5.8-rc3-11-gf5e50bf4d3ef/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-imx6q-sabrelite.html
>>>
>>>
> 
> f5e50bf4d3ef is PATCH 11/11. Does the problem happen at PATCH 1-10/11?
> PATCH 11/11 renames a method and the code compiles, so it seems
> unlikely that this is causing problems. One should never say never,
> though ;)

The sha1 is just the HEAD for the kernel reference. The regression
happens with your series, somewhere.

> The reported failure is not due to some test failing but rather due
> to timeout logging into the test system. Could it be that there is
> some other problem?

I did reproduce:

v5.8-rc3 + series => imx6 hang at boot time
v5.8-rc3 => imx6 boots correctly


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

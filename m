From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v7 00/11] Stop monitoring disabled devices
Date: Wed, 1 Jul 2020 16:25:49 +0200
Message-ID: <5dba166b-ecef-c9ee-a13a-0e9bbf74ce4c@linaro.org>
References: <20200629122925.21729-1-andrzej.p@collabora.com>
 <aab40d90-3f72-657c-5e14-e53a34c4b420@linaro.org>
 <3d03d1a2-ac06-b69b-93cb-e0203be62c10@collabora.com>
 <47111821-d691-e71d-d740-e4325e290fa4@linaro.org>
 <be9b7ee3-cad0-e462-126d-08de9b226285@collabora.com>
 <4353a939-3f5e-8369-5bc0-ad8162b5ffc7@linaro.org>
 <a531d80f-afd1-2dec-6c77-ed984e97595c@collabora.com>
 <db1ff4e1-cbf8-89b3-5d64-b91a1fd88a41@linaro.org>
 <73942aea-ae79-753c-fe90-d4a99423d548@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <73942aea-ae79-753c-fe90-d4a99423d548@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 01/07/2020 12:23, Andrzej Pietrasiewicz wrote:
> Hi,
> 

[ ... ]

>>>>
>>>> I did reproduce:
>>>>
>>>> v5.8-rc3 + series => imx6 hang at boot time
>>>> v5.8-rc3 => imx6 boots correctly
>>>>
> 
> What did you reproduce? Timeout logging in to the test system or a
> "real" failure of a test?

Timeout logging. Boot hangs.

>>> I kindly ask for a bisect.
>>
>> I will give a try but it is a very long process as the board is running
>> on kernelci.
>>
>> I was not able to reproduce it on imx7 despite it is the same sensor :/
>>
>>
> 
> Could it be that the thermal sensors somehow contribute to entropy and
> after
> the series is applied on some machines it takes more time to gather enough
> entropy?

I assume you are talking about the entropy for random?

It would be really surprising if it is the case. The message appears
asynchronously, I believe the boot flow is stuck in a mutex.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

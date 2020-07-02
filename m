From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v7 00/11] Stop monitoring disabled devices
Date: Thu, 2 Jul 2020 15:53:39 +0200
Message-ID: <5a28deb7-f307-8b03-faad-ab05cb8095d1@collabora.com>
References: <20200629122925.21729-1-andrzej.p@collabora.com>
 <aab40d90-3f72-657c-5e14-e53a34c4b420@linaro.org>
 <3d03d1a2-ac06-b69b-93cb-e0203be62c10@collabora.com>
 <47111821-d691-e71d-d740-e4325e290fa4@linaro.org>
 <be9b7ee3-cad0-e462-126d-08de9b226285@collabora.com>
 <4353a939-3f5e-8369-5bc0-ad8162b5ffc7@linaro.org>
 <a531d80f-afd1-2dec-6c77-ed984e97595c@collabora.com>
 <db1ff4e1-cbf8-89b3-5d64-b91a1fd88a41@linaro.org>
 <73942aea-ae79-753c-fe90-d4a99423d548@collabora.com>
 <374dddd9-b600-3a30-d6c3-8cfcefc944d9@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <374dddd9-b600-3a30-d6c3-8cfcefc944d9@linaro.org>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Daniel,

<snip>

>>>>>
>>>>> I did reproduce:
>>>>>
>>>>> v5.8-rc3 + series => imx6 hang at boot time
>>>>> v5.8-rc3 => imx6 boots correctly
> 
> So finally I succeeded to reproduce it on my imx7 locally. The sensor
> was failing to initialize for another reason related to the legacy
> cooling device, this is why it is not appearing on the imx7.
> 
> I can now git-bisect :)
> 

That would be very kind of you, thank you!

Andrzej

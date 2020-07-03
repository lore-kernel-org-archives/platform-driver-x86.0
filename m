From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v7 00/11] Stop monitoring disabled devices
Date: Fri, 3 Jul 2020 13:05:06 +0200
Message-ID: <9fcd1d07-26af-4ff3-56d7-7226ef42a7e6@linaro.org>
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
 <5a28deb7-f307-8b03-faad-ab05cb8095d1@collabora.com>
 <8aeb4f51-1813-63c1-165b-06640af5968f@linaro.org>
 <685ef627-e377-bbf1-da11-7f7556ca2dd7@collabora.com>
 <d41bf28f-ee91-6946-2334-f11ec81f96fe@linaro.org>
 <44c622dd7de8c7bf143c4435c0edd1b98d09a3d6.camel@intel.com>
 <58265668-fc6d-729a-c126-0c73c2ea853b@linaro.org>
 <625911aa-a55f-dcbf-66b3-719117c6aa32@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <625911aa-a55f-dcbf-66b3-719117c6aa32@collabora.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Vishal Kulkarni <vishal@chelsio.com>, "David S . Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Reichel <sre@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Support Opensource <support.opensource@diasemi.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 03/07/2020 12:45, Andrzej Pietrasiewicz wrote:
> Hi,
> 
> W dniu 03.07.2020 o 08:38, Daniel Lezcano pisze:
>> On 03/07/2020 03:49, Zhang Rui wrote:
>>> On Thu, 2020-07-02 at 19:49 +0200, Daniel Lezcano wrote:
>>
>> [ ... ]
>>
>>>>> So the reason is that ->get_temp() is called while the mutex is
>>>>> held and
>>>>> thermal_zone_device_is_enabled() wants to take the same mutex.
>>>>
>>>> Yes, that's correct.
>>>>
>>>>> Is adding a comment to thermal_zone_device_is_enabled() to never
>>>>> call
>>>>> it while the mutex is held and adding another version of it which
>>>>> does
>>>>> not take the mutex ok?
>>>>
>>>> The thermal_zone_device_is_enabled() is only used in two places, acpi
>>>> and this imx driver, and given:
>>>>
>>>> 1. as soon as the mutex is released, there is no guarantee the
>>>> thermal
>>>> zone won't be changed right after, the lock is pointless, thus the
>>>> information also.
>>>>
>>>> 2. from a design point of view, I don't see why a driver should know
>>>> if
>>>> a thermal zone is disabled or not
>>>>
>>>> It would make sense to end with this function and do not give the
>>>> different drivers an opportunity to access this information.
>>>
>>> I agree.
>>>>
>>>> Why not add change_mode for the acpi in order to enable or disable
>>>> the
>>>> events
>>>
>>> thermal_zone_device_is_enabled() is invoked in acpi thermal driver
>>> because we only want to do thermal_zone_device_update() when the acpi
>>> thermal zone is enabled.
>>>
>>> As thermal_zone_device_update() can handle a disabled thermal zone now,
>>> we can just remove the check.
>>
>> Ah yes, good point!
>>
>>
>>
> 
> I sent a short series with fixes. Daniel, can you kindly test it?

I confirm the i.MX is now correctly booting with the thermal zone
temperature available.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

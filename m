From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 02/11] thermal: Store thermal mode in a dedicated enum
Date: Fri, 29 May 2020 08:34:08 -0700
Message-ID: <6829f088-d816-fa7c-da97-cb5fd082d69d@roeck-us.net>
References: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
 <20200528192051.28034-1-andrzej.p@collabora.com>
 <20200528192051.28034-3-andrzej.p@collabora.com>
 <20200529144821.GA93994@roeck-us.net>
 <e48e5948-51f0-7ce7-265b-d432ea058b7e@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <e48e5948-51f0-7ce7-265b-d432ea058b7e@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>
List-Id: platform-driver-x86.vger.kernel.org

On 5/29/20 8:13 AM, Andrzej Pietrasiewicz wrote:
> Hi Guenter,
> 
> W dniu 29.05.2020 o 16:48, Guenter Roeck pisze:
>> On Thu, May 28, 2020 at 09:20:42PM +0200, Andrzej Pietrasiewicz wrote:
>>> Prepare for storing mode in struct thermal_zone_device.
>>>
>>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>>> ---
>>>   drivers/acpi/thermal.c                        | 27 +++++++++----------
>>>   drivers/platform/x86/acerhdf.c                |  8 ++++--
>>>   .../intel/int340x_thermal/int3400_thermal.c   | 18 +++++--------
>>>   3 files changed, 25 insertions(+), 28 deletions(-)
> 
> <snip>
> 
>>> @@ -544,27 +543,25 @@ static int thermal_set_mode(struct thermal_zone_device *thermal,
>>>                   enum thermal_device_mode mode)
>>>   {
>>>       struct acpi_thermal *tz = thermal->devdata;
>>> -    int enable;
>>>         if (!tz)
>>>           return -EINVAL;
>>>   +    if (mode != THERMAL_DEVICE_DISABLED &&
>>> +        mode != THERMAL_DEVICE_ENABLED)
>>> +        return -EINVAL;
>>
>> Personally I find this check unnecessary: The enum has no other values,
>> and it is verifyable that the callers provide the enum and not some other
>> value.
> 
> It is getting removed in PATCH 10/11.
> 
> 
>>> +    if (mode != THERMAL_DEVICE_ENABLED &&
>>> +        mode != THERMAL_DEVICE_DISABLED)
>>>           return -EINVAL;
>>
>> Same as above.
> 
> ditto.

Hmm, I think that would be better done with this patch. But I guess
that is a bit of PoV, so

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

since I don't have any other objections/observations.

Guenter

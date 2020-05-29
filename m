From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 04/11] thermal: Store device mode in struct
 thermal_zone_device
Date: Fri, 29 May 2020 19:21:50 +0200
Message-ID: <a0c0310f-9870-47be-4ca3-c07e41c380fc@collabora.com>
References: <20200529154205.GA157653@roeck-us.net>
 <5010f7df-59d6-92ef-c99a-0dbd715f0ad2@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <5010f7df-59d6-92ef-c99a-0dbd715f0ad2@collabora.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi again,

W dniu 29.05.2020 o 18:08, Andrzej Pietrasiewicz pisze:
> Hi Guenter,
> 
> W dniu 29.05.2020 o 17:42, Guenter Roeck pisze:
>> On Thu, May 28, 2020 at 09:20:44PM +0200, Andrzej Pietrasiewicz wrote:
>>> Prepare for eliminating get_mode().
>>>
>> Might be worthwhile to explain (not only in the subject) what you are
>> doing here.
>>
>>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>>> ---
>>>   drivers/acpi/thermal.c                        | 18 ++++++----------
>>>   .../ethernet/mellanox/mlxsw/core_thermal.c    | 21 +++++++------------
>>>   drivers/platform/x86/acerhdf.c                | 15 ++++++-------
>>>   drivers/thermal/da9062-thermal.c              |  6 ++----
>>>   drivers/thermal/imx_thermal.c                 | 17 +++++++--------
>>>   .../intel/int340x_thermal/int3400_thermal.c   | 12 +++--------
>>>   .../thermal/intel/intel_quark_dts_thermal.c   | 16 +++++++-------
>>>   drivers/thermal/thermal_of.c                  | 10 +++------
>>
>> After this patch is applied on top of the thermal 'testing' branch,
>> there are still local instances of thermal_device_mode in
>>     drivers/thermal/st/stm_thermal.c
>>     drivers/thermal/ti-soc-thermal/ti-thermal-common.c
>>
>> If there is a reason not to replace those, it might make sense to explain
>> it here.
>>
> 
> My understanding is that these two are sensor devices which are "plugged"
> into their "parent" thermal zone device. The latter is the "proper" tzd.
> They both use thermal_zone_of_device_ops instead of thermal_zone_device_ops.
> The former doesn't even have get_mode(). The thermal core, when it calls
> get_mode(), operates on the "parent" thermal zone devices.
> 
> Consequently, the drivers you mention use their "mode" members for
> their private purpose, not for the purpose of storing the "parent"
> thermal zone device mode.
> 

Let me also say it differently.

Both drivers which you mention use devm_thermal_zone_of_sensor_register().
It calls thermal_zone_of_sensor_register(), which "will search the list of
thermal zones described in device tree and look for the zone that refer to
the sensor device pointed by @dev->of_node as temperature providers. For
the zone pointing to the sensor node, the sensor will be added to the DT
thermal zone device." When a match is found thermal_zone_of_add_sensor()
is invoked, which (using thermal_zone_get_zone_by_name()) iterates over
all registered thermal_zone_devices. The one eventually found will be
returned and propagated to the original caller of
devm_thermal_zone_of_sensor_register(). The state of this returned
device is managed elsewhere (in that device's struct tzd). The "mode"
member you are referring to is thus unrelated.

Regards,

Andrzej

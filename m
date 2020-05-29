From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v4 04/11] thermal: Store device mode in struct
 thermal_zone_device
Date: Fri, 29 May 2020 18:08:51 +0200
Message-ID: <5010f7df-59d6-92ef-c99a-0dbd715f0ad2@collabora.com>
References: <20200529154205.GA157653@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20200529154205.GA157653@roeck-us.net>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Vishal Kulkarni <vishal@chelsio.com>, Luca Coelho <luciano.coelho@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com, Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Allison Randal <allison@lohutok.net>, NXP Linux Team <linux-imx@nxp.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi Guenter,

W dniu 29.05.2020 o 17:42, Guenter Roeck pisze:
> On Thu, May 28, 2020 at 09:20:44PM +0200, Andrzej Pietrasiewicz wrote:
>> Prepare for eliminating get_mode().
>>
> Might be worthwhile to explain (not only in the subject) what you are
> doing here.
> 
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> ---
>>   drivers/acpi/thermal.c                        | 18 ++++++----------
>>   .../ethernet/mellanox/mlxsw/core_thermal.c    | 21 +++++++------------
>>   drivers/platform/x86/acerhdf.c                | 15 ++++++-------
>>   drivers/thermal/da9062-thermal.c              |  6 ++----
>>   drivers/thermal/imx_thermal.c                 | 17 +++++++--------
>>   .../intel/int340x_thermal/int3400_thermal.c   | 12 +++--------
>>   .../thermal/intel/intel_quark_dts_thermal.c   | 16 +++++++-------
>>   drivers/thermal/thermal_of.c                  | 10 +++------
> 
> After this patch is applied on top of the thermal 'testing' branch,
> there are still local instances of thermal_device_mode in
> 	drivers/thermal/st/stm_thermal.c
> 	drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> 
> If there is a reason not to replace those, it might make sense to explain
> it here.
> 

My understanding is that these two are sensor devices which are "plugged"
into their "parent" thermal zone device. The latter is the "proper" tzd.
They both use thermal_zone_of_device_ops instead of thermal_zone_device_ops.
The former doesn't even have get_mode(). The thermal core, when it calls
get_mode(), operates on the "parent" thermal zone devices.

Consequently, the drivers you mention use their "mode" members for
their private purpose, not for the purpose of storing the "parent"
thermal zone device mode.

Andrzej

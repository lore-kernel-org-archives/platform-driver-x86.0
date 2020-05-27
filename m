From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [RFC v3 1/2] thermal: core: Let thermal zone device's mode be
 stored in its struct
Date: Wed, 27 May 2020 15:30:30 +0200
Message-ID: <4493c0e4-51aa-3907-810c-74949ff27ca4@samsung.com>
References: <9ac3b37a-8746-b8ee-70e1-9c876830ac83@linaro.org>
        <20200417162020.19980-1-andrzej.p@collabora.com>
        <20200417162020.19980-2-andrzej.p@collabora.com>
        <CGME20200523212502eucas1p27c01e46512cd6b38c2bb605fad01026f@eucas1p2.samsung.com>
        <f39c5ca6-5efa-889c-21f5-632dfd24715e@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <f39c5ca6-5efa-889c-21f5-632dfd24715e@linaro.org>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Peter Kaestle <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Support Opensource <support.opensource@diasemi.com>, Amit Kucheria <amit.kucheria@verdurent.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Allison Randal <allison@lohutok.net>, Enrico Weigelt <info@metux.net>
List-Id: platform-driver-x86.vger.kernel.org


Hi Daniel,

On 5/23/20 11:24 PM, Daniel Lezcano wrote:
> Hi Andrzej,
> 
> On 17/04/2020 18:20, Andrzej Pietrasiewicz wrote:
>> Thermal zone devices' mode is stored in individual drivers. This patch
>> changes it so that mode is stored in struct thermal_zone_device instead.
>>
>> As a result all driver-specific variables storing the mode are not needed
>> and are removed. Consequently, the get_mode() implementations have nothing
>> to operate on and need to be removed, too.
>>
>> Some thermal framework specific functions are introduced:
>>
>> thermal_zone_device_get_mode()
>> thermal_zone_device_set_mode()
>> thermal_zone_device_enable()
>> thermal_zone_device_disable()
>>
>> thermal_zone_device_get_mode() and its "set" counterpart take tzd's lock
>> and the "set" calls driver's set_mode() if provided, so the latter must
>> not take this lock again. At the end of the "set"
>> thermal_zone_device_update() is called so drivers don't need to repeat this
>> invocation in their specific set_mode() implementations.
>>
>> The scope of the above 4 functions is purposedly limited to the thermal
>> framework and drivers are not supposed to call them. This encapsulation
>> does not fully work at the moment for some drivers, though:
>>
>> - platform/x86/acerhdf.c
>> - drivers/thermal/imx_thermal.c
>> - drivers/thermal/intel/intel_quark_dts_thermal.c
>> - drivers/thermal/of-thermal.c
>>
>> and they manipulate struct thermal_zone_device's members directly.
>>
>> struct thermal_zone_params gains a new member called initial_mode, which
>> is used to set tzd's mode at registration time.
>>
>> The sysfs "mode" attribute is always exposed from now on, because all
>> thermal zone devices now have their get_mode() implemented at the generic
>> level and it is always available. Exposing "mode" doesn't hurt the drivers
>> which don't provide their own set_mode(), because writing to "mode" will
>> result in -EPERM, as expected.
> 
> The result is great, that is a nice cleanup of the thermal framework.
> 
> After review it appears there are still problems IMO, especially with
> the suspend / resume path. The patch is big, it is a bit complex to
> comment. I suggest to re-org the changes as following:

There are still issues with the related existing thermal code but this
patch seems to be a step in the right direction.

For the latest version posted ("v3" one, your mail was replied to the
older "RFC v3" one):

https://lore.kernel.org/linux-pm/20200423165705.13585-2-andrzej.p@collabora.com/

I couldn't find the problems with the patch itself (no new issues
being introduced, all changes seem to be improvements over the current
situation).

Also the patch is not small but it also not that big and it mostly
removes the code:

17 files changed, 105 insertions(+), 244 deletions(-)

I worry that since the original code is intertwined in the interesting
ways the cost of work on splitting the patch on smaller changes may be
higher than its benefits.

>  - patch 1 : Add the four functions:
> 
>  * thermal_zone_device_set_mode()
>  * thermal_zone_device_enable()
>  * thermal_zone_device_disable()
>  * thermal_zone_device_is_enabled()
> 
> *but* do not export thermal_zone_device_set_mode(), it must stay private
> to the thermal framework ATM.
> 
>  - patch 2 : Add the mode THERMAL_DEVICE_SUSPENDED
> 
> In the thermal_pm_notify() in the:
> 
>  - PM_SUSPEND_PREPARE case, set the mode to THERMAL_DEVICE_SUSPENDED if
> the mode is THERMAL_DEVICE_ENABLED
> 
>  - PM_POST_SUSPEND case, set the mode to THERMAL_DEVICE_ENABLED, if the
> mode is THERMAL_DEVICE_SUSPENDED
> 
>  - patch 3 : Change the monitor function
> 
> Change monitor_thermal_zone() function to set the polling to zero if the
> mode is THERMAL_DEVICE_DISABLED
> 
>  - patch 4 : Do the changes to remove get_mode() ops
> 
> Make sure there is no access to tz->mode from the drivers anymore but
> use of the functions of patch 1. IMO, this is the tricky part because a
> part of the drivers are not calling the update after setting the mode
> while the function thermal_zone_device_enable()/disable() call update
> via the thermal_zone_device_set_mode(), so we must be sure to not break
> anything.
> 
>  - patch 5 : Do the changes to remove set_mode() ops users
> 
> As the patch 3 sets the polling to zero, the routine in the driver
> setting the polling to zero is no longer needed (eg. in the mellanox
> driver). I expect int300 to be the last user of this ops, hopefully we
> can find a way to get rid of the specific call done inside and then
> remove the ops.
> 
> The initial_mode approach looks hackish, I suggest to make the default
> the thermal zone disabled after creating and then explicitly enable it.
> Note that is what do a lot of drivers already.
> 
> Hopefully, these changes are git-bisect safe.
> 
> Does it make sense ?

Besides the requirement to split the patch it seems that the above
list contains a lot of problematic areas with the existing thermal
code yet to be addressed..

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
 hotplug driver in Kconfig
Date: Mon, 24 Oct 2016 10:11:27 -0700
Message-ID: <de3cb2b3-6c04-ab79-3fd6-0e0f9af9080f@infradead.org>
References: <1477226727-160036-1-git-send-email-vadimp@mellanox.com>
 <a20039d5-6456-7450-f83c-572c5ce4fb8f@infradead.org>
 <AM5PR0501MB20976E48C946BD3DB3A79143A2A90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM5PR0501MB20976E48C946BD3DB3A79143A2A90@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "fengguang.wu@intel.com" <fengguang.wu@intel.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On 10/23/16 22:41, Vadim Pasternak wrote:
> 
> 
>> -----Original Message-----
>> From: Randy Dunlap [mailto:rdunlap@infradead.org]
>> Sent: Sunday, October 23, 2016 7:57 PM
>> To: Vadim Pasternak <vadimp@mellanox.com>; dvhart@infradead.org;
>> fengguang.wu@intel.com
>> Cc: davem@davemloft.net; geert@linux-m68k.org; akpm@linux-
>> foundation.org; kvalo@codeaurora.org; gregkh@linuxfoundation.org;
>> mchehab@kernel.org; linux@roeck-us.net; linux-kernel@vger.kernel.org;
>> platform-driver-x86@vger.kernel.org; jiri@resnulli.us;
>> andriy.shevchenko@linux.intel.com
>> Subject: Re: [patch v1] drivers/platform/x86: select hwmon for Mellanox
>> hotplug driver in Kconfig
>>
>> On 10/23/16 05:45, vadimp@mellanox.com wrote:
>>> From: Vadim Pasternak <vadimp@mellanox.com>
>>>
>>> Add select HWMON for mlxcpld-hotplug driver config, since it requires
>>> hwmon APIs.
>>>
>>> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>> ---
>>>  drivers/platform/x86/Kconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig
>>> b/drivers/platform/x86/Kconfig index 65d9b04..1853769 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -1032,6 +1032,7 @@ config MLX_CPLD_PLATFORM
>>>  	tristate "Mellanox platform hotplug driver support"
>>>  	default n
>>>  	depends on MLX_PLATFORM
>>> +	select HWMON
>>>  	select I2C
>>>  	---help---
>>>  	  This driver handles hot-plug events for the power suppliers, power
>>>
>>
>> Hi,
>> did you test this?  I would expect it to cause a kconfig warning, something about
>> HWMON having a dependency on HAS_IOMEM.
> 
> Hi Randy,
> 
> Yes, 
> I built tree with this fix with the attached .config file.
> Didn't see kconfig warnings.
> I can have a look again.

No need. lib/Kconfig handles it:

config HAS_IOMEM
	bool
	depends on !NO_IOMEM
	select GENERIC_IO
	default y


thanks.
-- 
~Randy

From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 12/12] extcon: axp288: Set USB role where necessary
Date: Mon, 26 Feb 2018 09:07:42 +0100
Message-ID: <478db279-c9c6-7fd2-b275-88789631cbda@redhat.com>
References: <20180225152510.10159-1-hdegoede@redhat.com>
 <20180225152510.10159-13-hdegoede@redhat.com>
 <2e3c62b0-0d9b-4d30-654b-750055e6f515@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2e3c62b0-0d9b-4d30-654b-750055e6f515@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 25-02-18 19:51, Randy Dunlap wrote:
> Hi,
> 
> On 02/25/2018 07:25 AM, Hans de Goede wrote:
>   
>> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
>> index a7bca4207f44..de15bf55895b 100644
>> --- a/drivers/extcon/Kconfig
>> +++ b/drivers/extcon/Kconfig
>> @@ -30,7 +30,8 @@ config EXTCON_ARIZONA
>>   
>>   config EXTCON_AXP288
>>   	tristate "X-Power AXP288 EXTCON support"
>> -	depends on MFD_AXP20X && USB_PHY
>> +	depends on MFD_AXP20X && USB_SUPPORT && X86
> 
> Could that be:
> 	depends on MFD_AXP20X && USB_SUPPORT && (X86 || COMPILE_TEST)
> 
> or is there some reason that it won't even build on other $ARCH?

It uses:

#include <asm/cpu_device_id.h>
#include <asm/intel-family.h>

So it really should only be build on X86, it always was an X86 only
driver, but it now it really depends on X86.

Thank you for all the reviews. I will prepare a v3 with all your
proposed fixes soon(ish).
Regards,

Hans


>> +	select USB_ROLE_SWITCH
>>   	help
>>   	  Say Y here to enable support for USB peripheral detection
>>   	  and USB MUX switching by X-Power AXP288 PMIC.
> 
> thanks,
> 

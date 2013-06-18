From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH]amilo-rfkill: add depends on i8042 in Kconfig
Date: Tue, 18 Jun 2013 08:00:24 -0700
Message-ID: <51C07608.2070406@infradead.org>
References: <alpine.DEB.2.02.1306181705530.28460@M2420> <1371560680.3495.121.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <1371560680.3495.121.camel@deadeye.wl.decadent.org.uk>
Sender: linux-next-owner@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Xiong Zhou <jencce.kernel@gmail.com>, matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, jim.epost@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On 06/18/13 06:04, Ben Hutchings wrote:
> On Tue, 2013-06-18 at 17:21 +0800, Xiong Zhou wrote:
>> From: Xiong Zhou <jencce.kernel@gmail.com>
>>
>> Fix randconfig build failure for Amilo x86 platform driver.
>> AMILO_RFKILL requires SERIO_I8042 being available.
>>
>> amilo-rfkill.c:(.text+0x108b5b): undefined reference to `i8042_lock_chip'
>> amilo-rfkill.c:(.text+0x108b69): undefined reference to `i8042_command'
>> amilo-rfkill.c:(.text+0x108b71): undefined reference to `i8042_unlock_chip'
>>
>> Reported-by: Jim Davis <jim.epost@gmail.com>
>> Signed-off-by: Xiong Zhou <jencce.kernel@gmail.com>
> 
> Acked-by: Ben Hutchings <ben@decadent.org.uk>
> 
> But I thought somehow sent this same fix a while back...

Yes, I reported it and sent a patch for it that you acked...
I guess my patch was never picked up.

> 
> Ben.
> 
>> ---
>>  drivers/platform/x86/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 8577261..37645b9 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -176,6 +176,7 @@ config FUJITSU_TABLET
>>  config AMILO_RFKILL
>>  	tristate "Fujitsu-Siemens Amilo rfkill support"
>>  	depends on RFKILL
>> +	depends on SERIO_I8042
>>  	---help---
>>  	  This is a driver for enabling wifi on some Fujitsu-Siemens Amilo
>>  	  laptops.
> 


-- 
~Randy

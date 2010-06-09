From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] classmate-laptop: fix for RFKILL=m, CMPC=y
Date: Wed, 09 Jun 2010 13:05:04 -0700
Message-ID: <4C0FF3F0.2080601@oracle.com>
References: <20100603134753.710a64b3.sfr@canb.auug.org.au> <20100603093903.d9378c9a.randy.dunlap@oracle.com> <20100609200218.GD2551@barata.holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:59915 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757220Ab0FIUGe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 16:06:34 -0400
In-Reply-To: <20100609200218.GD2551@barata.holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Daniel Oliveira Nascimento <don@syst.com.br>

On 06/09/10 13:02, Thadeu Lima de Souza Cascardo wrote:
> On Thu, Jun 03, 2010 at 09:39:03AM -0700, Randy Dunlap wrote:
>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>
>> Fix build error when CONFIG_RFKILL=m and CONFIG_ACPI_CMPC=y:
>> classmate-laptop should depend on RFKILL or RFKILL=n.
>>
>> classmate-laptop.c:(.text+0x1351fc): undefined reference to `rfkill_unregister'
>> classmate-laptop.c:(.text+0x135204): undefined reference to `rfkill_destroy'
>> classmate-laptop.c:(.text+0x135237): undefined reference to `rfkill_set_sw_state'
>> classmate-laptop.c:(.text+0x1352b9): undefined reference to `rfkill_alloc'
>> classmate-laptop.c:(.text+0x1352ca): undefined reference to `rfkill_register'
>> classmate-laptop.c:(.text+0x1352d6): undefined reference to `rfkill_destroy'
>>
>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>> ---
> 
> 
> Randy,
> 
> Since this implies a build failure, shouldn't it be sent for rc too?

Yes, it should.
I hit the problem during a linux-next build, but it does apply to mainline as well.
Thanks.


>>  drivers/platform/x86/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- linux-next-20100603.orig/drivers/platform/x86/Kconfig
>> +++ linux-next-20100603/drivers/platform/x86/Kconfig
>> @@ -520,6 +520,7 @@ config TOSHIBA_BT_RFKILL
>>  config ACPI_CMPC
>>  	tristate "CMPC Laptop Extras"
>>  	depends on X86 && ACPI
>> +	depends on RFKILL || RFKILL=n
>>  	select INPUT
>>  	select BACKLIGHT_CLASS_DEVICE
>>  	default n


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

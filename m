From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: Re: [PATCH] intel_ips: quieten "power or thermal limit exceeded"
 messages
Date: Thu, 26 Aug 2010 21:11:05 -0300
Message-ID: <4C770299.6000708@cesarb.net>
References: <Pine.LNX.4.30.1008261631410.13713-100000@mail.perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-03.mandic.com.br ([200.225.81.143]:42382 "EHLO
	smtp-03.mandic.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700Ab0H0ALJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 20:11:09 -0400
In-Reply-To: <Pine.LNX.4.30.1008261631410.13713-100000@mail.perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Em 26-08-2010 20:33, Joe Perches escreveu:
> On Thu, 26 Aug 2010, Cesar Eduardo Barros wrote:
>
>> On my Dell Inspiron N4010, one of these messages is printed every five
>> seconds. Change both to dev_dbg to quieten them even more.
>
> I think you should instead fix your hardware or maybe change
> your thermal throttling settings.

How can I know if this laptop is broken or not? According to Jesse's 
reply, the BIOS lowered the limit, which could explain why it hits the 
limit more often:

intel ips 0000:00:1f.6: Warning: CPU TDP doesn't match expected value 
(found 25, expected 35)

The thermal throttling seems to be also managed by the BIOS (and there 
are no settings about it on the BIOS setup that I remember):

CPU: Physical Processor ID: 0
CPU: Processor Core ID: 0
mce: CPU supports 9 MCE banks
CPU0: Thermal monitoring handled by SMI
using mwait in idle threads.
[...]
CPU0: Intel(R) Core(TM) i3 CPU       M 330  @ 2.13GHz stepping 02
Booting Node   0, Processors  #1
CPU1: Thermal monitoring handled by SMI
  #2
CPU2: Thermal monitoring handled by SMI
  #3 Ok.
CPU3: Thermal monitoring handled by SMI
Brought up 4 CPUs

And ACPI is of no help, it shows two thermal zones, one always showing 
27 C, the other always showing 0 C (and even though that is below the 
reported thresholds of 55 C and 71 C for the fans, the fan still speeds 
up and down on its own, showing that it is just the reporting that is 
broken).

The fan does slow down to almost nothing (or even off) when idle and 
spins up to a strong hot breeze when compiling the kernel (make -j8), so 
the thermal monitoring on the BIOS seems to be working fine. I would 
expect broken hardware to run the fan on high speed all the time (not 
cooling enough) or low speed all the time (thermal sensor broken).

The coretemp module (which is not autoloaded) seems to be more helpful; 
it shows between 43000 and 45000 for temp1_input on both cores when 
idle, going up to 50000-56000 when lightly loaded (I have not looked at 
it yet while doing a heavy compile).

Is there a way to know if all this is just an oddness of this model, or 
if there is something which is not working quite right?

(All the output above is from 2.6.35.3; I am not running 2.3.36-rc2+ 
right now because it hangs on resume, and I have not yet had the time to 
look at it.)

>
>> @@ -607,7 +607,7 @@ static bool mcp_exceeded(struct ips_driver *ips)
>> -		dev_info(&ips->dev->dev,
>> +		dev_dbg(&ips->dev->dev,
>>   			 "MCP power or thermal limit exceeded\n");
>
>


-- 
Cesar Eduardo Barros
cesarb@cesarb.net
cesar.barros@gmail.com

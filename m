From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: Re: [PATCH] intel_ips: quieten "power or thermal limit exceeded"
 messages
Date: Sat, 28 Aug 2010 11:18:34 -0300
Message-ID: <4C791ABA.9070005@cesarb.net>
References: <Pine.LNX.4.30.1008261631410.13713-100000@mail.perches.com>	 <4C770299.6000708@cesarb.net> <1282869660.1836.5.camel@Joe-Laptop>	 <4C77171E.6060008@cesarb.net> <1282894751.1836.41.camel@Joe-Laptop>	 <4C784650.2030200@cesarb.net> <1282962104.1946.179.camel@Joe-Laptop>	 <4C78E8EF.1000009@cesarb.net> <1282994116.1946.226.camel@Joe-Laptop>	 <4C790693.1060908@cesarb.net> <1283002154.1946.268.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-02.mandic.com.br ([200.225.81.133]:43439 "EHLO
	smtp-02.mandic.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753459Ab0H1OSk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Aug 2010 10:18:40 -0400
In-Reply-To: <1283002154.1946.268.camel@Joe-Laptop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Em 28-08-2010 10:29, Joe Perches escreveu:
> On Sat, 2010-08-28 at 09:52 -0300, Cesar Eduardo Barros wrote:
>> Em 28-08-2010 08:15, Joe Perches escreveu:
>>>> I will try to enable dev_dbg() later and see what it prints.
>>> or add:
> []
>> Here it is:
>>
>> intel ips 0000:00:1f.6: Warning: CPU TDP doesn't match expected value
>> (found 25, expected 35)
>> intel ips 0000:00:1f.6: PCI INT C ->  GSI 18 (level, low) ->  IRQ 18
>> intel ips 0000:00:1f.6: show_turbo_limits:ips_probe cte:1 gte:1 cpt:0
>> mpl:65535 mtl:65535 mpl:65535
>
> So ips->core_power_limit is still 0.
>
> Is it bad bios or driver?
>
> I expect the bios/hw is faulty but fingers are easy to point.
>
> Your choice on how to minimize your current logging problem.
>
> Changing the message level to dev_dbg probably isn't the
> right thing to do overall, but it may suit you right now.

The solution here probably is not less logging. The best solution IMO 
would be to do some sanity checking when loading the module, and if the 
values do not make sense, print something to the log and return -ENODEV.

I expect that, when it works as it should, the first read while loading 
the module already returns sane values, so a sanity check there should 
not have many false positives. OTOH, it is best to not load the module 
when you think things are strange.

-- 
Cesar Eduardo Barros
cesarb@cesarb.net
cesar.barros@gmail.com

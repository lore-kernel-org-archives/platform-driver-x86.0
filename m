From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: Re: [PATCH] intel_ips: quieten "power or thermal limit exceeded"
 messages
Date: Thu, 26 Aug 2010 21:22:39 -0300
Message-ID: <4C77054F.8030104@cesarb.net>
References: <4C74686D.8090707@cesarb.net>	<1282865341-17607-1-git-send-email-cesarb@cesarb.net> <20100827011853.3faef5e7@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp-02.mandic.com.br ([200.225.81.133]:43564 "EHLO
	smtp-02.mandic.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753813Ab0H0AWp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 20:22:45 -0400
In-Reply-To: <20100827011853.3faef5e7@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Em 26-08-2010 21:18, Alan Cox escreveu:
> On Thu, 26 Aug 2010 20:29:01 -0300
> Cesar Eduardo Barros<cesarb@cesarb.net>  wrote:
>
>> On my Dell Inspiron N4010, one of these messages is printed every five
>> seconds. Change both to dev_dbg to quieten them even more.
>
> It's not the kind of thing you want to quieten since in most cases it is
> stuff you want to know about.

Isn't it a normal thing, however? If I understand it correctly, this 
driver allows you to use a bit more power but throttles back if you are 
using too much or it gets too hot. Thus, there should be nothing wrong 
or even unusual with the situations where these messages appear.

>>   	if (ret)
>> -		dev_info(&ips->dev->dev,
>> +		dev_dbg(&ips->dev->dev,
>>   			 "MCP power or thermal limit exceeded\n");
>
> Probably better to ratelimit it. Being told it occurs is important, being
> told every five seconds is indeed excessive.

Agreed. Even if it does not happen when idle, it should happen a lot 
while playing a CPU-heavy and GPU-heavy 3D game.

-- 
Cesar Eduardo Barros
cesarb@cesarb.net
cesar.barros@gmail.com

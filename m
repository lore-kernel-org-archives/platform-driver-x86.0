From: Jiri Slaby <jirislaby@gmail.com>
Subject: [ping] Re: eeepc: rfkill on 900A defunct
Date: Tue, 19 Apr 2011 15:53:51 +0200
Message-ID: <4DAD93EF.3090205@gmail.com>
References: <4CED26EF.5000109@suse.cz>	<20101124201834.GA7760@srcf.ucam.org>	<4D6B6F9A.1020102@gmail.com>	<4D75FF8E.9010103@gmail.com> <AANLkTinBRCdOa1QdvWJiihvBpmJyvmRvDoFYgp0yTMFc@mail.gmail.com> <4D760A36.5040206@gmail.com> <4D777796.9030608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64384 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388Ab1DSNx4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Apr 2011 09:53:56 -0400
In-Reply-To: <4D777796.9030608@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Woody Suwalski <terraluna977@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Jiri Slaby <jslaby@suse.cz>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 03/09/2011 01:50 PM, Woody Suwalski wrote:
> Jiri Slaby wrote:
>> On 03/08/2011 11:22 AM, Corentin Chary wrote:
>>   
>>> On Tue, Mar 8, 2011 at 10:06 AM, Jiri Slaby<jirislaby@gmail.com>  wrote:
>>>     
>>>> On 02/28/2011 10:49 AM, Jiri Slaby wrote:
>>>>       
>>>>> On 11/24/2010 09:18 PM, Matthew Garrett wrote:
>>>>>         
>>>>>> Hm. As a shorter term fix, can you try this (entirely untested!)
>>>>>> approach?
>>>>>>            
>>>>> What is the status of this? Was there any alternative merged?
>>>>>          
>>>> Ping.
>>>>        
>>> Because this is Matthew's patch, and I have no hardware to test that
>>> patch, I'm not touching it.
>>>
>>> Jiri, on what models was this patch tested (only got 701 and 901 here) ?
>>>      
>> It was 900A.
>>
>> thanks,
>>    
> I have tested it on 900A and it does the trick.
> wlan can now be turned off/on (did not notice the problem before Jiri
> posted the patch ;-) ). So it should go in...

Any updates? Matthew?

-- 
js

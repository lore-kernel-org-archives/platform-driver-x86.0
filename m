From: Peter Meiser <meiser@gmx-topmail.de>
Subject: Re: Dell Vostro V131: special hotkey not working
Date: Thu, 12 Jun 2014 08:58:50 +0200
Message-ID: <53994FAA.3010207@gmx-topmail.de>
References: <4F97FA4C.9040201@gmx-topmail.de> <20120425135328.GA13385@srcf.ucam.org> <4F980807.6000705@gmx-topmail.de> <20120425142205.GA14322@srcf.ucam.org> <50FA77C0.4060808@gmx-topmail.de> <51EA1A07.10105@gmx-topmail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:62771 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932263AbaFLG6w (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Jun 2014 02:58:52 -0400
Received: from [10.227.248.236] ([88.128.80.100]) by mail.gmx.com (mrgmx003)
 with ESMTPSA (Nemesis) id 0MYx2x-1XHEgD3VGl-00VjS6 for
 <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2014 08:58:50 +0200
In-Reply-To: <51EA1A07.10105@gmx-topmail.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi again,

can anyone please help me debugging this issue? I'd like to get special key working. The "Dell instant launch manager" hotkey still doesn't generate anything.

I'm running Ubuntu 14.04 right now (kernel 3.13).

Thanks a lot in advance,
Peter

Am 20.07.2013 07:03, schrieb Peter Meiser:
> Hi again,
> 
> I found a solution for the 1st issue. It needs a udev quirk to force_release. Please find attached a patch against current udev in Ubuntu 12.04.
> 
> For the 2nd issue, I still can't find a way to generate a keycode.
> 
> Thanks for your help!
> Best regards,
> Peter
> 
> Am 19.01.2013 11:38, schrieb Peter Meiser:
>> Hi Matthew,
>>
>> this topic is still valid. Could you help me debugging the hotkeys?
>>
>> There're two issues:
>> 1. The "Dell support center" hotkey generates keycode 0xEE, but this is done forever. That means that I don't see a release event.
>> 2. The "Dell instant launch manager" hotkey doesn't generate anything.
>>
>> Thanks a lot in advance,
>> Peter
>>
>> Am 25.04.2012 16:22, schrieb Matthew Garrett:
>>> On Wed, Apr 25, 2012 at 04:19:51PM +0200, Peter Meiser wrote:
>>>> Hello Matthew,
>>>>
>>>> Am 25.04.2012 15:53, schrieb Matthew Garrett:
>>>>> watch -n 0.1 cat /proc/interrupts
>>>>
>>>> When running "watch -n 0,1 cat /proc/interrupts" (watch -n 0.1 errors out, maybe because of German environment???), the following row increases after each press:
>>>>
>>>>   9:          5          0          0          0   IO-APIC-fasteoi   acpi
>>>
>>> Ok, so it's definitely being handled by ACPI somehow - probably via WMI, 
>>> but unsure. Rez, any chance you can look at the original message and let 
>>> us know if this is expected to work with the current driver?
>>>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some
 machines
Date: Fri, 8 Mar 2019 09:14:24 +0800
Message-ID: <a3ad032f-6b03-2e0e-ba3d-89de4cc35ed8@flygoat.com>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
 <28af3c22ad144cf69284aa6f91ee6565@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <28af3c22ad144cf69284aa6f91ee6565@ausx13mpc124.AMER.DELL.COM>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, ibm-acpi@hmh.eng.br
Cc: dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


ÔÚ 2019/3/8 ÉÏÎç7:14, Mario.Limonciello@dell.com Ð´µÀ:
>   -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>> owner@vger.kernel.org> On Behalf Of Jiaxun Yang
>> Sent: Thursday, March 7, 2019 2:08 AM
>> To: ibm-acpi@hmh.eng.br
>> Cc: dvhart@infradead.org; andy@infradead.org; ibm-acpi-
>> devel@lists.sourceforge.net; platform-driver-x86@vger.kernel.org; linux-
>> kernel@vger.kernel.org; stable@vger.kernel.org; Jiaxun Yang
>> Subject: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some
>> machines
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Some AMD based ThinkPads have a firmware bug that calling
>> "GBDC" will cause bluetooth on Intel wireless cards blocked.

Hi,

Thanks for your suggestions.

> Since this is considered a firmware bug; has the OEM (and IBV) been notified?  Is it
> fixed in a newer version of the firmware?
No. I've noticed them about the bug but they said these models have no 
official Linux support so no plan to fix.
> If so, then this should probably only match particular broken firmware versions.
Disable bluetooth subdriver on these models should be safe since Intel 
cards have built-in RFKill and there is no bluetooth hotkey on these 
machines.
>> Probe these models by DMI match and disable bluetooth subdriver
>> if specified Intel wireless card exist.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---

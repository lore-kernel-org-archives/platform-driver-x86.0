From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: Re: [PATCH v2 05/11] platform/x86: asus-wmi: Support queued WMI event
 codes
Date: Fri, 12 Apr 2019 22:32:10 +0200
Message-ID: <b7b1834f-42e2-b652-9944-eb9b45b81cd0@gmail.com>
References: <a8dd77f3-1e28-6416-5f04-aff44d5bb6d6@gmail.com>
 <777027ac-921e-ee37-493e-974b49242d18@gmail.com>
 <142fe2e3-b560-6136-32df-b14bb4ac46f7@gmail.com>
 <CAD8Lp47yHMt-zYd02s3AgBDNQvRA5=Ccp4id8nTVHnQOtT+4_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD8Lp47yHMt-zYd02s3AgBDNQvRA5=Ccp4id8nTVHnQOtT+4_Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org



On 12.04.19 09:48, Daniel Drake wrote:
> On Thu, Apr 11, 2019 at 1:44 PM Yurii Pavlovskyi
> <yurii.pavlovskyi@gmail.com> wrote:
>> Event codes are expected to be polled from a queue on at least some
>> models.
> 
> Maybe avoid the word "poll" since it suggests something else (at least to me).

Ok, will change this in the code as well.

>>> The fix flushes the old key codes out of the queue on load and after
>> receiving event the queue is read until either ..FFFF or 1 is encountered.
>>
>> It might be considered a minor issue and no normal user would likely to
>> observe this (there is little reason unloading the driver), but it does
>> significantly frustrate a developer who is unlucky enough to encounter
>> this.
>>
>> Introduce functionality for flushing and processing queued codes, which is
>> enabled via quirk flag for ASUS7000. It might be considered if it is
>> reasonable to enable it everywhere (might introduce regressions) or always
>> try to flush the queue on module load and try to detect if this quirk is
>> present in the future.
>>
>> This patch limits the effect to the specific hardware defined by ASUS7000
>> device that is used for driver detection by vendor driver of Fx505. The
>> fallback is also implemented in case initial flush fails.
> 
> Which vendor driver are you referring to here?

The ASUS Keyboard hotkeys Driver V2.0.5 which is available to download for
FX505 has this in his INF file:
[ATKP.ntamd64]

%DeviceDesc1% = NO_DRV64, ACPI\ASUS7000

But this driver is not generic. It is limited to very specific hardware,
I'd guess gaming series (for instance K54C does not have this device). It
was rather a way to avoid breaking anything. I think your suggestion below
is much better.

> 
> Researching more:
> In our database of 144 Asus models, 142 of them have GANQ.
> 
> Of those 142, 9 of them return One in the empty-queue case. The other
> 133 match your FX505GM device exactly. So it seems valid to interpret
> both 0xffff and 0x1 as queue-end markers.
> 
> The 2 devices that do not have GANQ are not laptops. They also do not
> have the _UID "ATK" WMI device, they only have "ASUSWMI" and their WMI
> _WED method does not use a queue.
> There are a few more units that have both ASUSWMI and ATK devices, and
> the ASUSWMI device appears to never be queued.
> Another observation is that the ASUSWMI device works with notify code
> 0xD2, and the ATK device works with 0xFF.
> 
> Nailing this down a bit further, I found a DSDT for EEEPC X101H: that
> one only has ASUSWMI and it is also not queued.
> 
> So I think you should make this queue behaviour applied more
> generically, but either avoid it when the WMI device _UID is not "ATK"
> (as discussed in the DCTS/DSTS thread), or avoid it when the notify
> code is not 0x>
> Thanks
> Daniel

Thanks a lot for your research, it's much appreciated! That seems to
confirm that these two quirks are actually connected with ATK device. I
guess it makes sense to combine the detection for both of them. Also to
flush the queue we need to know the notify code beforehand, because it is
checked in _WED so checking for ATK seems reasonable to me.

Best regards,
Yurii

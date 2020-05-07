From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 4/5] platform/x86: intel-vbtn: Also handle tablet-mode
 switch on "Detachable" and "Portable" chassis-types
Date: Thu, 7 May 2020 13:25:38 +0200
Message-ID: <ca5e5db1-eac5-358b-7d85-95d62e87b6f0@redhat.com>
References: <20200502182951.114231-1-hdegoede@redhat.com>
 <20200502182951.114231-5-hdegoede@redhat.com>
 <7c3e5f844a224ff780cd8e3b3f5f7641@AUSX13MPC101.AMER.DELL.COM>
 <13a8ec94-1eae-4d95-7238-85c612ebc896@redhat.com>
 <afe7c366c97f4ab18d5a98a9695ceff6@AUSX13MPC101.AMER.DELL.COM>
 <CAHp75VcNJFfgshhL_pYsHodF1pMNySw08Z_4jr-vVkE-Xpj_ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcNJFfgshhL_pYsHodF1pMNySw08Z_4jr-vVkE-Xpj_ng@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/5/20 4:27 PM, Andy Shevchenko wrote:
> On Tue, May 5, 2020 at 5:22 PM <Mario.Limonciello@dell.com> wrote:
>>
>>> -----Original Message-----
>>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>>> owner@vger.kernel.org> On Behalf Of Hans de Goede
>>> Sent: Tuesday, May 5, 2020 4:06 AM
>>> To: Limonciello, Mario; dvhart@infradead.org; andy@infradead.org
>>> Cc: linux-acpi@vger.kernel.org; platform-driver-x86@vger.kernel.org; linux-
>>> kernel@vger.kernel.org
>>> Subject: Re: [PATCH 4/5] platform/x86: intel-vbtn: Also handle tablet-mode
>>> switch on "Detachable" and "Portable" chassis-types
>>>
>>>
>>> [EXTERNAL EMAIL]
>>>
>>> Hi,
>>>
>>> On 5/4/20 5:37 PM, Mario.Limonciello@dell.com wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Hans de Goede <hdegoede@redhat.com>
>>>>> Sent: Saturday, May 2, 2020 1:30 PM
>>>>> To: Darren Hart; Andy Shevchenko; Limonciello, Mario
>>>>> Cc: Hans de Goede; linux-acpi@vger.kernel.org; platform-driver-
>>>>> x86@vger.kernel.org; linux-kernel@vger.kernel.org
>>>>> Subject: [PATCH 4/5] platform/x86: intel-vbtn: Also handle tablet-mode
>>> switch
>>>>> on "Detachable" and "Portable" chassis-types
>>>>>
>>>>>
>>>>> [EXTERNAL EMAIL]
>>>>>
>>>>> Commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
>>>>> switch on 2-in-1's") added a DMI chassis-type check to avoid accidentally
>>>>> reporting SW_TABLET_MODE = 1 to userspace on laptops.
>>>>>
>>>>> Some devices with a detachable keyboard and using the intel-vbnt (INT33D6)
>>>>> interface to report if they are in tablet mode (keyboard detached) or not,
>>>>> report 32 / "Detachable" as chassis-type, e.g. the HP Pavilion X2 series.
>>>>>
>>>>> Other devices with a detachable keyboard and using the intel-vbnt (INT33D6)
>>>>> interface to report SW_TABLET_MODE, report 8 / "Portable" as chassis-type.
>>>>> The Dell Venue 11 Pro 7130 is an example of this.
>>>>>
>>>>> Extend the DMI chassis-type check to also accept Portables and Detachables
>>>>> so that the intel-vbtn driver will report SW_TABLET_MODE on these devices.
>>>>>
>>>>> Note the chassis-type check was originally added to avoid a false-positive
>>>>> tablet-mode report on the Dell XPS 9360 laptop. To the best of my knowledge
>>>>> that laptop is using a chassis-type of 9 / "Laptop", so after this commit
>>>>> we still ignore the tablet-switch for that chassis-type.
>>>>
>>>> Yes that's correct.
>>>>
>>>>>
>>>>> Fixes: de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
>>>>> switch on 2-in-1's")
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>> Looking at the Microsoft Windows documentation for tablet-mode reporting:
>>>>> https://docs.microsoft.com/en-us/windows-hardware/drivers/gpiobtn/button-
>>>>> implementation
>>>>>
>>>>> Then the presence of a tablet-mode switch is indicated by the presence
>>>>> of a PNP0C60 compatible ACPI devices. There are 2 ways in which this device
>>>>> can report the tablet-mode. 1. Directly providing a GpioInt resource inside
>>>>> the PNP0C60 device, 2. Through injecting events from a Windows driver.
>>>>>
>>>>> It seems that the intel-vbtn / the INT33D6 ACPI device is the ACPI side
>>>>> of Intel's generic solution for the case where the tablet-mode comes from
>>>>> the embedded-controller and needs to be "injected".
>>>>>
>>>>> This all suggests that it might be better to replace the chassis-type
>>>>> check with a acpi_dev_present("PNP0C60", NULL, -1) check.
>>>>>
>>>>> Mario, can you provide an acpidump and alsa-info.sh output for the
>>>>> Dell XPS 9360, so that I can check if that might help with the issue
>>>>> there, and thus is a potential candidate to replace the chassis-type
>>>>> check?
>>>>
>>>> Unfortunately with WFH right now, I don't have access to a XPS 9630 to
>>>> double check the patch series.
>>>>
>>>> However I do agree this should be a good approach.
>>>
>>> Ok, so lets stick with the chassis-type check (as amended by this patch)
>>> for now then. Then once you are able to go to your office again, we
>>> can examine the acpi_dev_present("PNP0C60", NULL, -1) alternative.
>>
>> I know XPS 13's are pretty popular, perhaps someone on the mailing list who has
>> one can share ACPI dump in the interim.
> 
> https://github.com/intel/dptfxtract/issues/13

Good one.

So this has:

         Device (CIND)
         {
             Name (_HID, "INT33D3" /* Intel GPIO Buttons */)  // _HID: Hardware I
             Name (_CID, "PNP0C60" /* Display Sensor Device */)  // _CID: Compati
             Method (_STA, 0, Serialized)  // _STA: Status
             {
                 If ((OSYS >= 0x07DC))
                 {
                     Return (0x0F)
                 }

                 Return (Zero)
             }
         }

And OSYS >= 0x07DC checks for "Windows 2012" which Linux does advertise,
so despite not having a tablet-mode(switch) the XPS 9360 still has a
PNP0C60 ACPI device and will report 0xf (present) as status for it,
so a acpi_dev_present("PNP0C60", NULL, -1) check will succeed on it.

Conclusion: such a check is not a valid alternative for checking DMI
chassis-types (and from that pov this series thus is ready for merging).

Regards,

Hans

From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH v3] dcdbas: Add support for WSMT ACPI table
Date: Tue, 3 Jul 2018 08:52:22 -0500
Message-ID: <4e9a34c5-e0e6-b060-40fa-30d738d1eb69@gmail.com>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com>
 <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
 <20180609010420.GA112645@localhost.localdomain>
 <CAHp75VcA5ZWahraDP69_hBHuqxw6cng93zAa1op5EBYfuCSPwg@mail.gmail.com>
 <b59027b3-a48e-f168-5f12-c67758c0c2c7@gmail.com>
 <CAHp75VcK78jL_7sF+ZGaPpwDED-6Xd+SdH_5WCfSBsVJW2GnDg@mail.gmail.com>
 <8307f1e0-c480-3f78-9327-e248208e5349@gmail.com>
 <CAHp75VdTGXqE__VHjRphEmpMVfxaVVik=u-_0NRhQAKeq=+ZKA@mail.gmail.com>
 <b5652ed8-5fff-4f8b-ec0f-467bce853bf8@gmail.com>
 <CAHp75VfL3v8U6o36-e3+XPL53sb9wMUOXsL6gn3XE4=-kJjuKQ@mail.gmail.com>
 <367a12e9-7d10-98e4-4791-69cdc7d01129@gmail.com>
 <CAHp75VdSVLzNHnrOzzrBMf4X2Cg4QACRrnxKNkQzcYJ0h5W+tw@mail.gmail.com>
 <e17fbb51b98d45318001adb7eb6a51b2@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VfNo9NVfgGn4Fqa5fA9zp47TkqHwn1MJ044qMQoMNMB-Q@mail.gmail.com>
 <73c53c23c0824e4595292bfafc6054ee@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73c53c23c0824e4595292bfafc6054ee@ausx13mpc120.AMER.DELL.COM>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com, andy.shevchenko@gmail.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 7/2/2018 11:15 AM, Mario.Limonciello@dell.com wrote:
>>
>>> I don't believe SMM communication ACPI table has ever been implemented by
>> Dell
>>> on server or client BIOS.  I do agree this table describes the behavior that DCDBAS
>> driver
>>> has used since before even UEFI BIOS pretty accurately.
>>
>> So, EPS table has been for ages in Dell machines?
>> Can we consider it as a predecessor of that SMM communication ACPI table?
> 
> No, EPS is new this year, specifically for server BIOS to be able to support SMM communication
> when WSMT is enabled.  The code tests in Stuart's patch will detect if WSMT is enabled
> and if it's enabled test if EPS was defined.  On server BIOS when EPS is defined dcdbas
> will be able to communicate using addresses defined in EPS.
> 
> Server BIOS will support EPS for applications using dcdbas interface and may at a later time
> introduce same WMI interface as client too (but applications will need time to update so
> they need to support both).
> 
> Actually Stuart's patch will cause client BIOS that has WSMT enabled make dcdbas fail
> initialization (as it should because dcdbas doesn't have a region that it can successfully
> communicate).  
> 
> In client machines we moved this communication to ACPI buffer allocated by WMI, which
> is why we have dell-smbios-wmi now in kernel.
> 
> I think once some variation of Stuart's patch is merged, I'll send a follow
> up patch to drop this test because it's no longer necessary:
> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/dell-smbios-smm.c#L106
> 
> 
>>
>>> Stuart and I did discuss with server BIOS (who uses this EPS mechanism) to see if
>> its possible
>>> to move EPS to SMM communication ACPI table however since it's been
>> deprecated by
>>> UEFI 2.7 they weren't willing to adopt it.
>>
>> It's pity, but the motivation to deprecate is "lack of use" which is
>> not true. That's why I would suggest to escalate this to UEFI
>> committee.
>>
>>> Stuart, anything else you want to add here?
>>
>> Darren, what's your opinion about this?
>>
>> P.S. I'm not against this approach (just some technical comments I
>> already shared), but on the other hand it would be nice to have undo
>> that deprecation and follow the standard in new firmwares.
>> Would you agree?
> 
> Sure.  Due to the timing of how long this will take, even if SMM communication
> ACPI table is undone from deprecation we may have to still support both EPS
> and SMM communication ACPI table though (maybe it would be order of preference).
> 
> 

I have confirmation that the EPS table will be 16-byte aligned, so I can make that
change.  I'll send a v5 with that and the updated comment.

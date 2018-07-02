From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] dcdbas: Add support for WSMT ACPI table
Date: Mon, 2 Jul 2018 18:21:39 +0300
Message-ID: <CAHp75VfNo9NVfgGn4Fqa5fA9zp47TkqHwn1MJ044qMQoMNMB-Q@mail.gmail.com>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com> <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
 <20180609010420.GA112645@localhost.localdomain> <CAHp75VcA5ZWahraDP69_hBHuqxw6cng93zAa1op5EBYfuCSPwg@mail.gmail.com>
 <b59027b3-a48e-f168-5f12-c67758c0c2c7@gmail.com> <CAHp75VcK78jL_7sF+ZGaPpwDED-6Xd+SdH_5WCfSBsVJW2GnDg@mail.gmail.com>
 <8307f1e0-c480-3f78-9327-e248208e5349@gmail.com> <CAHp75VdTGXqE__VHjRphEmpMVfxaVVik=u-_0NRhQAKeq=+ZKA@mail.gmail.com>
 <b5652ed8-5fff-4f8b-ec0f-467bce853bf8@gmail.com> <CAHp75VfL3v8U6o36-e3+XPL53sb9wMUOXsL6gn3XE4=-kJjuKQ@mail.gmail.com>
 <367a12e9-7d10-98e4-4791-69cdc7d01129@gmail.com> <CAHp75VdSVLzNHnrOzzrBMf4X2Cg4QACRrnxKNkQzcYJ0h5W+tw@mail.gmail.com>
 <e17fbb51b98d45318001adb7eb6a51b2@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e17fbb51b98d45318001adb7eb6a51b2@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 2, 2018 at 5:07 PM,  <Mario.Limonciello@dell.com> wrote:

>> >> OK, now the most important question, did you investigate "SMM
>> >> Communication ACPI Table"?
>> >> Can you utilize information in it?
>>
>> > Dell BIOS does not provide a "SMM Communication ACPI Table", just the EPS.  It
>> appears
>> > that the "SMM Communication ACPI Table" is deprecated in the UEFI 2.7 spec.
>> Also, the
>> > dcdbas driver is for Dell systems only.
>>
>> > The EPS table isn't an ACPI table,
>> > it's just a Dell-defined table.
>>
>> Hmm... It's either strange or has some background why is so.
>> OK it has a note that there is no use case, but here it is!
>>
>> Mario, can we consider this as a BIOS bug which doesn't provide SMM
>> Communication ACPI table?
>>
>> Can it be escalated on UEFI committee?

> I don't believe SMM communication ACPI table has ever been implemented by Dell
> on server or client BIOS.  I do agree this table describes the behavior that DCDBAS driver
> has used since before even UEFI BIOS pretty accurately.

So, EPS table has been for ages in Dell machines?
Can we consider it as a predecessor of that SMM communication ACPI table?

> Stuart and I did discuss with server BIOS (who uses this EPS mechanism) to see if its possible
> to move EPS to SMM communication ACPI table however since it's been deprecated by
> UEFI 2.7 they weren't willing to adopt it.

It's pity, but the motivation to deprecate is "lack of use" which is
not true. That's why I would suggest to escalate this to UEFI
committee.

> Stuart, anything else you want to add here?

Darren, what's your opinion about this?

P.S. I'm not against this approach (just some technical comments I
already shared), but on the other hand it would be nice to have undo
that deprecation and follow the standard in new firmwares.
Would you agree?

-- 
With Best Regards,
Andy Shevchenko

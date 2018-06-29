From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] dcdbas: Add support for WSMT ACPI table
Date: Fri, 29 Jun 2018 22:29:39 +0300
Message-ID: <CAHp75VdSVLzNHnrOzzrBMf4X2Cg4QACRrnxKNkQzcYJ0h5W+tw@mail.gmail.com>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com> <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
 <20180609010420.GA112645@localhost.localdomain> <CAHp75VcA5ZWahraDP69_hBHuqxw6cng93zAa1op5EBYfuCSPwg@mail.gmail.com>
 <b59027b3-a48e-f168-5f12-c67758c0c2c7@gmail.com> <CAHp75VcK78jL_7sF+ZGaPpwDED-6Xd+SdH_5WCfSBsVJW2GnDg@mail.gmail.com>
 <8307f1e0-c480-3f78-9327-e248208e5349@gmail.com> <CAHp75VdTGXqE__VHjRphEmpMVfxaVVik=u-_0NRhQAKeq=+ZKA@mail.gmail.com>
 <b5652ed8-5fff-4f8b-ec0f-467bce853bf8@gmail.com> <CAHp75VfL3v8U6o36-e3+XPL53sb9wMUOXsL6gn3XE4=-kJjuKQ@mail.gmail.com>
 <367a12e9-7d10-98e4-4791-69cdc7d01129@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <367a12e9-7d10-98e4-4791-69cdc7d01129@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 29, 2018 at 9:56 PM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
> On 06/27/2018 06:52 PM, Andy Shevchenko wrote:
>> On Fri, Jun 15, 2018 at 1:31 AM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
>>> On 6/14/2018 12:25 PM, Andy Shevchenko wrote:
>>>> On Thu, Jun 14, 2018 at 5:22 PM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
>>>>> On 6/13/2018 3:54 AM, Andy Shevchenko wrote:

>>>> Thanks, but here I meant += 1 vs += 16 step.

> I did realize that the debug code that printed the address of the EPS table was not
> working right, and the table on my system is actually 16-byte aligned.  However,
> the documentation on the EPS does not specify that it will be 16-byte aligned, so I
> don't think the driver should make that assumption, especially since scanning a 64K
> region byte by byte should take very little extra time over scanning every 16th byte.

> I guess this isn't needed since the table on my system actually is 16-byte aligned.

I think the 16 byte is a natural alignment applicable to all tables like a such.
I would rather go with it until we will get a (weird) BIOS which does
not support that.

(I believe this alignment just comes by definition of C ABIs for the
structures / types. So, each defined type is located on an aligned
boundaries)

>>> [ 4680.194012] dcdbas dcdbas: WSMT found, using firmware-provided SMI buffer.
>>> [ 4680.195327] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.3)
>>
>> OK, now the most important question, did you investigate "SMM
>> Communication ACPI Table"?
>> Can you utilize information in it?

> Dell BIOS does not provide a "SMM Communication ACPI Table", just the EPS.  It appears
> that the "SMM Communication ACPI Table" is deprecated in the UEFI 2.7 spec.  Also, the
> dcdbas driver is for Dell systems only.

> The EPS table isn't an ACPI table,
> it's just a Dell-defined table.

Hmm... It's either strange or has some background why is so.
OK it has a note that there is no use case, but here it is!

Mario, can we consider this as a BIOS bug which doesn't provide SMM
Communication ACPI table?

Can it be escalated on UEFI committee?

-- 
With Best Regards,
Andy Shevchenko

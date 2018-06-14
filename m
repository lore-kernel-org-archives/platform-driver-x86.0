From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] dcdbas: Add support for WSMT ACPI table
Date: Thu, 14 Jun 2018 20:25:03 +0300
Message-ID: <CAHp75VdTGXqE__VHjRphEmpMVfxaVVik=u-_0NRhQAKeq=+ZKA@mail.gmail.com>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com> <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
 <20180609010420.GA112645@localhost.localdomain> <CAHp75VcA5ZWahraDP69_hBHuqxw6cng93zAa1op5EBYfuCSPwg@mail.gmail.com>
 <b59027b3-a48e-f168-5f12-c67758c0c2c7@gmail.com> <CAHp75VcK78jL_7sF+ZGaPpwDED-6Xd+SdH_5WCfSBsVJW2GnDg@mail.gmail.com>
 <8307f1e0-c480-3f78-9327-e248208e5349@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8307f1e0-c480-3f78-9327-e248208e5349@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Douglas_Warzecha@dell.com, Mario Limonciello <mario.limonciello@dell.com>, Jared.Dominguez@dell.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 14, 2018 at 5:22 PM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
> On 6/13/2018 3:54 AM, Andy Shevchenko wrote:

>>> +                * Provide physical address of command buffer field within
>>> +                * the struct smi_cmd... can't use virt_to_phys on smi_cmd
>>> +                * because address may be from memremap.
>>
>> Wait, memremap() might return a virtual address. How we be sure that
>> we got still physical address here?

> Before this patch, the address in smi_cmd always came from an alloc, so
> virt_to_phys() was used to get the physical address here.  With WSMT, we
> could be using a BIOS-provided buffer for SMI, in which case the address in
> smi_cmd will come from memremap(), so we can't use virt_to_phys() on it.
> So instead I changed this to use the physical address of smi_data_buf that
> is stored in smi_data_buf_phys_addr, which will be valid regardless of how
> the address of smi_data_buf was generated.

Yes, but what does guarantee that memremap() will return you still
physical address?

>>> +               return 0;
>>> +
>>> +       /* Scan for EPS (entry point structure) */
>>> +       for (addr = (u8 *)__va(0xf0000);
>>> +            addr < (u8 *)__va(0x100000 - sizeof(struct smm_eps_table));
>>
>>> +            addr += 1) {
>>
>> This wasn't commented IIRC and changed. So, why?

> I changed this is response to your earlier comment (7 june)... you had pointed
> out that it would be better if I put an "if (eps) break;" inside the for loop
> instead of having "&& !eps" in the condition of the for loop.  I put the note
> "Changed loop searching 0xf0000 to be more readable" in the list of changes for
> patch version v3 to cover this change.

Thanks, but here I meant += 1 vs += 16 step.

-- 
With Best Regards,
Andy Shevchenko

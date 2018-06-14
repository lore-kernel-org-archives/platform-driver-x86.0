From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH v3] dcdbas: Add support for WSMT ACPI table
Date: Thu, 14 Jun 2018 17:31:08 -0500
Message-ID: <b5652ed8-5fff-4f8b-ec0f-467bce853bf8@gmail.com>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com>
 <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
 <20180609010420.GA112645@localhost.localdomain>
 <CAHp75VcA5ZWahraDP69_hBHuqxw6cng93zAa1op5EBYfuCSPwg@mail.gmail.com>
 <b59027b3-a48e-f168-5f12-c67758c0c2c7@gmail.com>
 <CAHp75VcK78jL_7sF+ZGaPpwDED-6Xd+SdH_5WCfSBsVJW2GnDg@mail.gmail.com>
 <8307f1e0-c480-3f78-9327-e248208e5349@gmail.com>
 <CAHp75VdTGXqE__VHjRphEmpMVfxaVVik=u-_0NRhQAKeq=+ZKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdTGXqE__VHjRphEmpMVfxaVVik=u-_0NRhQAKeq=+ZKA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Douglas_Warzecha@dell.com, Mario Limonciello <mario.limonciello@dell.com>, Jared.Dominguez@dell.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org



On 6/14/2018 12:25 PM, Andy Shevchenko wrote:
> On Thu, Jun 14, 2018 at 5:22 PM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
>> On 6/13/2018 3:54 AM, Andy Shevchenko wrote:
> 
>>>> +                * Provide physical address of command buffer field within
>>>> +                * the struct smi_cmd... can't use virt_to_phys on smi_cmd
>>>> +                * because address may be from memremap.
>>>
>>> Wait, memremap() might return a virtual address. How we be sure that
>>> we got still physical address here?
> 
>> Before this patch, the address in smi_cmd always came from an alloc, so
>> virt_to_phys() was used to get the physical address here.  With WSMT, we
>> could be using a BIOS-provided buffer for SMI, in which case the address in
>> smi_cmd will come from memremap(), so we can't use virt_to_phys() on it.
>> So instead I changed this to use the physical address of smi_data_buf that
>> is stored in smi_data_buf_phys_addr, which will be valid regardless of how
>> the address of smi_data_buf was generated.
> 
> Yes, but what does guarantee that memremap() will return you still
> physical address?
> 

Sorry, I'm not sure I understand the question.

Up to now, this driver always just allocated a buffer from main memory that
it used to send/receive information from BIOS when it generated a SMI.  That's
what smi_cmd points to where this comment is.  And it was safe to use
virt_to_phys() on this address.

With this patch, though, the driver may now be using a buffer that isn't part
of main memory--it could now be using a buffer that BIOS provided the physical
address for, and this would not be part of main memory.  So smi_cmd may contain
a virtual address that memremap() provided.  And because memremap() is just
like ioremap(), the driver can no longer use virt_to_phys(smi_cmd) to get the
physical address of the buffer.

My comment is just pointing that out... I was trying to say, "the code can't
use virt_to_phys(smi_cmd) to get the virtual address here".

memremap() should always return a virtual address that points to the physical
address we send it (unless it fails of course).


>>>> +               return 0;
>>>> +
>>>> +       /* Scan for EPS (entry point structure) */
>>>> +       for (addr = (u8 *)__va(0xf0000);
>>>> +            addr < (u8 *)__va(0x100000 - sizeof(struct smm_eps_table));
>>>
>>>> +            addr += 1) {
>>>
>>> This wasn't commented IIRC and changed. So, why?
> 
>> I changed this is response to your earlier comment (7 june)... you had pointed
>> out that it would be better if I put an "if (eps) break;" inside the for loop
>> instead of having "&& !eps" in the condition of the for loop.  I put the note
>> "Changed loop searching 0xf0000 to be more readable" in the list of changes for
>> patch version v3 to cover this change.
> 
> Thanks, but here I meant += 1 vs += 16 step.
> 

Sorry, I thought I had answered this earlier.  The spec does not say that the EPS
table will be on a 16-byte boundary.  And I just added a printk in this driver to
see where it is on the system I had at hand, and it isn't on a 16-byte boundary:

[ 4680.192542] dcdbas - EPS table at 000000005761efb7
[ 4680.194012] dcdbas dcdbas: WSMT found, using firmware-provided SMI buffer.
[ 4680.195327] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.3)

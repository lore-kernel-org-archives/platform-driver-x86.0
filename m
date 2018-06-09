From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH resend v2] dcdbas: Add support for WSMT ACPI table
Date: Sat, 9 Jun 2018 21:57:19 +0300
Message-ID: <CAHp75VcA5ZWahraDP69_hBHuqxw6cng93zAa1op5EBYfuCSPwg@mail.gmail.com>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com> <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
 <20180609010420.GA112645@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180609010420.GA112645@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Douglas_Warzecha@dell.com, Mario Limonciello <mario.limonciello@dell.com>, Jared_Dominguez@dell.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jun 9, 2018 at 4:04 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Jun 07, 2018 at 08:11:41PM +0300, Andy Shevchenko wrote:
>> On Thu, Jun 7, 2018 at 6:59 PM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:

>> > +static inline struct smm_eps_table *check_eps_table(u8 *addr)
>> > +{
>> > +       struct smm_eps_table *eps = (struct smm_eps_table *)addr;
>> > +
>>
>> > +       if (strncmp(SMM_EPS_SIG, eps->smm_comm_buff_anchor, 4) != 0)
>>
>> I'm not sure about strings operation here.
>> I would rather do like with other magic constants: introduce hex value
>> and compare it as unsigned integer.
>>
>> Also, it might be a warning, since \0 wasn't ever checked from the
>> string literal. Though, I'm not sure if it applicable to strncmp()
>> function (it's for strncpy for sure).
>
> I think we're OK here, and we're being consistent with the
> dell-wmi-descriptor test for "DELL WMI". I don't recall if it was that
> one or something else, but doing it in HEX ended up being more
> confusing. The \0 isn't an issue since strncmp will only compare the n
> (4) bytes.

Yeah, consistency is usually a priority over style. Though in the
context below I see also magic numbers instead of strings.
I have no strong opinion here which one is better to follow.

>> Also I've a feeling that 0xf0000 constant is defined already somewhere
>> under arch/x86/include/asm or evem include/linux.
>
> But... is it defined for this purpose? If not, I'd prefer it hardcoded
> (or with a DEFINE).

OK, I did a research, and the following is the result.

arch/x86/kernel/mpparse.c:636:      smp_scan_config(0xF0000, 0x10000))
arch/x86/kernel/probe_roms.c:27:        .start  = 0xf0000,

arch/x86/pci/irq.c:91: *  Search 0xf0000 -- 0xfffff for the PCI IRQ
Routing Table.
arch/x86/pci/irq.c:105: for (addr = (u8 *) __va(0xf0000); addr < (u8
*) __va(0x100000); addr += 16) {

arch/x86/platform/geode/alix.c:34:#define BIOS_SIGNATURE_TINYBIOS
         0xf0000
arch/x86/platform/olpc/olpc-xo1-pm.c:36:} ofw_bios_entry = { 0xF0000 +
PAGE_OFFSET, __KERNEL_CS };
arch/x86/platform/ts5500/ts5500.c:103:  bios = ioremap(0xf0000, 0x10000);

Perhaps it would be a good idea to introduce such constant in the future.

Note mpparse.c and irq.c, that's similar purpose of the address range.

>> >  #define SMI_CMD_MAGIC                          (0x534D4931)
>> >
>> > +#define SMM_EPS_SIG                            "$SCB"
>>
>> Just integer like above and put the sting as a comment.
>> (Side note: above magic also looks like string)
>
> Given the above, I think we can use the more recognizable string - since
> that is clearly how they think of this label.

OK with me!

-- 
With Best Regards,
Andy Shevchenko

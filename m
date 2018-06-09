From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH resend v2] dcdbas: Add support for WSMT ACPI table
Date: Fri, 8 Jun 2018 18:04:20 -0700
Message-ID: <20180609010420.GA112645@localhost.localdomain>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com>
 <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Douglas_Warzecha@dell.com, Mario Limonciello <mario.limonciello@dell.com>, Jared_Dominguez@dell.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 07, 2018 at 08:11:41PM +0300, Andy Shevchenko wrote:
> On Thu, Jun 7, 2018 at 6:59 PM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
> > If the WSMT ACPI table is present and indicates that a fixed communication
> > buffer should be used, use the firmware-specified buffer instead of
> > allocating a buffer in memory for communications between the dcdbas driver
> > and firmare.
> 
> >  config DCDBAS
> >         tristate "Dell Systems Management Base Driver"
> > -       depends on X86
> > +       depends on X86 && ACPI


> 
> Hmm... I'm not sure about this dependency.
> So, the question is do all users actually need this? How did it work
> previously? How has this been tested in case when command line has
> "acpi=off" (yes, this one just for sake of test, I don't believe it's
> a real use case)?

Yeah... after the 4.16 and 4.17 KConfig fumbling around the SMBIOS
driver which intersected with this one.... this needs to be thoroughly
covered, tested, and thought through. Linus was.... generous in the
number of attempts it took us to get that right.

Did DCDBAS ever work on a system without ACPI?

> 
> >  #include <linux/string.h>
> >  #include <linux/types.h>
> >  #include <linux/mutex.h>
> > +#include <linux/acpi.h>
> 
> Please, try to keep an order as much as possible.
> For example, in given context this line should be before string.h (I
> didn't check the actual file, perhaps even upper).
> 
> >  #include <asm/io.h>
> >
> >  #include "dcdbas.h"
> 
> >                 /* Calling Interface SMI */
> > -               smi_cmd->ebx = (u32) virt_to_phys(smi_cmd->command_buffer);
> > +               smi_cmd->ebx = smi_data_buf_phys_addr
> > +                               + offsetof(struct smi_cmd, command_buffer);
> 
> Please, keep at least + on the previous line.
> Also, I'm not sure what is the difference now. Especially for previous
> users when this wasn't the part of the driver.
> Some explanation needed.
> 
> > +static u8 checksum(u8 *buffer, u8 length)
> > +{
> > +       u8 sum = 0;
> > +       u8 *end = buffer + length;
> > +
> > +       while (buffer < end)
> > +               sum = (u8)(sum + *(buffer++));
> 
> Why not simple
> 
> sum += *buffer++;
> 
> ?
> 
> > +       return sum;
> > +}
> 
> And I would rather check if we have similar algoritms already in the
> kernel which  we might re-use.

Seems to be some options in lib/checksum.c to check.

> 
> > +
> > +static inline struct smm_eps_table *check_eps_table(u8 *addr)
> > +{
> > +       struct smm_eps_table *eps = (struct smm_eps_table *)addr;
> > +
> 
> > +       if (strncmp(SMM_EPS_SIG, eps->smm_comm_buff_anchor, 4) != 0)
> 
> I'm not sure about strings operation here.
> I would rather do like with other magic constants: introduce hex value
> and compare it as unsigned integer.
> 
> Also, it might be a warning, since \0 wasn't ever checked from the
> string literal. Though, I'm not sure if it applicable to strncmp()
> function (it's for strncpy for sure).

I think we're OK here, and we're being consistent with the
dell-wmi-descriptor test for "DELL WMI". I don't recall if it was that
one or something else, but doing it in HEX ended up being more
confusing. The \0 isn't an issue since strncmp will only compare the n
(4) bytes.

> 
> > +               return NULL;
> > +
> > +       if (checksum(addr, eps->length) != 0)
> > +               return NULL;
> > +
> > +       return eps;
> > +}
> > +
> > +static int dcdbas_check_wsmt(void)
> > +{
> > +       struct acpi_table_wsmt *wsmt = NULL;
> > +       struct smm_eps_table *eps = NULL;
> > +       u8 *addr;
> > +
> > +       acpi_get_table(ACPI_SIG_WSMT, 0, (struct acpi_table_header **)&wsmt);
> > +       if (!wsmt)
> > +               return 0;
> > +
> > +       /* Check if WSMT ACPI table shows that protection is enabled */
> > +       if (!(wsmt->protection_flags & ACPI_WSMT_FIXED_COMM_BUFFERS)
> > +           || !(wsmt->protection_flags
> > +                & ACPI_WSMT_COMM_BUFFER_NESTED_PTR_PROTECTION))
> > +               return 0;
> > +
> > +       /* Scan for EPS (entry point structure) */
> > +       for (addr = (u8 *)__va(0xf0000);
> > +            addr < (u8 *)__va(0x100000 - sizeof(struct smm_eps_table)) && !eps;
> 
> Perhaps better to do
> 
> for (...) {
>  eps = ...();
>  if (eps)
>   break;
> }
> 
> Also I've a feeling that 0xf0000 constant is defined already somewhere
> under arch/x86/include/asm or evem include/linux.

But... is it defined for this purpose? If not, I'd prefer it hardcoded
(or with a DEFINE).

> 
> > +            addr += 1)
> 
> += 1?!
> All tables I saw in BIOS are aligned with 16 bytes. Is it the case here?
> 
> Is there any other means to check if the table present? ACPI code?
> Method / variable?
> 
> > +               eps = check_eps_table(addr);
> > +
> > +       if (!eps) {
> > +               dev_dbg(&dcdbas_pdev->dev, "found WSMT, but no EPS found\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       /*
> > +        * Get physical address of buffer and map to virtual address.
> > +        * Table gives size in 4K pages, regardless of actual system page size.
> > +        */
> 
> > +       if (eps->smm_comm_buff_addr + 8 > U32_MAX) {
> 
> if (upper_32_bits(..._addr + 8)) {
> 
> ?
> 
> > +               dev_warn(&dcdbas_pdev->dev, "found WSMT, but EPS buffer address is above 4GB\n");
> > +               return -EINVAL;
> > +       }
> > +       eps_buffer = (u8 *)memremap(eps->smm_comm_buff_addr,
> 
> Why casting?
> 
> > +                                    eps->num_of_4k_pages * 4096, MEMREMAP_WB);
> 
> This multiplication looks strange. Perhaps use PAGE_SIZE?
> 
> > +       if (!eps_buffer) {
> > +               dev_warn(&dcdbas_pdev->dev, "found WSMT, but failed to map EPS buffer\n");
> > +               return -ENOMEM;
> > +       }
> > +
> > +       /* First 8 bytes of buffer is for semaphore */
> > +       smi_data_buf_phys_addr = (u32) eps->smm_comm_buff_addr + 8;
> 
> lower_32_bits() ?
> 
> > +       smi_data_buf = eps_buffer + 8;
> 
> > +       smi_data_buf_size = (unsigned long) min(eps->num_of_4k_pages * 4096 - 8,
> > +                           (u64) ULONG_MAX);
> 
> This is too twisted code. First, it needs explanation.
> Second, it might need some refactoring.
> 
> (Yes, I got the idea, but would it be better implementation?)
> 
> > +       max_smi_data_buf_size = smi_data_buf_size;
> > +       wsmt_enabled = true;
> > +       dev_info(&dcdbas_pdev->dev,
> > +                "WSMT found, using firmware-provided SMI buffer.\n");
> > +       return 1;
> > +}
> 
> >  #define SMI_CMD_MAGIC                          (0x534D4931)
> >
> > +#define SMM_EPS_SIG                            "$SCB"
> 
> Just integer like above and put the sting as a comment.
> (Side note: above magic also looks like string)

Given the above, I think we can use the more recognizable string - since
that is clearly how they think of this label.

Otherwise, agree with a follow-up to all of Andy's feedback.

-- 
Darren Hart
VMware Open Source Technology Center

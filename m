From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] dcdbas: Add support for WSMT ACPI table
Date: Wed, 13 Jun 2018 11:54:45 +0300
Message-ID: <CAHp75VcK78jL_7sF+ZGaPpwDED-6Xd+SdH_5WCfSBsVJW2GnDg@mail.gmail.com>
References: <45b8bde6-aaa8-3f3f-0528-81e5e931751c@gmail.com>
 <bc6846e1-2b6d-dcc2-355c-2699aa1607a2@gmail.com> <CAHp75Vdmqm+r=Orxs6_dCr18y+EwEQ=s-7UgaZKHuKbtjMcOig@mail.gmail.com>
 <20180609010420.GA112645@localhost.localdomain> <CAHp75VcA5ZWahraDP69_hBHuqxw6cng93zAa1op5EBYfuCSPwg@mail.gmail.com>
 <b59027b3-a48e-f168-5f12-c67758c0c2c7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b59027b3-a48e-f168-5f12-c67758c0c2c7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Douglas_Warzecha@dell.com, Mario Limonciello <mario.limonciello@dell.com>, Jared.Dominguez@dell.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 13, 2018 at 4:24 AM, Stuart Hayes <stuart.w.hayes@gmail.com> wrote:
>
> If the WSMT ACPI table is present and indicates that a fixed communication
> buffer should be used, use the firmware-specified buffer instead of
> allocating a buffer in memory for communications between the dcdbas driver
> and firmare.

Thanks for an update. My comments below.

> -       if ((pos + count) > MAX_SMI_DATA_BUF_SIZE)
> +       if ((pos + count) > max_smi_data_buf_size)
>                 return -EINVAL;

Parens are redundant, but okay, not purpose of the change.

> +               /* Calling Interface SMI

I suppose the style of the comments like
/*
 * Calling ...
...

> +                *
> +                * Provide physical address of command buffer field within
> +                * the struct smi_cmd... can't use virt_to_phys on smi_cmd
> +                * because address may be from memremap.

Wait, memremap() might return a virtual address. How we be sure that
we got still physical address here?

(Also note () when referring to functions)

> +                */
> +               smi_cmd->ebx = smi_data_buf_phys_addr +
> +                               offsetof(struct smi_cmd, command_buffer);

Btw, can it be one line (~83 character are okay for my opinion).

> +       acpi_get_table(ACPI_SIG_WSMT, 0, (struct acpi_table_header **)&wsmt);
> +       if (!wsmt)
> +               return 0;
> +
> +       /* Check if WSMT ACPI table shows that protection is enabled */
> +       if (!(wsmt->protection_flags & ACPI_WSMT_FIXED_COMM_BUFFERS)

> +           || !(wsmt->protection_flags
> +                & ACPI_WSMT_COMM_BUFFER_NESTED_PTR_PROTECTION))

Better to indent like

if (... ||
 !(... & ...)

> +               return 0;
> +
> +       /* Scan for EPS (entry point structure) */
> +       for (addr = (u8 *)__va(0xf0000);
> +            addr < (u8 *)__va(0x100000 - sizeof(struct smm_eps_table));

> +            addr += 1) {

This wasn't commented IIRC and changed. So, why?

-- 
With Best Regards,
Andy Shevchenko

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: dell-smbios: Link all dell-smbios-*
 modules together
Date: Tue, 27 Feb 2018 20:02:06 +0200
Message-ID: <CAHp75VcpkO8=iF=pXhbyaR_kP+kPhmr1AEQM-CwGuL78Z7T1Bg@mail.gmail.com>
References: <1519753659-3376-1-git-send-email-mario.limonciello@dell.com> <1519753659-3376-3-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519753659-3376-3-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 27, 2018 at 7:47 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> Some race conditions were raised due to dell-smbios and its backends
> not being ready by the time that a consumer would call one of the
> exported methods.
>
> To avoid this problem, guarantee that all initialization has been
> done by linking them all together and running init for them all.
>
> As part of this change the Kconfig needs to be adjusted so that
> CONFIG_DELL_SMBIOS_SMM and CONFIG_DELL_SMBIOS_WMI are boolean
> rather than modules.
>
> CONFIG_DELL_SMBIOS is a visually selectable option again and both
> CONFIG_DELL_SMBIOS_WMI and CONFIG_DELL_SMBIOS_SMM are optional.

> changes from v1:
>  * Move #ifdefs into dell-smbios.h and use static inline functions

> --- a/drivers/platform/x86/dell-smbios-smm.c
> +++ b/drivers/platform/x86/dell-smbios-smm.c

> +#ifdef CONFIG_DELL_SMBIOS_SMM

Hmm... It's still here.

Hint: in Makefile you need something like

obj-$(CONFIG_DELL_SMBIOS_SMM) += dell-smbios-smm.o

> +#endif /* CONFIG_DELL_SMBIOS_SMM */

> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c

> +#ifdef CONFIG_DELL_SMBIOS_WMI

Ditto.

> +#endif /* CONFIG_DELL_SMBIOS_WMI */


> +#ifdef CONFIG_DELL_SMBIOS_WMI
> +int init_dell_smbios_wmi(void);
> +void exit_dell_smbios_wmi(void);
> +#else /* CONFIG_DELL_SMBIOS_WMI */
> +static inline int init_dell_smbios_wmi(void)
> +{
> +       return -ENODEV;
> +}

> +static inline void exit_dell_smbios_wmi(void)
> +{}

One line, please.

> +#endif /* CONFIG_DELL_SMBIOS_WMI */
> +
> +#ifdef CONFIG_DELL_SMBIOS_SMM
> +int init_dell_smbios_smm(void);
> +void exit_dell_smbios_smm(void);
> +#else /* CONFIG_DELL_SMBIOS_SMM */
> +static inline int init_dell_smbios_smm(void)
> +{
> +       return -ENODEV;
> +}

> +static inline void exit_dell_smbios_smm(void)
> +{}

Ditto.

> +#endif /* CONFIG_DELL_SMBIOS_SMM */

-- 
With Best Regards,
Andy Shevchenko

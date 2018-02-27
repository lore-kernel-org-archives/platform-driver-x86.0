From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: dell-smbios: Link all dell-smbios-*
 modules together
Date: Tue, 27 Feb 2018 18:08:54 +0200
Message-ID: <CAHp75VcNWo0Mh8jYU0vV+RRt3ZudKns_ZStcp_7ueebJfwL_nQ@mail.gmail.com>
References: <1519747014-17561-1-git-send-email-mario.limonciello@dell.com> <1519747014-17561-3-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519747014-17561-3-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 27, 2018 at 5:56 PM, Mario Limonciello
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


> --- a/drivers/platform/x86/dell-smbios-smm.c
> +++ b/drivers/platform/x86/dell-smbios-smm.c

> +#ifdef CONFIG_DELL_SMBIOS_SMM

> +#else /* CONFIG_DELL_SMBIOS_SMM */
> +int init_dell_smbios_smm(void)
> +{
> +       return -ENODEV;
> +}

> +void exit_dell_smbios_smm(void)
> +{}
> +#endif /* CONFIG_DELL_SMBIOS_SMM */

> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c

> +#ifdef CONFIG_DELL_SMBIOS_WMI

> +#else /* CONFIG_DELL_SMBIOS_WMI */
> +int init_dell_smbios_wmi(void)
> +{
> +       return -ENODEV;
> +}
> +
> +void exit_dell_smbios_wmi(void)
> +{}
> +#endif /* CONFIG_DELL_SMBIOS_WMI */

It's rather strange to see above in *.c and not in *.h where it's
usually supposed to be...

> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -75,4 +75,10 @@ int dell_laptop_register_notifier(struct notifier_block *nb);
>  int dell_laptop_unregister_notifier(struct notifier_block *nb);
>  void dell_laptop_call_notifier(unsigned long action, void *data);
>
> +/* for the supported backends */
> +int init_dell_smbios_wmi(void);
> +void exit_dell_smbios_wmi(void);
> +int init_dell_smbios_smm(void);
> +void exit_dell_smbios_smm(void);
> +

...here...

>  #endif

-- 
With Best Regards,
Andy Shevchenko

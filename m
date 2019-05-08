From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 04/11] platform/x86: asus-wmi: Improve DSTS WMI method
 ID detection
Date: Wed, 8 May 2019 16:36:23 +0300
Message-ID: <CAHp75VfMXAyUpWTrEHnv1NcQcHch+RHehWYTjk6KMTbXbtppPg@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com> <d6ee51cc-eb0f-2bb9-fef9-f8b4bf849076@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d6ee51cc-eb0f-2bb9-fef9-f8b4bf849076@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 19, 2019 at 1:08 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The DSTS method detection mistakenly selects DCTS instead of DSTS if
> nothing is returned when the method ID is not defined in WMNB. As a result,
> the control of keyboard backlight is not functional for TUF Gaming series
> laptops. Implement another detection method instead.
>
> There is evidence that DCTS is handled by ACPI WMI devices that have _UID
> ASUSWMI, whereas none of the devices without ASUSWMI respond to DCTS and
> DSTS is used instead [1]. To check the _UID a new method is added to wmi.h
> / wmi.c. It returns _UID of the ACPI WMI device that declares WMI object
> with given GUID.
>
> Generally, it is possible that multiple PNP0C14 ACPI devices are present in
> the system as mentioned in the commit message of commit bff431e49ff5
> ("ACPI: WMI: Add ACPI-WMI mapping driver").
>
> Therefore the _UID is checked for given GUID that maps to a specific ACPI
> device, to which it is also mapped by other methods of wmi module.
>
> DSDT examples:
>
> FX505GM:
> Method (WMNB, 3, Serialized)
> { ...
>     If ((Local0 == 0x53545344))
>     {
>         ...
>         Return (Zero)
>     }
>     ...
>     // No return
> }
>
> K54C:
> Method (WMNB, 3, Serialized)
> { ...
>     If ((Local0 == 0x53545344))
>     {
>         ...
>         Return (0x02)
>     }
>     ...
>     Return (0xFFFFFFFE)
> }
>

> [1] https://lkml.org/lkml/2019/4/11/322

Link: ...?

>         int rv;
> +       char *wmi_uid;

Keep them in reversed spruce order.



> +       if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI)) {

> +               pr_info("Detected ASUSWMI, use DCTS\n");

dev_info()?

>                 asus->dsts_id = ASUS_WMI_METHODID_DSTS;
> -       else
> +       } else {

> +               pr_info("Detected %s, not ASUSWMI, use DSTS\n", wmi_uid);

Ditto.

> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c

> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h

This change should go separately.


> -#define ASUS_WMI_METHODID_DSTS         0x53544344 /* Device STatuS */
> -#define ASUS_WMI_METHODID_DSTS2                0x53545344 /* Device STatuS #2*/

> +#define ASUS_WMI_METHODID_DSTS         0x53544344 /* Device STatuS (DCTS) */

It's not clear from the description what 'C' stands for.
Is there any specification which describes the difference and actual
abbreviations?

> +#define ASUS_WMI_METHODID_DSTS2                0x53545344 /* Device STatuS (DSTS) */

-- 
With Best Regards,
Andy Shevchenko

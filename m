From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: disable bluetooth for some machines
Date: Thu, 7 Mar 2019 10:23:38 +0200
Message-ID: <CAHp75VeXPezw1Qyku2WvRPxF6euOX2BNdwFJTP37W9pdWRuynw@mail.gmail.com>
References: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307080820.9723-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stable <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 7, 2019 at 10:09 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Some AMD based ThinkPads have a firmware bug that calling
> "GBDC" will cause bluetooth on Intel wireless cards blocked.
>
> Probe these models by DMI match and disable bluetooth subdriver
> if specified Intel wireless card exist.

Thanks for a patch. My comments below.

(and take your time, there is merge window going on, so, your fix is
probably material for v5.1-rc2)

> @@ -79,6 +79,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/workqueue.h>
>  #include <linux/acpi.h>

> +#include <linux/pci.h>
>  #include <linux/pci_ids.h>

The new include has included the old one with IDs.

>  #include <linux/power_supply.h>
>  #include <sound/core.h>
> @@ -4501,11 +4502,80 @@ static void bluetooth_exit(void)
>         bluetooth_shutdown();
>  }

> +static int __init have_bt_fwbug(void)
> +{
> +       /* Some AMD based ThinkPads have a firmware bug that calling
> +        * "GBDC" will cause bluetooth on Intel wireless cards blocked
> +        */

/*
 * Comments in multi-line style example.
 * Should look like this one.
 */

> +       if (dmi_check_system(bt_fwbug_list)) {

> +               if (pci_get_device(PCI_VENDOR_ID_INTEL, 0x24F3, NULL) || \
> +                   pci_get_device(PCI_VENDOR_ID_INTEL, 0x24FD, NULL) || \
> +                   pci_get_device(PCI_VENDOR_ID_INTEL, 0x2526, NULL))

You can do a table and use pci_match_device().
On top of it

if (x) {
 if (y)
  ...
}

equivalent to

if (x && y) {
 ...
}

> +                       return 1;
> +               else
> +                       return 0;
> +       } else {
> +                       return 0;
> +       }
> +}

> +       if (have_bt_fwbug()) {
> +               vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
> +                       FW_BUG "disable bluetooth subdriver for Intel cards\n");
> +               return 1;
> +       }
>         vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_RFKILL,
>                         "initializing bluetooth subdriver\n");

Below I see the following:
        /* bluetooth not supported on 570, 600e/x, 770e, 770x, A21e, A2xm/p,
          G4x, R30, R31, R40e, R50e, T20-22, X20-21 */
       tp_features.bluetooth = hkey_handle &&
           acpi_evalf(hkey_handle, &status, "GBDC", "qd");

Is it possible to integrate your stuff to this one?
Or can you do similar, like tp_features.bluetooth = !have_bt_fwbug(); ?

-- 
With Best Regards,
Andy Shevchenko

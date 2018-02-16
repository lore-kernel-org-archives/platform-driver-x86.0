From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 12/12] extcon: axp288: Set USB role where necessary
Date: Fri, 16 Feb 2018 15:19:53 +0200
Message-ID: <CAHp75VcNpnx1vknr43sgDPEi8hu9yYRKv2JzOtg+ruuWoik3pg@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-13-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216104751.8371-13-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> The AXP288 BC1.2 charger detection / extcon code may seem like a strange
> place to add code to control the USB role-switch on devices with an AXP288,
> but there are 2 reasons to do this inside the axp288 extcon code:
>
> 1) On many devices the USB role is controlled by ACPI AML code, but the AML
>    code only switches between the host and none roles, because of Windows
>    not really using device mode. To make device mode work we need to toggle
>    between the none/device roles based on VBus presence, and the axp288
>    extcon gets interrupts on VBus insertion / removal.
>
> 2) In order for our BC1.2 charger detection to work properly the role
>    mux must be properly set to device mode before we do the detection.
>
> Also note the Kconfig help-text / obsolete depends on USB_PHY which are
> remnants from older never upstreamed code also controlling the mux from
> the axp288 extcon code.
>
> This commit also adds code to get notifications from the INT3496 extcon
> device, which is used on some devices to notify the kernel about id-pin
> changes instead of them being handled through AML code.
>
> This fixes:
> -Device mode not working on most CHT devices with an AXP288
> -Host mode not working on devices with an INT3496 ACPI device
> -Charger-type misdetection (always SDP) on devices with an INT3496 when the
>  USB role (always) gets initialized as host
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

>  config EXTCON_AXP288
>         tristate "X-Power AXP288 EXTCON support"
> -       depends on MFD_AXP20X && USB_PHY
> +       depends on MFD_AXP20X && USB_SUPPORT
> +       select USB_ROLE_SWITCH

Is it supposed to work outside of x86 world?..

> +#include <asm/cpu_device_id.h>
> +#include <asm/intel-family.h>

...if yes, this should go under CONFIG_X86 along with accompanying parts.

...if no, put corresponding dependency to Kconfig.

> +       if (info->role_sw) {
> +               ret = devm_add_action_or_reset(dev, axp288_put_role_sw, info);
> +               if (ret)
> +                       return ret;
> +
> +               if (acpi_dev_present("INT3496", NULL, -1)) {
> +                       info->id_extcon = extcon_get_extcon_dev("INT3496:00");

Please use instance found by acpi_dev_present(). Okay, actually new
helper is here:
acpi_dev_get_first_match_name().

> +                       if (!info->id_extcon)
> +                               return -EPROBE_DEFER;
> +
> +                       dev_info(dev, "controlling USB role\n");
> +               } else {
> +                       dev_info(dev, "controlling USB role based on vbus presence\n");
> +               }
> +       }
> +

-- 
With Best Regards,
Andy Shevchenko

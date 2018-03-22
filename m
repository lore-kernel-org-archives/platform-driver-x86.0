From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v9 12/12] extcon: axp288: Set USB role where necessary
Date: Fri, 23 Mar 2018 08:53:15 +0900
Message-ID: <5AB441EB.2030403@samsung.com>
References: <20180320125713.85465-1-heikki.krogerus@linux.intel.com>
        <CGME20180320125801epcas1p2117b4d90063e6c4129ec18e54b5bdea6@epcas1p2.samsung.com>
        <20180320125713.85465-13-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20180320125713.85465-13-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2018년 03월 20일 21:57, Heikki Krogerus wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> The AXP288 BC1.2 charger detection / extcon code may seem like a strange
> place to add code to control the USB role-switch on devices with an AXP288,
> but there are 2 reasons to do this inside the axp288 extcon code:
> 
> 1) On many devices the USB role is controlled by ACPI AML code, but the AML
>    code only switches between the host and none roles, because of Windows
>    not really using device mode. To make device mode work we need to toggle
>    between the none/device roles based on Vbus presence, and the axp288
>    extcon gets interrupts on Vbus insertion / removal.
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
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
> Changes in v4:
> -Add Andy's Reviewed-by
> 
> Changes in v2:
> -Add depends on X86 to Kconfig (the AXP288 PMIC is only used on X86)
> -Use new acpi_dev_get_first_match_name() helper to get the INT3496 device-name
> -Add Heikki's Reviewed-by
> ---
>  drivers/extcon/Kconfig         |   3 +-
>  drivers/extcon/extcon-axp288.c | 176 +++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 170 insertions(+), 9 deletions(-)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

[snip]

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics

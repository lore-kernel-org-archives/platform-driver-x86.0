From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Implement irq_set_wake
Date: Thu, 31 Jan 2019 21:47:00 +0200
Message-ID: <CAKErNvoeMs9cDDAvMfxaGLsKY3-q_JmrjCUB8VK4ZUXUVytwsQ@mail.gmail.com>
References: <20180924143719.22191-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924143719.22191-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On Mon, Sep 24, 2018 at 5:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> We were relying on the interrupt being shared with the ACPI SCI and the
> ACPI core calling irq_set_wake. But that does not always happen on
> Bay Trail devices, so we should do it ourselves.
>
> This fixes wake from USB not working on various Bay Trail devices.

This patch breaks suspend on ASUS E202SA (bisecting pointed me to this
patch, and if I revert it and build 4.20.5 without this patch,
everything works flawlessly).

This command fails with the following message:

# echo mem > /sys/power/state
Error while writing to stdout
write_loop: Device or resource busy

And here is dmesg output:

[  224.077275] PM: suspend entry (deep)
[  224.077286] PM: Syncing filesystems ... done.
[  225.495014] Freezing user space processes ... (elapsed 0.003 seconds) done.
[  225.498540] OOM killer disabled.
[  225.498543] Freezing remaining freezable tasks ... (elapsed 0.002
seconds) done.
[  225.500693] printk: Suspending console(s) (use no_console_suspend to debug)
[  225.502793] wlp1s0: deauthenticating from 00:03:7f:12:34:56 by
local choice (Reason: 3=DEAUTH_LEAVING)
[  225.535333] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  225.535882] sd 0:0:0:0: [sda] Stopping disk
[  226.969070] ACPI: EC: interrupt blocked
[  227.002156] ACPI: Preparing to enter system sleep state S3
[  227.007890] ACPI: EC: event blocked
[  227.007895] ACPI: EC: EC stopped
[  227.007900] PM: Saving platform NVS memory
[  227.008264] Disabling non-boot CPUs ...
[  227.034114] smpboot: CPU 1 is now offline
[  227.088320] smpboot: CPU 2 is now offline
[  227.141513] smpboot: CPU 3 is now offline
[  227.147086] Enabling non-boot CPUs ...
[  227.147187] x86: Booting SMP configuration:
[  227.147190] smpboot: Booting Node 0 Processor 1 APIC 0x2
[  227.147916]  cache: parent cpu1 should not be sleeping
[  227.148354] CPU1 is up
[  227.148424] smpboot: Booting Node 0 Processor 2 APIC 0x4
[  227.149800]  cache: parent cpu2 should not be sleeping
[  227.151143] CPU2 is up
[  227.151187] smpboot: Booting Node 0 Processor 3 APIC 0x6
[  227.152399]  cache: parent cpu3 should not be sleeping
[  227.153883] CPU3 is up
[  227.154876] ACPI: EC: EC started
[  227.155282] ACPI: Waking up from system sleep state S3
[  227.159874] ACPI: button: The lid device is not compliant to SW_LID.
[  227.169441] ACPI: EC: interrupt unblocked
[  228.236790] ACPI: EC: event unblocked
[  228.241950] rtlwifi: rtlwifi: wireless switch is on
[  228.251865] sd 0:0:0:0: [sda] Starting disk
[  228.476637] usb 1-4: reset full-speed USB device number 2 using xhci_hcd
[  228.562879] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[  228.563924] ata2: SATA link down (SStatus 4 SControl 300)
[  228.564979] ata1.00: supports DRM functions and may not be fully accessible
[  228.565493] ata1.00: NCQ Send/Recv Log not supported
[  228.567649] ata1.00: supports DRM functions and may not be fully accessible
[  228.568252] ata1.00: NCQ Send/Recv Log not supported
[  228.570075] ata1.00: configured for UDMA/133
[  228.580412] ahci 0000:00:13.0: port does not support device sleep
[  228.639349] Bluetooth: hci0: RTL: rtl: examining hci_ver=06
hci_rev=0e2f lmp_ver=06 lmp_subver=a041

[  228.639368] Bluetooth: hci0: RTL: rtl: unknown IC info, lmp subver
a041, hci rev 0e2f, hci ver 0006
[  228.639742] acpi LNXPOWER:01: Turning OFF
[  228.640033] OOM killer enabled.
[  228.640040] Restarting tasks ... done.
[  228.795406] PM: suspend exit
[  228.800399] audit: type=1130 audit(1548962671.104:94): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd"
exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
res=success'
[  229.067206] wlp1s0: authenticate with 12:34:56:78:90:12
[  229.067823] wlp1s0: send auth to 12:34:56:78:90:12 (try 1/3)
[  229.070955] wlp1s0: authenticated
[  229.072395] wlp1s0: associate with 12:34:56:78:90:12 (try 1/3)
[  229.074505] wlp1s0: RX AssocResp from 12:34:56:78:90:12 (capab=0x11
status=0 aid=2)
[  229.074819] wlp1s0: associated
[  233.809200] audit: type=1131 audit(1548962676.106:95): pid=1 uid=0
auid=4294967295 ses=4294967295 msg='unit=systemd-rfkill comm="systemd"
exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
res=success'

The laptop doesn't go to sleep, the screen turns off, and in a couple
of seconds it turns on.

Please take a look at this regression. Feel free to ask me for any
additional information you need.

Thanks,
Max

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel_int0002_vgpio.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
> index 987a3b03f225..33c3489f5bc1 100644
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -106,6 +106,21 @@ static void int0002_irq_mask(struct irq_data *data)
>         outl(gpe_en_reg, GPE0A_EN_PORT);
>  }
>
> +static int int0002_irq_set_wake(struct irq_data *data, unsigned int on)
> +{
> +       struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct platform_device *pdev = to_platform_device(chip->parent);
> +       int irq = platform_get_irq(pdev, 0);
> +
> +       /* Propagate to parent irq */
> +       if (on)
> +               enable_irq_wake(irq);
> +       else
> +               disable_irq_wake(irq);
> +
> +       return 0;
> +}
> +
>  static irqreturn_t int0002_irq(int irq, void *data)
>  {
>         struct gpio_chip *chip = data;
> @@ -128,6 +143,7 @@ static struct irq_chip int0002_irqchip = {
>         .irq_ack                = int0002_irq_ack,
>         .irq_mask               = int0002_irq_mask,
>         .irq_unmask             = int0002_irq_unmask,
> +       .irq_set_wake           = int0002_irq_set_wake,
>  };
>
>  static int int0002_probe(struct platform_device *pdev)

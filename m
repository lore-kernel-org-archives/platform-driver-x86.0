From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v9 19/20] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Fri, 17 Apr 2020 13:59:14 +0300
Message-ID: <CAHp75VcMH47yvqaTNN851+G4ghT-og0M15DaN0b_+J_0yCW84g@mail.gmail.com>
References: <20200416081552.68083-1-mika.westerberg@linux.intel.com>
 <20200416081552.68083-20-mika.westerberg@linux.intel.com> <20200417105704.GE3737@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200417105704.GE3737@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 17, 2020 at 1:56 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 16 Apr 2020, Mika Westerberg wrote:
>
> > This driver only creates a bunch of platform devices sharing resources
> > belonging to the PMC device. This is pretty much what MFD subsystem is
> > for so move the driver there, renaming it to intel_pmc_bxt.c which
> > should be more clear what it is.
> >
> > MFD subsystem provides nice helper APIs for subdevice creation so
> > convert the driver to use those. Unfortunately the ACPI device includes
> > separate resources for most of the subdevices so we cannot simply call
> > mfd_add_devices() to create all of them but instead we need to call it
> > separately for each device.
> >
> > The new MFD driver continues to expose two sysfs attributes that allow
> > userspace to send IPC commands to the PMC/SCU to avoid breaking any
> > existing applications that may use these. Generally this is bad idea so
> > document this in the ABI documentation.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  .../ABI/obsolete/sysfs-driver-intel_pmc_bxt   |  22 +
> >  arch/x86/include/asm/intel_pmc_ipc.h          |  47 --
> >  arch/x86/include/asm/intel_telemetry.h        |   1 +
> >  drivers/mfd/Kconfig                           |  16 +-
> >  drivers/mfd/Makefile                          |   1 +
> >  drivers/mfd/intel_pmc_bxt.c                   | 468 +++++++++++++
> >  drivers/platform/x86/Kconfig                  |  16 +-
> >  drivers/platform/x86/Makefile                 |   1 -
> >  drivers/platform/x86/intel_pmc_ipc.c          | 645 ------------------
> >  .../platform/x86/intel_telemetry_debugfs.c    |  12 +-
> >  drivers/platform/x86/intel_telemetry_pltdrv.c |   2 +
> >  drivers/usb/typec/tcpm/Kconfig                |   2 +-
> >  drivers/watchdog/iTCO_wdt.c                   |  25 +-
> >  include/linux/mfd/intel_pmc_bxt.h             |  53 ++
> >  include/linux/platform_data/itco_wdt.h        |  11 +-
> >  15 files changed, 602 insertions(+), 720 deletions(-)
> >  create mode 100644 Documentation/ABI/obsolete/sysfs-driver-intel_pmc_bxt
> >  delete mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
> >  create mode 100644 drivers/mfd/intel_pmc_bxt.c
> >  delete mode 100644 drivers/platform/x86/intel_pmc_ipc.c
> >  create mode 100644 include/linux/mfd/intel_pmc_bxt.h
>
> Looks good to me know.
>
> Thanks for taking the time to realise my review comments.
>
> For my own reference (apply this as-is to your sign-off block):
>
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Can you prepare ib for ii that I can pull from?
Or do you want me to do the same for you?

-- 
With Best Regards,
Andy Shevchenko

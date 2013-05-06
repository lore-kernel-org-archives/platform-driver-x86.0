From: Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v17 RESEND] pvpanic: pvpanic device driver
Date: Mon, 6 May 2013 08:38:50 -0300
Message-ID: <20130506113850.GA5603@amt.cnet>
References: <1367549230-12805-1-git-send-email-hutao@cn.fujitsu.com>
 <20130503215918.GA13555@amt.cnet>
 <20130506033935.GA20827@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53209 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752470Ab3EFLjR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 May 2013 07:39:17 -0400
Content-Disposition: inline
In-Reply-To: <20130506033935.GA20827@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hu Tao <hutao@cn.fujitsu.com>
Cc: platform-driver-x86@vger.kernel.org, kvm@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>, Paolo Bonzini <pbonzini@redhat.com>

On Mon, May 06, 2013 at 11:39:35AM +0800, Hu Tao wrote:
> On Fri, May 03, 2013 at 06:59:18PM -0300, Marcelo Tosatti wrote:
> > On Fri, May 03, 2013 at 10:47:10AM +0800, Hu Tao wrote:
> > > pvpanic device is a qemu simulated device through which guest panic
> > > event is sent to host.
> > > 
> > > Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> > > ---
> > >  drivers/platform/x86/Kconfig   |   7 +++
> > >  drivers/platform/x86/Makefile  |   2 +
> > >  drivers/platform/x86/pvpanic.c | 115 +++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 124 insertions(+)
> > >  create mode 100644 drivers/platform/x86/pvpanic.c
> > > 
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > index 3338437..527ed04 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -781,4 +781,11 @@ config APPLE_GMUX
> > >  	  graphics as well as the backlight. Currently only backlight
> > >  	  control is supported by the driver.
> > >  
> > > +config PVPANIC
> > > +	tristate "pvpanic device support"
> > > +	depends on ACPI
> > > +	---help---
> > > +	  This driver provides support for pvpanic device, which is a qemu
> > > +	  simulated device through which guest panic event is sent to host.
> > > +
> > >  endif # X86_PLATFORM_DEVICES
> > > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> > > index ace2b38..ef0ec74 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -51,3 +51,5 @@ obj-$(CONFIG_INTEL_OAKTRAIL)	+= intel_oaktrail.o
> > >  obj-$(CONFIG_SAMSUNG_Q10)	+= samsung-q10.o
> > >  obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
> > >  obj-$(CONFIG_CHROMEOS_LAPTOP)	+= chromeos_laptop.o
> > > +
> > > +obj-$(CONFIG_PVPANIC)           += pvpanic.o
> > > diff --git a/drivers/platform/x86/pvpanic.c b/drivers/platform/x86/pvpanic.c
> > > new file mode 100644
> > > index 0000000..81c95ec
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/pvpanic.c
> > > @@ -0,0 +1,115 @@
> > > +/*
> > > + *  pvpanic.c - pvpanic Device Support
> > > + *
> > > + *  Copyright (C) 2013 Fujitsu.
> > > + *
> > > + *  This program is free software; you can redistribute it and/or modify
> > > + *  it under the terms of the GNU General Public License as published by
> > > + *  the Free Software Foundation; either version 2 of the License, or
> > > + *  (at your option) any later version.
> > > + *
> > > + *  This program is distributed in the hope that it will be useful,
> > > + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> > > + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + *  GNU General Public License for more details.
> > > + *
> > > + *  You should have received a copy of the GNU General Public License
> > > + *  along with this program; if not, write to the Free Software
> > > + *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
> > > + */
> > > +
> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +#include <linux/init.h>
> > > +#include <linux/types.h>
> > > +#include <acpi/acpi_bus.h>
> > > +#include <acpi/acpi_drivers.h>
> > > +
> > > +MODULE_AUTHOR("Hu Tao <hutao@cn.fujitsu.com>");
> > > +MODULE_DESCRIPTION("pvpanic device driver");
> > > +MODULE_LICENSE("GPL");
> > > +
> > > +static int pvpanic_add(struct acpi_device *device);
> > > +static int pvpanic_remove(struct acpi_device *device);
> > > +
> > > +static const struct acpi_device_id pvpanic_device_ids[] = {
> > > +	{ "QEMU0001", 0},
> > > +	{ "", 0},
> > > +};
> > > +MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
> > > +
> > > +#define PVPANIC_PANICKED	(1 << 0)
> > > +
> > > +static acpi_handle handle;
> > > +
> > > +static struct acpi_driver pvpanic_driver = {
> > > +	.name =		"pvpanic",
> > > +	.class =	"QEMU",
> > > +	.ids =		pvpanic_device_ids,
> > > +	.ops =		{
> > > +				.add =		pvpanic_add,
> > > +				.remove =	pvpanic_remove,
> > > +			},
> > > +	.owner =	THIS_MODULE,
> > > +};
> > > +
> > > +static void
> > > +pvpanic_send_event(unsigned int event)
> > > +{
> > > +	union acpi_object arg;
> > > +	struct acpi_object_list arg_list;
> > > +
> > > +	if (!handle)
> > > +		return;
> > > +
> > > +	arg.type = ACPI_TYPE_INTEGER;
> > > +	arg.integer.value = event;
> > > +
> > > +	arg_list.count = 1;
> > > +	arg_list.pointer = &arg;
> > > +
> > > +	acpi_evaluate_object(handle, "WRPT", &arg_list, NULL);
> > > +}
> > 
> > Is it safe to call acpi_evaluate_object from a panic notifier? For
> > example:
> > 
> > - Has it been confirmed that no code invoked via acpi_evaluate_object can panic() ?
> 
> Confirmed.
> 
> > - acpi_ex_enter_interpreter grabs a mutex. Is that path ever used?
> 
> Unfortunately yes. As I can tell, there are 2 places in the path to grab
> a mutex: when searching the namespace for the method, and when executing
> the method. I didn't find a non-blocking version of acpi_evaluate_object.

Then thats a bug because the pvpanic notifier is called with interrupts
disabled.

Suppose its safer to use an OUT instruction?

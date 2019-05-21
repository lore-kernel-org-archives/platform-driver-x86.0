From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/2] platform/mellanox: Add bootctl driver for Mellanox
 BlueField Soc
Date: Tue, 21 May 2019 09:58:38 +0200
Message-ID: <CAK8P3a0AfEo8+EDBoOS8PfOeKGZUhgXoT7xz+pG9YNUDPdfR_A@mail.gmail.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
 <1558115345-32476-1-git-send-email-lsun@mellanox.com> <20190520155658.GA14165@kroah.com>
 <DB6PR05MB32232CA5DD05D1A923A28215A1060@DB6PR05MB3223.eurprd05.prod.outlook.com>
 <20190520191209.GA29776@kroah.com> <DB6PR05MB3223F25A2E2B78053FE96D5BA1060@DB6PR05MB3223.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB6PR05MB3223F25A2E2B78053FE96D5BA1060@DB6PR05MB3223.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 20, 2019 at 10:44 PM Liming Sun <lsun@mellanox.com> wrote:
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Monday, May 20, 2019 3:12 PM
> > To: Liming Sun <lsun@mellanox.com>
> > Cc: Andy Shevchenko <andy@infradead.org>; Darren Hart <dvhart@infradead.org>; Vadim Pasternak <vadimp@mellanox.com>; David
> > Woods <dwoods@mellanox.com>; platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 1/2] platform/mellanox: Add bootctl driver for Mellanox BlueField Soc
> >
> > On Mon, May 20, 2019 at 06:07:44PM +0000, Liming Sun wrote:
> > > > > +static struct platform_driver mlxbf_bootctl_driver = {
> > > > > +       .probe = mlxbf_bootctl_probe,
> > > > > +       .driver = {
> > > > > +               .name = "mlxbf-bootctl",
> > > > > +               .groups = mlxbf_bootctl_groups,
> > > > > +               .acpi_match_table = mlxbf_bootctl_acpi_ids,
> > > >
> > > > Why is an acpi driver a platform driver?  Isn't there a "real" acpi
> > > > driver interface you should be tieing into instead?
> > > >
> > > > Only use a platform driver as an absolute last resort.  I don't think
> > > > that is the case here.
> > >
> > > The driver is trying to configure boot-swapping and display secure state,
> > > and is defined/initiated in ACPI table in UEFI. It seems a little hard to
> > > categorize this driver to any existing subsystem. Any suggestion
> > > where it might be a better fit (like drivers/misc, drivers/firmware, etc)?
> > > Please correct me if I misunderstand the comments. Thanks!.
> >
> > The comment was asking why an acpi driver is a platform driver, but then
> > I went and looked now at a bunch of acpi drivers, and they all are
> > platform drivers :(
> >
> > Anyway, drivers/acpi/ seems like the best place for this file, right?
>
> My understanding is that the "drivers/acpi" is mainly for the acpi common code.
> The vendor or platform specific drivers are spread in other various directories,
> most of which are 'platform' drivers.

It depends on how closely you are following the acpi specification.
If you just implement access to a standard ACPI feature, or you have
added your interface to the ACPI specification, then the driver
should work on any system that supports this feature.

> For this driver, we didn't find better sub-component for it, thus put it under
> 'drivers/platform/mellanox' which is vendor specific driver by its name.

drivers/platform/mellanox/ would be a good place for drivers running on
a host platform with a bluefield accelerator card as an add-on, but as I
understand, this is a driver that actually just runs in Linux on the bluefield
itself, so it should go in a different place.

We use drivers/soc/ for things that are specific to one SoC, and that
are typically used by other drivers, but that don't have (and should not
have) a generic abstraction, which probably is not the case here either.

What we do have in drivers/power/reset is a couple of drivers that
set the "reboot reason", communicating that to the firmware for the
next boot, using the reboot_mode_register() interface. I don't
know too much about that interface, but maybe you can use that
instead of adding another sysfs interface?

If you have a complex firmware on the system that you can talk
to, there is also drivers/firmware/ as another option to put
abstractions into.

         Arnd

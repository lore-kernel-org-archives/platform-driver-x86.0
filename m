From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RESEND PATCH V5 0/3] Intel Platform Monitoring Technology
Date: Fri, 28 Aug 2020 14:29:54 +0300
Message-ID: <CAHp75VcKrkxuAJvXnLGnHJTkVfac6N0RTH-3OEA5ksV2psWBew@mail.gmail.com>
References: <20200819180255.11770-1-david.e.box@linux.intel.com> <20200828105655.GU1826686@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200828105655.GU1826686@dell>
Sender: linux-pci-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 28, 2020 at 1:57 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Wed, 19 Aug 2020, David E. Box wrote:
>
> [...]
>
> > David E. Box (3):
> >   PCI: Add defines for Designated Vendor-Specific Extended Capability
> >   mfd: Intel Platform Monitoring Technology support
> >   platform/x86: Intel PMT Telemetry capability driver
> >
> >  .../ABI/testing/sysfs-class-pmt_telemetry     |  46 ++
> >  MAINTAINERS                                   |   6 +
> >  drivers/mfd/Kconfig                           |  10 +
> >  drivers/mfd/Makefile                          |   1 +
> >  drivers/mfd/intel_pmt.c                       | 220 +++++++++
> >  drivers/platform/x86/Kconfig                  |  10 +
> >  drivers/platform/x86/Makefile                 |   1 +
> >  drivers/platform/x86/intel_pmt_telemetry.c    | 448 ++++++++++++++++++
> >  include/uapi/linux/pci_regs.h                 |   5 +
> >  9 files changed, 747 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_telemetry
> >  create mode 100644 drivers/mfd/intel_pmt.c
> >  create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c
>
> What's the plan for this set?
>
> I'm happy to pick it up and take it through MFD if required.

I guess that was already agreed like this and you were in Cc list of
that discussion.

>
> If that's the route of choice, I'll pick it up in just over a week.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> Senior Technical Lead - Developer Services
> Linaro.org =E2=94=82 Open source software for Arm SoCs
> Follow Linaro: Facebook | Twitter | Blog



--=20
With Best Regards,
Andy Shevchenko

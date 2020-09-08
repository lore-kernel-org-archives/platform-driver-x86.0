From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH V5 0/3] Intel Platform Monitoring Technology
Date: Tue, 8 Sep 2020 10:26:20 +0100
Message-ID: <20200908092620.GL4400@dell>
References: <20200819180255.11770-1-david.e.box@linux.intel.com>
 <20200828105655.GU1826686@dell>
 <CAHp75VcKrkxuAJvXnLGnHJTkVfac6N0RTH-3OEA5ksV2psWBew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VcKrkxuAJvXnLGnHJTkVfac6N0RTH-3OEA5ksV2psWBew@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "David E. Box" <david.e.box@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 28 Aug 2020, Andy Shevchenko wrote:

> On Fri, Aug 28, 2020 at 1:57 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Wed, 19 Aug 2020, David E. Box wrote:
> >
> > [...]
> >
> > > David E. Box (3):
> > >   PCI: Add defines for Designated Vendor-Specific Extended Capability
> > >   mfd: Intel Platform Monitoring Technology support
> > >   platform/x86: Intel PMT Telemetry capability driver
> > >
> > >  .../ABI/testing/sysfs-class-pmt_telemetry     |  46 ++
> > >  MAINTAINERS                                   |   6 +
> > >  drivers/mfd/Kconfig                           |  10 +
> > >  drivers/mfd/Makefile                          |   1 +
> > >  drivers/mfd/intel_pmt.c                       | 220 +++++++++
> > >  drivers/platform/x86/Kconfig                  |  10 +
> > >  drivers/platform/x86/Makefile                 |   1 +
> > >  drivers/platform/x86/intel_pmt_telemetry.c    | 448 ++++++++++++++++++
> > >  include/uapi/linux/pci_regs.h                 |   5 +
> > >  9 files changed, 747 insertions(+)
> > >  create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_telemetry
> > >  create mode 100644 drivers/mfd/intel_pmt.c
> > >  create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c
> >
> > What's the plan for this set?
> >
> > I'm happy to pick it up and take it through MFD if required.
> 
> I guess that was already agreed like this and you were in Cc list of
> that discussion.

I have many submissions on the go at the moment.

Keeping full status for each of them in my head would be impossible.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

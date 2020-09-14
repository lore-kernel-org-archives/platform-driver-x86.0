From: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: Intel PMT Crashlog capability driver
Date: Mon, 14 Sep 2020 15:35:07 -0700
Message-ID: <CAKgT0UfM0534GZcKzgTeEa3nq2+FWHk4PfA593smGOLun4d97A@mail.gmail.com>
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-4-david.e.box@linux.intel.com> <6e3738db-bfff-7fd2-65e6-bd0d126f9eaa@redhat.com>
 <CAKgT0UcxSwRseMBdMd0_HDUS=JGZDAZnAy-tkLkB-hMXLYtucw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKgT0UcxSwRseMBdMd0_HDUS=JGZDAZnAy-tkLkB-hMXLYtucw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org, dvhart@infradead.org, andy@infradead.org, Alexander Duyck <alexander.h.duyck@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 14, 2020 at 11:07 AM Alexander Duyck
<alexander.duyck@gmail.com> wrote:
>
> On Mon, Sep 14, 2020 at 6:42 AM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 9/11/20 9:45 PM, David E. Box wrote:
> > > From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > >
> > > Add support for the Intel Platform Monitoring Technology crashlog
> > > interface.  This interface provides a few sysfs values to allow for
> > > controlling the crashlog telemetry interface as well as a character driver
> > > to allow for mapping the crashlog memory region so that it can be accessed
> > > after a crashlog has been recorded.
> > >
> > > This driver is meant to only support the server version of the crashlog
> > > which is identified as crash_type 1 with a version of zero. Currently no
> > > other types are supported.
> > >
> > > Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > > ---
> > >   .../ABI/testing/sysfs-class-pmt_crashlog      |  66 ++
> > >   drivers/platform/x86/Kconfig                  |  10 +
> > >   drivers/platform/x86/Makefile                 |   1 +
> > >   drivers/platform/x86/intel_pmt_crashlog.c     | 588 ++++++++++++++++++
> > >   4 files changed, 665 insertions(+)
> > >   create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_crashlog
> > >   create mode 100644 drivers/platform/x86/intel_pmt_crashlog.c
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-class-pmt_crashlog b/Documentation/ABI/testing/sysfs-class-pmt_crashlog
> > > new file mode 100644
> > > index 000000000000..40fb4ff437a6
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-class-pmt_crashlog
> > > @@ -0,0 +1,66 @@
> > > +What:                /sys/class/pmt_crashlog/
> > > +Date:                September 2020
> > > +KernelVersion:       5.10
> > > +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > +Description:
> > > +             The pmt_crashlog/ class directory contains information
> > > +             for devices that expose crashlog capabilities using the Intel
> > > +             Platform Monitoring Technology (PTM).
> > > +
> > > +What:                /sys/class/pmt_crashlog/crashlogX
> > > +Date:                September 2020
> > > +KernelVersion:       5.10
> > > +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > +Description:
> > > +             The crashlogX directory contains files for configuring an
> > > +             instance of a PMT crashlog device that can perform crash data
> > > +             recoring. Each crashlogX device has an associated
> > > +             /dev/crashlogX device node. This node can be opened and mapped
> > > +             to access the resulting crashlog data. The register layout for
> > > +             the log can be determined from an XML file of specified guid
> > > +             for the parent device.
> > > +
> > > +What:                /sys/class/pmt_crashlog/crashlogX/guid
> > > +Date:                September 2020
> > > +KernelVersion:       5.10
> > > +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > +Description:
> > > +             (RO) The guid for this crashlog device. The guid identifies the
> > > +             version of the XML file for the parent device that should be
> > > +             used to determine the register layout.
> > > +
> > > +What:                /sys/class/pmt_crashlog/crashlogX/size
> > > +Date:                September 2020
> > > +KernelVersion:       5.10
> > > +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > +Description:
> > > +             (RO) The length of the result buffer in bytes that corresponds
> > > +             to the mapping size for the /dev/crashlogX device node.
> > > +
> > > +What:                /sys/class/pmt_crashlog/crashlogX/offset
> > > +Date:                September 2020
> > > +KernelVersion:       5.10
> > > +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > +Description:
> > > +             (RO) The offset of the buffer in bytes that corresponds
> > > +             to the mapping for the /dev/crashlogX device node.
> > > +
> > > +What:                /sys/class/pmt_crashlog/crashlogX/enable
> > > +Date:                September 2020
> > > +KernelVersion:       5.10
> > > +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > +Description:
> > > +             (RW) Boolean value controlling if the crashlog functionality
> > > +             is enabled for the /dev/crashlogX device node.
> > > +
> > > +What:                /sys/class/pmt_crashlog/crashlogX/trigger
> > > +Date:                September 2020
> > > +KernelVersion:       5.10
> > > +Contact:     Alexander Duyck <alexander.h.duyck@linux.intel.com>
> > > +Description:
> > > +             (RW) Boolean value controlling  the triggering of the
> > > +             /dev/crashlogX device node. When read it provides data on if
> > > +             the crashlog has been triggered. When written to it can be
> > > +             used to either clear the current trigger by writing false, or
> > > +             to trigger a new event if the trigger is not currently set.
> > > +
> >
> > Both the pmt_crashlog and the attributes suggest that this is highly
> > Intel PMT specific. /sys/class/foo interfaces are generally speaking
> > meant to be generic interfaces.
> >
> > If this was defining a generic, vendor and implementation agnostic interface for
> > configuring / accessing crashlogs, then using a class would be fine, but that
> > is not the case, so I believe that this should not implement / register a class.
> >
> > Since the devices are instantiated through MFD there already is a
> > static sysfs-path which can be used to find the device in sysfs:
> > /sys/bus/platform/device/pmt_crashlog
> >
> > So you can register the sysfs attributes directly under the platform_device
> > and then userspace can easily find them, so there really is no need to
> > use a class here.
>
> I see. So we change the root directory from "/sys/class/pmt_crashlog/"
> to "/sys/bus/platform/device/pmt_crashlog" while retaining the same
> functionality. That should be workable.

So one issue as I see it is that if we were to change this then we
probably need to to change the telemetry functionality that was
recently accepted
(https://lore.kernel.org/lkml/20200819180255.11770-1-david.e.box@linux.intel.com/)
as well. The general idea with using the /sys/class/pmt_crashlog/
approach was to keep things consistent with how the pmt_telemetry was
being accessed. So if we change this then we end up with very
different interfaces for the two very similar pieces of functionality.
So ideally we would want to change both telemetry and crashlog to
function the same way.

Do you have any good examples of anything that has done something
similar? From what I can tell it looks like we need to clean up the
naming to drop the ".%d.auto" for the bus directory names and then
look at adding a folder to handle all of the instances of either
telemetry or crashlog, assuming we follow the reg-dummy or serial8250
model.

Similarly the crashlog and telemetry both rely on similar mechanisms
to display the MMIO region containing the data. I still need to spend
some more time looking into what is involved in switching from a char
device to a binary sysfs, but I think with the example I found earlier
of the resourceN bit from the PCI sysfs I can probably make that work
for both cases.

Thanks.

- Alex

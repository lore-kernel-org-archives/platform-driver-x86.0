From: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH V4 0/3] Intel Platform Monitoring Technology
Date: Mon, 27 Jul 2020 09:29:00 -0700
Message-ID: <718d3322c97561f69e156ed479e52d01d0899d78.camel@linux.intel.com>
References: <20200714062323.19990-1-david.e.box@linux.intel.com>
         <20200717190620.29821-1-david.e.box@linux.intel.com>
         <CAHp75VftSf8pzSAYMjcKg-MSiy0T4xG=wiKpgY20_ZKOO0Tq0w@mail.gmail.com>
Reply-To: david.e.box@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAHp75VftSf8pzSAYMjcKg-MSiy0T4xG=wiKpgY20_ZKOO0Tq0w@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2020-07-27 at 13:23 +0300, Andy Shevchenko wrote:
> On Fri, Jul 17, 2020 at 10:05 PM David E. Box
> <david.e.box@linux.intel.com> wrote:
> > Intel Platform Monitoring Technology (PMT) is an architecture for
> > enumerating and accessing hardware monitoring capabilities on a
> > device.
> > With customers increasingly asking for hardware telemetry,
> > engineers not
> > only have to figure out how to measure and collect data, but also
> > how to
> > deliver it and make it discoverable. The latter may be through some
> > device
> > specific method requiring device specific tools to collect the
> > data. This
> > in turn requires customers to manage a suite of different tools in
> > order to
> > collect the differing assortment of monitoring data on their
> > systems.  Even
> > when such information can be provided in kernel drivers, they may
> > require
> > constant maintenance to update register mappings as they change
> > with
> > firmware updates and new versions of hardware. PMT provides a
> > solution for
> > discovering and reading telemetry from a device through a hardware
> > agnostic
> > framework that allows for updates to systems without requiring
> > patches to
> > the kernel or software tools.
> > 
> > PMT defines several capabilities to support collecting monitoring
> > data from
> > hardware. All are discoverable as separate instances of the PCIE
> > Designated
> > Vendor extended capability (DVSEC) with the Intel vendor code. The
> > DVSEC ID
> > field uniquely identifies the capability. Each DVSEC also provides
> > a BAR
> > offset to a header that defines capability-specific attributes,
> > including
> > GUID, feature type, offset and length, as well as configuration
> > settings
> > where applicable. The GUID uniquely identifies the register space
> > of any
> > monitor data exposed by the capability. The GUID is associated with
> > an XML
> > file from the vendor that describes the mapping of the register
> > space along
> > with properties of the monitor data. This allows vendors to perform
> > firmware updates that can change the mapping (e.g. add new metrics)
> > without
> > requiring any changes to drivers or software tools. The new mapping
> > is
> > confirmed by an updated GUID, read from the hardware, which
> > software uses
> > with a new XML.
> > 
> > The current capabilities defined by PMT are Telemetry, Watcher, and
> > Crashlog.  The Telemetry capability provides access to a continuous
> > block
> > of read only data. The Watcher capability provides access to
> > hardware
> > sampling and tracing features. Crashlog provides access to device
> > crash
> > dumps.  While there is some relationship between capabilities
> > (Watcher can
> > be configured to sample from the Telemetry data set) each exists as
> > stand
> > alone features with no dependency on any other. The design
> > therefore splits
> > them into individual, capability specific drivers. MFD is used to
> > create
> > platform devices for each capability so that they may be managed by
> > their
> > own driver. The PMT architecture is (for the most part) agnostic to
> > the
> > type of device it can collect from. Devices nodes are consequently
> > generic
> > in naming, e.g. /dev/telem<n> and /dev/smplr<n>. Each capability
> > driver
> > creates a class to manage the list of devices supporting
> > it.  Software can
> > determine which devices support a PMT feature by searching through
> > each
> > device node entry in the sysfs class folder. It can additionally
> > determine
> > if a particular device supports a PMT feature by checking for a PMT
> > class
> > folder in the device folder.
> > 
> > This patch set provides support for the PMT framework, along with
> > support
> > for Telemetry on Tiger Lake.
> > 
> 
> I assume this goes thru MFD tree.

Yes, looking for pull by MFD. Thanks Andy.

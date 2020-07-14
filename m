From: "David E. Box" <david.e.box@linux.intel.com>
Subject: [PATCH V3 0/3] Intel Platform Monitoring Technology
Date: Mon, 13 Jul 2020 23:23:20 -0700
Message-ID: <20200714062323.19990-1-david.e.box@linux.intel.com>
References: <20200508021844.6911-1-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200508021844.6911-1-david.e.box@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, david.e.box@linux.intel.com, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Intel Platform Monitoring Technology (PMT) is an architecture for
enumerating and accessing hardware monitoring capabilities on a device.
With customers increasingly asking for hardware telemetry, engineers not
only have to figure out how to measure and collect data, but also how to
deliver it and make it discoverable. The latter may be through some device
specific method requiring device specific tools to collect the data. This
in turn requires customers to manage a suite of different tools in order to
collect the differing assortment of monitoring data on their systems.  Even
when such information can be provided in kernel drivers, they may require
constant maintenance to update register mappings as they change with
firmware updates and new versions of hardware. PMT provides a solution for
discovering and reading telemetry from a device through a hardware agnostic
framework that allows for updates to systems without requiring patches to
the kernel or software tools.

PMT defines several capabilities to support collecting monitoring data from
hardware. All are discoverable as separate instances of the PCIE Designated
Vendor extended capability (DVSEC) with the Intel vendor code. The DVSEC ID
field uniquely identifies the capability. Each DVSEC also provides a BAR
offset to a header that defines capability-specific attributes, including
GUID, feature type, offset and length, as well as configuration settings
where applicable. The GUID uniquely identifies the register space of any
monitor data exposed by the capability. The GUID is associated with an XML
file from the vendor that describes the mapping of the register space along
with properties of the monitor data. This allows vendors to perform
firmware updates that can change the mapping (e.g. add new metrics) without
requiring any changes to drivers or software tools. The new mapping is
confirmed by an updated GUID, read from the hardware, which software uses
with a new XML.

The current capabilities defined by PMT are Telemetry, Watcher, and
Crashlog.  The Telemetry capability provides access to a continuous block
of read only data. The Watcher capability provides access to hardware
sampling and tracing features. Crashlog provides access to device crash
dumps.  While there is some relationship between capabilities (Watcher can
be configured to sample from the Telemetry data set) each exists as stand
alone features with no dependency on any other. The design therefore splits
them into individual, capability specific drivers. MFD is used to create
platform devices for each capability so that they may be managed by their
own driver. The PMT architecture is (for the most part) agnostic to the
type of device it can collect from. Devices nodes are consequently generic
in naming, e.g. /dev/telem<n> and /dev/smplr<n>. Each capability driver
creates a class to manage the list of devices supporting it.  Software can
determine which devices support a PMT feature by searching through each
device node entry in the sysfs class folder. It can additionally determine
if a particular device supports a PMT feature by checking for a PMT class
folder in the device folder.

This patch set provides support for the PMT framework, along with support
for Telemetry on Tiger Lake.

Changes from V2:

Please excuse this delayed V3 as we dealt with last minute hardware
changes.

 	- In order to handle certain HW bugs from the telemetry capability
	  driver, create a single platform device per capability instead of
	  a device per entry. Add the entry data as device resources and
	  let the capability driver manage them as a set allowing for
	  cleaner HW bug resolution.
	- Handle discovery table offset bug in intel_pmt.c
	- Handle overlapping regions in intel_pmt_telemetry.c
	- Add description of sysfs class to testing ABI.
	- Don't check size and count until confirming support for the PMT
	  capability to avoid bailing out when we need to skip it.
	- Remove unneeded header file. Move code to the intel_pmt.c, the
	  only place where it's needed.
	- Remove now unused platform data.
	- Add missing header files types.h, bits.h.
	- Rename file name and build options from telem to telemetry.
	- Code cleanup suggested by Andy S.
	- x86 mailing list added.

Changes from V1:

	- In the telemetry driver, set the device in device_create() to
	  the parent pci device (the monitoring device) for clear
	  association in sysfs. Was set before to the platform device
	  created by the pci parent.
	- Move telem struct into driver and delete unneeded header file.
	- Start telem device numbering from 0 instead of 1. 1 was used
	  due to anticipated changes, no longer needed.
	- Use helper macros suggested by Andy S.
	- Rename class to pmt_telemetry, spelling out full name
	- Move monitor device name defines to common header
	- Coding style, spelling, and Makefile/MAINTAINERS ordering fixes

David E. Box (3):
  PCI: Add defines for Designated Vendor-Specific Capability
  mfd: Intel Platform Monitoring Technology support
  platform/x86: Intel PMT Telemetry capability driver

 .../ABI/testing/sysfs-class-pmt_telemetry     |  46 ++
 MAINTAINERS                                   |   6 +
 drivers/mfd/Kconfig                           |  10 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/intel_pmt.c                       | 218 +++++++++
 drivers/platform/x86/Kconfig                  |  10 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel_pmt_telemetry.c    | 454 ++++++++++++++++++
 include/uapi/linux/pci_regs.h                 |   5 +
 9 files changed, 751 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_telemetry
 create mode 100644 drivers/mfd/intel_pmt.c
 create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c

-- 
2.20.1

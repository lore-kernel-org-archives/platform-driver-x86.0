From: "Edward O'Callaghan" <quasisec@google.com>
Subject: Re: [PATCH v8 00/15] Introduce support for Dell SMBIOS over WMI
Date: Mon, 16 Oct 2017 13:45:35 +1100
Message-ID: <CAD584ivjn3CCtm7iSR=pCbXADg3apOQmBvQvXRQ5KpKuZX5OHQ@mail.gmail.com>
References: <cover.1507958847.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507958847.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, pali.rohar@gmail.com, rjw@rjwysocki.net, Matthew Garrett <mjg59@google.com>, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

I like how this series turned out and I think it puts us in a
exceedingly better position than the dcdbas path. This series is,

Reviewed-by: Edward O'Callaghan <quasisec@google.com>

On Sat, Oct 14, 2017 at 4:32 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> The existing way that the dell-smbios helper module and associated
> other drivers (dell-laptop, dell-wmi) communicate with the platform
> really isn't secure.  It requires creating a buffer in physical
> DMA32 memory space and passing that to the platform via SMM.
>
> Since the platform got a physical memory pointer, you've just got
> to trust that the platform has only modified (and accessed) memory
> within that buffer.
>
> Dell Platform designers recognize this security risk and offer a
> safer way to communicate with the platform over ACPI.  This is
> in turn exposed via a WMI interface to the OS.
>
> When communicating over WMI-ACPI the communication doesn't occur
> with physical memory pointers.  When the ASL is invoked, the fixed
> length ACPI buffer is copied to a small operating region.  The ASL
> will invoke the SMI, and SMM will only have access to this operating
> region.  When the ASL returns the buffer is copied back for the OS
> to process.
>
> This method of communication should also deprecate the usage of the
> dcdbas kernel module and software dependent upon it's interface.
> Instead offer a character device interface for communicating with this
> ASL method to allow userspace to use instead.
>
> To faciliate that this patch series introduces a generic way for WMI
> drivers to be able to create discoverable character devices with
> a predictable IOCTL interface through the WMI bus when desired.
> Requiring WMI drivers to explicitly ask for this functionality will
> act as an effective vendor whitelist to character device creation.
>
> Some of this work is the basis for what will be a proper interpreter
> of MOF in the kernel and controls for what drivers will be able to
> do with that MOF.
>
> NOTE: This patch series is intended to go on top of platform-drivers-x86
> linux-next.
>
> For convenience the entire series including those is also available here:
> https://github.com/superm1/linux/tree/wmi-smbios
> changes bweteen v7 and v8:
>  * fix typo s/desc_buffer/buffer/ in 32k split commit
>  * Add missing include for <linux/types.h> in uapi
>  * dell-smbios: initialize correct attribute files
>  * Output class/select in debug messages in base 10.
>  * Don't send the u64 length argument to ACPI call length
>  * Only filter calls that originate from userspace
>  * Filter kernel calls from userspace
>  * Add more blacklisting/whitelisting logic per Alan Cox's
>    recommendations
>  * Adjust tokens attributes to only be accessible to CAP_SYS_ADMIN
>  * Set default permissions on character device.
>  * Move token, class, select definitions for items used in drivers
>    to dells-smios.h.
> changes between v6 and v7:
>  * Use deferred probing in any function results needed from
>    dell-wmi-descriptor
>  * Protect against a list entry disappearing when running an ioctl from
>    WMI bus
>  * Move ioctl uapi declaration into a common header file for all WMI
>    drivers.
>  * New patch: create required_buffer_size for method type WMI objects
>    in WMI core rather than vendor driver.
>  * WSMT patch: Add comment explaining WSMT
>  * Filtering patch: Add comments explaining what I can about blacklists.
>  * WMI, dell-smbios-wmi: Add back in compat ioctl, it is needed.
>    My previous test was erroneous in forgetting to copy an updated header
>    into the chroot.
>  * dell-laptop, dell-wmi: allocate less memory for buffer, page no longer
>    needed
>  * dell-laptop make the changes (hopefully) more amenable to pali style
>    wise.
>  * read SMM cmd address in dell-smbios-smm rather than dell-smbios
>  * shuffle structure definitions for this
> changes between v5 and v6:
>  * Adjust Kconfig for dell-smbios to not depend on anything.
>    - SMM and WMI drivers will both select dell-smbios
>    - Technically the module can run on it's own (it's just not useful)
>  * Add a new tokens sysfs interface
>  * Rework blacklisting into easily expandable structures
>  * Lock modules during ioctl call from WMI bus
>  * drop references to compat ioctl in both WMI and dell-smbios-wmi
>    drivers. (Made sure ioctl worked in both 32 and 64 userspace though)
>  * dell-smbios-wmi
>    - s/buffer_size/req_buf_size/ to make it clearer that userspace
>      doesn't get to set this, it's set internally.
>    - read just buffer length before reading whole structure from
>      userspace
>    - if buffer length is too big, show a warning
>    - I tried to rename argument for unlocked_ioctl, but this caused
>      problems in matching initialization lists, so still casting.
>    - Add comments clarifying everything happening in ioctl
> changes between v4 and v5:
>  * Remove Andy's S suggested by in sysfs tokens patch
>  * Make some output in dell-wmi-descriptor debug only
>  * Adjust various Kconfig dependencies as recommended by Darren
>  * Drop patch to set dell-smbios to default on ACPI_WMI,
>    it's not needed after the Kconfig dependencies rework
>  * Move WSMT check patch to after WMI driver is introduced.
>  * Make common smbios call return value int as there could be
>    errors now with drivers not being loaded.
>  * Make SMBIOS call methods for all drivers return status
>  * Reorder patches 2 and 4.
>  * Don't export symbols for calling functions on dispatchers
>  * wmi patch:
>    - use sprintf instead of strcpy
>    - remove needless bool for tracking found
>    - adjust logic to look for instance_count - 1, it's zero
>      based not 1 based.
>    - Pass a callback to unlocked_ioctl instead of full file
>      operations object
>    - ioctl: Don't fail on no bound WMI driver
>    - Add missing header for uapi
>    - Make helper macros include data types
>    - add compat ioctl
>  * dell-smbios:
>    - Add filtering functionality for SMBIOS calling interface
>    - Use dev_dbg rather than pr_debug where possible
>  * dell-smbios-wmi:
>    - test for handle on b1 table
>    - correct misc flags comment
>    - drop access checks
>    - use dev_dbg instead of pr_* calls
>    - use filtering functionality
>    - add mutexes around list add/remove
>    - switch from get_first_device to get_first_priv and inline
>    - add mutex locking to prevent unloading mid-call.
>    - update to new ioctl passing
>    - fix userspace uapi to use __u32 instead of u32
>    - Don't use a header file for internal only use
>    - make sure it works with compat ioctl
>  * dell-laptop: make dell_smbios_send_request local function
>    for boilerplate calls.
>  * ioctl patch
>    - Change API to have a simpler structure to pass back and
>      forth
>    - Rename header file
>    - Export to sysfs properly
>    - Add the size of the length variable into the requested
>      buffersize to sysfs, do math in the driver when copying
>      data around.
> changes between v3 and v4:
>  * Make Dell WMI notifications driver fail notifications fail
>    when WMI descriptor driver is unavailable.
>  * Add a patch to check for Dell OEM string to stop dell-smbios
>    module from being loaded in unsupported systems manually.
>  * Split Dell WMI descriptor into it's own driver for others to
>    query.
>  * Test the misc BIOS flags table to decide whether to run in WMI
>    or SMI mode.
>  * s/dell-wmi-smbios/dell-smbios/ in a few patch titles
>  * Add missing Suggested-by to a patch from v2 (Sorry Andy S!)
>  * Adjust cleanup order of wmi character device.
>  * Fix a remaining reference to /dev/wmi-$driver
>  * Use get_order to get size for pages
>  * Split up dell-smbios into 3 drivers:
>    dell-smbios
>    -> dell-smbios-smm
>    -> dell-smbios-wmi
>    If either of the two dispatcher drivers is unloaded but
>    the other still works, gracefully fall back to that driver
>  * Remove unneded open and release on file operations in WMI
>    driver
>  * Switch to misc character device in WMI bus.
>  * Query the size of the calling interface buffer from WMI
>    descriptor driver.
>  * Require userspace to use this information to build an
>    appropriately sized buffer.
>  * Verify the size of buffer passed from userspace matches
>    expectation of buffer processed in kernel.
>  * Add more documentation about the IOCTL API.
>  * Add in a recommendation from Andy S about outputing tokens
>  * Add a patch to test for non-functional SMM due to WSMT
>  * Define macros for IOCTL's through the WMI bus.
>  * Pass all IOCTL calls for WMI drivers through WMI bus
>    WMI bus will guarantee instance count matches and prevent
>    creating too many more IOCTLs.
> changes between v2 and v3:
>  * Drop patches 1-7, they're in Darren's review tree now
>  * Add missing newline on new Documentation
>  * Add Reviewed by from Edward O'Callaghan
>  * Adjust path of character device from /dev/wmi-$driver to
>    /dev/wmi/$driver
>  * Store wmi_device pointer rather than using a boolean has_wmi
>    to indicate driver is running in WMI mode
>  * Don't guard free_page from freeing NULL (this is OK)
>  * New patch: add wmidev_evaluate_method to wmi bus as recommended
>    by Andy L
>  * Adjust ACPI-WMI interface for this patch change ^
>  * Add back in sysfs token patch, drop 2nd and 3rd ioctls per discussion
>    on mailing list.
>  * On sysfs interface: adjust the delimiter to be tabs
>  * Drop the rename dell-smbios -> dell-wmi-smbios patch
>  * Remove/move some unnecessary tests for CONFIG_DCDBAS
>  * Reword s/platform/SMM/ in the WMI-ACPI patch.
>  * Update Kconfig to recommend using CONFIG_DCDBAS on old machines.
>  * Allocate buffer to the same pointer regardless of the struct
>    assigned to it.  Keep track of the buffer size for cleaning up.
>  * Explain policy around character device creation in commit message
> changes between v1 and v2:
>  * Introduce another patch to sort the includes in wmi.c
>  * Introduce another patch to cleanup dell_wmi_check_descriptor_buffer
>    checks.
>  * Add a commit message to the pr_fmt commit
>  * Introduce includes to wmi.c in proper location
>  * Add Reviewed-by to relevant patches from Pali
>  * Make the WMI introduction patch fallback to legacy SMI
>    if compiled with CONFIG_DCDBAS
>  * Separate format of WMI and SMI buffers.  WMI buffer supports more
>    arguments and data.
>  * Adjust the rename patch for changes to fallback
>  * Drop sysfs token creation patch
>  * Adjust WMI descriptor check patch for changes to fallback
>  * introduce another patch to remove needless includes in dell-smbios.c
>  * Add token ioctl interface to character device.
>    - Can query number of tokens
>    - Can query values in all tokens
>  * Expose format of all buffers and IOCTL commands to uapi header
>  * Drop the read interface from character device.  It doesn't make
>    sense with multiple different ioctl methods.
>  * Default WMI interface to 32k (This would normally be queried via
>    MOF, but that's not possible yet)
>  * Create separate buffers for WMI and SMI.  If WMI is available,
>    free the SMI buffer.
>  * Reorder patches so all fixups come first in the series.
>
> Mario Limonciello (15):
>   platform/x86: wmi: Add new method wmidev_evaluate_method
>   platform/x86: dell-wmi: increase severity of some failures
>   platform/x86: dell-wmi: clean up wmi descriptor check
>   platform/x86: dell-wmi: allow 32k return size in the descriptor
>   platform/x86: dell-wmi-descriptor: split WMI descriptor into it's own
>     driver
>   platform/x86: wmi: Don't allow drivers to get each other's GUIDs
>   platform/x86: dell-smbios: only run if proper oem string is detected
>   platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens
>   platform/x86: dell-smbios: Introduce dispatcher for SMM calls
>   platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver
>   platform/x86: dell-smbios-smm: test for WSMT
>   platform/x86: dell-smbios: Add filtering support
>   platform/x86: wmi: Add sysfs attribute for required_buffer_size
>   platform/x86: wmi: create userspace interface for drivers
>   platform/x86: dell-smbios-wmi: introduce userspace interface
>
>  Documentation/ABI/testing/dell-smbios-wmi          |  41 ++
>  .../ABI/testing/sysfs-platform-dell-smbios         |  21 +
>  MAINTAINERS                                        |  25 +
>  drivers/platform/x86/Kconfig                       |  34 +-
>  drivers/platform/x86/Makefile                      |   3 +
>  drivers/platform/x86/dell-laptop.c                 | 283 +++++-------
>  drivers/platform/x86/dell-smbios-smm.c             | 195 ++++++++
>  drivers/platform/x86/dell-smbios-wmi.c             | 292 ++++++++++++
>  drivers/platform/x86/dell-smbios.c                 | 510 +++++++++++++++++++--
>  drivers/platform/x86/dell-smbios.h                 |  68 ++-
>  drivers/platform/x86/dell-wmi-descriptor.c         | 162 +++++++
>  drivers/platform/x86/dell-wmi-descriptor.h         |  18 +
>  drivers/platform/x86/dell-wmi.c                    |  91 +---
>  drivers/platform/x86/wmi.c                         | 192 +++++++-
>  include/linux/wmi.h                                |  17 +-
>  include/uapi/linux/wmi.h                           |  52 +++
>  16 files changed, 1655 insertions(+), 349 deletions(-)
>  create mode 100644 Documentation/ABI/testing/dell-smbios-wmi
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-smbios
>  create mode 100644 drivers/platform/x86/dell-smbios-smm.c
>  create mode 100644 drivers/platform/x86/dell-smbios-wmi.c
>  create mode 100644 drivers/platform/x86/dell-wmi-descriptor.c
>  create mode 100644 drivers/platform/x86/dell-wmi-descriptor.h
>  create mode 100644 include/uapi/linux/wmi.h
>
> --
> 2.14.1
>

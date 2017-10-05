From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 11/14] platform/x86: dell-smbios-wmi: Add new WMI
 dispatcher driver
Date: Wed, 4 Oct 2017 19:14:34 -0700
Message-ID: <20171005021434.GF25018@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <8b37d47244fbba75ea264d06d4e7966a1f8f8f7a.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8b37d47244fbba75ea264d06d4e7966a1f8f8f7a.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 04, 2017 at 05:48:37PM -0500, Mario Limonciello wrote:
> The dell-smbios stack only currently uses an SMI interface which grants
> direct access to physical memory to the firmware SMM methods via a pointer.
> 
> This dispatcher driver adds a WMI-ACPI interface that is detected by WMI
> probe and preferred over the SMI interface in dell-smbios.
> 
> Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> for a buffer of data storage when SMM calls are performed.
> 
> This is a safer approach to use in kernel drivers as the SMM will
> only have access to that OperationRegion.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  MAINTAINERS                            |   6 +
>  drivers/platform/x86/Kconfig           |  16 ++-
>  drivers/platform/x86/Makefile          |   1 +
>  drivers/platform/x86/dell-smbios-wmi.c | 215 +++++++++++++++++++++++++++++++++
>  drivers/platform/x86/dell-smbios-wmi.h |  28 +++++
>  5 files changed, 265 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/platform/x86/dell-smbios-wmi.c
>  create mode 100644 drivers/platform/x86/dell-smbios-wmi.h
> 
...
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f0b97cb8e449..ef597f440d2e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -93,13 +93,27 @@ config ASUS_LAPTOP
>  
>  config DELL_SMBIOS
>  	tristate "Dell SMBIOS calling interface"
> -	depends on DELL_SMBIOS_SMM
> +	depends on DELL_SMBIOS_WMI || DELL_SMBIOS_SMM
>  	---help---
>  	This module provides common functions for kernel modules using
>  	Dell SMBIOS.

You use select DELL_SMBIOS below, which implies this modules should be
invisible. Indeed, there is no need for the user to see the DELL_SMBIOS
option at all now, they can select DELL_SMBIOS_WMI and or
DELL_SMBIOS_SMM, no need to keep the DELL_SMBIOS option.

> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
> +static void __init parse_b1_table(const struct dmi_header *dm)
> +{
> +	struct misc_bios_flags_structure *flags =
> +	container_of(dm, struct misc_bios_flags_structure, header);
> +
> +	/* 4 bytes header, and one word of flags */

Assuming specifically 8 bytes of flags, independent of arch?

-- 
Darren Hart
VMware Open Source Technology Center

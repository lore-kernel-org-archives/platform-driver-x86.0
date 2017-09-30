From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce
 character device for userspace
Date: Fri, 29 Sep 2017 19:06:07 -0700
Message-ID: <20170930020607.GD13307@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 27, 2017 at 11:02:17PM -0500, Mario Limonciello wrote:
> This userspace character device will be used to perform SMBIOS calls
> from any applications.
> 
> It provides an ioctl that will allow passing the 32k WMI calling
> interface buffer between userspace and kernel space.
> 
> This character device is intended to deprecate the dcdbas kernel module
> and the interface that it provides to userspace.
> 
> It's important for the driver to provide a R/W ioctl to ensure that
> two competing userspace processes don't race to provide or read each
> others data.
> 
> The character device will only be created if the WMI interface was
> found.
> 
> The API for interacting with this interface is defined in documentation
> as well as a uapi header provides the format of the structures.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  Documentation/ABI/testing/dell-wmi-smbios |  11 ++++
>  drivers/platform/x86/dell-smbios.c        | 100 ++++++++++++++++++++++++------
>  drivers/platform/x86/dell-smbios.h        |  19 +-----
>  include/uapi/linux/dell-wmi-smbios.h      |  30 +++++++++
>  4 files changed, 124 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/ABI/testing/dell-wmi-smbios
>  create mode 100644 include/uapi/linux/dell-wmi-smbios.h
> 
> diff --git a/Documentation/ABI/testing/dell-wmi-smbios b/Documentation/ABI/testing/dell-wmi-smbios
> new file mode 100644
> index 000000000000..0a4200688cb0
> --- /dev/null
> +++ b/Documentation/ABI/testing/dell-wmi-smbios
> @@ -0,0 +1,11 @@
> +What:		/dev/wmi-dell-wmi-smbios

/dev/wmi/dell-smbios

> +Date:		October 2017
> +KernelVersion:	4.15
> +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> +Description:
> +		Perform SMBIOS calls on supported Dell machines.
> +		through the Dell ACPI-WMI interface.
> +
> +		IOCTL's and buffer formats are defined in:
> +		<uapi/linux/dell-wmi-smbios.h>
> +
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index 5d793b012e5e..4174afbade13 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -24,6 +24,7 @@
>  #include <linux/slab.h>
>  #include <linux/io.h>
>  #include <linux/wmi.h>
> +#include <linux/uaccess.h>
>  #include "dell-smbios.h"
>  
>  #ifdef CONFIG_DCDBAS
> @@ -41,8 +42,9 @@ struct calling_interface_structure {
>  	struct calling_interface_token tokens[];
>  } __packed;
>  
> -static void *buffer;
> -static size_t bufferlen;
> +static void *internal_buffer;
> +static size_t internal_bufferlen;

A large portion of this changeset is dedicated to renaming these two variables,
but it isn't clear why, and not mentioned in the changelog. Seems like
unnecessary churn. Or if we really should rename it... can it be done earlier in
the series when we're working with those buffers for functional reasons?

-- 
Darren Hart
VMware Open Source Technology Center

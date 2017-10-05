From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Wed, 4 Oct 2017 18:09:09 -0700
Message-ID: <20171005010909.GC25018@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:34360 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751221AbdJEBJM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 21:09:12 -0400
Content-Disposition: inline
In-Reply-To: <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

On Wed, Oct 04, 2017 at 05:48:31PM -0500, Mario Limonciello wrote:
> All communication on individual GUIDs should occur in separate drivers.
> Allowing a driver to communicate with the bus to another GUID is just
> a hack that discourages drivers to adopt the bus model.
> 
> The information found from the WMI descriptor driver is now exported
> for use by other drivers.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  MAINTAINERS                                |   5 +
>  drivers/platform/x86/Kconfig               |  12 +++
>  drivers/platform/x86/Makefile              |   1 +
>  drivers/platform/x86/dell-wmi-descriptor.c | 162 +++++++++++++++++++++++++++++
>  drivers/platform/x86/dell-wmi-descriptor.h |  18 ++++
>  drivers/platform/x86/dell-wmi.c            |  88 ++--------------
>  6 files changed, 205 insertions(+), 81 deletions(-)
>  create mode 100644 drivers/platform/x86/dell-wmi-descriptor.c
>  create mode 100644 drivers/platform/x86/dell-wmi-descriptor.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08b96f77f618..659dbeec4191 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4002,6 +4002,11 @@ M:	Pali Rohár <pali.rohar@gmail.com>
>  S:	Maintained
>  F:	drivers/platform/x86/dell-wmi.c
>  
> +DELL WMI DESCRIPTOR DRIVER
> +M:	Mario Limonciello <mario.limonciello@dell.com>
> +S:	Maintained
> +F:	drivers/platform/x86/dell-wmi-descriptor.c
> +
>  DELTA ST MEDIA DRIVER
>  M:	Hugues Fruchet <hugues.fruchet@st.com>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 1f7959ff055c..bc347c326d87 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -121,6 +121,7 @@ config DELL_WMI
>  	depends on DMI
>  	depends on INPUT
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
> +	depends on DELL_WMI_DESCRIPTOR

We have to be careful with the use of "select", but I think in this case it
makes sense.

If you "select DELL_WMI_DESCRIPTOR" here, and maintain depends on
ACPI_WMI (not shown in context here), then...

>  	select DELL_SMBIOS
>  	select INPUT_SPARSEKMAP
>  	---help---
> @@ -129,6 +130,17 @@ config DELL_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called dell-wmi.
>  
> +config DELL_WMI_DESCRIPTOR
> +	tristate "Dell WMI descriptor"
> +	depends on ACPI_WMI
> +	default ACPI_WMI

This default can be dropped, the dependency will be met if DELL_WMI can
be enabled...

> +	---help---
> +	  Say Y here if you want to be able to read the format of WMI
> +	  communications on some Dell laptops, desktops and IoT gateways.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell-wmi-descriptor.

... and this can be converted to an invisible option and eliminate some
Kconfig clutter.

...


> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 1366bccdf275..90d7e8e55e9b 100644
...
> @@ -376,7 +375,11 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  	 * So to prevent reading garbage from buffer we will process only first
>  	 * one event on devices with WMI interface version 0.
>  	 */
> -	if (priv->interface_version == 0 && buffer_entry < buffer_end)
> +	if (!dell_wmi_get_interface_version(&interface_version)) {

You've introduced a dependency on another module here and haven't
guaranteed that dell-wmi-descriptor will have been loaded prior to this
one.

You'll want to add something like:

#ifdef CONFIG_DELL_WMI_DESCRIPTOR_MODULE
	if (request_module("dell_wmi_descriptor"))
		/* FAIL */
#endif

During init.

-- 
Darren Hart
VMware Open Source Technology Center

From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 09/14] platform/x86: dell-smbios: Introduce dispatcher
 for SMM calls
Date: Wed, 4 Oct 2017 18:57:52 -0700
Message-ID: <20171005015752.GD25018@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <151b8e5bb0be0a9ef88282581d441a4211465ae7.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48008 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751132AbdJEB55 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 21:57:57 -0400
Content-Disposition: inline
In-Reply-To: <151b8e5bb0be0a9ef88282581d441a4211465ae7.1507156392.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>

On Wed, Oct 04, 2017 at 05:48:35PM -0500, Mario Limonciello wrote:
> This splits up the dell-smbios driver into two drivers:
> * dell-smbios
> * dell-smbios-smm
> 
> dell-smbios can operate with multiple different dispatcher drivers to
> perform SMBIOS operations.
> 
> Also modify the interface that dell-laptop and dell-wmi use align to this
> model more closely.  Rather than a single global buffer being allocated
> for all drivers, each driver will allocate and be responsible for it's own
> buffer. The pointer will be passed to the calling function and each
> dispatcher driver will then internally copy it to the proper location to
> perform it's call.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  MAINTAINERS                            |   6 ++
>  drivers/platform/x86/Kconfig           |  17 ++-
>  drivers/platform/x86/Makefile          |   1 +
>  drivers/platform/x86/dell-laptop.c     | 191 ++++++++++++++++-----------------
>  drivers/platform/x86/dell-smbios-smm.c | 136 +++++++++++++++++++++++
>  drivers/platform/x86/dell-smbios-smm.h |  22 ++++
>  drivers/platform/x86/dell-smbios.c     | 120 +++++++++++++--------
>  drivers/platform/x86/dell-smbios.h     |  13 ++-
>  drivers/platform/x86/dell-wmi.c        |   8 +-
>  9 files changed, 361 insertions(+), 153 deletions(-)
>  create mode 100644 drivers/platform/x86/dell-smbios-smm.c
>  create mode 100644 drivers/platform/x86/dell-smbios-smm.h
> 
...

> +config DELL_SMBIOS_SMM
> +       tristate "Dell SMBIOS calling interface (SMM implementation)"
> +       depends on DCDBAS
> +       default DCDBAS
> +       select DELL_SMBIOS
> +       ---help---
> +       This provides an implementation for the Dell SMBIOS calling interface
> +       communicated over ACPI-WMI.

Not over ACPI-WMI... over SMM.... right?



> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index f42159fd2031..c648bbfcc394 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -85,6 +85,7 @@ static struct platform_driver platform_driver = {
>  	}
>  };
>  
> +static struct calling_interface_buffer *buffer;
>  static struct platform_device *platform_device;
>  static struct backlight_device *dell_backlight_device;
>  static struct rfkill *wifi_rfkill;
> @@ -405,7 +406,6 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
>  
>  static int dell_rfkill_set(void *data, bool blocked)
>  {
> -	struct calling_interface_buffer *buffer;
>  	int disable = blocked ? 1 : 0;
>  	unsigned long radio = (unsigned long)data;
>  	int hwswitch_bit = (unsigned long)data - 1;
> @@ -413,19 +413,21 @@ static int dell_rfkill_set(void *data, bool blocked)
>  	int status;
>  	int ret;
>  
> -	buffer = dell_smbios_get_buffer();
> -
> -	dell_smbios_send_request(17, 11);
> +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> +	buffer->class = 17;
> +	buffer->select = 11;

Please move these three lines into a function, it's used far far too
often to be open coded. The dell_smbios_send_request is a reasonable
wrapper which you could just define here as well. This would minimize
the change to the driver.


-- 
Darren Hart
VMware Open Source Technology Center

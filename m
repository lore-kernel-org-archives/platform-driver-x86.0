From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix warning about
 deprecated hwmon_device_register
Date: Fri, 18 Aug 2017 16:01:06 -0700
Message-ID: <20170818230106.GA15303@fury>
References: <20170620051633.GB15974@khazad-dum.debian.net>
 <20170621034513.4023-1-kernel@fomichev.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:58754 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751674AbdHRXBL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 19:01:11 -0400
Content-Disposition: inline
In-Reply-To: <20170621034513.4023-1-kernel@fomichev.me>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stanislav Fomichev <kernel@fomichev.me>
Cc: hmh@hmh.eng.br, ibm-acpi@hmh.eng.br, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Stanislav Fomichev <sdf@google.com>

On Tue, Jun 20, 2017 at 08:45:13PM -0700, Stanislav Fomichev wrote:
> From: Stanislav Fomichev <sdf@google.com>
> 

Oi, apologies for the long delay on this.

> Use hwmon_device_register_with_groups instead of deprecated
> hwmon_device_register and fix a dmesg warning.
> 
> This patch however changes the userspace API.
> hwmon_device_register_with_groups takes `hwmon' name as an argument and creates
> a name file in the `hwmon' device, not in the `platform_device'. This
> allows us to remove custom `name' device attribute, but in order to make
> lm-sensors happy we also have to move fans and thermal attributes to the
> `hwmon' device.
> 
> Even though this patch changes userspace API, it's still compatible with
> the lm-sensors. Starting with lm-sensors 3.0 (circa 2007), it looks at both
> hwmon and the backing device for the name and other attributes.
> 
> before:
> $ cat /sys/devices/platform/thinkpad_hwmon/{name,fan1_input}
> thinkpad
> 2007
> $ cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/{name,fan1_input}
> cat: /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/name: No such file or directory
> cat: /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/fan1_input: No such file or directory
> $ cat /sys/class/hwmon/hwmon1/{name,fan1_input}
> cat: /sys/class/hwmon/hwmon1/name: No such file or directory
> cat: /sys/class/hwmon/hwmon1/fan1_input: No such file or directory
> $ sensors
> thinkpad-isa-0000
> Adapter: ISA adapter
> fan1:        3533 RPM
> 
> after:
> $ cat /sys/devices/platform/thinkpad_hwmon/{name,fan1_input}
> cat: /sys/devices/platform/thinkpad_hwmon/name: No such file or directory
> cat: /sys/devices/platform/thinkpad_hwmon/fan1_input: No such file or directory
> $ cat /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon1/{name,fan1_input}
> thinkpad
> 3478
> $ cat /sys/class/hwmon/hwmon1/{name,fan1_input}
> thinkpad
> 3478
> $ sensors
> thinkpad-isa-0000
> Adapter: ISA adapter
> fan1:        3489 RPM
> 

This looks very reasonable to me. The lm-sensors user experience is
effectively unchanged, and the /sys/* changes move from a specific
implementation to a generic implementation, taking advantage for the
subsystem.

> $ sensors -v
> sensors version 3.4.0 with libsensors version 3.4.0
> 
> Changes since v1:
> * Bumped TPACPI_SYSFS_VERSION
> * Updated documentation
> 

Please see Documentation/process/submitting-patches.rst section 14
regarding the placement of the Changelog below the --- marker line as it
is not part of the commit message. (for future patches)

> Signed-off-by: Stanislav Fomichev <kernel@fomichev.me>
> ---
>  Documentation/laptops/thinkpad-acpi.txt |  9 ++++++--
>  drivers/platform/x86/thinkpad_acpi.c    | 38 ++++++++++-----------------------
>  2 files changed, 18 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
> index ba2e7d254842..1dbef8b8c7b1 100644
> --- a/Documentation/laptops/thinkpad-acpi.txt
> +++ b/Documentation/laptops/thinkpad-acpi.txt
> @@ -121,8 +121,9 @@ space, for 2.6.23+ this is /sys/devices/platform/thinkpad_acpi/.
>  Sysfs device attributes for the sensors and fan are on the
>  thinkpad_hwmon device's sysfs attribute space, but you should locate it
>  looking for a hwmon device with the name attribute of "thinkpad", or
> -better yet, through libsensors.
> -
> +better yet, through libsensors. For 4.13+ sysfs attributes were moved to the

This will be 4.14 because we let it sit too long. I'll correct this.

I've queued this to testing for 4.14.

Henrique, please shout if you have any objections here.

-- 
Darren Hart
VMware Open Source Technology Center

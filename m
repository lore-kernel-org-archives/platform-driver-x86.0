Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6C7A95C;
	Fri, 17 Jan 2025 17:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135388; cv=none; b=dTYG3VYJ+K/DVW5Mgr3WRDQzG6mrPZeWPM/a+orN26F75NcJAALJrLWNADVnrO89y705GW0LRkkNkrDM6lEMJRBWLh8UOuxoEyh8mzJokRL4Lki+m4kyq8Ot//LhnXzyKduHVkV7NfGfvus7wEsmzkgIEVSerMXSld+p4A0XI48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135388; c=relaxed/simple;
	bh=r7eL3+Tr5uQXZbyFFywh2Dh6RW7RjDbL/ciBT4p+lqI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ps2JTEiUDwLEsTY2+j5QniuplNSV7YnnmmqeDs3WifA8ENMrsVTWIzjCqRRR2F99K093S826Bwj/SpzykDs2GIRVe3Xd32zejT8C4Rmr/sdzSlzZTWdhcrjIhMnrOADXzFkGwgEpn94kvYadTxD1lbqYZYOHrcy54dbVHnMdKjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iF5tOEx3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iF5tOEx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737135385; x=1768671385;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=r7eL3+Tr5uQXZbyFFywh2Dh6RW7RjDbL/ciBT4p+lqI=;
  b=iF5tOEx3gXOG7I5MNMcaut+6aYpp3HdUSJ82t7ppC6oMQ4VYAOQLXDfv
   MGPbTtTmkTLALnpP61XcIz1eA/aJAYNc0iL3Xsu9fYI1avhRFqu+3tlTJ
   fqFDHpGnTZeb+koGPZfa2YwkzwHd2PDehexdgwaTdfr4ANcXE0D/LhQHQ
   Vb3oABZrvi4pfA32jIVttPfcKN0bHnXaFCkj+t4hplC9H3i1MATJ6OMGD
   afHHuraZ7rt5nH8xSSpQkJf3VSK3QsFvdPCY7F/iXLciprHYw/EjbanOj
   /PqTsQ/POWRcC/jN0/B5DSjUxdBV5LT+NPTGF0kn3zpUY4PQcoWHkhzie
   A==;
X-CSE-ConnectionGUID: YEX+HCK4QeqZJXMWoVC1pw==
X-CSE-MsgGUID: 0aEnlCfMR2ektO6K7x+pPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41246866"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="41246866"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 09:36:24 -0800
X-CSE-ConnectionGUID: jgVb3qkCSV+tWeTCwlZoKw==
X-CSE-MsgGUID: +hpkmg2rSp2x0HKYpF3UUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="106416760"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.76])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 09:36:18 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 17 Jan 2025 19:36:14 +0200 (EET)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: W_Armin@gmx.de, thomas@t-8ch.de, kuurtb@gmail.com, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    corbet@lwn.net, linux-doc@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
In-Reply-To: <20250112150910.13489-1-josh@joshuagrisham.com>
Message-ID: <f91b823c-593d-dbdf-e453-878e61f329ec@linux.intel.com>
References: <20250112150910.13489-1-josh@joshuagrisham.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1492781381-1737135192=:932"
Content-ID: <478685f3-9d3e-ecb9-c128-12fe03f1e256@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1492781381-1737135192=:932
Content-Type: text/plain; CHARSET=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <7870b86c-9aa4-f8e9-e9e9-e9a43701637e@linux.intel.com>

On Sun, 12 Jan 2025, Joshua Grisham wrote:

> Add a new driver for Samsung Galaxy Book series notebook devices with the
> following features:
>=20
> - Keyboard backlight control
> - Battery extension with charge control end threshold
> - Controller for Samsung's performance modes using the platform profile
>   interface
> - Adds firmware-attributes to control various system features
> - Handles various hotkeys and notifications
>=20
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
>=20
> ---
>=20
> v1->v2:
> - Attempt to resolve all review comments from v1 as written here:
> https://lore.kernel.org/platform-driver-x86/53c5075b-1967-45d0-937f-46391=
2dd966d@gmx.de/T/#mbcbd8d5d9bc4496bac5486636c7d3b32bc3e5cd0
>=20
> v2->v3:
> - Tweak to battery attribute to closer match pattern in dell-wmi-ddv
> - implement platform_profile_remove() change from
>   9b3bb37b44a317626464e79da8b39989b421963f
> - Small tweak to Documentation page
>=20
> v3->v4:
> - Remove custom tracepoint (can trace via existing mechanisms)
> - Remove module parameters
> - Move sysfs attributes from device to firmware-attributes
> - Refactor "allow_recording" to "camera_lens_cover" plus other small
>   renames in aim to have more standardized naming that are cross-vendor
> - Attempt to improve locking mechanisms
> - Tweak logic for setting and getting led brightness
> - More fixes for aiming to use devres/devm pattern
> - Change battery charge end threshold to use 1 to 100 instead of 0 to 99
> - Add swtich input event for camera_lens_cover remove all others (they wi=
ll
>   be generated as ACPI netlink events instead)
> - Various other small tweaks and features as requested from feedback
>=20
> v4-v5:
> - Prefix all locally defined symbols with "GB_" as a namespace
> - Remove extra unused out_buf from galaxybook_acpi_method
> - Tighten up logic flow for setting and unsetting global pointer (now it
>   is done directly in association with the i8042 filter init and exit)
> - Rename "camera_lens_cover" to "block_recording"
> - Change input device to only apply for "Camera Lens Cover", remove spars=
e
>   keymap and set capabilities manually as part of block_recording init,
>   then notify using input_report_switch when setting block_recording
> - Correct firmware-attributes enumeration implementation (adding all
>   attributes) and remove erroneous ABI fw attrs docs update
> - Few small tweaks to how locks are used
> - Use device_unregister instead of device_destroy for firmware attributes
>   device
> - Tighten up and clean up performance mode to profile mapping logic; now
>   the mapping is largely "fixed" apart from "Ultra" that will map to
>   performance while also re-mapping "Performance" to balanced-performance
> - Tighten up error handling so probe will fail in more cases where it
>   should fail
> - Replace platform_profile_register with devm_platform_profile_register
>=20
> v5->v6:
> - A few small clean-up/fixes as requested from feedback
> - Revamp performance mode profile mapping so it is more static and relies
>   more on the facilities already built in to platform_profile, including:
>   - setting and using bits on profile handler choices to drive most of th=
e
>     behavior instead of having totally separate logic
>   - get_performance_mode_profile() is now a mostly static mapping that
>     drives both setting initial profile choices and retrieving the right
>     profile for a given performance_mode during runtime
>   - during init most of the mappings are hard-coded and the only things
>     that are changed are the exception cases (override legacy values and
>     downgrade of performance when Ultra mode is present)
>   - new function galaxybook_performance_mode_init() now handles initial
>     startup performance mode in a much more simple and straight-forward w=
ay
> ---
>  Documentation/admin-guide/laptops/index.rst   |    1 +
>  .../laptops/samsung-galaxybook.rst            |  170 ++
>  MAINTAINERS                                   |    7 +
>  drivers/platform/x86/Kconfig                  |   17 +
>  drivers/platform/x86/Makefile                 |    5 +-
>  drivers/platform/x86/samsung-galaxybook.c     | 1485 +++++++++++++++++
>  6 files changed, 1683 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/admin-guide/laptops/samsung-galaxybook.=
rst
>  create mode 100644 drivers/platform/x86/samsung-galaxybook.c
>=20
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/=
admin-guide/laptops/index.rst
> index cd9a1c2695fd..e71c8984c23e 100644
> --- a/Documentation/admin-guide/laptops/index.rst
> +++ b/Documentation/admin-guide/laptops/index.rst
> @@ -11,6 +11,7 @@ Laptop Drivers
>     disk-shock-protection
>     laptop-mode
>     lg-laptop
> +   samsung-galaxybook
>     sony-laptop
>     sonypi
>     thinkpad-acpi
> diff --git a/Documentation/admin-guide/laptops/samsung-galaxybook.rst b/D=
ocumentation/admin-guide/laptops/samsung-galaxybook.rst
> new file mode 100644
> index 000000000000..f6af0c84de2c
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
> @@ -0,0 +1,170 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Samsung Galaxy Book
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Joshua Grisham <josh@joshuagrisham.com>
> +
> +This is a Linux x86 platform driver for Samsung Galaxy Book series noteb=
ook
> +devices which utilizes Samsung's ``SCAI`` ACPI device in order to contro=
l
> +extra features and receive various notifications.
> +
> +Supported devices
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Any device with one of the supported ACPI device IDs should be supported=
=2E This
> +covers most of the "Samsung Galaxy Book" series notebooks that are curre=
ntly
> +available as of this writing, and could include other Samsung notebook d=
evices
> +as well.
> +
> +Status
> +=3D=3D=3D=3D=3D=3D
> +
> +The following features are currently supported:
> +
> +- :ref:`Keyboard backlight <keyboard-backlight>` control
> +- :ref:`Performance mode <performance-mode>` control implemented using t=
he
> +  platform profile interface
> +- :ref:`Battery charge control end threshold
> +  <battery-charge-control-end-threshold>` (stop charging battery at give=
n
> +  percentage value) implemented as a battery hook
> +- :ref:`Firmware Attributes <firmware-attributes>` to allow control of v=
arious
> +  device settings
> +- :ref:`Handling of Fn hotkeys <keyboard-hotkey-actions>` for various ac=
tions
> +- :ref:`Handling of ACPI notifications and hotkeys
> +  <acpi-notifications-and-hotkey-actions>`
> +
> +Because different models of these devices can vary in their features, th=
ere is
> +logic built within the driver which attempts to test each implemented fe=
ature
> +for a valid response before enabling its support (registering additional=
 devices
> +or extensions, adding sysfs attributes, etc). Therefore, it can be impor=
tant to
> +note that not all features may be supported for your particular device.
> +
> +The following features might be possible to implement but will require
> +additional investigation and are therefore not supported at this time:
> +
> +- "Dolby Atmos" mode for the speakers
> +- "Outdoor Mode" for increasing screen brightness on models with ``SAM04=
27``
> +- "Silent Mode" on models with ``SAM0427``
> +
> +.. _keyboard-backlight:
> +
> +Keyboard backlight
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A new LED class named ``samsung-galaxybook::kbd_backlight`` is created w=
hich
> +will then expose the device using the standard sysfs-based LED interface=
 at
> +``/sys/class/leds/samsung-galaxybook::kbd_backlight``. Brightness can be
> +controlled by writing the desired value to the ``brightness`` sysfs attr=
ibute or
> +with any other desired userspace utility.
> +
> +.. note::
> +  Most of these devices have an ambient light sensor which also turns
> +  off the keyboard backlight under well-lit conditions. This behavior do=
es not
> +  seem possible to control at this time, but can be good to be aware of.
> +
> +.. _performance-mode:
> +
> +Performance mode
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This driver implements the
> +Documentation/userspace-api/sysfs-platform_profile.rst interface for wor=
king
> +with the "performance mode" function of the Samsung ACPI device.
> +
> +Mapping of each Samsung "performance mode" to its respective platform pr=
ofile is
> +performed dynamically by the driver, as not all models support all of th=
e same
> +performance modes. Your device might have one or more of the following m=
appings:
> +
> +- "Silent" maps to ``low-power``
> +- "Quiet" maps to ``quiet``
> +- "Optimized" maps to ``balanced``
> +- "Performance" maps to ``performance``
> +- For devices which support "Ultra", "Ultra" will map to ``performance``=
 and
> +  "Performance" will be re-mapped to ``balanced-performance``.
> +
> +The result of the mapping can be printed in the kernel log when the modu=
le is
> +loaded. Supported profiles can also be retrieved from
> +``/sys/firmware/acpi/platform_profile_choices``, while
> +``/sys/firmware/acpi/platform_profile`` can be used to read or write the
> +currently selected profile.
> +
> +The ``balanced`` platform profile will be set during module load if no p=
rofile
> +has been previously set.
> +
> +.. _battery-charge-control-end-threshold:
> +
> +Battery charge control end threshold
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This platform driver will add the ability to set the battery's charge co=
ntrol
> +end threshold, but does not have the ability to set a start threshold.
> +
> +This feature is typically called "Battery Saver" by the various Samsung
> +applications in Windows, but in Linux we have implemented the standardiz=
ed
> +"charge control threshold" sysfs interface on the battery device to allo=
w for
> +controlling this functionality from the userspace.
> +
> +The sysfs attribute
> +``/sys/class/power_supply/BAT1/charge_control_end_threshold`` can be use=
d to
> +read or set the desired charge end threshold.
> +
> +If you wish to maintain interoperability with Windows, then you should s=
et the
> +value to 80 to represent "on", or 100 to represent "off", as these are t=
he
> +values currently recognized by the various Windows-based Samsung applica=
tions
> +and services as "on" or "off". Otherwise, the device will accept any val=
ue
> +between 1 and 100 as the percentage that you wish the battery to stop ch=
arging
> +at.
> +
> +.. _firmware-attributes:
> +
> +Firmware Attributes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following enumeration-typed firmware attributes are set up by this d=
river
> +and should be accessible under
> +``/sys/class/firmware-attributes/samsung-galaxybook/attributes/`` if you=
r device
> +supports them:
> +
> +- ``power_on_lid_open`` (device should power on when the lid is opened)
> +- ``usb_charging``  (USB ports can deliver power to connected devices ev=
en when
> +  the device is powered off or in a low sleep state)
> +- ``block_recording`` (blocks access to camera and microphone)
> +
> +All of these attributes are simple boolean-like enumeration values which=
 use 0
> +to represent "off" and 1 to represent "on". Use the ``current_value`` at=
tribute
> +to get or change the setting on the device.
> +
> +Note that when ``block_recording`` is updated, the input device "Samsung=
 Galaxy
> +Book Lens Cover" will receive a ``SW_CAMERA_LENS_COVER`` switch event wh=
ich
> +reflects the current state.
> +
> +.. _keyboard-hotkey-actions:
> +
> +Keyboard hotkey actions (i8042 filter)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The i8042 filter will swallow the keyboard events for the Fn+F9 hotkey (=
Multi-
> +level keyboard backlight toggle) and Fn+F10 hotkey (Block recording togg=
le)
> +and instead execute their actions within the driver itself.
> +
> +Fn+F9 will cycle through the brightness levels of the keyboard backlight=
=2E A
> +notification will be sent using ``led_classdev_notify_brightness_hw_chan=
ged``
> +so that the userspace can be aware of the change. This mimics the behavi=
or of
> +other existing devices where the brightness level is cycled internally b=
y the
> +embedded controller and then reported via a notification.
> +
> +Fn+F10 will toggle the value of the "block recording" setting, which blo=
cks
> +or allows usage of the built-in camera and microphone.
> +
> +.. _acpi-notifications-and-hotkey-actions:
> +
> +ACPI notifications and hotkey actions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +ACPI notifications will generate ACPI netlink events and can be received=
 using
> +userspace tools such as ``acpi_listen`` and ``acpid``.
> +
> +The Fn+F11 Performance mode hotkey will be handled by the driver; each k=
eypress
> +will cycle to the next available platform profile.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3809931b9240..6448e931728c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20733,6 +20733,13 @@ L:=09linux-fbdev@vger.kernel.org
>  S:=09Maintained
>  F:=09drivers/video/fbdev/s3c-fb.c
> =20
> +SAMSUNG GALAXY BOOK DRIVER
> +M:=09Joshua Grisham <josh@joshuagrisham.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09Documentation/admin-guide/laptops/samsung-galaxybook.rst
> +F:=09drivers/platform/x86/samsung-galaxybook.c
> +
>  SAMSUNG INTERCONNECT DRIVERS
>  M:=09Sylwester Nawrocki <s.nawrocki@samsung.com>
>  M:=09Artur =A6wigo=F1 <a.swigon@samsung.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..c77178e2640b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -778,6 +778,23 @@ config BARCO_P50_GPIO
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called barco-p50-gpio.
> =20
> +config SAMSUNG_GALAXYBOOK
> +=09tristate "Samsung Galaxy Book driver"
> +=09depends on ACPI
> +=09depends on ACPI_BATTERY
> +=09depends on INPUT
> +=09depends on LEDS_CLASS
> +=09depends on SERIO_I8042
> +=09select ACPI_PLATFORM_PROFILE
> +=09select FW_ATTR_CLASS
> +=09help
> +=09  This is a driver for Samsung Galaxy Book series notebooks. It adds
> +=09  support for the keyboard backlight control, performance mode contro=
l,
> +=09  function keys, and various firmware attributes.
> +
> +=09  For more information about this driver, see
> +=09  <file:Documentation/admin-guide/laptops/samsung-galaxybook.rst>.
> +
>  config SAMSUNG_LAPTOP
>  =09tristate "Samsung Laptop driver"
>  =09depends on RFKILL || RFKILL =3D n
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b142947067..32ec4cb9d902 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -95,8 +95,9 @@ obj-$(CONFIG_PCENGINES_APU2)=09+=3D pcengines-apuv2.o
>  obj-$(CONFIG_BARCO_P50_GPIO)=09+=3D barco-p50-gpio.o
> =20
>  # Samsung
> -obj-$(CONFIG_SAMSUNG_LAPTOP)=09+=3D samsung-laptop.o
> -obj-$(CONFIG_SAMSUNG_Q10)=09+=3D samsung-q10.o
> +obj-$(CONFIG_SAMSUNG_GALAXYBOOK)=09+=3D samsung-galaxybook.o
> +obj-$(CONFIG_SAMSUNG_LAPTOP)=09=09+=3D samsung-laptop.o
> +obj-$(CONFIG_SAMSUNG_Q10)=09=09+=3D samsung-q10.o
> =20
>  # Toshiba
>  obj-$(CONFIG_TOSHIBA_BT_RFKILL)=09+=3D toshiba_bluetooth.o
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform=
/x86/samsung-galaxybook.c
> new file mode 100644
> index 000000000000..bbdf4b9282ac
> --- /dev/null
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -0,0 +1,1485 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Samsung Galaxy Book driver
> + *
> + * Copyright (c) 2025 Joshua Grisham <josh@joshuagrisham.com>
> + *
> + * With contributions to the SCAI ACPI device interface:
> + * Copyright (c) 2024 Giulio Girardi <giulio.girardi@protechgroup.it>
> + *
> + * Implementation inspired by existing x86 platform drivers.
> + * Thank you to the authors!
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/i8042.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
> +#include <linux/serio.h>
> +#include <linux/sysfs.h>
> +#include <linux/uuid.h>
> +#include <linux/workqueue.h>
> +#include <acpi/battery.h>
> +#include "firmware_attributes_class.h"
> +
> +#define DRIVER_NAME "samsung-galaxybook"
> +
> +struct samsung_galaxybook {
> +=09struct platform_device *platform;
> +=09struct acpi_device *acpi;
> +
> +=09const struct class *fw_attrs_class;
> +=09struct device *fw_attrs_dev;
> +=09struct kset *fw_attrs_kset;
> +=09/* block out of sync condition if firmware attributes are updated in =
multiple threads */

Please use multiple line comment as this exceeds 80 chars.

> +=09struct mutex fw_attr_lock;
> +
> +=09bool has_kbd_backlight;
> +=09bool has_block_recording;
> +=09bool has_performance_mode;
> +
> +=09struct led_classdev kbd_backlight;
> +=09struct work_struct kbd_backlight_hotkey_work;
> +=09/* block out of sync condition in hotkey action if brightness updated=
 in another thread */

Ditto.

> +=09struct mutex kbd_backlight_lock;
> +
> +=09void *i8042_filter_ptr;
> +
> +=09struct work_struct block_recording_hotkey_work;
> +=09struct input_dev *camera_lens_cover_switch;
> +
> +=09struct acpi_battery_hook battery_hook;
> +=09struct device_attribute charge_control_end_threshold_attr;
> +
> +=09u8 profile_performance_modes[PLATFORM_PROFILE_LAST + 1];
> +=09struct platform_profile_handler profile_handler;
> +};
> +
> +static struct samsung_galaxybook *galaxybook_ptr;
> +
> +enum galaxybook_fw_attr_id {
> +=09GB_ATTR_POWER_ON_LID_OPEN,
> +=09GB_ATTR_USB_CHARGING,
> +=09GB_ATTR_BLOCK_RECORDING,
> +};
> +
> +static const char * const galaxybook_fw_attr_name[] =3D {
> +=09[GB_ATTR_POWER_ON_LID_OPEN] =3D "power_on_lid_open",
> +=09[GB_ATTR_USB_CHARGING] =3D "usb_charging",
> +=09[GB_ATTR_BLOCK_RECORDING] =3D "block_recording",
> +};
> +
> +static const char * const galaxybook_fw_attr_desc[] =3D {
> +=09[GB_ATTR_POWER_ON_LID_OPEN] =3D "Power On Lid Open",
> +=09[GB_ATTR_USB_CHARGING] =3D "USB Charging",
> +=09[GB_ATTR_BLOCK_RECORDING] =3D "Block Recording",

Please align values in both arrays.

> +};
> +
> +#define GB_ATTR_LANGUAGE_CODE "en_US.UTF-8"
> +
> +struct galaxybook_fw_attr {
> +=09struct samsung_galaxybook *galaxybook;
> +=09enum galaxybook_fw_attr_id fw_attr_id;
> +=09struct attribute_group attr_group;
> +=09struct kobj_attribute display_name;
> +=09struct kobj_attribute current_value;
> +=09int (*get_value)(struct samsung_galaxybook *galaxybook, bool *value);
> +=09int (*set_value)(struct samsung_galaxybook *galaxybook, const bool va=
lue);
> +};
> +
> +struct sawb {
> +=09u16 safn;
> +=09u16 sasb;
> +=09u8 rflg;
> +=09union {
> +=09=09struct {
> +=09=09=09u8 gunm;
> +=09=09=09u8 guds[250];
> +=09=09} __packed;
> +=09=09struct {
> +=09=09=09u8 caid[16];
> +=09=09=09u8 fncn;
> +=09=09=09u8 subn;
> +=09=09=09u8 iob0;
> +=09=09=09u8 iob1;
> +=09=09=09u8 iob2;
> +=09=09=09u8 iob3;
> +=09=09=09u8 iob4;
> +=09=09=09u8 iob5;
> +=09=09=09u8 iob6;
> +=09=09=09u8 iob7;
> +=09=09=09u8 iob8;
> +=09=09=09u8 iob9;
> +=09=09} __packed;
> +=09=09struct {
> +=09=09=09u8 iob_prefix[18];
> +=09=09=09u8 iob_values[10];
> +=09=09} __packed;
> +=09} __packed;
> +} __packed;
> +
> +#define GB_SAWB_LEN_SETTINGS          0x15
> +#define GB_SAWB_LEN_PERFORMANCE_MODE  0x100
> +
> +#define GB_SAFN  0x5843
> +
> +#define GB_SASB_KBD_BACKLIGHT     0x78
> +#define GB_SASB_POWER_MANAGEMENT  0x7a
> +#define GB_SASB_USB_CHARGING_GET  0x67
> +#define GB_SASB_USB_CHARGING_SET  0x68
> +#define GB_SASB_NOTIFICATIONS     0x86
> +#define GB_SASB_BLOCK_RECORDING   0x8a
> +#define GB_SASB_PERFORMANCE_MODE  0x91
> +
> +#define GB_SAWB_RFLG_POS     4
> +#define GB_SAWB_GB_GUNM_POS  5
> +
> +#define GB_RFLG_SUCCESS  0xaa
> +#define GB_GUNM_FAIL     0xff
> +
> +#define GB_GUNM_FEATURE_ENABLE          0xbb
> +#define GB_GUNM_FEATURE_ENABLE_SUCCESS  0xdd
> +#define GB_GUDS_FEATURE_ENABLE          0xaa
> +#define GB_GUDS_FEATURE_ENABLE_SUCCESS  0xcc
> +
> +#define GB_GUNM_GET  0x81
> +#define GB_GUNM_SET  0x82
> +
> +#define GB_GUNM_POWER_MANAGEMENT  0x82
> +
> +#define GB_GUNM_USB_CHARGING_GET            0x80
> +#define GB_GUNM_USB_CHARGING_ON             0x81
> +#define GB_GUNM_USB_CHARGING_OFF            0x80
> +#define GB_GUDS_POWER_ON_LID_OPEN           0xa3
> +#define GB_GUDS_POWER_ON_LID_OPEN_GET       0x81
> +#define GB_GUDS_POWER_ON_LID_OPEN_SET       0x80
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL      0xe9
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL_GET  0x91
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL_SET  0x90
> +#define GB_GUNM_ACPI_NOTIFY_ENABLE          0x80
> +#define GB_GUDS_ACPI_NOTIFY_ENABLE          0x02
> +
> +#define GB_BLOCK_RECORDING_ON   0x0
> +#define GB_BLOCK_RECORDING_OFF  0x1
> +
> +#define GB_FNCN_PERFORMANCE_MODE       0x51
> +#define GB_SUBN_PERFORMANCE_MODE_LIST  0x01
> +#define GB_SUBN_PERFORMANCE_MODE_GET   0x02
> +#define GB_SUBN_PERFORMANCE_MODE_SET   0x03
> +
> +/* guid 8246028d-8bca-4a55-ba0f-6f1e6b921b8f */
> +static const guid_t performance_mode_guid =3D
> +=09GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6b, 0=
x92, 0x1b, 0x8f);
> +#define GB_PERFORMANCE_MODE_GUID performance_mode_guid
> +
> +#define GB_PERFORMANCE_MODE_ULTRA               0x16
> +#define GB_PERFORMANCE_MODE_PERFORMANCE         0x15
> +#define GB_PERFORMANCE_MODE_SILENT              0xb
> +#define GB_PERFORMANCE_MODE_QUIET               0xa
> +#define GB_PERFORMANCE_MODE_OPTIMIZED           0x2
> +#define GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY  0x1
> +#define GB_PERFORMANCE_MODE_OPTIMIZED_LEGACY    0x0
> +#define GB_PERFORMANCE_MODE_IGNORE1             0x14
> +#define GB_PERFORMANCE_MODE_IGNORE2             0xc
> +#define GB_PERFORMANCE_MODE_INVALID             0xff
> +
> +#define GB_ACPI_METHOD_ENABLE            "SDLS"
> +#define GB_ACPI_METHOD_ENABLE_ON         1
> +#define GB_ACPI_METHOD_ENABLE_OFF        0
> +#define GB_ACPI_METHOD_SETTINGS          "CSFI"
> +#define GB_ACPI_METHOD_PERFORMANCE_MODE  "CSXI"
> +
> +#define GB_KBD_BACKLIGHT_MAX_BRIGHTNESS  3
> +
> +#define GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED    0x61
> +#define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
> +#define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
> +#define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
> +
> +#define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
> +#define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
> +#define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
> +#define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
> +#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
> +#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
> +
> +/*
> + * ACPI method handling
> + */
> +
> +static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook,=
 acpi_string method,
> +=09=09=09=09  struct sawb *buf, size_t len)
> +{
> +=09struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +=09union acpi_object in_obj, *out_obj;
> +=09struct acpi_object_list input;
> +=09acpi_status status;
> +=09int err;
> +
> +=09in_obj.type =3D ACPI_TYPE_BUFFER;
> +=09in_obj.buffer.length =3D len;
> +=09in_obj.buffer.pointer =3D (u8 *)buf;
> +
> +=09input.count =3D 1;
> +=09input.pointer =3D &in_obj;
> +
> +=09status =3D acpi_evaluate_object_typed(galaxybook->acpi->handle, metho=
d, &input, &output,
> +=09=09=09=09=09    ACPI_TYPE_BUFFER);
> +
> +=09if (ACPI_FAILURE(status)) {
> +=09=09dev_err(&galaxybook->acpi->dev, "failed to execute method %s; got =
%s\n",
> +=09=09=09method, acpi_format_exception(status));
> +=09=09return -EIO;
> +=09}
> +
> +=09out_obj =3D output.pointer;
> +
> +=09if (out_obj->buffer.length !=3D len || out_obj->buffer.length < GB_SA=
WB_GB_GUNM_POS + 1) {
> +=09=09dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> +=09=09=09"response length mismatch\n", method);

Please put the entire error message on the same line (to make sure grep=20
will capture it).

> +=09=09err =3D -EPROTO;
> +=09=09goto out_free;
> +=09}
> +=09if (out_obj->buffer.pointer[GB_SAWB_RFLG_POS] !=3D GB_RFLG_SUCCESS) {
> +=09=09dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> +=09=09=09"device did not respond with success code 0x%x\n",

Ditto.

> +=09=09=09method, GB_RFLG_SUCCESS);
> +=09=09err =3D -ENXIO;
> +=09=09goto out_free;
> +=09}
> +=09if (out_obj->buffer.pointer[GB_SAWB_GB_GUNM_POS] =3D=3D GB_GUNM_FAIL)=
 {
> +=09=09dev_err(&galaxybook->acpi->dev,
> +=09=09=09"failed to execute method %s; device responded with failure cod=
e 0x%x\n",

Ditto.

> +=09=09=09method, GB_GUNM_FAIL);
> +=09=09err =3D -ENXIO;
> +=09=09goto out_free;
> +=09}
> +
> +=09memcpy(buf, out_obj->buffer.pointer, len);
> +=09err =3D 0;
> +
> +out_free:
> +=09kfree(out_obj);
> +=09return err;
> +}
> +
> +static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *gal=
axybook, const u16 sasb)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D sasb;
> +=09buf.gunm =3D GB_GUNM_FEATURE_ENABLE;
> +=09buf.guds[0] =3D GB_GUDS_FEATURE_ENABLE;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09     &buf, GB_SAWB_LEN_SETTINGS);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (buf.gunm !=3D GB_GUNM_FEATURE_ENABLE_SUCCESS &&
> +=09    buf.guds[0] !=3D GB_GUDS_FEATURE_ENABLE_SUCCESS)
> +=09=09return -ENODEV;
> +
> +=09return 0;
> +}
> +
> +/*
> + * Keyboard Backlight
> + */
> +
> +static int kbd_backlight_acpi_set(struct samsung_galaxybook *galaxybook,
> +=09=09=09=09  const enum led_brightness brightness)
> +{
> +=09struct sawb buf =3D {};
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_KBD_BACKLIGHT;
> +=09buf.gunm =3D GB_GUNM_SET;
> +
> +=09buf.guds[0] =3D brightness;
> +
> +=09return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09      &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static int kbd_backlight_acpi_get(struct samsung_galaxybook *galaxybook,
> +=09=09=09=09  enum led_brightness *brightness)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_KBD_BACKLIGHT;
> +=09buf.gunm =3D GB_GUNM_GET;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09     &buf, GB_SAWB_LEN_SETTINGS);
> +=09if (err)
> +=09=09return err;
> +
> +=09*brightness =3D buf.gunm;
> +
> +=09return 0;
> +}
> +
> +static int kbd_backlight_store(struct led_classdev *led,
> +=09=09=09       const enum led_brightness brightness)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of_const(led, struct samsung_galaxybook, kbd_backlight);
> +
> +=09return kbd_backlight_acpi_set(galaxybook, brightness);
> +}
> +
> +static enum led_brightness kbd_backlight_show(struct led_classdev *led)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of(led, struct samsung_galaxybook, kbd_backlight);
> +=09enum led_brightness brightness;
> +=09int err;
> +
> +=09err =3D kbd_backlight_acpi_get(galaxybook, &brightness);
> +=09if (err)
> +=09=09return err;
> +
> +=09return brightness;
> +}
> +
> +static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *gala=
xybook)
> +{
> +=09struct led_init_data init_data =3D {};
> +=09enum led_brightness brightness;
> +=09int err;
> +
> +=09err =3D devm_mutex_init(&galaxybook->platform->dev, &galaxybook->kbd_=
backlight_lock);
> +=09if (err)
> +=09=09return err;
> +
> +=09err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_KBD_BACKLI=
GHT);
> +=09if (err) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to enable kbd_backlight feature, error %d\n", err);
> +=09=09return 0;
> +=09}
> +
> +=09err =3D kbd_backlight_acpi_get(galaxybook, &brightness);
> +=09if (err) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to get initial kbd_backlight brightness, error %d\n", e=
rr);
> +=09=09return 0;
> +=09}
> +
> +=09init_data.devicename =3D DRIVER_NAME;
> +=09init_data.default_label =3D ":" LED_FUNCTION_KBD_BACKLIGHT;
> +=09init_data.devname_mandatory =3D true;
> +
> +=09galaxybook->kbd_backlight.brightness_get =3D kbd_backlight_show;
> +=09galaxybook->kbd_backlight.brightness_set_blocking =3D kbd_backlight_s=
tore;
> +=09galaxybook->kbd_backlight.flags =3D LED_BRIGHT_HW_CHANGED;
> +=09galaxybook->kbd_backlight.max_brightness =3D GB_KBD_BACKLIGHT_MAX_BRI=
GHTNESS;
> +
> +=09err =3D devm_led_classdev_register_ext(&galaxybook->platform->dev,
> +=09=09=09=09=09     &galaxybook->kbd_backlight, &init_data);
> +=09if (err)
> +=09=09return err;
> +
> +=09galaxybook->has_kbd_backlight =3D true;
> +
> +=09return 0;
> +}
> +
> +/*
> + * Battery Extension (adds charge_control_end_threshold to the battery d=
evice)
> + */
> +
> +static int charge_control_end_threshold_acpi_set(struct samsung_galaxybo=
ok *galaxybook, u8 value)
> +{
> +=09struct sawb buf =3D {};
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +=09buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +=09buf.guds[0] =3D GB_GUDS_BATTERY_CHARGE_CONTROL;
> +=09buf.guds[1] =3D GB_GUDS_BATTERY_CHARGE_CONTROL_SET;
> +=09buf.guds[2] =3D value;
> +
> +=09return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09      &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static int charge_control_end_threshold_acpi_get(struct samsung_galaxybo=
ok *galaxybook, u8 *value)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +=09buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +=09buf.guds[0] =3D GB_GUDS_BATTERY_CHARGE_CONTROL;
> +=09buf.guds[1] =3D GB_GUDS_BATTERY_CHARGE_CONTROL_GET;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09     &buf, GB_SAWB_LEN_SETTINGS);
> +=09if (err)
> +=09=09return err;
> +
> +=09*value =3D buf.guds[1];
> +
> +=09return 0;
> +}
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev, st=
ruct device_attribute *attr,
> +=09=09=09=09=09=09  const char *buf, size_t count)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of(attr, struct samsung_galaxybook, charge_control_end_t=
hreshold_attr);
> +=09u8 value;
> +=09int err;
> +
> +=09if (!count)
> +=09=09return -EINVAL;
> +
> +=09err =3D kstrtou8(buf, 0, &value);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (value < 1 || value > 100)
> +=09=09return -EINVAL;
> +
> +=09/* device stores "no end threshold" as 0 instead of 100; if setting t=
o 100, send 0 */
> +=09if (value =3D=3D 100)
> +=09=09value =3D 0;
> +
> +=09err =3D charge_control_end_threshold_acpi_set(galaxybook, value);
> +=09if (err)
> +=09=09return err;
> +
> +=09return count;
> +}
> +
> +static ssize_t charge_control_end_threshold_show(struct device *dev, str=
uct device_attribute *attr,
> +=09=09=09=09=09=09 char *buf)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of(attr, struct samsung_galaxybook, charge_control_end_t=
hreshold_attr);
> +=09u8 value;
> +=09int err;
> +
> +=09err =3D charge_control_end_threshold_acpi_get(galaxybook, &value);
> +=09if (err)
> +=09=09return err;
> +
> +=09/* device stores "no end threshold" as 0 instead of 100; if device ha=
s 0, report 100 */
> +=09if (value =3D=3D 0)
> +=09=09value =3D 100;
> +
> +=09return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static int galaxybook_battery_add(struct power_supply *battery, struct a=
cpi_battery_hook *hook)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of(hook, struct samsung_galaxybook, battery_hook);
> +
> +=09return device_create_file(&battery->dev, &galaxybook->charge_control_=
end_threshold_attr);
> +}
> +
> +static int galaxybook_battery_remove(struct power_supply *battery, struc=
t acpi_battery_hook *hook)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of(hook, struct samsung_galaxybook, battery_hook);
> +
> +=09device_remove_file(&battery->dev, &galaxybook->charge_control_end_thr=
eshold_attr);
> +=09return 0;
> +}
> +
> +static int galaxybook_battery_threshold_init(struct samsung_galaxybook *=
galaxybook)
> +{
> +=09struct acpi_battery_hook *hook;
> +=09struct device_attribute *attr;
> +=09u8 value;
> +=09int err;
> +
> +=09err =3D charge_control_end_threshold_acpi_get(galaxybook, &value);
> +=09if (err) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to get initial battery charge end threshold, error %d\n=
", err);
> +=09=09return 0;
> +=09}
> +
> +=09hook =3D &galaxybook->battery_hook;
> +=09hook->add_battery =3D galaxybook_battery_add;
> +=09hook->remove_battery =3D galaxybook_battery_remove;
> +=09hook->name =3D "Samsung Galaxy Book Battery Extension";
> +
> +=09attr =3D &galaxybook->charge_control_end_threshold_attr;
> +=09sysfs_attr_init(&attr->attr);
> +=09attr->attr.name =3D "charge_control_end_threshold";
> +=09attr->attr.mode =3D 0644;
> +=09attr->show =3D charge_control_end_threshold_show;
> +=09attr->store =3D charge_control_end_threshold_store;
> +
> +=09return devm_battery_hook_register(&galaxybook->platform->dev, &galaxy=
book->battery_hook);
> +}
> +
> +/*
> + * Platform Profile / Performance mode
> + */
> +
> +static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybo=
ok,
> +=09=09=09=09     const u8 performance_mode)
> +{
> +=09struct sawb buf =3D {};
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +=09export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +=09buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +=09buf.subn =3D GB_SUBN_PERFORMANCE_MODE_SET;
> +=09buf.iob0 =3D performance_mode;
> +
> +=09return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_=
MODE,
> +=09=09=09=09      &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +}
> +
> +static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybo=
ok, u8 *performance_mode)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +=09export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +=09buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +=09buf.subn =3D GB_SUBN_PERFORMANCE_MODE_GET;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE=
_MODE,
> +=09=09=09=09     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +=09if (err)
> +=09=09return err;
> +
> +=09*performance_mode =3D buf.iob0;
> +
> +=09return 0;
> +}
> +
> +static int get_performance_mode_profile(struct samsung_galaxybook *galax=
ybook,
> +=09=09=09=09=09const u8 performance_mode,
> +=09=09=09=09=09enum platform_profile_option *profile)
> +{
> +=09switch (performance_mode) {
> +=09case GB_PERFORMANCE_MODE_SILENT:
> +=09=09*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +=09=09break;
> +=09case GB_PERFORMANCE_MODE_QUIET:
> +=09=09*profile =3D PLATFORM_PROFILE_QUIET;
> +=09=09break;
> +=09case GB_PERFORMANCE_MODE_OPTIMIZED:
> +=09case GB_PERFORMANCE_MODE_OPTIMIZED_LEGACY:
> +=09=09*profile =3D PLATFORM_PROFILE_BALANCED;
> +=09=09break;
> +=09case GB_PERFORMANCE_MODE_PERFORMANCE:
> +=09case GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY:
> +=09=09/* balanced-performance profile is used for Performance when Ultra=
 is present */
> +=09=09if (test_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +=09=09=09     galaxybook->profile_handler.choices))
> +=09=09=09*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +=09=09else
> +=09=09=09*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +=09=09break;
> +=09case GB_PERFORMANCE_MODE_ULTRA:
> +=09=09*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +=09=09break;
> +=09case GB_PERFORMANCE_MODE_IGNORE1:
> +=09case GB_PERFORMANCE_MODE_IGNORE2:
> +=09=09return -EOPNOTSUPP;
> +=09default:
> +=09=09dev_warn(&galaxybook->platform->dev,
> +=09=09=09 "unrecognized performance mode 0x%x\n", performance_mode);
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int galaxybook_platform_profile_set(struct platform_profile_handl=
er *pprof,
> +=09=09=09=09=09   enum platform_profile_option profile)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of(pprof, struct samsung_galaxybook, profile_handler);
> +
> +=09return performance_mode_acpi_set(galaxybook,
> +=09=09=09=09=09 galaxybook->profile_performance_modes[profile]);
> +}
> +
> +static int galaxybook_platform_profile_get(struct platform_profile_handl=
er *pprof,
> +=09=09=09=09=09   enum platform_profile_option *profile)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09container_of(pprof, struct samsung_galaxybook, profile_handler);
> +=09u8 performance_mode;
> +=09int err;
> +
> +=09err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> +=09if (err)
> +=09=09return err;
> +
> +=09return get_performance_mode_profile(galaxybook, performance_mode, pro=
file);
> +}
> +
> +static int galaxybook_performance_mode_init(struct samsung_galaxybook *g=
alaxybook)
> +{
> +=09enum platform_profile_option profile =3D PLATFORM_PROFILE_LAST;
> +=09u8 performance_mode;
> +=09int err;
> +=09int i;
> +
> +=09err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> +=09if (err)
> +=09=09return err;
> +
> +=09err =3D get_performance_mode_profile(galaxybook, performance_mode, &p=
rofile);
> +=09if (err)
> +=09=09dev_warn(&galaxybook->platform->dev,
> +=09=09=09 "initial startup performance mode 0x%x is not mapped\n",
> +=09=09=09 performance_mode);
> +
> +=09for_each_set_bit(i, galaxybook->profile_handler.choices, PLATFORM_PRO=
FILE_LAST)
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"enabled platform profile %d using performance mode 0x%x\n",
> +=09=09=09i, galaxybook->profile_performance_modes[i]);
> +
> +=09/* ensure that performance_mode at startup matches what should be map=
ped for its profile */
> +=09if (galaxybook->profile_performance_modes[profile] =3D=3D performance=
_mode)
> +=09=09return 0;
> +
> +=09/* otherwise, if balanced is enabled, use it as the default startup p=
rofile */
> +=09if (test_bit(PLATFORM_PROFILE_BALANCED, galaxybook->profile_handler.c=
hoices))
> +=09=09return galaxybook_platform_profile_set(&galaxybook->profile_handle=
r,
> +=09=09=09=09=09=09       PLATFORM_PROFILE_BALANCED);
> +
> +=09/* otherwise, find the first enabled profile and use that instead */
> +=09profile =3D find_next_bit_wrap(galaxybook->profile_handler.choices,
> +=09=09=09=09     PLATFORM_PROFILE_LAST,
> +=09=09=09=09     0);
> +
> +=09if (profile =3D=3D PLATFORM_PROFILE_LAST) {
> +=09=09dev_err(&galaxybook->platform->dev,
> +=09=09=09"no platform profiles have been enabled\n");
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09return galaxybook_platform_profile_set(&galaxybook->profile_handler, =
profile);
> +}
> +
> +#define gb_pfmode(profile) galaxybook->profile_performance_modes[profile=
]
> +
> +static int galaxybook_profile_init(struct samsung_galaxybook *galaxybook=
)
> +{
> +=09enum platform_profile_option profile;
> +=09struct sawb buf =3D {};
> +=09unsigned int i;
> +=09int err;
> +
> +=09/* fetch supported performance mode values from ACPI method */
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_PERFORMANCE_MODE;
> +=09export_guid(buf.caid, &GB_PERFORMANCE_MODE_GUID);
> +=09buf.fncn =3D GB_FNCN_PERFORMANCE_MODE;
> +=09buf.subn =3D GB_SUBN_PERFORMANCE_MODE_LIST;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE=
_MODE,
> +=09=09=09=09     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +=09if (err) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to get supported performance modes, error %d\n", err);
> +=09=09return 0;
> +=09}
> +
> +=09galaxybook->profile_handler.name =3D DRIVER_NAME;
> +=09galaxybook->profile_handler.dev =3D &galaxybook->platform->dev;
> +=09galaxybook->profile_handler.profile_get =3D galaxybook_platform_profi=
le_get;
> +=09galaxybook->profile_handler.profile_set =3D galaxybook_platform_profi=
le_set;
> +
> +=09/* set initial default profile performance mode mappings */
> +=09gb_pfmode(PLATFORM_PROFILE_LOW_POWER) =3D GB_PERFORMANCE_MODE_SILENT;
> +=09gb_pfmode(PLATFORM_PROFILE_QUIET) =3D GB_PERFORMANCE_MODE_QUIET;
> +=09gb_pfmode(PLATFORM_PROFILE_BALANCED) =3D GB_PERFORMANCE_MODE_OPTIMIZE=
D_LEGACY;
> +=09gb_pfmode(PLATFORM_PROFILE_PERFORMANCE) =3D GB_PERFORMANCE_MODE_PERFO=
RMANCE_LEGACY;
> +=09gb_pfmode(PLATFORM_PROFILE_LAST) =3D GB_PERFORMANCE_MODE_INVALID;
> +=09/*
> +=09 * Value returned in iob0 will have the number of supported performan=
ce
> +=09 * modes per device. The performance mode values will then be given a=
s a
> +=09 * list after this (iob1-iobX). Loop through the supported values and
> +=09 * enable their mapped platform_profile choice, overriding "legacy"
> +=09 * values along the way if a non-legacy value exists.
> +=09 */
> +=09for (i =3D 1; i <=3D buf.iob0; i++) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"device supports performance mode 0x%x\n", buf.iob_values[i]);
> +=09=09err =3D get_performance_mode_profile(galaxybook, buf.iob_values[i]=
, &profile);
> +=09=09if (err)
> +=09=09=09continue;
> +=09=09switch (buf.iob_values[i]) {
> +=09=09case GB_PERFORMANCE_MODE_OPTIMIZED:
> +=09=09=09/* override legacy Optimized value */
> +=09=09=09gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_OPTIMIZED;
> +=09=09=09break;
> +=09=09case GB_PERFORMANCE_MODE_PERFORMANCE:
> +=09=09=09/* override legacy Performance value */
> +=09=09=09gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_PERFORMANCE;
> +=09=09=09break;
> +=09=09case GB_PERFORMANCE_MODE_ULTRA:
> +=09=09=09/* if Ultra is supported, downgrade performance to balanced-per=
formance */
> +=09=09=09if (test_bit(PLATFORM_PROFILE_PERFORMANCE,
> +=09=09=09=09     galaxybook->profile_handler.choices)) {
> +=09=09=09=09gb_pfmode(PLATFORM_PROFILE_BALANCED_PERFORMANCE) =3D
> +=09=09=09=09=09gb_pfmode(PLATFORM_PROFILE_PERFORMANCE);
> +=09=09=09=09set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +=09=09=09=09=09galaxybook->profile_handler.choices);
> +=09=09=09}
> +=09=09=09/* override performance profile to use Ultra's value */
> +=09=09=09gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_ULTRA;
> +=09=09=09break;
> +=09=09default:
> +=09=09=09break;
> +=09=09}
> +=09=09set_bit(profile, galaxybook->profile_handler.choices);
> +=09}
> +
> +=09err =3D galaxybook_performance_mode_init(galaxybook);
> +=09if (err) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to initialize performance mode, error %d\n", err);
> +=09=09return 0;
> +=09}
> +
> +=09err =3D devm_platform_profile_register(&galaxybook->profile_handler);
> +=09if (err)
> +=09=09return err;

As you might already know, I've in the meantime merged the Kurt's big
platform_profile series so these need to the be rebased on top of that.

--=20
 i.

> +=09galaxybook->has_performance_mode =3D true;
> +
> +=09return 0;
> +}
> +
> +/*
> + * Firmware Attributes
> + */
> +
> +/* Power on lid open (device should power on when lid is opened) */
> +
> +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxyb=
ook, const bool value)
> +{
> +=09struct sawb buf =3D {};
> +
> +=09lockdep_assert_held(&galaxybook->fw_attr_lock);
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +=09buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +=09buf.guds[0] =3D GB_GUDS_POWER_ON_LID_OPEN;
> +=09buf.guds[1] =3D GB_GUDS_POWER_ON_LID_OPEN_SET;
> +=09buf.guds[2] =3D value ? 1 : 0;
> +
> +=09return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09      &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxyb=
ook, bool *value)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_POWER_MANAGEMENT;
> +=09buf.gunm =3D GB_GUNM_POWER_MANAGEMENT;
> +=09buf.guds[0] =3D GB_GUDS_POWER_ON_LID_OPEN;
> +=09buf.guds[1] =3D GB_GUDS_POWER_ON_LID_OPEN_GET;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09     &buf, GB_SAWB_LEN_SETTINGS);
> +=09if (err)
> +=09=09return err;
> +
> +=09*value =3D buf.guds[1];
> +
> +=09return 0;
> +}
> +
> +/* USB Charging (USB ports can charge other devices even when device is =
powered off) */
> +
> +static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook, =
const bool value)
> +{
> +=09struct sawb buf =3D {};
> +
> +=09lockdep_assert_held(&galaxybook->fw_attr_lock);
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_USB_CHARGING_SET;
> +=09buf.gunm =3D value ? GB_GUNM_USB_CHARGING_ON : GB_GUNM_USB_CHARGING_O=
FF;
> +
> +=09return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09      &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, =
bool *value)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_USB_CHARGING_GET;
> +=09buf.gunm =3D GB_GUNM_USB_CHARGING_GET;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09     &buf, GB_SAWB_LEN_SETTINGS);
> +=09if (err)
> +=09=09return err;
> +
> +=09*value =3D buf.gunm =3D=3D 1;
> +
> +=09return 0;
> +}
> +
> +/* Block recording (blocks access to camera and microphone) */
> +
> +static int block_recording_acpi_set(struct samsung_galaxybook *galaxyboo=
k, const bool value)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09lockdep_assert_held(&galaxybook->fw_attr_lock);
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_BLOCK_RECORDING;
> +=09buf.gunm =3D GB_GUNM_SET;
> +=09buf.guds[0] =3D value ? GB_BLOCK_RECORDING_ON : GB_BLOCK_RECORDING_OF=
F;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09     &buf, GB_SAWB_LEN_SETTINGS);
> +=09if (err)
> +=09=09return err;
> +
> +=09input_report_switch(galaxybook->camera_lens_cover_switch,
> +=09=09=09    SW_CAMERA_LENS_COVER, value ? 1 : 0);
> +=09input_sync(galaxybook->camera_lens_cover_switch);
> +
> +=09return 0;
> +}
> +
> +static int block_recording_acpi_get(struct samsung_galaxybook *galaxyboo=
k, bool *value)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_BLOCK_RECORDING;
> +=09buf.gunm =3D GB_GUNM_GET;
> +
> +=09err =3D galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09     &buf, GB_SAWB_LEN_SETTINGS);
> +=09if (err)
> +=09=09return err;
> +
> +=09*value =3D buf.gunm =3D=3D GB_BLOCK_RECORDING_ON;
> +
> +=09return 0;
> +}
> +
> +static int galaxybook_block_recording_init(struct samsung_galaxybook *ga=
laxybook)
> +{
> +=09bool value;
> +=09int err;
> +
> +=09err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_BLOCK_RECO=
RDING);
> +=09if (err) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to initialize block_recording, error %d\n", err);
> +=09=09return 0;
> +=09}
> +
> +=09guard(mutex)(&galaxybook->fw_attr_lock);
> +
> +=09err =3D block_recording_acpi_get(galaxybook, &value);
> +=09if (err) {
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to get initial block_recording state, error %d\n", err)=
;
> +=09=09return 0;
> +=09}
> +
> +=09galaxybook->camera_lens_cover_switch =3D
> +=09=09devm_input_allocate_device(&galaxybook->platform->dev);
> +=09if (!galaxybook->camera_lens_cover_switch)
> +=09=09return -ENOMEM;
> +
> +=09galaxybook->camera_lens_cover_switch->name =3D "Samsung Galaxy Book C=
amera Lens Cover";
> +=09galaxybook->camera_lens_cover_switch->phys =3D DRIVER_NAME "/input0";
> +=09galaxybook->camera_lens_cover_switch->id.bustype =3D BUS_HOST;
> +
> +=09input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_=
CAMERA_LENS_COVER);
> +
> +=09err =3D input_register_device(galaxybook->camera_lens_cover_switch);
> +=09if (err)
> +=09=09return err;
> +
> +=09input_report_switch(galaxybook->camera_lens_cover_switch,
> +=09=09=09    SW_CAMERA_LENS_COVER, value ? 1 : 0);
> +=09input_sync(galaxybook->camera_lens_cover_switch);
> +
> +=09galaxybook->has_block_recording =3D true;
> +
> +=09return 0;
> +}
> +
> +/* Firmware Attributes setup */
> +
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *at=
tr, char *buf)
> +{
> +=09return sysfs_emit(buf, "enumeration\n");
> +}
> +
> +static struct kobj_attribute fw_attr_type =3D __ATTR_RO(type);
> +
> +static ssize_t default_value_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buf)
> +{
> +=09return sysfs_emit(buf, "0\n");
> +}
> +
> +static struct kobj_attribute fw_attr_default_value =3D __ATTR_RO(default=
_value);
> +
> +static ssize_t possible_values_show(struct kobject *kobj, struct kobj_at=
tribute *attr, char *buf)
> +{
> +=09return sysfs_emit(buf, "0;1\n");
> +}
> +
> +static struct kobj_attribute fw_attr_possible_values =3D __ATTR_RO(possi=
ble_values);
> +
> +static ssize_t display_name_language_code_show(struct kobject *kobj, str=
uct kobj_attribute *attr,
> +=09=09=09=09=09       char *buf)
> +{
> +=09return sysfs_emit(buf, "%s\n", GB_ATTR_LANGUAGE_CODE);
> +}
> +
> +static struct kobj_attribute fw_attr_display_name_language_code =3D
> +=09__ATTR_RO(display_name_language_code);
> +
> +static ssize_t display_name_show(struct kobject *kobj, struct kobj_attri=
bute *attr, char *buf)
> +{
> +=09struct galaxybook_fw_attr *fw_attr =3D
> +=09=09container_of(attr, struct galaxybook_fw_attr, display_name);
> +
> +=09return sysfs_emit(buf, "%s\n", galaxybook_fw_attr_desc[fw_attr->fw_at=
tr_id]);
> +}
> +
> +static ssize_t current_value_store(struct kobject *kobj, struct kobj_att=
ribute *attr,
> +=09=09=09=09   const char *buf, size_t count)
> +{
> +=09struct galaxybook_fw_attr *fw_attr =3D
> +=09=09container_of(attr, struct galaxybook_fw_attr, current_value);
> +=09struct samsung_galaxybook *galaxybook =3D fw_attr->galaxybook;
> +=09bool value;
> +=09int err;
> +
> +=09if (!count)
> +=09=09return -EINVAL;
> +
> +=09err =3D kstrtobool(buf, &value);
> +=09if (err)
> +=09=09return err;
> +
> +=09guard(mutex)(&galaxybook->fw_attr_lock);
> +
> +=09err =3D fw_attr->set_value(galaxybook, value);
> +=09if (err)
> +=09=09return err;
> +
> +=09return count;
> +}
> +
> +static ssize_t current_value_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buf)
> +{
> +=09struct galaxybook_fw_attr *fw_attr =3D
> +=09=09container_of(attr, struct galaxybook_fw_attr, current_value);
> +=09bool value;
> +=09int err;
> +
> +=09err =3D fw_attr->get_value(fw_attr->galaxybook, &value);
> +=09if (err)
> +=09=09return err;
> +
> +=09return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static void galaxybook_fw_attr_remove(void *data)
> +{
> +=09struct galaxybook_fw_attr *fw_attr =3D data;
> +=09struct samsung_galaxybook *galaxybook =3D fw_attr->galaxybook;
> +
> +=09sysfs_remove_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr->attr_g=
roup);
> +}
> +
> +#define NUM_FW_ATTR_ENUM_ATTRS  6
> +
> +static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook=
,
> +=09=09=09=09   const enum galaxybook_fw_attr_id fw_attr_id,
> +=09=09=09=09   int (*get_value)(struct samsung_galaxybook *galaxybook,
> +=09=09=09=09=09=09    bool *value),
> +=09=09=09=09   int (*set_value)(struct samsung_galaxybook *galaxybook,
> +=09=09=09=09=09=09    const bool value))
> +{
> +=09struct galaxybook_fw_attr *fw_attr;
> +=09struct attribute **attrs;
> +=09int err;
> +
> +=09fw_attr =3D devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr)=
, GFP_KERNEL);
> +=09if (!fw_attr)
> +=09=09return -ENOMEM;
> +
> +=09attrs =3D devm_kcalloc(&galaxybook->platform->dev, NUM_FW_ATTR_ENUM_A=
TTRS + 1,
> +=09=09=09     sizeof(*attrs), GFP_KERNEL);
> +=09if (!attrs)
> +=09=09return -ENOMEM;
> +
> +=09attrs[0] =3D &fw_attr_type.attr;
> +=09attrs[1] =3D &fw_attr_default_value.attr;
> +=09attrs[2] =3D &fw_attr_possible_values.attr;
> +=09attrs[3] =3D &fw_attr_display_name_language_code.attr;
> +
> +=09sysfs_attr_init(&fw_attr.display_name);
> +=09fw_attr->display_name.attr.name =3D "display_name";
> +=09fw_attr->display_name.attr.mode =3D 0444;
> +=09fw_attr->display_name.show =3D display_name_show;
> +=09attrs[4] =3D &fw_attr->display_name.attr;
> +
> +=09sysfs_attr_init(&fw_attr.current_value);
> +=09fw_attr->current_value.attr.name =3D "current_value";
> +=09fw_attr->current_value.attr.mode =3D 0644;
> +=09fw_attr->current_value.show =3D current_value_show;
> +=09fw_attr->current_value.store =3D current_value_store;
> +=09attrs[5] =3D &fw_attr->current_value.attr;
> +
> +=09attrs[6] =3D NULL;
> +
> +=09fw_attr->galaxybook =3D galaxybook;
> +=09fw_attr->fw_attr_id =3D fw_attr_id;
> +=09fw_attr->attr_group.name =3D galaxybook_fw_attr_name[fw_attr_id];
> +=09fw_attr->attr_group.attrs =3D attrs;
> +=09fw_attr->get_value =3D get_value;
> +=09fw_attr->set_value =3D set_value;
> +
> +=09err =3D sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr=
->attr_group);
> +=09if (err)
> +=09=09return err;
> +
> +=09return devm_add_action_or_reset(&galaxybook->platform->dev,
> +=09=09=09=09=09galaxybook_fw_attr_remove, fw_attr);
> +}
> +
> +static void galaxybook_kset_unregister(void *data)
> +{
> +=09struct kset *kset =3D data;
> +
> +=09kset_unregister(kset);
> +}
> +
> +static void galaxybook_fw_attrs_dev_unregister(void *data)
> +{
> +=09struct device *fw_attrs_dev =3D data;
> +
> +=09device_unregister(fw_attrs_dev);
> +=09fw_attributes_class_put();
> +}
> +
> +static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxyboo=
k)
> +{
> +=09bool value;
> +=09int err;
> +
> +=09err =3D devm_mutex_init(&galaxybook->platform->dev, &galaxybook->fw_a=
ttr_lock);
> +=09if (err)
> +=09=09return err;
> +
> +=09err =3D fw_attributes_class_get(&galaxybook->fw_attrs_class);
> +=09if (err)
> +=09=09return err;
> +
> +=09galaxybook->fw_attrs_dev =3D device_create(galaxybook->fw_attrs_class=
, NULL, MKDEV(0, 0),
> +=09=09=09=09=09=09 NULL, "%s", DRIVER_NAME);
> +=09if (IS_ERR(galaxybook->fw_attrs_dev)) {
> +=09=09fw_attributes_class_put();
> +=09=09err =3D PTR_ERR(galaxybook->fw_attrs_dev);
> +=09=09return err;
> +=09}
> +=09err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +=09=09=09=09       galaxybook_fw_attrs_dev_unregister,
> +=09=09=09=09       galaxybook->fw_attrs_dev);
> +=09if (err)
> +=09=09return err;
> +
> +=09galaxybook->fw_attrs_kset =3D kset_create_and_add("attributes", NULL,
> +=09=09=09=09=09=09=09&galaxybook->fw_attrs_dev->kobj);
> +=09if (!galaxybook->fw_attrs_kset)
> +=09=09return -ENOMEM;
> +=09err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +=09=09=09=09       galaxybook_kset_unregister, galaxybook->fw_attrs_kset=
);
> +=09if (err)
> +=09=09return err;
> +
> +=09err =3D power_on_lid_open_acpi_get(galaxybook, &value);
> +=09if (!err) {
> +=09=09err =3D galaxybook_fw_attr_init(galaxybook,
> +=09=09=09=09=09      GB_ATTR_POWER_ON_LID_OPEN,
> +=09=09=09=09=09      &power_on_lid_open_acpi_get,
> +=09=09=09=09=09      &power_on_lid_open_acpi_set);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +
> +=09err =3D usb_charging_acpi_get(galaxybook, &value);
> +=09if (!err) {
> +=09=09err =3D galaxybook_fw_attr_init(galaxybook,
> +=09=09=09=09=09      GB_ATTR_USB_CHARGING,
> +=09=09=09=09=09      &usb_charging_acpi_get,
> +=09=09=09=09=09      &usb_charging_acpi_set);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +
> +=09/* block_recording requires an additional init before it can be used =
*/
> +=09err =3D galaxybook_block_recording_init(galaxybook);
> +=09if (err)
> +=09=09return err;
> +=09if (!galaxybook->has_block_recording)
> +=09=09return 0;
> +
> +=09err =3D block_recording_acpi_get(galaxybook, &value);
> +=09if (err) {
> +=09=09galaxybook->has_block_recording =3D false;
> +=09=09return 0;
> +=09}
> +
> +=09return galaxybook_fw_attr_init(galaxybook,
> +=09=09=09=09       GB_ATTR_BLOCK_RECORDING,
> +=09=09=09=09       &block_recording_acpi_get,
> +=09=09=09=09       &block_recording_acpi_set);
> +}
> +
> +/*
> + * Hotkeys and notifications
> + */
> +
> +static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *wor=
k)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09from_work(galaxybook, work, kbd_backlight_hotkey_work);
> +=09int brightness;
> +=09int err;
> +
> +=09guard(mutex)(&galaxybook->kbd_backlight_lock);
> +
> +=09brightness =3D galaxybook->kbd_backlight.brightness;
> +=09if (brightness < galaxybook->kbd_backlight.max_brightness)
> +=09=09brightness++;
> +=09else
> +=09=09brightness =3D 0;
> +
> +=09err =3D led_set_brightness_sync(&galaxybook->kbd_backlight, brightnes=
s);
> +=09if (err) {
> +=09=09dev_err(&galaxybook->platform->dev,
> +=09=09=09"failed to set kbd_backlight brightness, error %d\n", err);
> +=09=09return;
> +=09}
> +
> +=09led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backlight,=
 brightness);
> +}
> +
> +static void galaxybook_block_recording_hotkey_work(struct work_struct *w=
ork)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D
> +=09=09from_work(galaxybook, work, block_recording_hotkey_work);
> +=09bool value;
> +=09int err;
> +
> +=09guard(mutex)(&galaxybook->fw_attr_lock);
> +
> +=09err =3D block_recording_acpi_get(galaxybook, &value);
> +=09if (err) {
> +=09=09dev_err(&galaxybook->platform->dev,
> +=09=09=09"failed to get block_recording, error %d\n", err);
> +=09=09return;
> +=09}
> +
> +=09err =3D block_recording_acpi_set(galaxybook, !value);
> +=09if (err)
> +=09=09dev_err(&galaxybook->platform->dev,
> +=09=09=09"failed to set block_recording, error %d\n", err);
> +}
> +
> +static bool galaxybook_i8042_filter(unsigned char data, unsigned char st=
r, struct serio *port)
> +{
> +=09static bool extended;
> +
> +=09if (str & I8042_STR_AUXDATA)
> +=09=09return false;
> +
> +=09if (data =3D=3D 0xe0) {
> +=09=09extended =3D true;
> +=09=09return true;
> +=09} else if (extended) {
> +=09=09extended =3D false;
> +=09=09switch (data) {
> +=09=09case GB_KEY_KBD_BACKLIGHT_KEYDOWN:
> +=09=09=09return true;
> +=09=09case GB_KEY_KBD_BACKLIGHT_KEYUP:
> +=09=09=09if (galaxybook_ptr->has_kbd_backlight)
> +=09=09=09=09schedule_work(&galaxybook_ptr->kbd_backlight_hotkey_work);
> +=09=09=09return true;
> +
> +=09=09case GB_KEY_BLOCK_RECORDING_KEYDOWN:
> +=09=09=09return true;
> +=09=09case GB_KEY_BLOCK_RECORDING_KEYUP:
> +=09=09=09if (galaxybook_ptr->has_block_recording)
> +=09=09=09=09schedule_work(&galaxybook_ptr->block_recording_hotkey_work);
> +=09=09=09return true;
> +
> +=09=09/* battery notification already sent to battery and ACPI device; i=
gnore */
> +=09=09case GB_KEY_BATTERY_NOTIFY_KEYUP:
> +=09=09case GB_KEY_BATTERY_NOTIFY_KEYDOWN:
> +=09=09=09return true;
> +
> +=09=09default:
> +=09=09=09/*
> +=09=09=09 * Report the previously filtered e0 before continuing
> +=09=09=09 * with the next non-filtered byte.
> +=09=09=09 */
> +=09=09=09serio_interrupt(port, 0xe0, 0);
> +=09=09=09return false;
> +=09=09}
> +=09}
> +
> +=09return false;
> +}
> +
> +static void galaxybook_i8042_filter_remove(void *data)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D data;
> +
> +=09i8042_remove_filter(galaxybook_i8042_filter);
> +=09cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
> +=09cancel_work_sync(&galaxybook->block_recording_hotkey_work);
> +
> +=09if (galaxybook_ptr)
> +=09=09galaxybook_ptr =3D NULL;
> +}
> +
> +static int galaxybook_i8042_filter_install(struct samsung_galaxybook *ga=
laxybook)
> +{
> +=09int err;
> +
> +=09/* global pointer is currently needed for i8042 filter */
> +=09if (galaxybook_ptr)
> +=09=09return -EBUSY;
> +=09galaxybook_ptr =3D galaxybook;
> +
> +=09if (!galaxybook->has_kbd_backlight && !galaxybook->has_block_recordin=
g)
> +=09=09return 0;
> +
> +=09INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
> +=09=09  galaxybook_kbd_backlight_hotkey_work);
> +=09INIT_WORK(&galaxybook->block_recording_hotkey_work,
> +=09=09  galaxybook_block_recording_hotkey_work);
> +
> +=09err =3D i8042_install_filter(galaxybook_i8042_filter);
> +=09if (err)
> +=09=09return err;
> +
> +=09return devm_add_action_or_reset(&galaxybook->platform->dev,
> +=09=09=09=09=09galaxybook_i8042_filter_remove, galaxybook);
> +}
> +
> +/*
> + * ACPI device setup
> + */
> +
> +static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *=
data)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D data;
> +
> +=09switch (event) {
> +=09case GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED:
> +=09case GB_ACPI_NOTIFY_DEVICE_ON_TABLE:
> +=09case GB_ACPI_NOTIFY_DEVICE_OFF_TABLE:
> +=09=09break;
> +=09case GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE:
> +=09=09if (galaxybook->has_performance_mode)
> +=09=09=09platform_profile_cycle();
> +=09=09break;
> +=09default:
> +=09=09dev_warn(&galaxybook->platform->dev,
> +=09=09=09 "unknown ACPI notification event: 0x%x\n", event);
> +=09}
> +
> +=09acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(&galaxybook->pl=
atform->dev),
> +=09=09=09=09=09event, 1);
> +}
> +
> +static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *gala=
xybook)
> +{
> +=09struct sawb buf =3D {};
> +=09int err;
> +
> +=09err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_NOTIFICATI=
ONS);
> +=09if (err)
> +=09=09return err;
> +
> +=09buf.safn =3D GB_SAFN;
> +=09buf.sasb =3D GB_SASB_NOTIFICATIONS;
> +=09buf.gunm =3D GB_GUNM_ACPI_NOTIFY_ENABLE;
> +=09buf.guds[0] =3D GB_GUDS_ACPI_NOTIFY_ENABLE;
> +
> +=09return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> +=09=09=09=09      &buf, GB_SAWB_LEN_SETTINGS);
> +}
> +
> +static void galaxybook_acpi_remove_notify_handler(void *data)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D data;
> +
> +=09acpi_remove_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
> +=09=09=09=09   galaxybook_acpi_notify);
> +}
> +
> +static void galaxybook_acpi_disable(void *data)
> +{
> +=09struct samsung_galaxybook *galaxybook =3D data;
> +
> +=09acpi_execute_simple_method(galaxybook->acpi->handle,
> +=09=09=09=09   GB_ACPI_METHOD_ENABLE, GB_ACPI_METHOD_ENABLE_OFF);
> +}
> +
> +static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
> +{
> +=09acpi_status status;
> +=09int err;
> +
> +=09status =3D acpi_execute_simple_method(galaxybook->acpi->handle, GB_AC=
PI_METHOD_ENABLE,
> +=09=09=09=09=09    GB_ACPI_METHOD_ENABLE_ON);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +=09err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +=09=09=09=09       galaxybook_acpi_disable, galaxybook);
> +=09if (err)
> +=09=09return err;
> +
> +=09status =3D acpi_install_notify_handler(galaxybook->acpi->handle, ACPI=
_ALL_NOTIFY,
> +=09=09=09=09=09     galaxybook_acpi_notify, galaxybook);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +=09err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +=09=09=09=09       galaxybook_acpi_remove_notify_handler, galaxybook);
> +=09if (err)
> +=09=09return err;
> +
> +=09err =3D galaxybook_enable_acpi_notify(galaxybook);
> +=09if (err)
> +=09=09dev_dbg(&galaxybook->platform->dev, "failed to enable ACPI notific=
ations; "
> +=09=09=09"some hotkeys will not be supported\n");
> +
> +=09err =3D galaxybook_enable_acpi_feature(galaxybook, GB_SASB_POWER_MANA=
GEMENT);
> +=09if (err)
> +=09=09dev_dbg(&galaxybook->platform->dev,
> +=09=09=09"failed to initialize ACPI power management features; "
> +=09=09=09"many features of this driver will not be available\n");
> +
> +=09return 0;
> +}
> +
> +/*
> + * Platform driver
> + */
> +
> +static int galaxybook_probe(struct platform_device *pdev)
> +{
> +=09struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
> +=09struct samsung_galaxybook *galaxybook;
> +=09int err;
> +
> +=09if (!adev)
> +=09=09return -ENODEV;
> +
> +=09galaxybook =3D devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_KERN=
EL);
> +=09if (!galaxybook)
> +=09=09return -ENOMEM;
> +
> +=09galaxybook->platform =3D pdev;
> +=09galaxybook->acpi =3D adev;
> +=09galaxybook->has_kbd_backlight =3D false;
> +=09galaxybook->has_block_recording =3D false;
> +=09galaxybook->has_performance_mode =3D false;
> +
> +=09err =3D galaxybook_acpi_init(galaxybook);
> +=09if (err)
> +=09=09return dev_err_probe(&galaxybook->platform->dev, err,
> +=09=09=09=09     "failed to initialize ACPI device\n");
> +
> +=09err =3D galaxybook_profile_init(galaxybook);
> +=09if (err)
> +=09=09return dev_err_probe(&galaxybook->platform->dev, err,
> +=09=09=09=09     "failed to initialize platform profile\n");
> +
> +=09err =3D galaxybook_battery_threshold_init(galaxybook);
> +=09if (err)
> +=09=09return dev_err_probe(&galaxybook->platform->dev, err,
> +=09=09=09=09     "failed to initialize battery threshold\n");
> +
> +=09err =3D galaxybook_kbd_backlight_init(galaxybook);
> +=09if (err)
> +=09=09return dev_err_probe(&galaxybook->platform->dev, err,
> +=09=09=09=09     "failed to initialize kbd_backlight\n");
> +
> +=09err =3D galaxybook_fw_attrs_init(galaxybook);
> +=09if (err)
> +=09=09return dev_err_probe(&galaxybook->platform->dev, err,
> +=09=09=09=09     "failed to initialize firmware-attributes\n");
> +
> +=09err =3D galaxybook_i8042_filter_install(galaxybook);
> +=09if (err)
> +=09=09return dev_err_probe(&galaxybook->platform->dev, err,
> +=09=09=09=09     "failed to initialize i8042_filter\n");
> +
> +=09return 0;
> +}
> +
> +static const struct acpi_device_id galaxybook_device_ids[] =3D {
> +=09{ "SAM0427" },
> +=09{ "SAM0428" },
> +=09{ "SAM0429" },
> +=09{ "SAM0430" },
> +=09{}
> +};
> +MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
> +
> +static struct platform_driver galaxybook_platform_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D DRIVER_NAME,
> +=09=09.acpi_match_table =3D galaxybook_device_ids,
> +=09},
> +=09.probe =3D galaxybook_probe,
> +};
> +module_platform_driver(galaxybook_platform_driver);
> +
> +MODULE_AUTHOR("Joshua Grisham <josh@joshuagrisham.com>");
> +MODULE_DESCRIPTION("Samsung Galaxy Book driver");
> +MODULE_LICENSE("GPL");
--8323328-1492781381-1737135192=:932--

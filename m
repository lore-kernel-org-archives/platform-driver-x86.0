Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C8919DFAB;
	Mon, 30 Dec 2024 17:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735581050; cv=none; b=Tu70QomzjUcYDaBNfmNMh9K34jCpR4qMExoDQqyTjgNRfIVcnAuHdL68ftlt2V/HThZtElNbRUJsiO1/yyfZDtOg8CKLQDUzWuQB+WoiHvogvmrLasp632AwI9LjzZF/UrcR3ScLB1HoXdaLSUeksqRyxr7vATrM2OIKYDgmq88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735581050; c=relaxed/simple;
	bh=6KjkXzNQjDpX5wKrdr2oMA+2mC6o6/wUASAnCep0+v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jpOwbhIrE+QtGmyReKc07AQOUXM4ML6VPgBetRkBfa30wQlk2z0graLvHSxNCJHpEFhO/YfwKwDgUeyngaRi8MfCwq51f+ONqr4TDBdQKFtNEu3uZy57ymmOhC6YOoxpygjF28128tRiKFHaGa5t6nusqVramdo5TidcYAjf1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ547Nt3; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ547Nt3"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c4d855fafso1440781241.2;
        Mon, 30 Dec 2024 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735581046; x=1736185846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0rBoL1j/7REfKu/GewwbnRmIlSF/qlQIIf9fxNnOv/A=;
        b=fJ547Nt3Y+SBLm43k5NM5kdrMF54J0QwdmTJxpXSpWW5FieEqruxY+TOykAisoA8ZB
         POLE37oxyGIJvMAMPxr7Nv+yrZLTUNRAOrpEp1Iz2GgWMJ/Z/Ped0sdog0EMQUoRGQoq
         dGUbSFn4vt7dXd6aOsymb8u7uYYpK0tvtFyCgjNJ+15CYJ1EfChJCV0DxacURrT2kENq
         YolIq414ybdmLsKgZS1Ixhy5TzfdPCUNy1IitXe1xO4wuXGBE7Fqw0S+mBdf/0UFyhDL
         cYV0lkjHNOQUvgQJpthbfssJkin1foJ6GAmKbL0ePczLBvB7b2Qh2zPaxmZHm6v4s4AG
         bCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735581046; x=1736185846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rBoL1j/7REfKu/GewwbnRmIlSF/qlQIIf9fxNnOv/A=;
        b=wRi9dUf25v3yijtVlhgOLI+ATqPlFSTUUDpungPc4Xw8uo++RO1A8+sycQ5FHHm/Oi
         HHIKP1NKp2t9X/KSCtpKEhMtwq7K+NY1oCmF/3iNzpSZmowAH7ftYH5399hxq3YsRhxF
         SZxFdMtUP+Xjz/7Wh8IUAGxqfWzW9PVFIJXch51TnuqJXjcBstzklqYgGygmzbztffl0
         nfSiYHqoNk3b46iliLtZiINRF2YIwVofqOXb7FFNRncn3H0Q7NWSO8XChmdeN2CKDdmm
         2u/m16onFJx4/bYtkrY1drK/1QZzO7NMuvWHSMTeBB4pUjkZwK340kkVPwe0aFmUAolp
         g+qw==
X-Forwarded-Encrypted: i=1; AJvYcCU7oYnPqHSpsQlsfdhTBzp8Xjb8lLdrQaKwnQ+g/4fVsomYE40zqeU+Aiu9r8HBwW3QPdDZKJ/oiqlrRqYiEKSeVw032g==@vger.kernel.org, AJvYcCUeqCeS5OLqn+uEY5jbfGAkTkor4BSICgTt3U9BrY8dzL9I3fRvJTs8VhXqxvEGod++FRxWiFAcqQo=@vger.kernel.org, AJvYcCXyNTXkAu8IUHt0ANTIoNEauTYSA+3WdXvpwqUUPxD1SqJ7Jr8Ey0K+MROvogQHaCPiQnLGo0KBZV48E+jc@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJisvXtBLswRcV6YRSGumRbQX2+ax7s1OCzWvS/b6cyrIO0mo
	8xnwTnGX4209HcKfxnd+A6RbNPmEa1EkRBI/f/kycb5xhhaSpsxu
X-Gm-Gg: ASbGnctYxT41tAiEMqfrw8snpjz+GH26mkf9ovLpoBBFBhDT+bUuKzv4gxsycNtdxND
	E8jUxYcVlDSc90FEOVYVD7ccVT1/BXe74NQFqQyrjUX7Tm3J4iMMti9NLJNoDXOk3j/VXrWRMu8
	8jwraXB1Bv93cLGMqTSyzjQoM0wMEOkCO+chvHbInfuo4TlaVJppJLNLLt8lNhNT1ISKj5hhS6s
	saGOSNU8cFLE4yv9fe/EsLEZaapJM0t66hiRMO1TzYuCUV9ooFtVw==
X-Google-Smtp-Source: AGHT+IE4kJS1iXFIYx7+11IFomCkxK81W1Van0DbG9JAtdqqZdMlYGFklCy4Yyuw92copGjd2dU+Yw==
X-Received: by 2002:a05:6102:1493:b0:4af:ea3b:7b41 with SMTP id ada2fe7eead31-4b2cc31c0dcmr27736818137.6.1735581045668;
        Mon, 30 Dec 2024 09:50:45 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad57f59sm4095865241.30.2024.12.30.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 09:50:44 -0800 (PST)
Date: Mon, 30 Dec 2024 12:50:41 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, W_Armin@gmx.de, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <mvp4rhnpzjdfyacuzczg2y5vms7hnarxxwbnk3pbtfx3mg3mrm@vzceo5cfjfl6>
References: <20241226153031.49457-1-josh@joshuagrisham.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241226153031.49457-1-josh@joshuagrisham.com>

On Thu, Dec 26, 2024 at 04:30:22PM +0100, Joshua Grisham wrote:
> Adds a new driver for Samsung Galaxy Book series notebook devices with the
> following features:
> 
> - Keyboard backlight control
> - Battery extension with charge control end threshold
> - Controller for Samsung's performance modes using the platform profile
>   interface
> - Adds firmware-attributes to control various system features
> - Handles various hotkeys and notifications

Hi Joshua!

A couple of comments:

> 
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
> ---
> 
> v1->v2:
> - Attempt to resolve all review comments from v1 as written here:
> https://lore.kernel.org/platform-driver-x86/53c5075b-1967-45d0-937f-463912dd966d@gmx.de/T/#mbcbd8d5d9bc4496bac5486636c7d3b32bc3e5cd0
> 
> v2->v3:
> - Tweak to battery attribute to closer match pattern in dell-wmi-ddv
> - implement platform_profile_remove() change from
>   9b3bb37b44a317626464e79da8b39989b421963f
> - Small tweak to Documentation page
> 
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
> - Add swtich input event for camera_lens_cover remove all others (they will
>   be generated as ACPI netlink events instead)
> - Various other small tweaks and features as requested from feedback
> ---
>  .../testing/sysfs-class-firmware-attributes   |   28 +
>  Documentation/admin-guide/laptops/index.rst   |    1 +
>  .../laptops/samsung-galaxybook.rst            |  165 ++
>  MAINTAINERS                                   |    7 +
>  drivers/platform/x86/Kconfig                  |   18 +
>  drivers/platform/x86/Makefile                 |    5 +-
>  drivers/platform/x86/samsung-galaxybook.c     | 1493 +++++++++++++++++
>  7 files changed, 1715 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/admin-guide/laptops/samsung-galaxybook.rst
>  create mode 100644 drivers/platform/x86/samsung-galaxybook.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 2713efa509b4..dd36577b68f2 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -326,6 +326,17 @@ Description:
>  					This role is specific to Secure Platform Management (SPM) attribute.
>  					It requires configuring an endorsement (kek) and signing certificate (sk).
>  
> +What:		/sys/class/firmware-attributes/*/attributes/camera_lens_cover
> +Date:		December 2024
> +KernelVersion:	6.13
> +Contact:	Joshua Grisham <josh@joshuagrisham.com>
> +Description:
> +		This attribute can be used to control the behavior of a software-based camera lens
> +		cover. The value is a boolean represented by 0 for false (camera is not blocked)
> +		and 1 for true (camera is blocked).
> +
> +		On Samsung Galaxy Book systems, this attribute will also control a software-based
> +		"cover" of the microphone in addition to the camera.
>  
>  What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
>  Date:		February 2021
> @@ -356,6 +367,14 @@ Description:
>  		Drivers may emit a CHANGE uevent when this value changes and userspace
>  		may check it again.
>  
> +What:		/sys/class/firmware-attributes/*/attributes/power_on_lid_open
> +Date:		December 2024
> +KernelVersion:	6.13
> +Contact:	Joshua Grisham <josh@joshuagrisham.com>
> +Description:
> +		This attribute can be used to control powering on a device when the lid is opened.
> +		The value is a boolean represented by 0 for false and 1 for true.
> +
>  What:		/sys/class/firmware-attributes/*/attributes/reset_bios
>  Date:		February 2021
>  KernelVersion:	5.11
> @@ -429,6 +448,15 @@ Description:
>  		HP specific class extensions - Secure Platform Manager (SPM)
>  		--------------------------------
>  
> +What:		/sys/class/firmware-attributes/*/attributes/usb_charging
> +Date:		December 2024
> +KernelVersion:	6.13
> +Contact:	Joshua Grisham <josh@joshuagrisham.com>
> +Description:
> +		This attribute can be used to control if USB ports can continue to deliver power to
> +		connected devices when the device is powered off or in a low sleep state. The value
> +		is a boolean represented by 0 for false and 1 for true.
> +
>  What:		/sys/class/firmware-attributes/*/authentication/SPM/kek
>  Date:		March 2023
>  KernelVersion:	5.18
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
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
> diff --git a/Documentation/admin-guide/laptops/samsung-galaxybook.rst b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
> new file mode 100644
> index 000000000000..65da7cd84c01
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
> @@ -0,0 +1,165 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +==========================
> +Samsung Galaxy Book Extras
> +==========================
> +
> +Joshua Grisham <josh@joshuagrisham.com>
> +
> +This is a Linux x86 platform driver for Samsung Galaxy Book series notebook
> +devices which utilizes Samsung's ``SCAI`` ACPI device in order to control
> +extra features and receive various notifications.
> +
> +Supported devices
> +=================
> +
> +Any device with one of the supported ACPI device IDs should be supported. This
> +covers most of the "Samsung Galaxy Book" series notebooks that are currently
> +available as of this writing, and could include other Samsung notebook devices
> +as well.
> +
> +Status
> +======
> +
> +The following features are currently supported:
> +
> +- :ref:`Keyboard backlight <keyboard-backlight>` control
> +- :ref:`Performance mode <performance-mode>` control implemented using the
> +  platform profile interface
> +- :ref:`Battery charge control end threshold
> +  <battery-charge-control-end-threshold>` (stop charging battery at given
> +  percentage value) implemented as a battery device extension
> +- :ref:`Firmware Attributes <firmware-attributes>` to allow control of various
> +  device settings
> +- :ref:`Handling of Fn hotkeys <keyboard-hotkey-actions>` for various actions
> +- :ref:`Handling of ACPI notifications and hotkeys
> +  <acpi-notifications-and-hotkey-actions>`
> +
> +Because different models of these devices can vary in their features, there is
> +logic built within the driver which attempts to test each implemented feature
> +for a valid response before enabling its support (registering additional devices
> +or extensions, adding sysfs attributes, etc). Therefore, it can be important to
> +note that not all features may be supported for your particular device.
> +
> +The following features might be possible to implement but will require
> +additional investigation and are therefore not supported at this time:
> +
> +- "Dolby Atmos" mode for the speakers
> +- "Outdoor Mode" for increasing screen brightness on models with ``SAM0427``
> +- "Silent Mode" on models with ``SAM0427``
> +
> +.. _keyboard-backlight:
> +
> +Keyboard backlight
> +==================
> +
> +A new LED class named ``samsung-galaxybook::kbd_backlight`` is created which
> +will then expose the device using the standard sysfs-based LED interface at
> +``/sys/class/leds/samsung-galaxybook::kbd_backlight``. Brightness can be
> +controlled by writing the desired value to the ``brightness`` sysfs attribute or
> +with any other desired userspace utility.
> +
> +.. note::
> +  Most of these devices have an ambient light sensor which also turns
> +  off the keyboard backlight under well-lit conditions. This behavior does not
> +  seem possible to control at this time, but can be good to be aware of.
> +
> +.. _performance-mode:
> +
> +Performance mode
> +================
> +
> +This driver implements the
> +Documentation/userspace-api/sysfs-platform_profile.rst interface for working
> +with the "performance mode" function of the Samsung ACPI device.
> +
> +Mapping of each Samsung "performance mode" to its respective platform profile is
> +done dynamically based on a list of the supported modes reported by the device
> +itself. Preference is given to always try and map ``low-power``, ``balanced``,
> +and ``performance`` profiles, as these seem to be the most common profiles
> +utilized (and sometimes even required) by various userspace tools.
> +
> +The result of the mapping will be printed in the kernel log when the module is
> +loaded. Supported profiles can also be retrieved from
> +``/sys/firmware/acpi/platform_profile_choices``, while
> +``/sys/firmware/acpi/platform_profile`` can be used to read or write the
> +currently selected profile.
> +
> +The ``balanced`` platform profile will be set during module load if no profile
> +has been previously set.
> +
> +.. _battery-charge-control-end-threshold:
> +
> +Battery charge control end threshold
> +====================================
> +
> +This platform driver will add the ability to set the battery's charge control
> +end threshold, but does not have the ability to set a start threshold.
> +
> +This feature is typically called "Battery Saver" by the various Samsung
> +applications in Windows, but in Linux we have implemented the standardized
> +"charge control threshold" sysfs interface on the battery device to allow for
> +controlling this functionality from the userspace.
> +
> +The sysfs attribute
> +``/sys/class/power_supply/BAT1/charge_control_end_threshold`` can be used to
> +read or set the desired charge end threshold.
> +
> +If you wish to maintain interoperability with Windows, then you should set the
> +value to 80 to represent "on", or 100 to represent "off", as these are the
> +values currently recognized by the various Windows-based Samsung applications
> +and services as "on" or "off". Otherwise, the device will accept any value
> +between 1 and 100 as the percentage that you wish the battery to stop charging
> +at.
> +
> +.. _firmware-attributes:
> +
> +Firmware Attributes
> +===================
> +
> +The following firmware attributes are set up by this driver and should be
> +accessible under
> +``/sys/class/firmware-attributes/samsung-galaxybook/attributes/`` if your device
> +supports them:
> +
> +- ``camera_lens_cover``
> +- ``power_on_lid_open``
> +- ``usb_charging``
> +
> +These attributes are documented in more detail under
> +Documentation/admin-guide/abi.rst.
> +
> +.. _keyboard-hotkey-actions:
> +
> +Keyboard hotkey actions (i8042 filter)
> +======================================
> +
> +The i8042 filter will swallow the keyboard events for the Fn+F9 hotkey (Multi-
> +level keyboard backlight toggle) and Fn+F10 hotkey (Block recording toggle)
> +and instead execute their actions within the driver itself.
> +
> +Fn+F9 will cycle through the brightness levels of the keyboard backlight. A
> +notification will be sent using ``led_classdev_notify_brightness_hw_changed``
> +so that the userspace can be aware of the change. This mimics the behavior of
> +other existing devices where the brightness level is cycled internally by the
> +embedded controller and then reported via a notification.
> +
> +Fn+F10 will toggle the value of the "camera lens cover" setting, which blocks
> +or allows usage of the built-in camera and microphone.
> +
> +There is a new "Samsung Galaxy Book Extra Buttons" input device created which
> +will send input events for the following notifications:
> +
> +- Switch ``SW_CAMERA_LENS_COVER`` (on or off) when the camera and microphone are
> +  "blocked" or "allowed" when toggling the Camera Lens Cover setting.
> +
> +.. _acpi-notifications-and-hotkey-actions:
> +
> +ACPI notifications and hotkey actions
> +=====================================
> +
> +ACPI notifications will generate ACPI netlink events and can be received using
> +userspace tools such as ``acpi_listen`` and ``acpid``.
> +
> +The Fn+F11 Performance mode hotkey will be handled by the driver; each keypress
> +will cycle to the next available platform profile.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3809931b9240..e74873a1e74b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20733,6 +20733,13 @@ L:	linux-fbdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/video/fbdev/s3c-fb.c
>  
> +SAMSUNG GALAXY BOOK EXTRAS DRIVER
> +M:	Joshua Grisham <josh@joshuagrisham.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/laptops/samsung-galaxybook.rst
> +F:	drivers/platform/x86/samsung-galaxybook.c
> +
>  SAMSUNG INTERCONNECT DRIVERS
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  M:	Artur Świgoń <a.swigon@samsung.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..ecc509f5df55 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -778,6 +778,24 @@ config BARCO_P50_GPIO
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called barco-p50-gpio.
>  
> +config SAMSUNG_GALAXYBOOK
> +	tristate "Samsung Galaxy Book extras driver"
> +	depends on ACPI
> +	depends on ACPI_BATTERY
> +	depends on INPUT
> +	depends on LEDS_CLASS
> +	depends on SERIO_I8042
> +	select ACPI_PLATFORM_PROFILE
> +	select FW_ATTR_CLASS
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This is a driver for Samsung Galaxy Book series notebooks. It adds
> +	  support for the keyboard backlight control, performance mode control, fan
> +	  speed reporting, function keys, and various other device controls.
> +
> +	  For more information about this driver, see
> +	  <file:Documentation/admin-guide/laptops/samsung-galaxybook.rst>.
> +
>  config SAMSUNG_LAPTOP
>  	tristate "Samsung Laptop driver"
>  	depends on RFKILL || RFKILL = n
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b142947067..32ec4cb9d902 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -95,8 +95,9 @@ obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
>  obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
>  
>  # Samsung
> -obj-$(CONFIG_SAMSUNG_LAPTOP)	+= samsung-laptop.o
> -obj-$(CONFIG_SAMSUNG_Q10)	+= samsung-q10.o
> +obj-$(CONFIG_SAMSUNG_GALAXYBOOK)	+= samsung-galaxybook.o
> +obj-$(CONFIG_SAMSUNG_LAPTOP)		+= samsung-laptop.o
> +obj-$(CONFIG_SAMSUNG_Q10)		+= samsung-q10.o
>  
>  # Toshiba
>  obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+= toshiba_bluetooth.o
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> new file mode 100644
> index 000000000000..c656471dd1c7
> --- /dev/null
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -0,0 +1,1493 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Samsung Galaxy Book series extras driver
> + *
> + * Copyright (c) 2024 Joshua Grisham <josh@joshuagrisham.com>
> + *
> + * With contributions to the SCAI ACPI device interface:
> + * Copyright (c) 2024 Giulio Girardi <giulio.girardi@protechgroup.it>
> + *
> + * Implementation inspired by existing x86 platform drivers.
> + * Thank you to the authors!
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/err.h>
> +#include <linux/i8042.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
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
> +static const struct acpi_device_id galaxybook_device_ids[] = {
> +	{ "SAM0427" },
> +	{ "SAM0428" },
> +	{ "SAM0429" },
> +	{ "SAM0430" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
> +
> +struct samsung_galaxybook {
> +	struct platform_device *platform;
> +	struct acpi_device *acpi;
> +
> +	struct device *fw_attrs_dev;
> +	struct kset *fw_attrs_kset;
> +	struct kobj_attribute power_on_lid_open_attr;
> +	struct kobj_attribute usb_charging_attr;
> +	struct kobj_attribute camera_lens_cover_attr;
> +
> +	bool has_kbd_backlight;
> +	bool has_camera_lens_cover;
> +	bool has_performance_mode;
> +
> +	struct led_classdev kbd_backlight;
> +	/* block out of sync condition in hotkey action if brightness updated in another thread */
> +	struct mutex kbd_backlight_lock;
> +	struct work_struct kbd_backlight_hotkey_work;
> +
> +	struct input_dev *input;
> +	/* protect sparse keymap event reporting getting out of sync from multiple threads */
> +	struct mutex input_lock;
> +	void *i8042_filter_ptr;
> +
> +	/* block out of sync condition in hotkey action if value updated in another thread */
> +	struct mutex camera_lens_cover_lock;
> +	struct work_struct camera_lens_cover_hotkey_work;
> +
> +	struct acpi_battery_hook battery_hook;
> +	struct device_attribute charge_control_end_threshold_attr;
> +
> +	u8 profile_performance_modes[PLATFORM_PROFILE_LAST];
> +	struct platform_profile_handler profile_handler;
> +};
> +
> +static struct samsung_galaxybook *galaxybook_ptr;
> +static const struct class *fw_attr_class;
> +
> +struct sawb {
> +	u16 safn;
> +	u16 sasb;
> +	u8 rflg;
> +	union {
> +		struct {
> +			u8 gunm;
> +			u8 guds[250];
> +		} __packed;
> +		struct {
> +			u8 caid[16];
> +			u8 fncn;
> +			u8 subn;
> +			u8 iob0;
> +			u8 iob1;
> +			u8 iob2;
> +			u8 iob3;
> +			u8 iob4;
> +			u8 iob5;
> +			u8 iob6;
> +			u8 iob7;
> +			u8 iob8;
> +			u8 iob9;
> +		} __packed;
> +		struct {
> +			u8 iob_prefix[18];
> +			u8 iob_values[10];
> +		} __packed;
> +	} __packed;
> +} __packed;
> +
> +#define SAWB_LEN_SETTINGS         0x15
> +#define SAWB_LEN_PERFORMANCE_MODE 0x100
> +
> +#define SAFN  0x5843
> +
> +#define SASB_KBD_BACKLIGHT      0x78
> +#define SASB_POWER_MANAGEMENT   0x7a
> +#define SASB_USB_CHARGING_GET   0x67
> +#define SASB_USB_CHARGING_SET   0x68
> +#define SASB_NOTIFICATIONS      0x86
> +#define SASB_CAMERA_LENS_COVER  0x8a
> +#define SASB_PERFORMANCE_MODE   0x91
> +
> +#define SAWB_RFLG_POS  4
> +#define SAWB_GUNM_POS  5
> +
> +#define RFLG_SUCCESS  0xaa
> +#define GUNM_FAIL     0xff
> +
> +#define GUNM_FEATURE_ENABLE          0xbb
> +#define GUNM_FEATURE_ENABLE_SUCCESS  0xdd
> +#define GUDS_FEATURE_ENABLE          0xaa
> +#define GUDS_FEATURE_ENABLE_SUCCESS  0xcc
> +
> +#define GUNM_GET  0x81
> +#define GUNM_SET  0x82
> +
> +#define GUNM_POWER_MANAGEMENT  0x82
> +
> +#define GUNM_USB_CHARGING_GET            0x80
> +#define GUNM_USB_CHARGING_ON             0x81
> +#define GUNM_USB_CHARGING_OFF            0x80
> +#define GUDS_POWER_ON_LID_OPEN           0xa3
> +#define GUDS_POWER_ON_LID_OPEN_GET       0x81
> +#define GUDS_POWER_ON_LID_OPEN_SET       0x80
> +#define GUDS_BATTERY_CHARGE_CONTROL      0xe9
> +#define GUDS_BATTERY_CHARGE_CONTROL_GET  0x91
> +#define GUDS_BATTERY_CHARGE_CONTROL_SET  0x90
> +#define GUNM_ACPI_NOTIFY_ENABLE          0x80
> +#define GUDS_ACPI_NOTIFY_ENABLE          0x02
> +
> +#define GB_CAMERA_LENS_COVER_ON   0x0
> +#define GB_CAMERA_LENS_COVER_OFF  0x1
> +
> +#define FNCN_PERFORMANCE_MODE       0x51
> +#define SUBN_PERFORMANCE_MODE_LIST  0x01
> +#define SUBN_PERFORMANCE_MODE_GET   0x02
> +#define SUBN_PERFORMANCE_MODE_SET   0x03
> +
> +/* guid 8246028d-8bca-4a55-ba0f-6f1e6b921b8f */
> +static const guid_t performance_mode_guid_value =
> +	GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6b, 0x92, 0x1b, 0x8f);
> +#define PERFORMANCE_MODE_GUID performance_mode_guid_value
> +
> +#define PERFORMANCE_MODE_ULTRA               0x16
> +#define PERFORMANCE_MODE_PERFORMANCE         0x15
> +#define PERFORMANCE_MODE_SILENT              0xb
> +#define PERFORMANCE_MODE_QUIET               0xa
> +#define PERFORMANCE_MODE_OPTIMIZED           0x2
> +#define PERFORMANCE_MODE_PERFORMANCE_LEGACY  0x1
> +#define PERFORMANCE_MODE_OPTIMIZED_LEGACY    0x0
> +#define PERFORMANCE_MODE_UNKNOWN             0xff
> +
> +#define DEFAULT_PLATFORM_PROFILE PLATFORM_PROFILE_BALANCED
> +
> +#define ACPI_METHOD_ENABLE            "SDLS"
> +#define ACPI_METHOD_ENABLE_ON         1
> +#define ACPI_METHOD_ENABLE_OFF        0
> +#define ACPI_METHOD_SETTINGS          "CSFI"
> +#define ACPI_METHOD_PERFORMANCE_MODE  "CSXI"
> +
> +#define KBD_BACKLIGHT_MAX_BRIGHTNESS  3
> +
> +#define ACPI_NOTIFY_BATTERY_STATE_CHANGED    0x61
> +#define ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
> +#define ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
> +#define ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
> +
> +#define GB_KEY_KBD_BACKLIGHT_KEYDOWN      0x2c
> +#define GB_KEY_KBD_BACKLIGHT_KEYUP        0xac
> +#define GB_KEY_CAMERA_LENS_COVER_KEYDOWN  0x1f
> +#define GB_KEY_CAMERA_LENS_COVER_KEYUP    0x9f
> +#define GB_KEY_BATTERY_NOTIFY_KEYUP       0xf
> +#define GB_KEY_BATTERY_NOTIFY_KEYDOWN     0x8f
> +
> +#define INPUT_CAMERA_LENS_COVER_ON   0x01
> +#define INPUT_CAMERA_LENS_COVER_OFF  0x02
> +
> +static const struct key_entry galaxybook_acpi_keymap[] = {
> +	{ KE_SW,  INPUT_CAMERA_LENS_COVER_ON,  { .sw = { SW_CAMERA_LENS_COVER, 1 } } },
> +	{ KE_SW,  INPUT_CAMERA_LENS_COVER_OFF, { .sw = { SW_CAMERA_LENS_COVER, 0 } } },
> +	{ KE_END, 0 },
> +};
> +
> +/*
> + * ACPI method handling
> + */
> +
> +static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_string method,
> +				  struct sawb *in_buf, size_t len, struct sawb *out_buf)
> +{
> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	union acpi_object in_obj, *out_obj;
> +	struct acpi_object_list input;
> +	acpi_status status;
> +	int err;
> +
> +	in_obj.type = ACPI_TYPE_BUFFER;
> +	in_obj.buffer.length = len;
> +	in_obj.buffer.pointer = (u8 *)in_buf;
> +
> +	input.count = 1;
> +	input.pointer = &in_obj;
> +
> +	status = acpi_evaluate_object_typed(galaxybook->acpi->handle, method, &input, &output,
> +					    ACPI_TYPE_BUFFER);
> +
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; got %s\n",
> +			method, acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	out_obj = output.pointer;
> +
> +	if (out_obj->buffer.length != len || out_obj->buffer.length < SAWB_GUNM_POS + 1) {
> +		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> +			"response length mismatch\n", method);
> +		err = -EPROTO;
> +		goto out_free;
> +	}
> +	if (out_obj->buffer.pointer[SAWB_RFLG_POS] != RFLG_SUCCESS) {
> +		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> +			"device did not respond with success code 0x%x\n",
> +			method, RFLG_SUCCESS);
> +		err = -ENXIO;
> +		goto out_free;
> +	}
> +	if (out_obj->buffer.pointer[SAWB_GUNM_POS] == GUNM_FAIL) {
> +		dev_err(&galaxybook->acpi->dev,
> +			"failed to execute method %s; device responded with failure code 0x%x\n",
> +			method, GUNM_FAIL);
> +		err = -ENXIO;
> +		goto out_free;
> +	}
> +
> +	memcpy(out_buf, out_obj->buffer.pointer, len);
> +	err = 0;
> +
> +out_free:
> +	kfree(out_obj);
> +	return err;
> +}
> +
> +static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *galaxybook, const u16 sasb)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = sasb;
> +	buf.gunm = GUNM_FEATURE_ENABLE;
> +	buf.guds[0] = GUDS_FEATURE_ENABLE;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	if (buf.gunm != GUNM_FEATURE_ENABLE_SUCCESS && buf.guds[0] != GUDS_FEATURE_ENABLE_SUCCESS)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +/*
> + * Keyboard Backlight
> + */
> +
> +static int kbd_backlight_acpi_set(struct samsung_galaxybook *galaxybook,
> +				  const enum led_brightness brightness)
> +{
> +	struct sawb buf = { 0 };
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_KBD_BACKLIGHT;
> +	buf.gunm = GUNM_SET;
> +
> +	buf.guds[0] = brightness;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int kbd_backlight_acpi_get(struct samsung_galaxybook *galaxybook,
> +				  enum led_brightness *brightness)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_KBD_BACKLIGHT;
> +	buf.gunm = GUNM_GET;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*brightness = buf.gunm;
> +
> +	return 0;
> +}
> +
> +static int kbd_backlight_store(struct led_classdev *led,
> +			       const enum led_brightness brightness)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of_const(led, struct samsung_galaxybook, kbd_backlight);
> +
> +	return kbd_backlight_acpi_set(galaxybook, brightness);
> +}
> +
> +static enum led_brightness kbd_backlight_show(struct led_classdev *led)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(led, struct samsung_galaxybook, kbd_backlight);
> +	enum led_brightness brightness;
> +	int err;
> +
> +	err = kbd_backlight_acpi_get(galaxybook, &brightness);
> +	if (err)
> +		return err;
> +
> +	return brightness;
> +}
> +
> +static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *galaxybook)
> +{
> +	struct led_init_data init_data = {};
> +	enum led_brightness brightness;
> +	int err;
> +
> +	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->kbd_backlight_lock);
> +	if (err)
> +		return err;
> +
> +	err = galaxybook_enable_acpi_feature(galaxybook, SASB_KBD_BACKLIGHT);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	/* verify we can read the value, otherwise stop without setting has_kbd_backlight */
> +	err = kbd_backlight_acpi_get(galaxybook, &brightness);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	init_data.devicename = DRIVER_NAME;
> +	init_data.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT;
> +	init_data.devname_mandatory = true;
> +
> +	galaxybook->kbd_backlight.brightness_get = kbd_backlight_show;
> +	galaxybook->kbd_backlight.brightness_set_blocking = kbd_backlight_store;
> +	galaxybook->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
> +	galaxybook->kbd_backlight.max_brightness = KBD_BACKLIGHT_MAX_BRIGHTNESS;
> +
> +	err = devm_led_classdev_register_ext(&galaxybook->platform->dev,
> +					     &galaxybook->kbd_backlight, &init_data);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	galaxybook->has_kbd_backlight = true;
> +
> +	return 0;
> +
> +return_with_dbg:
> +	dev_dbg(&galaxybook->platform->dev,
> +		"failed to initialize kbd_backlight, error %d\n", err);
> +	return 0;

Return `err` here.

> +}
> +
> +/*
> + * Platform device attributes (configuration properties which can be controlled via userspace)
> + */
> +
> +/* Power on lid open (device should power on when lid is opened) */
> +
> +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
> +{
> +	struct sawb buf = { 0 };
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_POWER_MANAGEMENT;
> +	buf.gunm = GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] = GUDS_POWER_ON_LID_OPEN;
> +	buf.guds[1] = GUDS_POWER_ON_LID_OPEN_SET;
> +	buf.guds[2] = value ? 1 : 0;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_POWER_MANAGEMENT;
> +	buf.gunm = GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] = GUDS_POWER_ON_LID_OPEN;
> +	buf.guds[1] = GUDS_POWER_ON_LID_OPEN_GET;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value = buf.guds[1];
> +
> +	return 0;
> +}
> +
> +static ssize_t power_on_lid_open_store(struct kobject *kobj, struct kobj_attribute *attr,
> +				       const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, power_on_lid_open_attr);
> +
> +	bool value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err = kstrtobool(buffer, &value);
> +	if (err)
> +		return err;
> +
> +	err = power_on_lid_open_acpi_set(galaxybook, value);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t power_on_lid_open_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				      char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, power_on_lid_open_attr);
> +	bool value;
> +	int err;
> +
> +	err = power_on_lid_open_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buffer, "%u\n", value);
> +}
> +
> +/* USB Charging (USB ports can charge other devices even when device is powered off) */
> +
> +static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
> +{
> +	struct sawb buf = { 0 };
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_USB_CHARGING_SET;
> +	buf.gunm = value ? GUNM_USB_CHARGING_ON : GUNM_USB_CHARGING_OFF;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_USB_CHARGING_GET;
> +	buf.gunm = GUNM_USB_CHARGING_GET;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value = buf.gunm == 1;
> +
> +	return 0;
> +}
> +
> +static ssize_t usb_charging_store(struct kobject *kobj, struct kobj_attribute *attr,
> +				  const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, usb_charging_attr);
> +	bool value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err = kstrtobool(buffer, &value);
> +	if (err)
> +		return err;
> +
> +	err = usb_charging_acpi_set(galaxybook, value);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t usb_charging_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, usb_charging_attr);
> +	bool value;
> +	int err;
> +
> +	err = usb_charging_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buffer, "%u\n", value);
> +}
> +
> +/* Camera lens cover (blocks access to camera and microphone) */
> +
> +static int camera_lens_cover_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
> +{
> +	struct sawb buf = { 0 };
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_CAMERA_LENS_COVER;
> +	buf.gunm = GUNM_SET;
> +	buf.guds[0] = value ? GB_CAMERA_LENS_COVER_ON : GB_CAMERA_LENS_COVER_OFF;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int camera_lens_cover_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_CAMERA_LENS_COVER;
> +	buf.gunm = GUNM_GET;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value = buf.gunm == GB_CAMERA_LENS_COVER_ON;
> +
> +	return 0;
> +}
> +
> +static ssize_t camera_lens_cover_store(struct kobject *kobj, struct kobj_attribute *attr,
> +				       const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, camera_lens_cover_attr);
> +	bool value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err = kstrtobool(buffer, &value);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&galaxybook->camera_lens_cover_lock);
> +	err = camera_lens_cover_acpi_set(galaxybook, value);
> +	mutex_unlock(&galaxybook->camera_lens_cover_lock);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t camera_lens_cover_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				      char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, camera_lens_cover_attr);
> +	bool value;
> +	int err;
> +
> +	err = camera_lens_cover_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buffer, "%u\n", value);
> +}
> +
> +static int galaxybook_camera_lens_cover_init(struct samsung_galaxybook *galaxybook)
> +{
> +	int err;
> +
> +	err = galaxybook_enable_acpi_feature(galaxybook, SASB_CAMERA_LENS_COVER);
> +	if (err) {
> +		dev_dbg(&galaxybook->platform->dev,
> +			"failed to initialize camera lens cover feature, error %d\n", err);
> +		return 0;
> +	}
> +
> +	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->camera_lens_cover_lock);
> +	if (err)
> +		return err;
> +
> +	galaxybook->has_camera_lens_cover = true;
> +
> +	return 0;
> +}
> +
> +/* Attribute setup */
> +
> +static void galaxybook_power_on_lid_open_attr_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	sysfs_remove_file(&galaxybook->fw_attrs_kset->kobj,
> +			  &galaxybook->power_on_lid_open_attr.attr);
> +}
> +
> +static void galaxybook_usb_charging_attr_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	sysfs_remove_file(&galaxybook->fw_attrs_kset->kobj,
> +			  &galaxybook->usb_charging_attr.attr);
> +}
> +
> +static void galaxybook_camera_lens_cover_attr_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	sysfs_remove_file(&galaxybook->fw_attrs_kset->kobj,
> +			  &galaxybook->camera_lens_cover_attr.attr);
> +}
> +
> +static void galaxybook_fw_attrs_kset_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	kset_unregister(galaxybook->fw_attrs_kset);
> +}
> +
> +static void galaxybook_fw_attr_class_remove(void *data)
> +{
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +	fw_attributes_class_put();
> +}
> +
> +static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
> +{
> +	bool value;
> +	int err;
> +
> +	err = fw_attributes_class_get(&fw_attr_class);
> +	if (err)
> +		return err;
> +
> +	galaxybook->fw_attrs_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
> +						 NULL, "%s", DRIVER_NAME);
> +	if (IS_ERR(galaxybook->fw_attrs_dev)) {
> +		fw_attributes_class_put();
> +		err = PTR_ERR(galaxybook->fw_attrs_dev);
> +		return err;
> +	}
> +	err = devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_fw_attr_class_remove, NULL);
> +	if (err)
> +		return err;
> +
> +	galaxybook->fw_attrs_kset = kset_create_and_add("attributes", NULL,
> +							&galaxybook->fw_attrs_dev->kobj);
> +	if (!galaxybook->fw_attrs_kset)
> +		return -ENOMEM;
> +	err = devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_fw_attrs_kset_remove, galaxybook);
> +	if (err)
> +		return err;
> +
> +	err = power_on_lid_open_acpi_get(galaxybook, &value);
> +	if (!err) {
> +		sysfs_attr_init(&galaxybook->power_on_lid_open_attr);
> +		galaxybook->power_on_lid_open_attr.attr.name = "power_on_lid_open";
> +		galaxybook->power_on_lid_open_attr.attr.mode = 0644;
> +		galaxybook->power_on_lid_open_attr.show = power_on_lid_open_show;
> +		galaxybook->power_on_lid_open_attr.store = power_on_lid_open_store;
> +		err = sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
> +					&galaxybook->power_on_lid_open_attr.attr);
> +		if (err)
> +			return err;
> +		err = devm_add_action_or_reset(&galaxybook->platform->dev,
> +					       galaxybook_power_on_lid_open_attr_remove,
> +					       galaxybook);
> +		if (err)
> +			return err;
> +	}
> +
> +	err = usb_charging_acpi_get(galaxybook, &value);
> +	if (!err) {
> +		sysfs_attr_init(&galaxybook->usb_charging_attr);
> +		galaxybook->usb_charging_attr.attr.name = "usb_charging";
> +		galaxybook->usb_charging_attr.attr.mode = 0644;
> +		galaxybook->usb_charging_attr.show = usb_charging_show;
> +		galaxybook->usb_charging_attr.store = usb_charging_store;
> +		err = sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
> +					&galaxybook->usb_charging_attr.attr);
> +		if (err)
> +			return err;
> +		err = devm_add_action_or_reset(&galaxybook->platform->dev,
> +					       galaxybook_usb_charging_attr_remove, galaxybook);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (!galaxybook->has_camera_lens_cover)
> +		return 0;
> +	err = camera_lens_cover_acpi_get(galaxybook, &value);
> +	if (err) {
> +		galaxybook->has_camera_lens_cover = false;
> +		return 0;
> +	}
> +
> +	sysfs_attr_init(&galaxybook->camera_lens_cover_attr);
> +	galaxybook->camera_lens_cover_attr.attr.name = "camera_lens_cover";
> +	galaxybook->camera_lens_cover_attr.attr.mode = 0644;
> +	galaxybook->camera_lens_cover_attr.show = camera_lens_cover_show;
> +	galaxybook->camera_lens_cover_attr.store = camera_lens_cover_store;
> +	err = sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
> +				&galaxybook->camera_lens_cover_attr.attr);
> +	if (err)
> +		return err;
> +	return devm_add_action_or_reset(&galaxybook->platform->dev,
> +					galaxybook_camera_lens_cover_attr_remove, galaxybook);
> +}
> +
> +/*
> + * Battery Extension (adds charge_control_end_threshold to the battery device)
> + */
> +
> +static int charge_control_end_threshold_acpi_set(struct samsung_galaxybook *galaxybook, u8 value)
> +{
> +	struct sawb buf = { 0 };
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_POWER_MANAGEMENT;
> +	buf.gunm = GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] = GUDS_BATTERY_CHARGE_CONTROL;
> +	buf.guds[1] = GUDS_BATTERY_CHARGE_CONTROL_SET;
> +	buf.guds[2] = value;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int charge_control_end_threshold_acpi_get(struct samsung_galaxybook *galaxybook, u8 *value)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_POWER_MANAGEMENT;
> +	buf.gunm = GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] = GUDS_BATTERY_CHARGE_CONTROL;
> +	buf.guds[1] = GUDS_BATTERY_CHARGE_CONTROL_GET;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value = buf.guds[1];
> +
> +	return 0;
> +}
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev, struct device_attribute *attr,
> +						  const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, charge_control_end_threshold_attr);
> +	u8 value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err = kstrtou8(buffer, 0, &value);
> +	if (err)
> +		return err;
> +
> +	if (value < 1 || value > 100)
> +		return -EINVAL;
> +
> +	/* device stores "no end threshold" as 0 instead of 100; if setting to 100, send 0 */
> +	if (value == 100)
> +		value = 0;
> +
> +	err = charge_control_end_threshold_acpi_set(galaxybook, value);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t charge_control_end_threshold_show(struct device *dev, struct device_attribute *attr,
> +						 char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(attr, struct samsung_galaxybook, charge_control_end_threshold_attr);
> +	u8 value;
> +	int err;
> +
> +	err = charge_control_end_threshold_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	/* device stores "no end threshold" as 0 instead of 100; if device has 0, report 100 */
> +	if (value == 0)
> +		value = 100;
> +
> +	return sysfs_emit(buffer, "%d\n", value);
> +}
> +
> +static int galaxybook_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(hook, struct samsung_galaxybook, battery_hook);
> +
> +	return device_create_file(&battery->dev, &galaxybook->charge_control_end_threshold_attr);
> +}
> +
> +static int galaxybook_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(hook, struct samsung_galaxybook, battery_hook);
> +
> +	device_remove_file(&battery->dev, &galaxybook->charge_control_end_threshold_attr);
> +	return 0;
> +}
> +
> +static void galaxybook_battery_threshold_init(struct samsung_galaxybook *galaxybook)
> +{
> +	struct acpi_battery_hook *hook;
> +	struct device_attribute *attr;
> +	u8 value;
> +	int err;
> +
> +	err = charge_control_end_threshold_acpi_get(galaxybook, &value);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	hook = &galaxybook->battery_hook;
> +	hook->add_battery = galaxybook_battery_add;
> +	hook->remove_battery = galaxybook_battery_remove;
> +	hook->name = "Samsung Galaxy Book Battery Extension";
> +
> +	attr = &galaxybook->charge_control_end_threshold_attr;
> +	sysfs_attr_init(&attr->attr);
> +	attr->attr.name = "charge_control_end_threshold";
> +	attr->attr.mode = 0644;
> +	attr->show = charge_control_end_threshold_show;
> +	attr->store = charge_control_end_threshold_store;
> +
> +	err = devm_battery_hook_register(&galaxybook->platform->dev, &galaxybook->battery_hook);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	return;
> +
> +return_with_dbg:
> +	dev_dbg(&galaxybook->platform->dev,
> +		"failed to initialize battery charge threshold, error %d\n", err);
> +}
> +
> +/*
> + * Platform Profile / Performance mode
> + */
> +
> +static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybook,
> +				     const u8 performance_mode)
> +{
> +	struct sawb buf = { 0 };
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &PERFORMANCE_MODE_GUID);
> +	buf.fncn = FNCN_PERFORMANCE_MODE;
> +	buf.subn = SUBN_PERFORMANCE_MODE_SET;
> +	buf.iob0 = performance_mode;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_PERFORMANCE_MODE,
> +				      &buf, SAWB_LEN_PERFORMANCE_MODE, &buf);
> +}
> +
> +static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybook, u8 *performance_mode)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &PERFORMANCE_MODE_GUID);
> +	buf.fncn = FNCN_PERFORMANCE_MODE;
> +	buf.subn = SUBN_PERFORMANCE_MODE_GET;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_PERFORMANCE_MODE,
> +				     &buf, SAWB_LEN_PERFORMANCE_MODE, &buf);
> +	if (err)
> +		return err;
> +
> +	*performance_mode = buf.iob0;
> +
> +	return 0;
> +}
> +
> +static int get_performance_mode_profile(struct samsung_galaxybook *galaxybook,
> +					const u8 performance_mode,
> +					enum platform_profile_option *profile)
> +{
> +	for (int i = 0; i < PLATFORM_PROFILE_LAST; i++) {
> +		if (galaxybook->profile_performance_modes[i] == performance_mode) {
> +			if (profile)
> +				*profile = i;
> +			return 0;
> +		}
> +	}
> +
> +	return -ENODATA;
> +}
> +
> +static int galaxybook_platform_profile_set(struct platform_profile_handler *pprof,
> +					   enum platform_profile_option profile)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(pprof, struct samsung_galaxybook, profile_handler);
> +
> +	return performance_mode_acpi_set(galaxybook,
> +					 galaxybook->profile_performance_modes[profile]);
> +}
> +
> +static int galaxybook_platform_profile_get(struct platform_profile_handler *pprof,
> +					   enum platform_profile_option *profile)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(pprof, struct samsung_galaxybook, profile_handler);
> +	u8 performance_mode;
> +	int err;
> +
> +	err = performance_mode_acpi_get(galaxybook, &performance_mode);
> +	if (err)
> +		return err;
> +
> +	return get_performance_mode_profile(galaxybook, performance_mode, profile);
> +}
> +
> +static void galaxybook_profile_exit(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	platform_profile_remove(&galaxybook->profile_handler);
> +}
> +
> +#define IGNORE_PERFORMANCE_MODE_MAPPING  -1
> +
> +static void galaxybook_profile_init(struct samsung_galaxybook *galaxybook)
> +{
> +	u8 current_performance_mode;
> +	u8 init_performance_mode;
> +	struct sawb buf = { 0 };
> +	int mapped_profiles;
> +	int mode_profile;
> +	int err;
> +	int i;
> +
> +	galaxybook->profile_handler.name = DRIVER_NAME;
> +	galaxybook->profile_handler.dev = &galaxybook->platform->dev;
> +	galaxybook->profile_handler.profile_get = galaxybook_platform_profile_get;
> +	galaxybook->profile_handler.profile_set = galaxybook_platform_profile_set;
> +
> +	/* fetch supported performance mode values from ACPI method */
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &PERFORMANCE_MODE_GUID);
> +	buf.fncn = FNCN_PERFORMANCE_MODE;
> +	buf.subn = SUBN_PERFORMANCE_MODE_LIST;
> +
> +	err = galaxybook_acpi_method(galaxybook, ACPI_METHOD_PERFORMANCE_MODE,
> +				     &buf, SAWB_LEN_PERFORMANCE_MODE, &buf);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	/* set up profile_performance_modes with "unknown" as init value */
> +	for (i = 0; i < PLATFORM_PROFILE_LAST; i++)
> +		galaxybook->profile_performance_modes[i] = PERFORMANCE_MODE_UNKNOWN;
> +
> +	/*
> +	 * Value returned in iob0 will have the number of supported performance modes.
> +	 * The performance mode values will then be given as a list after this (iob1-iobX).
> +	 * Loop backwards from last value to first value (to handle fallback cases which come with
> +	 * smaller values) and map each supported value to its correct platform_profile_option.
> +	 */
> +	for (i = buf.iob0; i > 0; i--) {
> +		/*
> +		 * Prefer mapping to at least performance, balanced, and low-power profiles, as they
> +		 * are the profiles which are typically supported by userspace tools
> +		 * (power-profiles-daemon, etc).
> +		 * - performance = "ultra", otherwise "performance"
> +		 * - balanced    = "optimized", otherwise "performance" when "ultra" is supported
> +		 * - low-power   = "silent", otherwise "quiet"
> +		 * Different models support different modes. Additional supported modes will be
> +		 * mapped to profiles that fall in between these 3.
> +		 */
> +		switch (buf.iob_values[i]) {
> +		case PERFORMANCE_MODE_ULTRA:
> +			/* ultra always maps to performance */
> +			mode_profile = PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +
> +		case PERFORMANCE_MODE_PERFORMANCE:
> +			/* if ultra exists, map performance to balanced-performance */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_PERFORMANCE] !=
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			else /* otherwise map it to performance instead */
> +				mode_profile = PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +
> +		case PERFORMANCE_MODE_SILENT:
> +			/* silent always maps to low-power */
> +			mode_profile = PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +
> +		case PERFORMANCE_MODE_QUIET:
> +			/* if silent exists, map quiet to quiet */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_LOW_POWER] !=
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile = PLATFORM_PROFILE_QUIET;
> +			else /* otherwise map it to low-power for better userspace tool support */
> +				mode_profile = PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +
> +		case PERFORMANCE_MODE_OPTIMIZED:
> +			/* optimized always maps to balanced */
> +			mode_profile = PLATFORM_PROFILE_BALANCED;
> +			break;
> +
> +		case PERFORMANCE_MODE_PERFORMANCE_LEGACY:
> +			/* map to performance if performance is not already supported */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_PERFORMANCE] ==
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile = PLATFORM_PROFILE_PERFORMANCE;
> +			else /* otherwise, ignore */
> +				mode_profile = IGNORE_PERFORMANCE_MODE_MAPPING;
> +			break;
> +
> +		case PERFORMANCE_MODE_OPTIMIZED_LEGACY:
> +			/* map to balanced if balanced is not already supported */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_BALANCED] ==
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile = PLATFORM_PROFILE_BALANCED;
> +			else /* otherwise, ignore */
> +				mode_profile = IGNORE_PERFORMANCE_MODE_MAPPING;
> +			break;
> +
> +		default: /* any other value is not supported */
> +			mode_profile = IGNORE_PERFORMANCE_MODE_MAPPING;
> +			break;
> +		}
> +
> +		/* if current mode value mapped to a supported platform_profile_option, set it up */
> +		if (mode_profile != IGNORE_PERFORMANCE_MODE_MAPPING) {
> +			mapped_profiles++;

mapped_profiles is uninitialized!!

> +			galaxybook->profile_performance_modes[mode_profile] = buf.iob_values[i];
> +			set_bit(mode_profile, galaxybook->profile_handler.choices);
> +			if (mode_profile == DEFAULT_PLATFORM_PROFILE)
> +				init_performance_mode = buf.iob_values[i];
> +			dev_dbg(&galaxybook->platform->dev,
> +				"will support platform profile %d (performance mode 0x%x)\n",
> +				mode_profile, buf.iob_values[i]);
> +		} else {
> +			dev_dbg(&galaxybook->platform->dev,
> +				"unmapped performance mode 0x%x will be ignored\n",
> +				buf.iob_values[i]);
> +		}
> +	}
> +
> +	if (mapped_profiles == 0) {
> +		err = -ENODEV;
> +		goto return_with_dbg;
> +	}
> +
> +	/* now check currently set performance mode; if not supported then set default mode */
> +	err = performance_mode_acpi_get(galaxybook, &current_performance_mode);
> +	if (err)
> +		goto return_with_dbg;
> +	err = get_performance_mode_profile(galaxybook, current_performance_mode, NULL);
> +	if (err) {
> +		dev_dbg(&galaxybook->platform->dev,
> +			"initial performance mode value is not supported by device; "
> +			"setting to default\n");
> +		err = performance_mode_acpi_set(galaxybook, init_performance_mode);
> +		if (err)
> +			goto return_with_dbg;
> +	}
> +
> +	err = platform_profile_register(&galaxybook->profile_handler);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	err = devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_profile_exit, galaxybook);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	galaxybook->has_performance_mode = true;
> +
> +	return;
> +
> +return_with_dbg:
> +	dev_dbg(&galaxybook->platform->dev,
> +		"failed to initialize platform profile, error %d\n", err);
> +}
> +
> +/*
> + * Hotkeys and notifications
> + */
> +
> +static void galaxybook_input_notify(struct samsung_galaxybook *galaxybook, int event)
> +{
> +	if (!galaxybook->input)
> +		return;
> +	mutex_lock(&galaxybook->input_lock);
> +	if (!sparse_keymap_report_event(galaxybook->input, event, 1, true))
> +		dev_warn(&galaxybook->acpi->dev, "unknown input notification event: 0x%x\n", event);
> +	mutex_unlock(&galaxybook->input_lock);
> +}
> +
> +static int galaxybook_input_init(struct samsung_galaxybook *galaxybook)
> +{
> +	int err;
> +
> +	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->input_lock);
> +	if (err)
> +		return err;
> +
> +	galaxybook->input = devm_input_allocate_device(&galaxybook->platform->dev);
> +	if (!galaxybook->input)
> +		return -ENOMEM;
> +
> +	galaxybook->input->name = "Samsung Galaxy Book Extra Buttons";
> +	galaxybook->input->phys = DRIVER_NAME "/input0";
> +	galaxybook->input->id.bustype = BUS_HOST;
> +	galaxybook->input->dev.parent = &galaxybook->platform->dev;
> +
> +	err = sparse_keymap_setup(galaxybook->input, galaxybook_acpi_keymap, NULL);
> +	if (err)
> +		return err;
> +
> +	return input_register_device(galaxybook->input);
> +}
> +
> +static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(work, struct samsung_galaxybook, kbd_backlight_hotkey_work);
> +	int new_brightness;
> +	int err;
> +
> +	guard(mutex)(&galaxybook->kbd_backlight_lock);
> +
> +	if (galaxybook->kbd_backlight.brightness < galaxybook->kbd_backlight.max_brightness)
> +		new_brightness = galaxybook->kbd_backlight.brightness + 1;
> +	else
> +		new_brightness = 0;
> +
> +	err = led_set_brightness_sync(&galaxybook->kbd_backlight, new_brightness);
> +	if (err) {
> +		dev_err(&galaxybook->platform->dev,
> +			"failed to set kbd_backlight brightness, error %d\n", err);
> +		return;
> +	}
> +
> +	led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backlight, new_brightness);
> +}
> +
> +static void galaxybook_camera_lens_cover_hotkey_work(struct work_struct *work)
> +{
> +	struct samsung_galaxybook *galaxybook =
> +		container_of(work, struct samsung_galaxybook, camera_lens_cover_hotkey_work);
> +	bool value;
> +	int err;
> +
> +	guard(mutex)(&galaxybook->camera_lens_cover_lock);
> +
> +	err = camera_lens_cover_acpi_get(galaxybook, &value);
> +	if (err) {
> +		dev_err(&galaxybook->platform->dev,
> +			"failed to get camera_lens_cover, error %d\n", err);
> +		return;
> +	}
> +
> +	err = camera_lens_cover_acpi_set(galaxybook, !value);
> +	if (err) {
> +		dev_err(&galaxybook->platform->dev,
> +			"failed to set camera_lens_cover, error %d\n", err);
> +		return;
> +	}
> +
> +	galaxybook_input_notify(galaxybook,
> +				!value ? INPUT_CAMERA_LENS_COVER_ON : INPUT_CAMERA_LENS_COVER_OFF);
> +}
> +
> +static bool galaxybook_i8042_filter(unsigned char data, unsigned char str, struct serio *port)
> +{
> +	static bool extended;
> +
> +	if (str & I8042_STR_AUXDATA)
> +		return false;
> +
> +	if (data == 0xe0) {
> +		extended = true;
> +		return true;
> +	} else if (extended) {
> +		extended = false;
> +		switch (data) {
> +		case GB_KEY_KBD_BACKLIGHT_KEYDOWN:
> +			return true;
> +		case GB_KEY_KBD_BACKLIGHT_KEYUP:
> +			if (galaxybook_ptr->has_kbd_backlight)
> +				schedule_work(&galaxybook_ptr->kbd_backlight_hotkey_work);
> +			return true;
> +
> +		case GB_KEY_CAMERA_LENS_COVER_KEYDOWN:
> +			return true;
> +		case GB_KEY_CAMERA_LENS_COVER_KEYUP:
> +			if (galaxybook_ptr->has_camera_lens_cover)
> +				schedule_work(&galaxybook_ptr->camera_lens_cover_hotkey_work);
> +			return true;
> +
> +		/* battery notification already sent to battery and ACPI device; ignore */
> +		case GB_KEY_BATTERY_NOTIFY_KEYUP:
> +		case GB_KEY_BATTERY_NOTIFY_KEYDOWN:
> +			return true;
> +
> +		default:
> +			/*
> +			 * Report the previously filtered e0 before continuing
> +			 * with the next non-filtered byte.
> +			 */
> +			serio_interrupt(port, 0xe0, 0);
> +			return false;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static void galaxybook_i8042_filter_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	i8042_remove_filter(galaxybook_i8042_filter);
> +	if (galaxybook->has_kbd_backlight)
> +		cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
> +	if (galaxybook->has_camera_lens_cover)
> +		cancel_work_sync(&galaxybook->camera_lens_cover_hotkey_work);
> +}
> +
> +static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
> +{
> +	int err;
> +
> +	if (!galaxybook->has_kbd_backlight && !galaxybook->has_camera_lens_cover)
> +		return 0;
> +
> +	if (galaxybook->has_kbd_backlight)
> +		INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
> +			  galaxybook_kbd_backlight_hotkey_work);
> +
> +	if (galaxybook->has_camera_lens_cover)
> +		INIT_WORK(&galaxybook->camera_lens_cover_hotkey_work,
> +			  galaxybook_camera_lens_cover_hotkey_work);
> +
> +	err = i8042_install_filter(galaxybook_i8042_filter);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action_or_reset(&galaxybook->platform->dev,
> +					galaxybook_i8042_filter_remove, galaxybook);
> +}
> +
> +/*
> + * ACPI device setup
> + */
> +
> +static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	switch (event) {
> +	case ACPI_NOTIFY_BATTERY_STATE_CHANGED:
> +	case ACPI_NOTIFY_DEVICE_ON_TABLE:
> +	case ACPI_NOTIFY_DEVICE_OFF_TABLE:
> +		break;
> +	case ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE:
> +		if (galaxybook->has_performance_mode)
> +			platform_profile_cycle();
> +		break;
> +	default:
> +		dev_warn(&galaxybook->acpi->dev, "unknown ACPI notification event: 0x%x\n", event);
> +	}
> +
> +	acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(&galaxybook->platform->dev),
> +					event, 1);
> +}
> +
> +static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *galaxybook)
> +{
> +	struct sawb buf = { 0 };
> +	int err;
> +
> +	err = galaxybook_enable_acpi_feature(galaxybook, SASB_NOTIFICATIONS);
> +	if (err)
> +		return err;
> +
> +	buf.safn = SAFN;
> +	buf.sasb = SASB_NOTIFICATIONS;
> +	buf.gunm = GUNM_ACPI_NOTIFY_ENABLE;
> +	buf.guds[0] = GUDS_ACPI_NOTIFY_ENABLE;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static void galaxybook_acpi_remove_notify_handler(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	acpi_remove_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
> +				   galaxybook_acpi_notify);
> +}
> +
> +static void galaxybook_acpi_disable(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook = data;
> +
> +	acpi_execute_simple_method(galaxybook->acpi->handle,
> +				   ACPI_METHOD_ENABLE, ACPI_METHOD_ENABLE_OFF);
> +}
> +
> +static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
> +{
> +	acpi_status status;
> +	int err;
> +
> +	status = acpi_execute_simple_method(galaxybook->acpi->handle, ACPI_METHOD_ENABLE,
> +					    ACPI_METHOD_ENABLE_ON);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +	err = devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_acpi_disable, galaxybook);
> +	if (err)
> +		return err;
> +
> +	status = acpi_install_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
> +					     galaxybook_acpi_notify, galaxybook);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +	err = devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_acpi_remove_notify_handler, galaxybook);
> +	if (err)
> +		return err;
> +
> +	err = galaxybook_enable_acpi_notify(galaxybook);
> +	if (err)
> +		dev_warn(&galaxybook->platform->dev, "failed to enable ACPI notifications; "
> +			 "some hotkeys will not be supported\n");
> +
> +	err = galaxybook_enable_acpi_feature(galaxybook, SASB_POWER_MANAGEMENT);
> +	if (err)
> +		dev_warn(&galaxybook->acpi->dev,
> +			 "failed to initialize ACPI power management features; "
> +			 "many features of this driver will not be available\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * Platform driver
> + */
> +
> +static int galaxybook_probe(struct platform_device *pdev)
> +{
> +	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
> +	struct samsung_galaxybook *galaxybook;
> +	int err;
> +
> +	if (!adev)
> +		return -ENODEV;
> +
> +	galaxybook = devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_KERNEL);
> +	if (!galaxybook)
> +		return -ENOMEM;
> +
> +	/* set static pointer here so it can be used in i8042 filter */
> +	if (galaxybook_ptr)
> +		return -EBUSY;
> +	galaxybook_ptr = galaxybook;
> +
> +	galaxybook->platform = pdev;
> +	galaxybook->acpi = adev;
> +
> +	dev_set_drvdata(&galaxybook->platform->dev, galaxybook);
> +
> +	err = galaxybook_input_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +				     "failed to initialize input device\n");
> +
> +	err = galaxybook_acpi_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->acpi->dev, err,
> +				     "failed to initialize ACPI device\n");
> +
> +	galaxybook_profile_init(galaxybook);
> +	galaxybook_battery_threshold_init(galaxybook);
> +
> +	err = galaxybook_camera_lens_cover_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->acpi->dev, err,
> +				     "failed to initialize camera_lens_cover\n");
> +
> +	err = galaxybook_kbd_backlight_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->acpi->dev, err,
> +				     "failed to initialize kbd_backlight\n");
> +
> +	err = galaxybook_fw_attrs_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +				     "failed to initialize firmware-attributes\n");
> +
> +	err = galaxybook_i8042_filter_install(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +				     "failed to initialize i8042_filter\n");
> +
> +	return 0;
> +}
> +
> +static void galaxybook_remove(struct platform_device *pdev)
> +{
> +	if (galaxybook_ptr)
> +		galaxybook_ptr = NULL;

Please someone correct me if I'm wrong.

Device resources get released after calling the .remove callback,
therefore there is a small window in which the i8042 filter is *still*
installed after this point, which means you could dereference a NULL
pointer.

I suggest not using devres for the i8042 filter.

~ Kurt

> +}
> +
> +static struct platform_driver galaxybook_platform_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.acpi_match_table = galaxybook_device_ids,
> +	},
> +	.probe = galaxybook_probe,
> +	.remove = galaxybook_remove,
> +};
> +module_platform_driver(galaxybook_platform_driver);
> +
> +MODULE_AUTHOR("Joshua Grisham <josh@joshuagrisham.com>");
> +MODULE_DESCRIPTION("Samsung Galaxy Book Extras");
> +MODULE_LICENSE("GPL");

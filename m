Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B43264F2;
	Wed, 10 Jun 2026 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081055; cv=none; b=lZrxdVn6xvQzBf6KUzhkvADUiv0KCyQwHbputb3oVxBexbll0jERuRxViiiQTluRCsQkD4WwdpAtx1njAf6RYnj5uvIqZOWn8UJZcb4Xb2YjHobOAAxDfFal6czGbf104xzftWpue6XqRNg1YJYi5EBYwc1bazFfHGKJHwt4cYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081055; c=relaxed/simple;
	bh=b5n4a9alEgFRNNINbaRDsfuzhUhw1HTSmxmRikN3SKg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=W08fRN6QoKIezoTnPcZC8C9F3mnDj7hs1bmOibL2LO8HVXJXpyGTkrkTnKuWvwL6jaKahwFe39IA9wvY6r0PBqF20xxfbx809rHnkfSlcogHQWQUKrfA35uNC73szWW7nx9VEmm3q/FXGWkPPT5t5buFhsVybz1Q/U/zirm6Cs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TEATRGiG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TEATRGiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781081054; x=1812617054;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=b5n4a9alEgFRNNINbaRDsfuzhUhw1HTSmxmRikN3SKg=;
  b=TEATRGiGWHvy+QO/DVxl1OYq+9npN5ptSvl94PFIYudzCtZoH1Dsqnok
   CxTNcvgvv7JIY8kKcmL8YO0n6HWF5OEdl+0Wgk4I+cQN4D1aR3T8o4692
   R6hgl+TGyWIwfmyYxNpnntHH27GJvBIYoNUs14nFXw4wyBAdNS+SOjt1u
   dGUwZbesJp+7QvCfqFr+XpkszJgnVY+h5jB3imAHmr1JGtDi3koZSShU2
   jP+ihwyODASWpgjBit9N/IXGOWYRIVt5Lkj0p57qpxXUCkLMyWJLECNQw
   y4vXD+dSaFwRuCustD2UGjZq0XEsQLTmpJ3u4vexMigGXpWslnP2x84Hp
   Q==;
X-CSE-ConnectionGUID: THpqp9IhR3Se3ie/3jFrvA==
X-CSE-MsgGUID: mGyRBsq5TSerp1/4N3KdUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92186801"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92186801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 01:44:11 -0700
X-CSE-ConnectionGUID: Yxe5xZ4eSMaLT4XtVYAA+w==
X-CSE-MsgGUID: nhGsZp/CRRu3Ag0SnXJQMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="244975525"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.18])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 01:44:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jun 2026 11:44:04 +0300 (EEST)
To: Dave Carey <carvsdriver@gmail.com>
cc: platform-driver-x86@vger.kernel.org, johannes.goede@oss.qualcomm.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, armin.wolf@outlook.de, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard
 dock detection driver
In-Reply-To: <20260609212631.925943-3-carvsdriver@gmail.com>
Message-ID: <51eeb7f9-ad94-da92-0adb-4f0e6863e7b1@linux.intel.com>
References: <20260608215205.678182-1-carvsdriver@gmail.com> <20260609212631.925943-1-carvsdriver@gmail.com> <20260609212631.925943-3-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-751216523-1781080207=:1359"
Content-ID: <faeededb-2f94-fe80-82b6-792f4a53c154@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-751216523-1781080207=:1359
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <2e106296-7349-48aa-79d3-c6c5a90a3ba4@linux.intel.com>

On Tue, 9 Jun 2026, Dave Carey wrote:

> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboard
> that magnetically attaches to the bottom (secondary) screen in one of two
> positions.  The Embedded Controller tracks the attachment state in a 2-bi=
t
> field called BKBD and signals changes via WMI event GUID
> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
> device, _UID "GMZN").
>=20
> The device contains embedded BMOF data (WQDD, 20705 bytes) documenting
> both WMI interfaces used by this driver:
>=20
>   LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
>   The ACPI _WED(0xEB) method returns EC.BKBD directly as an integer,
>   so the notify callback receives BKBD without a separate query.
>=20
>   LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
>   8-byte buffer {uint32 IDs=3D0x00060000, uint32 Status=3DBKBD}.
>   Used for the initial state read on probe and after resume.
>=20
> BKBD encoding:
>   0 =3D keyboard detached
>   1 =3D keyboard docked on top half of bottom screen
>   2 =3D keyboard docked on bottom half of bottom screen
>   3 =3D reserved (not observed in practice)
>=20
> This driver:
>   - Registers two WMI drivers: one on the event GUID (LENOVO_BTKBD_EVENT)
>     and one on the block GUID (LENOVO_FEATURE_STATUS_DATA).
>   - On probe, reads initial BKBD state via wmidev_query_block() on the
>     block device; whichever driver probes last triggers the initial read.
>   - On WMI notification, reads BKBD directly from the event data integer
>     (ACPI _WED(0xEB) returns EC.BKBD) without a redundant WQAF call.
>   - Reports SW_TABLET_MODE=3D1 when detached, SW_TABLET_MODE=3D0 when doc=
ked
>     in either position (a physical keyboard is present in both cases).
>   - Exposes the raw BKBD value via read-only sysfs attribute
>     "keyboard_position".
>   - Re-reads BKBD state on resume from suspend or hibernation.
>=20
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
>=20
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> ---
> v7:
> - Use wmidev_query_block() in place of deprecated wmidev_block_query().
>   Use __free(kfree) to manage the output buffer; simplify the parsing
>   to a single length check now that the WMI core handles type conversion.
> - Define BKBD_FIELD with GENMASK() and extract the field with FIELD_GET()
>   instead of open-coded masking.
> - Use guard(mutex) for all lock/unlock pairs.
> - Add yb9_kbdock_sync_locked() helper to consolidate the duplicated
>   initial-state read pattern in event_probe, block_probe, and resume.
> - Add linux/bitfield.h, linux/cleanup.h, linux/slab.h includes.
> - Fix comment on struct mutex field; use Context:/Returns: sections in
>   the kerneldoc comment for yb9_kbdock_query_locked().
>=20
> v6:
> - Submitted as 2/2; patch 1/2 adds a DMI early-exit to lenovo-ymc to
>   prevent duplicate SW_TABLET_MODE input nodes on the YB9.
>=20
> v5:
> - Rewrote as two WMI drivers (event + block) to avoid the deprecated
>   wmi_query_block() API: event driver owns the GUID that delivers
>   notifications, block driver owns the GUID used for querying state.
>   Either can probe first; both probe callbacks check whether the other
>   has already probed and fire the initial read when both are ready.
> - Use wmidev_block_query() on the block wmi_device directly (replaces
>   the deprecated wmi_query_block()).
> - In the notify callback, read BKBD directly from the event data integer
>   passed by the WMI core (_WED(0xEB) returns EC.BKBD; confirmed by
>   decoding the embedded BMOF from WQDD).  Eliminates the redundant WQAF
>   call that v4 made on every notification.
> - Documented the two BMOF classes (LENOVO_BTKBD_EVENT and
>   LENOVO_FEATURE_STATUS_DATA) with field layouts in the commit message
>   and file header.
> - sysfs keyboard_position: output bare integer, drop the parenthetical
>   position-name suffix that a couple of reviewers found non-standard.
> - Set .no_singleton =3D true on both WMI drivers (was missing from block
>   driver in v4).
> - Add PM resume callback (yb9_kbdock_resume) to re-read BKBD state
>   after suspend/hibernation.
>=20
> v4:
> - Dropped module_wmi_driver(); registered two WMI drivers manually to
>   allow sharing state.  module_init/exit pair registers/unregisters
>   both.
> - Added ATTRIBUTE_GROUPS() and .dev_groups for the sysfs attribute.
> - sysfs show: performed a live query instead of returning a cached value.
>=20
> v3:
> - Switched to devm_input_allocate_device().
> - Added DMI guard (dmi_check_system) to reject non-YB9 machines.
> - Removed redundant MODULE_DEVICE_TABLE on block driver.
>=20
> v2:
> - Added .no_singleton =3D true on the event WMI driver.
> - Added PM suspend/resume skeleton.
> - Fixed MODULE_LICENSE to "GPL" (was "GPL v2").
>=20
>  .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 +
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/lenovo/Kconfig           |  14 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/yb9-kbdock.c      | 317 ++++++++++++++++++
>  5 files changed, 358 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbd=
ock
>  create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/D=
ocumentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> @@ -0,0 +1,19 @@
> +What:=09=09/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_positi=
on
> +Date:=09=09April 2026
> +KernelVersion:=096.10
> +Contact:=09Dave Carey <carvsdriver@gmail.com>
> +Description:
> +=09=09Read-only attribute reporting the current keyboard dock position
> +=09=09as reported by the Embedded Controller on the Lenovo Yoga Book 9
> +=09=0914IAH10.
> +
> +=09=09Possible values:
> +
> +=09=09=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=09=090   keyboard is not docked to any screen (detached)
> +=09=091   keyboard docked on the top half of the bottom screen
> +=09=092   keyboard docked on the bottom half of the bottom screen
> +=09=09=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=09=09SW_TABLET_MODE input events are also emitted: 0 when the keyboard
> +=09=09is docked (either position), 1 when detached.
> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14479,6 +14479,13 @@ L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
>  F:=09drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
> =20
> +LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
> +M:=09Dave Carey <carvsdriver@gmail.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> +F:=09drivers/platform/x86/lenovo/yb9-kbdock.c
> +
>  LETSKETCH HID TABLET DRIVER
>  M:=09Hans de Goede <hansg@kernel.org>
>  L:=09linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>  =09      To compile this driver as a module, choose M here: the module
>  =09      will be called lenovo-wmi-camera.
> =20
> +config LENOVO_YB9_KBDOCK
> +=09tristate "Lenovo Yoga Book 9 keyboard dock detection"
> +=09depends on ACPI_WMI
> +=09depends on DMI
> +=09depends on INPUT
> +=09help
> +=09  Say Y here to enable keyboard dock detection on the Lenovo Yoga Boo=
k 9
> +=09  14IAH10.  The detachable Bluetooth keyboard magnetically attaches t=
o
> +=09  either screen; this driver reports SW_TABLET_MODE input events base=
d
> +=09  on the attachment state and exposes the raw position in sysfs.
> +
> +=09  To compile this driver as a module, choose M here: the module will =
be
> +=09  called lenovo-yb9-kbdock.
> +
>  config LENOVO_YMC
>  =09tristate "Lenovo Yoga Tablet Mode Control"
>  =09depends on ACPI_WMI
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/=
lenovo/Makefile
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_LMI)=09+=3D think-lmi.o
>  obj-$(CONFIG_THINKPAD_ACPI)=09+=3D thinkpad_acpi.o
> =20
>  lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)=09+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)=09+=3D yb9-kbdock.o
>  lenovo-target-$(CONFIG_LENOVO_YMC)=09+=3D ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)=09+=3D yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)=09+=3D yoga-tab2-pro-1380-fastcharger.o
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform/=
x86/lenovo/yb9-kbdock.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,317 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Yoga Book 9 keyboard-dock detection
> + *
> + * The Yoga Book 9 ships with a detachable Bluetooth keyboard that magne=
tically
> + * attaches to the bottom screen in one of two positions.  The EC tracks
> + * attachment state in a 2-bit field called BKBD and signals changes via=
 WMI
> + * event 0xEB on the WM10 ACPI device (_UID "GMZN").
> + *
> + * BKBD values:
> + *   0 =3D keyboard detached
> + *   1 =3D keyboard docked on the top half of the bottom screen
> + *   2 =3D keyboard docked on the bottom half of the bottom screen
> + *   3 =3D reserved / not observed
> + *
> + * Two WMI interfaces are used (documented in embedded BMOF, WQDD, 20705=
 bytes):
> + *
> + *   LENOVO_BTKBD_EVENT (event GUID, 806BD2A2-...)
> + *     WmiDataId(1) uint32 Status =E2=80=94 _WED(0xEB) returns EC.BKBD d=
irectly.
> + *     The notify callback receives BKBD as an integer; no separate quer=
y needed.
> + *
> + *   LENOVO_FEATURE_STATUS_DATA (block GUID, E7F300FA-...)
> + *     WmiDataId(1) uint32 IDs   =3D 0x00060000 (feature selector)
> + *     WmiDataId(2) uint32 Status =3D BKBD value
> + *     Used on probe and resume to read initial state.
> + *
> + * SW_TABLET_MODE=3D1 is reported when the keyboard is detached;
> + * SW_TABLET_MODE=3D0 when docked in either position (keyboard present).
> + * The raw BKBD value is exposed via the sysfs attribute "keyboard_posit=
ion".
> + *
> + * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID=09"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID=09"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +/* 2-bit EC field encoding the keyboard dock position */
> +#define BKBD_FIELD=09=09GENMASK(1, 0)

Please add

#include <linux/bits.h>

> +
> +/* BKBD encoding */
> +#define BKBD_DETACHED=09=090
> +#define BKBD_TOP_HALF=09=091
> +#define BKBD_BOTTOM_HALF=092
> +
> +static const struct dmi_system_id yb9_kbdock_dmi_table[] =3D {
> +=09{
> +=09=09/* Lenovo Yoga Book 9 14IAH10 */
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +=09=09},
> +=09},
> +=09{ }
> +};
> +
> +/*
> + * Shared state between the event and block WMI drivers.  Protected by l=
ock.
> + * The lock may be held across wmidev_query_block() calls (which can sle=
ep);
> + * block_remove() acquires the lock before clearing block_wdev, ensuring
> + * block_wdev remains valid for the duration of any in-progress query.
> + */
> +static struct {
> +=09struct mutex lock; /* protects input_dev and block_wdev */
> +=09struct input_dev *input_dev;=09/* set by event probe */
> +=09struct wmi_device *block_wdev;=09/* set by block probe */
> +} yb9;
> +
> +/**
> + * yb9_kbdock_query_locked() - Read BKBD from the block device.
> + * @log_dev: Device for logging.
> + *
> + * Context: Caller must hold yb9.lock.
> + * Returns: 0-3 on success, -errno on failure.
> + */
> +static int yb9_kbdock_query_locked(struct device *log_dev)
> +{
> +=09struct wmi_buffer out =3D {};
> +=09void *data __free(kfree) =3D NULL;

This variable should be declared down below where you assign the real=20
value to it (to understand the reasonale, please see the long comment in=20
cleanup.h).

> +=09u32 bkbd;
> +=09int ret;
> +
> +=09if (!yb9.block_wdev)
> +=09=09return -ENODEV;
> +
> +=09ret =3D wmidev_query_block(yb9.block_wdev, 0, &out);

This isn't based on the latest WMI core code?

/**
 * wmidev_query_block - Return contents of a WMI data block
 * @wdev: A wmi bus device from a driver
 * @instance: Instance index
 * @out: WMI buffer to fill
 * @min_size: Minimum size of the result data in bytes

The latest WMI core can also handle size check for you.

> +=09if (ret) {
> +=09=09dev_warn(log_dev, "WQAF failed: %d\n", ret);

Still missing an include for dev_*() printing.

> +=09=09return ret;
> +=09}
> +
> +=09data =3D out.data;
> +
> +=09/*
> +=09 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=3D0x00060000, Statu=
s=3DBKBD}.
> +=09 * BKBD is at bytes 4-7.
> +=09 */
> +=09if (out.length < 8) {
> +=09=09dev_warn(log_dev, "WQAF: buffer too short (%zu)\n", out.length);
> +=09=09return -EIO;
> +=09}
> +
> +=09memcpy(&bkbd, (u8 *)data + 4, sizeof(bkbd));

Why is data void * if you need to do this?

> +=09return (int)FIELD_GET(BKBD_FIELD, bkbd);

Unnecessary cast.

> +}
> +
> +/* Report SW_TABLET_MODE from BKBD.  Caller must hold yb9.lock. */
> +static void yb9_kbdock_report_locked(int bkbd, struct device *log_dev)
> +{
> +=09int tablet =3D (bkbd =3D=3D BKBD_DETACHED) ? 1 : 0;
> +
> +=09input_report_switch(yb9.input_dev, SW_TABLET_MODE, tablet);
> +=09input_sync(yb9.input_dev);
> +=09dev_dbg(log_dev, "BKBD=3D%d SW_TABLET_MODE=3D%d\n", bkbd, tablet);
> +}
> +
> +/* Read BKBD and report if both WMI devices are ready.  Caller must hold=
 yb9.lock. */
> +static void yb9_kbdock_sync_locked(struct device *log_dev)
> +{
> +=09int bkbd;
> +
> +=09if (!yb9.input_dev || !yb9.block_wdev)
> +=09=09return;
> +
> +=09bkbd =3D yb9_kbdock_query_locked(log_dev);
> +=09if (bkbd >=3D 0)
> +=09=09yb9_kbdock_report_locked(bkbd, log_dev);
> +}
> +
> +/* ------------------------------------------------------------------
> + * sysfs
> + * ------------------------------------------------------------------ */
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +=09=09=09=09      struct device_attribute *attr, char *buf)
> +{
> +=09int bkbd;
> +
> +=09guard(mutex)(&yb9.lock);
> +=09bkbd =3D yb9_kbdock_query_locked(dev);
> +
> +=09if (bkbd < 0)

Please don't leave empty line between call and it's error handling.

> +=09=09return bkbd;
> +=09return sysfs_emit(buf, "%u\n", (unsigned int)bkbd);

Just print with %d instead to avoid the cast.

> +}
> +static DEVICE_ATTR_RO(keyboard_position);
> +
> +static struct attribute *yb9_kbdock_attrs[] =3D {
> +=09&dev_attr_keyboard_position.attr,
> +=09NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);
> +
> +/* ------------------------------------------------------------------
> + * Event WMI driver =E2=80=94 LENOVO_BTKBD_EVENT
> + * ------------------------------------------------------------------ */
> +
> +static void yb9_kbdock_notify(struct wmi_device *wdev, union acpi_object=
 *data)
> +{
> +=09u32 bkbd;
> +
> +=09/*
> +=09 * _WED(0xEB) returns EC.BKBD directly as an integer
> +=09 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> +=09 */
> +=09if (!data || data->type !=3D ACPI_TYPE_INTEGER) {
> +=09=09dev_warn(&wdev->dev, "unexpected event data type %d\n",
> +=09=09=09 data ? data->type : -1);
> +=09=09return;
> +=09}
> +=09bkbd =3D FIELD_GET(BKBD_FIELD, data->integer.value);
> +
> +=09guard(mutex)(&yb9.lock);
> +=09if (yb9.input_dev)
> +=09=09yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +}
> +
> +static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *c=
tx)
> +{
> +=09struct input_dev *input_dev;
> +=09int err;
> +
> +=09if (!dmi_check_system(yb9_kbdock_dmi_table))
> +=09=09return -ENODEV;
> +
> +=09input_dev =3D devm_input_allocate_device(&wdev->dev);
> +=09if (!input_dev)
> +=09=09return -ENOMEM;
> +
> +=09input_dev->name =3D "Lenovo Yoga Book 9 keyboard dock switch";
> +=09input_dev->phys =3D YB9_KBDOCK_EVENT_GUID "/input0";
> +=09input_dev->id.bustype =3D BUS_HOST;
> +=09input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +=09err =3D input_register_device(input_dev);
> +=09if (err)
> +=09=09return err;
> +
> +=09guard(mutex)(&yb9.lock);
> +=09yb9.input_dev =3D input_dev;
> +=09yb9_kbdock_sync_locked(&wdev->dev);
> +=09return 0;
> +}
> +
> +static void yb9_kbdock_event_remove(struct wmi_device *wdev)
> +{
> +=09guard(mutex)(&yb9.lock);
> +=09yb9.input_dev =3D NULL;
> +}
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +=09guard(mutex)(&yb9.lock);
> +=09yb9_kbdock_sync_locked(dev);
> +=09return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_resu=
me);
> +
> +static const struct wmi_device_id yb9_kbdock_event_id_table[] =3D {
> +=09{ .guid_string =3D YB9_KBDOCK_EVENT_GUID },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
> +
> +static struct wmi_driver yb9_kbdock_event_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "lenovo-yb9-kbdock",
> +=09=09.dev_groups =3D yb9_kbdock_groups,
> +=09=09.pm =3D pm_sleep_ptr(&yb9_kbdock_pm_ops),
> +=09},
> +=09.id_table =3D yb9_kbdock_event_id_table,
> +=09.no_singleton =3D true,
> +=09.probe =3D yb9_kbdock_event_probe,
> +=09.remove =3D yb9_kbdock_event_remove,
> +=09.notify =3D yb9_kbdock_notify,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Block WMI driver =E2=80=94 LENOVO_FEATURE_STATUS_DATA
> + * ------------------------------------------------------------------ */
> +
> +static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *c=
tx)
> +{
> +=09if (!dmi_check_system(yb9_kbdock_dmi_table))
> +=09=09return -ENODEV;
> +
> +=09guard(mutex)(&yb9.lock);
> +=09yb9.block_wdev =3D wdev;
> +=09yb9_kbdock_sync_locked(&wdev->dev);
> +=09return 0;
> +}
> +
> +static void yb9_kbdock_block_remove(struct wmi_device *wdev)
> +{
> +=09guard(mutex)(&yb9.lock);
> +=09yb9.block_wdev =3D NULL;
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_block_id_table[] =3D {
> +=09{ .guid_string =3D YB9_KBDOCK_QUERY_GUID },
> +=09{ }
> +};
> +
> +static struct wmi_driver yb9_kbdock_block_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "lenovo-yb9-kbdock-block",
> +=09},
> +=09.id_table =3D yb9_kbdock_block_id_table,
> +=09.no_singleton =3D true,
> +=09.probe =3D yb9_kbdock_block_probe,
> +=09.remove =3D yb9_kbdock_block_remove,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Module init / exit
> + * ------------------------------------------------------------------ */
> +
> +static int __init yb9_kbdock_init(void)
> +{
> +=09int ret;
> +
> +=09mutex_init(&yb9.lock);

You'd need a pairing mutex_destroy() but please use devm_mutex_init()=20
instead so don't need to handle it manually (remember to do error=20
handling for devm_mutex_init() as it can fail).

> +
> +=09ret =3D wmi_driver_register(&yb9_kbdock_event_driver);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D wmi_driver_register(&yb9_kbdock_block_driver);
> +=09if (ret) {
> +=09=09wmi_driver_unregister(&yb9_kbdock_event_driver);
> +=09=09return ret;
> +=09}
> +=09return 0;
> +}
> +module_init(yb9_kbdock_init);
> +
> +static void __exit yb9_kbdock_exit(void)
> +{
> +=09wmi_driver_unregister(&yb9_kbdock_block_driver);
> +=09wmi_driver_unregister(&yb9_kbdock_event_driver);
> +}
> +module_exit(yb9_kbdock_exit);
> +
> +MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
> +MODULE_LICENSE("GPL");
>=20
> --
> 2.54.0
>=20

--=20
 i.
--8323328-751216523-1781080207=:1359--

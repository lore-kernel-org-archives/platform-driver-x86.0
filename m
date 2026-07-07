Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEA41DECD
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431655; cv=none; b=gLahT/JSE7ViFFiqm1RgswkxA9oKGgny0b9EqVb6srYzz3bUW0X7cPCA0uEGUUmpT8QCOqa00MI3elmg1x5anATm9gH8usIyY7rqMwvxNSCMWI3hodP7ZI2NhjEAvX+pImXVUQ2G4FBbvAcoASVcPCsWk8E4fkit1eGKu4ERQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431655; c=relaxed/simple;
	bh=7xJgmucfAVEMkOyzCnRHuLS/bLht+FKK++Rjtn4gLE4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P3buJzDt0kpOQEKdtftotBABwBrxPKOYnDbSal3I0G0frJbSPZXiDHspPEsblwKJBZq5L7Xj2geB4+a5KoZPtfF0xmYrbBaqiRBPX/jhqsVrWW7vVCQJPVfHiEMn1mlWZ8sBsCQNc7TKN0FlQKml7di6Iukf1eGn3jrC17J9Uw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUmBb4zT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUmBb4zT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783431653; x=1814967653;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7xJgmucfAVEMkOyzCnRHuLS/bLht+FKK++Rjtn4gLE4=;
  b=EUmBb4zTB288WYuYiou7oolYovhUv0v65+BdNJzyAEIaJAPEnWpHtC4k
   haquy7i/uBe8cC9cjTEtIGqmod3ye9d/JZzop81z4S++uolAF4pjo2Ias
   Ob+0nGLgjGVbZlyuUHN/wzZDW2HfjqdTuv5upIiY5AMl65x5aqSDsT7q3
   olujrQUOrSAbwzr8pPrjgmWrSKzQ6GP8pghRwPun3KM5we4p4viE+wYoT
   T/PdJoYKYNA9youFayocF570gcJz+kxqJ1xrzPtX9peYAuXmZlColvrez
   QpesQLmC6xfjitANP0O7lTdE+dOEuuusOkYAOIRRfZagItK0K71vwcD+/
   A==;
X-CSE-ConnectionGUID: DeoGCbyMSseSzWFplHeHNQ==
X-CSE-MsgGUID: oLHJ6yeJSx2/fHzODgLcTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101623308"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="101623308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:40:52 -0700
X-CSE-ConnectionGUID: ooel8/bgSNWo0OW5kDGRpQ==
X-CSE-MsgGUID: Z+FMrnIfQMSg0T2zMl6jUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="284108717"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 06:40:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 16:40:47 +0300 (EEST)
To: Dave Carey <carvsdriver@gmail.com>
cc: platform-driver-x86@vger.kernel.org, W_Armin@gmx.de, 
    Hans de Goede <hansg@kernel.org>, johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v11 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard
 dock detection driver
In-Reply-To: <20260623125914.833063-3-carvsdriver@gmail.com>
Message-ID: <7897a6df-25d4-bb3d-0804-64d9f9298ee0@linux.intel.com>
References: <8f84ca57-b856-4da0-8d90-e2be414f8997@gmx.de> <20260623125914.833063-1-carvsdriver@gmail.com> <20260623125914.833063-3-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1931719807-1783431647=:1152"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1931719807-1783431647=:1152
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 23 Jun 2026, Dave Carey wrote:

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
> This driver registers two WMI drivers sharing a module-level
> BLOCKING_NOTIFIER_HEAD:
>=20
>   - The event driver (LENOVO_BTKBD_EVENT) uses .notify_new() to receive
>     a pre-parsed wmi_buffer and fires the notifier chain with the BKBD
>     value extracted from the buffer.
>=20
>   - The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_dev in
>     its per-device private struct.  At probe time it registers a
>     notifier_block on the chain and reads the initial BKBD state via
>     wmidev_query_block().  The WMI buffer is parsed as
>     struct lenovo_feature_status { __le32 id; __le32 status; }, and the
>     ID field is verified before the status is used.
>=20
>   - SW_TABLET_MODE=3D1 is reported when the keyboard is detached;
>     SW_TABLET_MODE=3D0 when docked in either position (keyboard present).
>=20
>   - The raw BKBD value is exposed via read-only sysfs attribute
>     "keyboard_position".
>=20
>   - BKBD state is re-read via wmidev_query_block() on resume from
>     suspend or hibernation.
>=20
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
>=20
> Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> ---
> v11:
> - ABI doc: correct Date to "June 2027" and KernelVersion to "7.3"; these
>   fields should reflect when the ABI lands in the kernel, not the
>   submission date (Armin Wolf).
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
>  .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 ++
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/lenovo/Kconfig           |  14 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/yb9-kbdock.c      | 310 ++++++++++++++++++
>  5 files changed, 351 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbd=
ock
>  create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/D=
ocumentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> index 0000000..ebe713a
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> @@ -0,0 +1,19 @@
> +What:=09=09/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_positi=
on
> +Date:=09=09June 2027
> +KernelVersion:=097.3
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
> index d1cc0e1..00e8275 100644
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
> index 9c48487..938b361 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called lenovo-wmi-camera.
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
> index 7b2128e..2842d7d 100644
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
> index 0000000..dbf7ff4
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,310 @@
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
> + * The event driver (LENOVO_BTKBD_EVENT) fires a notifier chain on each =
WMI
> + * event.  The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_=
dev
> + * and registers a notifier_block to receive those events, eliminating t=
he
> + * need for shared global state or a mutex.
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
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID=09"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID=09"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +/* BKBD encoding */
> +#define BKBD_DETACHED=09=090
> +
> +/* LENOVO_FEATURE_STATUS_DATA feature selector */
> +#define YB9_FEATURE_STATUS_ID=090x00060000u
> +
> +/*
> + * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {uint32 IDs, uint32 Status}=
=2E
> + * IDs is always 0x00060000; Status holds the BKBD value (0=E2=80=933).
> + */
> +struct lenovo_feature_status {
> +=09__le32 id;
> +=09__le32 status;
> +} __packed;

Add includes for __packed and __le32.

> +
> +/* ------------------------------------------------------------------
> + * Notifier chain =E2=80=94 event driver fires it, block driver listens
> + * ------------------------------------------------------------------ */
> +
> +static BLOCKING_NOTIFIER_HEAD(yb9_kbdock_chain_head);
> +
> +static void devm_yb9_kbdock_unregister_notifier(void *data)
> +{
> +=09struct notifier_block *nb =3D data;
> +
> +=09blocking_notifier_chain_unregister(&yb9_kbdock_chain_head, nb);
> +}
> +
> +static int devm_yb9_kbdock_register_notifier(struct device *dev,
> +=09=09=09=09=09      struct notifier_block *nb)
> +{
> +=09int ret;
> +
> +=09ret =3D blocking_notifier_chain_register(&yb9_kbdock_chain_head, nb);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return devm_add_action_or_reset(dev, devm_yb9_kbdock_unregister_notif=
ier, nb);
> +}
> +
> +/* ------------------------------------------------------------------
> + * Block WMI driver =E2=80=94 LENOVO_FEATURE_STATUS_DATA
> + * (owns input_dev, sysfs, PM resume)
> + * ------------------------------------------------------------------ */
> +
> +struct yb9_kbdock_data {
> +=09struct wmi_device=09*wdev;
> +=09struct input_dev=09*input_dev;
> +=09struct notifier_block=09 nb;
> +};
> +
> +static int yb9_kbdock_query(struct yb9_kbdock_data *d)
> +{
> +=09struct wmi_buffer out =3D {};
> +=09int ret;
> +
> +=09ret =3D wmidev_query_block(d->wdev, 0, &out,
> +=09=09=09=09 sizeof(struct lenovo_feature_status));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09struct lenovo_feature_status *fs __free(kfree) =3D out.data;
> +
> +=09if (le32_to_cpu(fs->id) !=3D YB9_FEATURE_STATUS_ID)
> +=09=09return -EIO;
> +
> +=09return le32_to_cpu(fs->status);
> +}
> +
> +static void yb9_kbdock_report(struct yb9_kbdock_data *d, u32 bkbd)
> +{
> +=09int tablet =3D (bkbd =3D=3D BKBD_DETACHED) ? 1 : 0;
> +
> +=09input_report_switch(d->input_dev, SW_TABLET_MODE, tablet);
> +=09input_sync(d->input_dev);
> +=09dev_dbg(&d->wdev->dev, "BKBD=3D%u SW_TABLET_MODE=3D%d\n", bkbd, table=
t);
> +}
> +
> +static void yb9_kbdock_sync(struct yb9_kbdock_data *d)
> +{
> +=09int bkbd =3D yb9_kbdock_query(d);
> +
> +=09if (bkbd >=3D 0)
> +=09=09yb9_kbdock_report(d, bkbd);
> +}
> +
> +static int yb9_kbdock_nb_call(struct notifier_block *nb,
> +=09=09=09       unsigned long bkbd, void *unused)
> +{
> +=09struct yb9_kbdock_data *d =3D
> +=09=09container_of(nb, struct yb9_kbdock_data, nb);
> +
> +=09yb9_kbdock_report(d, bkbd);
> +=09return NOTIFY_DONE;
> +}
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +=09=09=09=09       struct device_attribute *attr,
> +=09=09=09=09       char *buf)
> +{
> +=09struct yb9_kbdock_data *d =3D dev_get_drvdata(dev);
> +=09int bkbd =3D yb9_kbdock_query(d);
> +
> +=09if (bkbd < 0)
> +=09=09return bkbd;
> +=09return sysfs_emit(buf, "%d\n", bkbd);

Add include.

> +}
> +static DEVICE_ATTR_RO(keyboard_position);
> +
> +static const struct attribute * const yb9_kbdock_attrs[] =3D {
> +=09&dev_attr_keyboard_position.attr,
> +=09NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +=09struct yb9_kbdock_data *d =3D dev_get_drvdata(dev);
> +
> +=09yb9_kbdock_sync(d);
> +=09return 0;
> +}
> +static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_resu=
me);
> +
> +static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *c=
tx)
> +{
> +=09struct yb9_kbdock_data *d;
> +=09struct input_dev *input_dev;
> +=09int ret;
> +
> +=09d =3D devm_kzalloc(&wdev->dev, sizeof(*d), GFP_KERNEL);
> +=09if (!d)
> +=09=09return -ENOMEM;
> +
> +=09d->wdev =3D wdev;
> +
> +=09input_dev =3D devm_input_allocate_device(&wdev->dev);
> +=09if (!input_dev)
> +=09=09return -ENOMEM;
> +
> +=09input_dev->name=09=09=3D "Lenovo Yoga Book 9 keyboard dock switch";
> +=09input_dev->phys=09=09=3D YB9_KBDOCK_QUERY_GUID "/input0";
> +=09input_dev->id.bustype=09=3D BUS_HOST;
> +=09input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +=09ret =3D input_register_device(input_dev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09d->input_dev=09=09=3D input_dev;
> +=09d->nb.notifier_call=09=3D yb9_kbdock_nb_call;
> +
> +=09ret =3D devm_yb9_kbdock_register_notifier(&wdev->dev, &d->nb);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09dev_set_drvdata(&wdev->dev, d);
> +=09yb9_kbdock_sync(d);
> +=09return 0;
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_block_id_table[] =3D {
> +=09{ .guid_string =3D YB9_KBDOCK_QUERY_GUID },
> +=09{ }
> +};
> +
> +static struct wmi_driver yb9_kbdock_block_driver =3D {
> +=09.driver =3D {
> +=09=09.name=09=09=3D "lenovo-yb9-kbdock",
> +=09=09.dev_groups=09=3D yb9_kbdock_groups,
> +=09=09.pm=09=09=3D pm_sleep_ptr(&yb9_kbdock_pm_ops),
> +=09},
> +=09.id_table=09=3D yb9_kbdock_block_id_table,
> +=09.no_singleton=09=3D true,
> +=09.probe=09=09=3D yb9_kbdock_block_probe,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Event WMI driver =E2=80=94 LENOVO_BTKBD_EVENT
> + * (fires the notifier chain on each WMI event)
> + * ------------------------------------------------------------------ */
> +
> +static void yb9_kbdock_notify_new(struct wmi_device *wdev,
> +=09=09=09=09  const struct wmi_buffer *data)
> +{
> +=09/*
> +=09 * _WED(0xEB) returns EC.BKBD directly as a 32-bit integer
> +=09 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> +=09 */
> +=09if (!data || data->length < sizeof(__le32))
> +=09=09return;
> +
> +=09u32 bkbd =3D le32_to_cpu(*(const __le32 *)data->data);
> +
> +=09blocking_notifier_call_chain(&yb9_kbdock_chain_head, bkbd, NULL);
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_event_id_table[] =3D {
> +=09{ .guid_string =3D YB9_KBDOCK_EVENT_GUID },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
> +
> +static struct wmi_driver yb9_kbdock_event_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "lenovo-yb9-kbdock-event",
> +=09},
> +=09.id_table=09=3D yb9_kbdock_event_id_table,
> +=09.no_singleton=09=3D true,
> +=09.notify_new=09=3D yb9_kbdock_notify_new,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Module init / exit
> + * ------------------------------------------------------------------ */
> +
> +static const struct dmi_system_id yb9_kbdock_dmi_table[] __initconst =3D=
 {
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
> +static int __init yb9_kbdock_init(void)
> +{
> +=09int ret;
> +
> +=09if (!dmi_check_system(yb9_kbdock_dmi_table))
> +=09=09return -ENODEV;
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
> +
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

--=20
 i.

--8323328-1931719807-1783431647=:1152--

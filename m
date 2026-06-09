Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5B739E6CD;
	Tue,  9 Jun 2026 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998468; cv=none; b=M8LS3DmRcOS/Y9VSiwAURo2z019fDVnM6/TktucNMKDqkDtb17GaesUJ7MLs88wAYw+ZfDvpPQeFt9onRrxUfsnLe1vsUBLd4rEEXkHJcYCvjb7bghiygaZwJ5MmXMWePztr0WBekgtR2RNauYGQgcXEyBZrqi22Scoi4Za0QxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998468; c=relaxed/simple;
	bh=DicigjoTsIMg6Yy1NlxpRF8aJt9wOzC9FHkKpY79Q6M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MSJN3fMbWvJv7sWpqOxKhUm/Und6wedXabufGvLvxvMy2bxbUtyFJ924VdYve0NKQ6O09xqWZmBHxnU+j71mV+4VdsZ6dOu1ymrYS+hlnMxObJmfzpaEq2hC/xBwhSjv4ztSrDULsA5M9SJh5yqDE1CGT8MJ/NlRjaM+CS+VXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moRdi2gQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moRdi2gQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780998467; x=1812534467;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DicigjoTsIMg6Yy1NlxpRF8aJt9wOzC9FHkKpY79Q6M=;
  b=moRdi2gQPMh0iz9nQqyRHaY9KpG8rLF60AwDbrsY0CpA3L8ljqrIYbaM
   CH4RqGFeJvcEzgtJuAiqIHoOYMLisZwqp4Ig+etV1KtWxkVOAOMgAQ84E
   gOrbkvwPTAQdpTKVp1vbHG9ohhSjharhdmweX61B4jOlkgIHeECfdkcH2
   Ua/SIKAM/PMOsHEEg2ILpBfVtUZ+3Hkxsl6VhI3K3l13hGxQRUTwHNGdD
   RMqZ/R8h+4FU9HFP8bRrcS6Xttd9RK96WpKjbbWyXmiOpRspkaCcj+5Ts
   vlu1+x7r7muKhxayS5o4OJzWE9cMzdhKJB1hNNpmQw5eRNauRBniEfJlU
   w==;
X-CSE-ConnectionGUID: B0+ISvPJTOWntOXwheQS1Q==
X-CSE-MsgGUID: ah7+VOjiTaeR5hmmIowaqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="104418161"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="104418161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 02:47:46 -0700
X-CSE-ConnectionGUID: 36yzvmdgQ6ebeCqmSbL0Vg==
X-CSE-MsgGUID: wGhElcR5SKOufaV2Y7YUqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="245912930"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 02:47:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 12:47:40 +0300 (EEST)
To: Dave Carey <carvsdriver@gmail.com>
cc: platform-driver-x86@vger.kernel.org, johannes.goede@oss.qualcomm.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, armin.wolf@outlook.de, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard
 dock detection driver
In-Reply-To: <20260608215205.678182-3-carvsdriver@gmail.com>
Message-ID: <32ae78eb-37ab-db82-9882-6c13f71e5c45@linux.intel.com>
References: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com> <20260608215205.678182-1-carvsdriver@gmail.com> <20260608215205.678182-3-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-720711083-1780998460=:1206"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-720711083-1780998460=:1206
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 8 Jun 2026, Dave Carey wrote:

> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboard
> that magnetically attaches to the bottom (secondary) screen in one of two
> positions.  The Embedded Controller tracks the attachment state in a 2-bi=
t
> field called BKBD

Please add a define for the field then with GENMASK() and extract it with=
=20
FIELD_GET(). Don't forget to add headers.

> and signals changes via WMI event GUID
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
>   - On probe, reads initial BKBD state via wmidev_block_query() on the
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
>  drivers/platform/x86/lenovo/yb9-kbdock.c      | 324 ++++++++++++++++++
>  5 files changed, 365 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbd=
ock
>  create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/D=
ocumentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> index 0000000..04e5293
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
> index d1cc0e1..00e8275 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14479,6 +14479,13 @@ L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
>  F:=09drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>=20
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
>=20
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
>=20
>  lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)=09+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)=09+=3D yb9-kbdock.o
>  lenovo-target-$(CONFIG_LENOVO_YMC)=09+=3D ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)=09+=3D yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)=09+=3D yoga-tab2-pro-1380-fastcharger.o
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform/=
x86/lenovo/yb9-kbdock.c
> new file mode 100644
> index 0000000..28a3ec7
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,324 @@
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
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID=09"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID=09"E7F300FA-21CD-4003-ADAC-2696135982E6"
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
> +=09struct mutex lock;

Please add a short comment here on the same line too about what it=20
protects.

> +=09struct input_dev *input_dev;=09/* set by event probe */
> +=09struct wmi_device *block_wdev;=09/* set by block probe */
> +} yb9;
> +
> +/*
> + * Read BKBD from the block device via wmidev_block_query().
> + * Returns 0-3 on success, -errno on failure.  Caller must hold yb9.lock=
=2E

To match kerneldoc formatting guidelines, use:

Context: Caller must hold yb9.lock.

Returns:


> + */
> +static int yb9_kbdock_query_locked(struct device *log_dev)
> +{
> +=09union acpi_object *obj;
> +=09u32 bkbd;
> +
> +=09if (!yb9.block_wdev)
> +=09=09return -ENODEV;
> +
> +=09obj =3D wmidev_block_query(yb9.block_wdev, 0);

This is interface is deprecated:

 * wmidev_block_query - Return contents of a WMI block (deprectated)

> +=09if (!obj) {
> +=09=09dev_warn(log_dev, "WQAF returned NULL\n");

Please add include.

> +=09=09return -EIO;
> +=09}
> +
> +=09/*
> +=09 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=3D0x00060000, Statu=
s=3DBKBD}.
> +=09 */
> +=09if (obj->type =3D=3D ACPI_TYPE_BUFFER && obj->buffer.length >=3D 8) {
> +=09=09memcpy(&bkbd, obj->buffer.pointer + 4, sizeof(bkbd));
> +=09=09bkbd &=3D 0x3;
> +=09} else if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +=09=09bkbd =3D obj->integer.value & 0x3;
> +=09} else {
> +=09=09dev_warn(log_dev, "WQAF: unexpected type %d len %u\n",
> +=09=09=09 obj->type,
> +=09=09=09 obj->type =3D=3D ACPI_TYPE_BUFFER ? obj->buffer.length : 0);
> +=09=09kfree(obj);
> +=09=09return -EIO;
> +=09}
> +
> +=09kfree(obj);

Please add include for kfree().

With the new WMI API, please use __free() to avoid dupli

> +=09return (int)bkbd;
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
> +/* ------------------------------------------------------------------
> + * sysfs
> + * ------------------------------------------------------------------ */
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +=09=09=09=09      struct device_attribute *attr, char *buf)
> +{
> +=09int bkbd;
> +
> +=09mutex_lock(&yb9.lock);
> +=09bkbd =3D yb9_kbdock_query_locked(dev);
> +=09mutex_unlock(&yb9.lock);
> +
> +=09if (bkbd < 0)
> +=09=09return bkbd;
> +=09return sysfs_emit(buf, "%u\n", (unsigned int)bkbd);
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
> +=09bkbd =3D data->integer.value & 0x3;
> +
> +=09mutex_lock(&yb9.lock);

guard()

> +=09if (yb9.input_dev)
> +=09=09yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +=09mutex_unlock(&yb9.lock);
> +}
> +
> +static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *c=
tx)
> +{
> +=09struct input_dev *input_dev;
> +=09int bkbd, err;
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
> +=09mutex_lock(&yb9.lock);

guard()

> +=09yb9.input_dev =3D input_dev;
> +=09/* Read initial state if the block device has already probed. */
> +=09if (yb9.block_wdev) {
> +=09=09bkbd =3D yb9_kbdock_query_locked(&wdev->dev);
> +=09=09if (bkbd >=3D 0)
> +=09=09=09yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +=09}
> +=09mutex_unlock(&yb9.lock);
> +
> +=09return 0;
> +}
> +
> +static void yb9_kbdock_event_remove(struct wmi_device *wdev)
> +{
> +=09mutex_lock(&yb9.lock);

guard()

> +=09yb9.input_dev =3D NULL;
> +=09mutex_unlock(&yb9.lock);
> +}
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +=09int bkbd;
> +
> +=09mutex_lock(&yb9.lock);
> +=09if (yb9.input_dev && yb9.block_wdev) {
> +=09=09bkbd =3D yb9_kbdock_query_locked(dev);
> +=09=09if (bkbd >=3D 0)
> +=09=09=09yb9_kbdock_report_locked(bkbd, dev);

This looks mostly duplicated with the code in yb9_kbdock_event_probe(),=20
try to consolidate somehow.

> +=09}
> +=09mutex_unlock(&yb9.lock);
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
> +=09int bkbd;
> +
> +=09if (!dmi_check_system(yb9_kbdock_dmi_table))
> +=09=09return -ENODEV;
> +
> +=09mutex_lock(&yb9.lock);
> +=09yb9.block_wdev =3D wdev;
> +=09/* Read initial state if the event device has already probed. */
> +=09if (yb9.input_dev) {
> +=09=09bkbd =3D yb9_kbdock_query_locked(&wdev->dev);
> +=09=09if (bkbd >=3D 0)
> +=09=09=09yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +=09}
> +=09mutex_unlock(&yb9.lock);

More duplication?

> +=09return 0;
> +}
> +
> +static void yb9_kbdock_block_remove(struct wmi_device *wdev)
> +{
> +=09mutex_lock(&yb9.lock);

guard()

> +=09yb9.block_wdev =3D NULL;
> +=09mutex_unlock(&yb9.lock);
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
> --
> 2.54.0
>=20

--=20
 i.

--8323328-720711083-1780998460=:1206--

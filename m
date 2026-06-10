Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DA3165F1A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109629; cv=none; b=pfXNTd2ichGLvFmUvv3huYd8Hh+JEwx4ndijScMz7dJzAOgRPkr+ekCEtJafEn2RF5PvkZXp5KK1mBZVCqGZNqr22RXlvLTSS1FMB1RdjPgH+h7nm7kgMauMWjxacuCGzjSYKh4CzWq4VJeHsUPbG5c5fg+mLgbnXnEaC/dnn/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109629; c=relaxed/simple;
	bh=ZvURlrgKCbHhK82B9ifJpEQZlh6kirQ+ptn1WnV5CYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRBEMoeOS7EXo+OrF1xWoZ1EK3MhYWx0TBKQnBDNa3VkTfNIavbpn1OSxPQDa5mAG+4cqPUEXQoLwFZ64N23bVjhSssXIGeBrz4uJNFazMdnGtvf/k49x0hAZuK66KNcNkol3S42O5XZlK7fJKGXTzEL9U9XOsmgboyQ1Wdkkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISFhu8i8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISFhu8i8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4936D1F00893;
	Wed, 10 Jun 2026 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109628;
	bh=fPNFcTypdwx30NVC1Zu79M6FlCtgRFu/OVMCoIFET7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ISFhu8i8L3oZ2DzJvWXT+eOczCqLRwIhR1Df3K8DxUL4Sb68xjKq8gRy3/HIpX/8l
	 8+tWsT2kgimJNtQIs5QYfU0ytDbQlWn8+xvMVWZvUK1CBG/QQPv/tlBIsLwo2o0mCA
	 icpLoYqWg2NdwoZmPGBPV0ytiG9izsJih2r2ScArzKDluK+xzpEjKe3270ubriGJqI
	 CDxi7OpVscJCU4v7lbLeL6HlCfqhOKLHYJyJLdHVefYhMDPQbG+SZ8zk1GGdtAmJwF
	 HGvZQFioweQ4H/RZv+BDxjtdgXo2IpliEGvd5CnwEN8pSBE0INBYWHEhspkaETeqpd
	 BYNFkJp0ljDfA==
Message-ID: <ad943d29-5f66-4757-8d9d-f63ee1cc7f97@kernel.org>
Date: Wed, 10 Jun 2026 18:40:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock
 detection driver
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com
References: <20260610155340.342949-1-carvsdriver@gmail.com>
 <20260610155340.342949-3-carvsdriver@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260610155340.342949-3-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10-Jun-26 17:53, Dave Carey wrote:
> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboard
> that magnetically attaches to the bottom (secondary) screen in one of two
> positions.  The Embedded Controller tracks the attachment state in a 2-bit
> field called BKBD and signals changes via WMI event GUID
> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
> device, _UID "GMZN").
> 
> The device contains embedded BMOF data (WQDD, 20705 bytes) documenting
> both WMI interfaces used by this driver:
> 
>   LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
>   The ACPI _WED(0xEB) method returns EC.BKBD directly as an integer,
>   so the notify callback receives BKBD without a separate query.
> 
>   LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
>   8-byte buffer {uint32 IDs=0x00060000, uint32 Status=BKBD}.
>   Used for the initial state read on probe and after resume.
> 
> BKBD encoding:
>   0 = keyboard detached
>   1 = keyboard docked on top half of bottom screen
>   2 = keyboard docked on bottom half of bottom screen
>   3 = reserved (not observed in practice)
> 
> This driver:
>   - Registers two WMI drivers: one on the event GUID (LENOVO_BTKBD_EVENT)
>     and one on the block GUID (LENOVO_FEATURE_STATUS_DATA).
>   - On probe, reads initial BKBD state via wmidev_query_block() on the
>     block device; whichever driver probes last triggers the initial read.
>   - On WMI notification, reads BKBD directly from the event data integer
>     (ACPI _WED(0xEB) returns EC.BKBD) without a redundant WQAF call.
>   - Reports SW_TABLET_MODE=1 when detached, SW_TABLET_MODE=0 when docked
>     in either position (a physical keyboard is present in both cases).
>   - Exposes the raw BKBD value via read-only sysfs attribute
>     "keyboard_position".
>   - Re-reads BKBD state on resume from suspend or hibernation.
> 
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
> 

Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

> Signed-off-by: Dave Carey <carvsdriver@gmail.com>

Regards,

Hans




> ---
> v8:
> - Add #include <linux/bits.h> (required for GENMASK).
> - Add #include <linux/dev_printk.h> (explicit include for dev_warn/dev_dbg).
> - Use __MUTEX_INITIALIZER(yb9.lock) for static mutex initialization; removes
>   mutex_init() call and the need for mutex_destroy().
> - Update wmidev_query_block() call to pass min_size=8; remove manual length
>   check that is now handled by the WMI core.
> - Move u8 *data __free(kfree) declaration to immediately after the successful
>   wmidev_query_block() call (cleanup.h convention).
> - Change data type from void * to u8 * to allow pointer arithmetic without cast.
> - Remove (int) cast from FIELD_GET() return value.
> - Remove blank line between yb9_kbdock_query_locked() call and error check in
>   keyboard_position_show().
> - Use %d format specifier in sysfs_emit(); remove (unsigned int) cast.
> 
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
> 
> v6:
> - Submitted as 2/2; patch 1/2 adds a DMI early-exit to lenovo-ymc to
>   prevent duplicate SW_TABLET_MODE input nodes on the YB9.
> 
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
> - Set .no_singleton = true on both WMI drivers (was missing from block
>   driver in v4).
> - Add PM resume callback (yb9_kbdock_resume) to re-read BKBD state
>   after suspend/hibernation.
> 
> v4:
> - Dropped module_wmi_driver(); registered two WMI drivers manually to
>   allow sharing state.  module_init/exit pair registers/unregisters
>   both.
> - Added ATTRIBUTE_GROUPS() and .dev_groups for the sysfs attribute.
> - sysfs show: performed a live query instead of returning a cached value.
> 
> v3:
> - Switched to devm_input_allocate_device().
> - Added DMI guard (dmi_check_system) to reject non-YB9 machines.
> - Removed redundant MODULE_DEVICE_TABLE on block driver.
> 
> v2:
> - Added .no_singleton = true on the event WMI driver.
> - Added PM suspend/resume skeleton.
> - Fixed MODULE_LICENSE to "GPL" (was "GPL v2").
> 
>  .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 ++
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/lenovo/Kconfig           |  14 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/yb9-kbdock.c      | 312 ++++++++++++++++++
>  5 files changed, 353 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
>  create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> index 0000000..04e5293
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> @@ -0,0 +1,19 @@
> +What:		/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_position
> +Date:		April 2026
> +KernelVersion:	6.10
> +Contact:	Dave Carey <carvsdriver@gmail.com>
> +Description:
> +		Read-only attribute reporting the current keyboard dock position
> +		as reported by the Embedded Controller on the Lenovo Yoga Book 9
> +		14IAH10.
> +
> +		Possible values:
> +
> +		==  =============================================================
> +		0   keyboard is not docked to any screen (detached)
> +		1   keyboard docked on the top half of the bottom screen
> +		2   keyboard docked on the bottom half of the bottom screen
> +		==  =============================================================
> +
> +		SW_TABLET_MODE input events are also emitted: 0 when the keyboard
> +		is docked (either position), 1 when detached.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e1..00e8275 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14479,6 +14479,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>  
> +LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
> +M:	Dave Carey <carvsdriver@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> +F:	drivers/platform/x86/lenovo/yb9-kbdock.c
> +
>  LETSKETCH HID TABLET DRIVER
>  M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index 9c48487..938b361 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called lenovo-wmi-camera.
>  
> +config LENOVO_YB9_KBDOCK
> +	tristate "Lenovo Yoga Book 9 keyboard dock detection"
> +	depends on ACPI_WMI
> +	depends on DMI
> +	depends on INPUT
> +	help
> +	  Say Y here to enable keyboard dock detection on the Lenovo Yoga Book 9
> +	  14IAH10.  The detachable Bluetooth keyboard magnetically attaches to
> +	  either screen; this driver reports SW_TABLET_MODE input events based
> +	  on the attachment state and exposes the raw position in sysfs.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called lenovo-yb9-kbdock.
> +
>  config LENOVO_YMC
>  	tristate "Lenovo Yoga Tablet Mode Control"
>  	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
> index 7b2128e..2842d7d 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>  
>  lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+= yb9-kbdock.o
>  lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform/x86/lenovo/yb9-kbdock.c
> new file mode 100644
> index 0000000..f00e5d4
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,312 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Yoga Book 9 keyboard-dock detection
> + *
> + * The Yoga Book 9 ships with a detachable Bluetooth keyboard that magnetically
> + * attaches to the bottom screen in one of two positions.  The EC tracks
> + * attachment state in a 2-bit field called BKBD and signals changes via WMI
> + * event 0xEB on the WM10 ACPI device (_UID "GMZN").
> + *
> + * BKBD values:
> + *   0 = keyboard detached
> + *   1 = keyboard docked on the top half of the bottom screen
> + *   2 = keyboard docked on the bottom half of the bottom screen
> + *   3 = reserved / not observed
> + *
> + * Two WMI interfaces are used (documented in embedded BMOF, WQDD, 20705 bytes):
> + *
> + *   LENOVO_BTKBD_EVENT (event GUID, 806BD2A2-...)
> + *     WmiDataId(1) uint32 Status — _WED(0xEB) returns EC.BKBD directly.
> + *     The notify callback receives BKBD as an integer; no separate query needed.
> + *
> + *   LENOVO_FEATURE_STATUS_DATA (block GUID, E7F300FA-...)
> + *     WmiDataId(1) uint32 IDs   = 0x00060000 (feature selector)
> + *     WmiDataId(2) uint32 Status = BKBD value
> + *     Used on probe and resume to read initial state.
> + *
> + * SW_TABLET_MODE=1 is reported when the keyboard is detached;
> + * SW_TABLET_MODE=0 when docked in either position (keyboard present).
> + * The raw BKBD value is exposed via the sysfs attribute "keyboard_position".
> + *
> + * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +/* 2-bit EC field encoding the keyboard dock position */
> +#define BKBD_FIELD		GENMASK(1, 0)
> +
> +/* BKBD encoding */
> +#define BKBD_DETACHED		0
> +#define BKBD_TOP_HALF		1
> +#define BKBD_BOTTOM_HALF	2
> +
> +static const struct dmi_system_id yb9_kbdock_dmi_table[] = {
> +	{
> +		/* Lenovo Yoga Book 9 14IAH10 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +		},
> +	},
> +	{ }
> +};
> +
> +/*
> + * Shared state between the event and block WMI drivers.  Protected by lock.
> + * The lock may be held across wmidev_query_block() calls (which can sleep);
> + * block_remove() acquires the lock before clearing block_wdev, ensuring
> + * block_wdev remains valid for the duration of any in-progress query.
> + */
> +static struct {
> +	struct mutex lock; /* protects input_dev and block_wdev */
> +	struct input_dev *input_dev;	/* set by event probe */
> +	struct wmi_device *block_wdev;	/* set by block probe */
> +} yb9 = {
> +	.lock = __MUTEX_INITIALIZER(yb9.lock),
> +};
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
> +	struct wmi_buffer out = {};
> +	u32 bkbd;
> +	int ret;
> +
> +	if (!yb9.block_wdev)
> +		return -ENODEV;
> +
> +	ret = wmidev_query_block(yb9.block_wdev, 0, &out, 8);
> +	if (ret) {
> +		dev_warn(log_dev, "WQAF failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	u8 *data __free(kfree) = out.data;
> +
> +	/*
> +	 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=0x00060000, Status=BKBD}.
> +	 * BKBD is at bytes 4-7.
> +	 */
> +	memcpy(&bkbd, data + 4, sizeof(bkbd));
> +	return FIELD_GET(BKBD_FIELD, bkbd);
> +}
> +
> +/* Report SW_TABLET_MODE from BKBD.  Caller must hold yb9.lock. */
> +static void yb9_kbdock_report_locked(int bkbd, struct device *log_dev)
> +{
> +	int tablet = (bkbd == BKBD_DETACHED) ? 1 : 0;
> +
> +	input_report_switch(yb9.input_dev, SW_TABLET_MODE, tablet);
> +	input_sync(yb9.input_dev);
> +	dev_dbg(log_dev, "BKBD=%d SW_TABLET_MODE=%d\n", bkbd, tablet);
> +}
> +
> +/* Read BKBD and report if both WMI devices are ready.  Caller must hold yb9.lock. */
> +static void yb9_kbdock_sync_locked(struct device *log_dev)
> +{
> +	int bkbd;
> +
> +	if (!yb9.input_dev || !yb9.block_wdev)
> +		return;
> +
> +	bkbd = yb9_kbdock_query_locked(log_dev);
> +	if (bkbd >= 0)
> +		yb9_kbdock_report_locked(bkbd, log_dev);
> +}
> +
> +/* ------------------------------------------------------------------
> + * sysfs
> + * ------------------------------------------------------------------ */
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	int bkbd;
> +
> +	guard(mutex)(&yb9.lock);
> +	bkbd = yb9_kbdock_query_locked(dev);
> +	if (bkbd < 0)
> +		return bkbd;
> +	return sysfs_emit(buf, "%d\n", bkbd);
> +}
> +static DEVICE_ATTR_RO(keyboard_position);
> +
> +static struct attribute *yb9_kbdock_attrs[] = {
> +	&dev_attr_keyboard_position.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);
> +
> +/* ------------------------------------------------------------------
> + * Event WMI driver — LENOVO_BTKBD_EVENT
> + * ------------------------------------------------------------------ */
> +
> +static void yb9_kbdock_notify(struct wmi_device *wdev, union acpi_object *data)
> +{
> +	u32 bkbd;
> +
> +	/*
> +	 * _WED(0xEB) returns EC.BKBD directly as an integer
> +	 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> +	 */
> +	if (!data || data->type != ACPI_TYPE_INTEGER) {
> +		dev_warn(&wdev->dev, "unexpected event data type %d\n",
> +			 data ? data->type : -1);
> +		return;
> +	}
> +	bkbd = FIELD_GET(BKBD_FIELD, data->integer.value);
> +
> +	guard(mutex)(&yb9.lock);
> +	if (yb9.input_dev)
> +		yb9_kbdock_report_locked(bkbd, &wdev->dev);
> +}
> +
> +static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	int err;
> +
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	input_dev = devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name = "Lenovo Yoga Book 9 keyboard dock switch";
> +	input_dev->phys = YB9_KBDOCK_EVENT_GUID "/input0";
> +	input_dev->id.bustype = BUS_HOST;
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	err = input_register_device(input_dev);
> +	if (err)
> +		return err;
> +
> +	guard(mutex)(&yb9.lock);
> +	yb9.input_dev = input_dev;
> +	yb9_kbdock_sync_locked(&wdev->dev);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_event_remove(struct wmi_device *wdev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9.input_dev = NULL;
> +}
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9_kbdock_sync_locked(dev);
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_resume);
> +
> +static const struct wmi_device_id yb9_kbdock_event_id_table[] = {
> +	{ .guid_string = YB9_KBDOCK_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
> +
> +static struct wmi_driver yb9_kbdock_event_driver = {
> +	.driver = {
> +		.name = "lenovo-yb9-kbdock",
> +		.dev_groups = yb9_kbdock_groups,
> +		.pm = pm_sleep_ptr(&yb9_kbdock_pm_ops),
> +	},
> +	.id_table = yb9_kbdock_event_id_table,
> +	.no_singleton = true,
> +	.probe = yb9_kbdock_event_probe,
> +	.remove = yb9_kbdock_event_remove,
> +	.notify = yb9_kbdock_notify,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Block WMI driver — LENOVO_FEATURE_STATUS_DATA
> + * ------------------------------------------------------------------ */
> +
> +static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	guard(mutex)(&yb9.lock);
> +	yb9.block_wdev = wdev;
> +	yb9_kbdock_sync_locked(&wdev->dev);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_block_remove(struct wmi_device *wdev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9.block_wdev = NULL;
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_block_id_table[] = {
> +	{ .guid_string = YB9_KBDOCK_QUERY_GUID },
> +	{ }
> +};
> +
> +static struct wmi_driver yb9_kbdock_block_driver = {
> +	.driver = {
> +		.name = "lenovo-yb9-kbdock-block",
> +	},
> +	.id_table = yb9_kbdock_block_id_table,
> +	.no_singleton = true,
> +	.probe = yb9_kbdock_block_probe,
> +	.remove = yb9_kbdock_block_remove,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Module init / exit
> + * ------------------------------------------------------------------ */
> +
> +static int __init yb9_kbdock_init(void)
> +{
> +	int ret;
> +
> +	ret = wmi_driver_register(&yb9_kbdock_event_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = wmi_driver_register(&yb9_kbdock_block_driver);
> +	if (ret) {
> +		wmi_driver_unregister(&yb9_kbdock_event_driver);
> +		return ret;
> +	}
> +	return 0;
> +}
> +module_init(yb9_kbdock_init);
> +
> +static void __exit yb9_kbdock_exit(void)
> +{
> +	wmi_driver_unregister(&yb9_kbdock_block_driver);
> +	wmi_driver_unregister(&yb9_kbdock_event_driver);
> +}
> +module_exit(yb9_kbdock_exit);
> +
> +MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
> +MODULE_LICENSE("GPL");


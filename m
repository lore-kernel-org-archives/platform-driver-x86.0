Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27CB28688C
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 18:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114408; cv=none; b=j9ZJdxIexpw/bfUF4WVfe+QgvjXjMLn6mbTUonQ0kBMNZLql8oeeKx4rScnSsC0fTo0RbNzJ91CEvBBT0ehwQNk3KBojgg8AALg2wnWbpvqaTobZtVpU5icJl45vOJ4ZNT/adDDnjRiWE1izwVhv2lWynW+gYCLpz0Cj4iFaDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114408; c=relaxed/simple;
	bh=3xg39klXI9N8qMNg8sOUiA8XaDP5VCFpFp7boKS/2XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2VcyrkhNZ55t1iUTSPOzspO9AjbJPmH1nr9vP4eastY/sbtlYnytg5o8SYaRJXq/lnYQ6viXOT4Cb8WWrgoHfIuemXzHONfVFiea5vtqdRNgLlOuLd+11OZSuactlqAEytXOgMNL+8ftTGThm+1gxeAvT4Mfyw6v8wqUnZU1Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QFH+oLrT; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QFH+oLrT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781114395; x=1781719195; i=w_armin@gmx.de;
	bh=lFT20/yyp2FWU/KyiORcAV/05HpkfqAOb1jQ8csXA2g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QFH+oLrT2B6hESHojgas4qYd58rWE3EdRcJuP3mrqLbpxFl5m6I/ClGXHwVMlQnX
	 732EQMsUJaYk2X+9suvc3qXL9fvAdtZlNMF1N1GNKkxiVqjFIhmJbvL1M4RNe2c8y
	 +yE75oMRAuqgQpWZKiZmlnyNKlTZRyTZwpu8mYKnOStfury+nOnAp02MQDS9w2aFK
	 vri3XIb1JF6YMNKHc6cWV6De57/UGpMTXva23GwNlqMUHJWaqqUFXFbb9Yj3PKltq
	 +B9Yn3rOzeWsiafnxNmP8B023rDXL0wPm7rzuUIoS2yzxRGdaR6gXAp+6c4rndNAH
	 3Fhqj26Q4FFqhCzWJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMfW-1wU3Is2i2O-00Fte2; Wed, 10
 Jun 2026 19:59:54 +0200
Message-ID: <e13e6d83-8796-48de-b3dc-97843d91c24b@gmx.de>
Date: Wed, 10 Jun 2026 19:59:53 +0200
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
Cc: ilpo.jarvinen@linux.intel.com, hansg@kernel.org
References: <20260610155340.342949-1-carvsdriver@gmail.com>
 <20260610155340.342949-3-carvsdriver@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260610155340.342949-3-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KsvitGekNktZCnRmGrxcKlsoI/bm3vqeDg4tafdfbOjjjNdm4Hz
 u3spHbJ0Z3eNtBDrEkZfnWIigg2RC0K6ILQ6OlqKXdNtGGe8AvgsequEmDNloJ8H+4/m1HV
 /ISHuU//kxYaQw71ajfNyP4pIfnOya9g4q/+WIzvtVf7Lsuk7eq6YNvyt7UnQa33Al/kHbE
 RCjPjeNrnW1MGKVu0zQJw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0we2Bqi1FNI=;T99YwP8Z0uUxMhJedHV50SDh9rF
 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
 =

Am 10.06.26 um 17:53 schrieb Dave Carey:

> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboar=
d
> that magnetically attaches to the bottom (secondary) screen in one of tw=
o
> positions.  The Embedded Controller tracks the attachment state in a 2-b=
it
> field called BKBD and signals changes via WMI event GUID
> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
> device, _UID "GMZN").
>
> The device contains embedded BMOF data (WQDD, 20705 bytes) documenting
> both WMI interfaces used by this driver:
>
>    LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
>    The ACPI _WED(0xEB) method returns EC.cd directly as an integer,
>    so the notify callback receives BKBD without a separate query.
>
>    LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
>    8-byte buffer {uint32 IDs=3D0x00060000, uint32 Status=3DBKBD}.
>    Used for the initial state read on probe and after resume.

Hi,

how many instances of the LENOVO_FEATURE_STATUS_DATA data block exist?
You can check this with the lswmi tool (https://pypi.org/project/lswmi/).

>
> BKBD encoding:
>    0 =3D keyboard detached
>    1 =3D keyboard docked on top half of bottom screen
>    2 =3D keyboard docked on bottom half of bottom screen
>    3 =3D reserved (not observed in practice)
>
> This driver:
>    - Registers two WMI drivers: one on the event GUID (LENOVO_BTKBD_EVEN=
T)
>      and one on the block GUID (LENOVO_FEATURE_STATUS_DATA).
>    - On probe, reads initial BKBD state via wmidev_query_block() on the
>      block device; whichever driver probes last triggers the initial rea=
d.
>    - On WMI notification, reads BKBD directly from the event data intege=
r
>      (ACPI _WED(0xEB) returns EC.BKBD) without a redundant WQAF call.
>    - Reports SW_TABLET_MODE=3D1 when detached, SW_TABLET_MODE=3D0 when d=
ocked
>      in either position (a physical keyboard is present in both cases).
>    - Exposes the raw BKBD value via read-only sysfs attribute
>      "keyboard_position".
>    - Re-reads BKBD state on resume from suspend or hibernation.
>
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
>
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> ---
> v8:
> - Add #include <linux/bits.h> (required for GENMASK).
> - Add #include <linux/dev_printk.h> (explicit include for dev_warn/dev_d=
bg).
> - Use __MUTEX_INITIALIZER(yb9.lock) for static mutex initialization; rem=
oves
>    mutex_init() call and the need for mutex_destroy().
> - Update wmidev_query_block() call to pass min_size=3D8; remove manual l=
ength
>    check that is now handled by the WMI core.
> - Move u8 *data __free(kfree) declaration to immediately after the succe=
ssful
>    wmidev_query_block() call (cleanup.h convention).
> - Change data type from void * to u8 * to allow pointer arithmetic witho=
ut cast.
> - Remove (int) cast from FIELD_GET() return value.
> - Remove blank line between yb9_kbdock_query_locked() call and error che=
ck in
>    keyboard_position_show().
> - Use %d format specifier in sysfs_emit(); remove (unsigned int) cast.
>
> v7:
> - Use wmidev_query_block() in place of deprecated wmidev_block_query().
>    Use __free(kfree) to manage the output buffer; simplify the parsing
>    to a single length check now that the WMI core handles type conversio=
n.
> - Define BKBD_FIELD with GENMASK() and extract the field with FIELD_GET(=
)
>    instead of open-coded masking.
> - Use guard(mutex) for all lock/unlock pairs.
> - Add yb9_kbdock_sync_locked() helper to consolidate the duplicated
>    initial-state read pattern in event_probe, block_probe, and resume.
> - Add linux/bitfield.h, linux/cleanup.h, linux/slab.h includes.
> - Fix comment on struct mutex field; use Context:/Returns: sections in
>    the kerneldoc comment for yb9_kbdock_query_locked().
>
> v6:
> - Submitted as 2/2; patch 1/2 adds a DMI early-exit to lenovo-ymc to
>    prevent duplicate SW_TABLET_MODE input nodes on the YB9.
>
> v5:
> - Rewrote as two WMI drivers (event + block) to avoid the deprecated
>    wmi_query_block() API: event driver owns the GUID that delivers
>    notifications, block driver owns the GUID used for querying state.
>    Either can probe first; both probe callbacks check whether the other
>    has already probed and fire the initial read when both are ready.
> - Use wmidev_block_query() on the block wmi_device directly (replaces
>    the deprecated wmi_query_block()).
> - In the notify callback, read BKBD directly from the event data integer
>    passed by the WMI core (_WED(0xEB) returns EC.BKBD; confirmed by
>    decoding the embedded BMOF from WQDD).  Eliminates the redundant WQAF
>    call that v4 made on every notification.
> - Documented the two BMOF classes (LENOVO_BTKBD_EVENT and
>    LENOVO_FEATURE_STATUS_DATA) with field layouts in the commit message
>    and file header.
> - sysfs keyboard_position: output bare integer, drop the parenthetical
>    position-name suffix that a couple of reviewers found non-standard.
> - Set .no_singleton =3D true on both WMI drivers (was missing from block
>    driver in v4).
> - Add PM resume callback (yb9_kbdock_resume) to re-read BKBD state
>    after suspend/hibernation.
>
> v4:
> - Dropped module_wmi_driver(); registered two WMI drivers manually to
>    allow sharing state.  module_init/exit pair registers/unregisters
>    both.
> - Added ATTRIBUTE_GROUPS() and .dev_groups for the sysfs attribute.
> - sysfs show: performed a live query instead of returning a cached value=
.
>
> v3:
> - Switched to devm_input_allocate_device().
> - Added DMI guard (dmi_check_system) to reject non-YB9 machines.
> - Removed redundant MODULE_DEVICE_TABLE on block driver.
>
> v2:
> - Added .no_singleton =3D true on the event WMI driver.
> - Added PM suspend/resume skeleton.
> - Fixed MODULE_LICENSE to "GPL" (was "GPL v2").
>
>   .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 ++
>   MAINTAINERS                                   |   7 +
>   drivers/platform/x86/lenovo/Kconfig           |  14 +
>   drivers/platform/x86/lenovo/Makefile          |   1 +
>   drivers/platform/x86/lenovo/yb9-kbdock.c      | 312 ++++++++++++++++++
>   5 files changed, 353 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-k=
bdock
>   create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/=
Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
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
> +		=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +		0   keyboard is not docked to any screen (detached)
> +		1   keyboard docked on the top half of the bottom screen
> +		2   keyboard docked on the bottom half of the bottom screen
> +		=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +		SW_TABLET_MODE input events are also emitted: 0 when the keyboard
> +		is docked (either position), 1 when detached.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e1..00e8275 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14479,6 +14479,13 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>  =20
> +LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
> +M:	Dave Carey <carvsdriver@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> +F:	drivers/platform/x86/lenovo/yb9-kbdock.c
> +
>   LETSKETCH HID TABLET DRIVER
>   M:	Hans de Goede <hansg@kernel.org>
>   L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/=
lenovo/Kconfig
> index 9c48487..938b361 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called lenovo-wmi-camera.
>  =20
> +config LENOVO_YB9_KBDOCK
> +	tristate "Lenovo Yoga Book 9 keyboard dock detection"
> +	depends on ACPI_WMI
> +	depends on DMI
> +	depends on INPUT
> +	help
> +	  Say Y here to enable keyboard dock detection on the Lenovo Yoga Book=
 9
> +	  14IAH10.  The detachable Bluetooth keyboard magnetically attaches to
> +	  either screen; this driver reports SW_TABLET_MODE input events based
> +	  on the attachment state and exposes the raw position in sysfs.
> +
> +	  To compile this driver as a module, choose M here: the module will b=
e
> +	  called lenovo-yb9-kbdock.
> +
>   config LENOVO_YMC
>   	tristate "Lenovo Yoga Tablet Mode Control"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86=
/lenovo/Makefile
> index 7b2128e..2842d7d 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
>  =20
>   lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+=3D yb9-kbdock.o
>   lenovo-target-$(CONFIG_LENOVO_YMC)	+=3D ymc.o
>   lenovo-target-$(CONFIG_YOGABOOK)	+=3D yogabook.o
>   lenovo-target-$(CONFIG_YT2_1380)	+=3D yoga-tab2-pro-1380-fastcharger.o
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform=
/x86/lenovo/yb9-kbdock.c
> new file mode 100644
> index 0000000..f00e5d4
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,312 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Yoga Book 9 keyboard-dock detection
> + *
> + * The Yoga Book 9 ships with a detachable Bluetooth keyboard that magn=
etically
> + * attaches to the bottom screen in one of two positions.  The EC track=
s
> + * attachment state in a 2-bit field called BKBD and signals changes vi=
a WMI
> + * event 0xEB on the WM10 ACPI device (_UID "GMZN").
> + *
> + * BKBD values:
> + *   0 =3D keyboard detached
> + *   1 =3D keyboard docked on the top half of the bottom screen
> + *   2 =3D keyboard docked on the bottom half of the bottom screen
> + *   3 =3D reserved / not observed
> + *
> + * Two WMI interfaces are used (documented in embedded BMOF, WQDD, 2070=
5 bytes):
> + *
> + *   LENOVO_BTKBD_EVENT (event GUID, 806BD2A2-...)
> + *     WmiDataId(1) uint32 Status =E2=80=94 _WED(0xEB) returns EC.BKBD =
directly.
> + *     The notify callback receives BKBD as an integer; no separate que=
ry needed.
> + *
> + *   LENOVO_FEATURE_STATUS_DATA (block GUID, E7F300FA-...)
> + *     WmiDataId(1) uint32 IDs   =3D 0x00060000 (feature selector)
> + *     WmiDataId(2) uint32 Status =3D BKBD value
> + *     Used on probe and resume to read initial state.
> + *
> + * SW_TABLET_MODE=3D1 is reported when the keyboard is detached;
> + * SW_TABLET_MODE=3D0 when docked in either position (keyboard present)=
.
> + * The raw BKBD value is exposed via the sysfs attribute "keyboard_posi=
tion".
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
> +static const struct dmi_system_id yb9_kbdock_dmi_table[] =3D {
> +	{
> +		/* Lenovo Yoga Book 9 14IAH10 */
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +		},
> +	},
> +	{ }
> +};
> +
> +/*
> + * Shared state between the event and block WMI drivers.  Protected by =
lock.
> + * The lock may be held across wmidev_query_block() calls (which can sl=
eep);
> + * block_remove() acquires the lock before clearing block_wdev, ensurin=
g
> + * block_wdev remains valid for the duration of any in-progress query.
> + */
> +static struct {
> +	struct mutex lock; /* protects input_dev and block_wdev */
> +	struct input_dev *input_dev;	/* set by event probe */
> +	struct wmi_device *block_wdev;	/* set by block probe */
> +} yb9 =3D {
> +	.lock =3D __MUTEX_INITIALIZER(yb9.lock),
> +};

Nack, having global data like this is not a good idea. Please use a notifi=
er like uniwill-wmi.c
to deliver WMI events to the WMI block driver, and put the input device in=
to the private data struct
of said driver.

This would also allow you to get rid of the mutex.

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
> +	struct wmi_buffer out =3D {};
> +	u32 bkbd;
> +	int ret;
> +
> +	if (!yb9.block_wdev)
> +		return -ENODEV;
> +
> +	ret =3D wmidev_query_block(yb9.block_wdev, 0, &out, 8);

Please define a struct like this:

struct lenovo_feature_status {
	__le32 id;
	__le32 status;
} __packed;

You should then use said struct for size calculations using sizeof()
and for accessing the individual fields using le32_to_cpu().

> +	if (ret) {
> +		dev_warn(log_dev, "WQAF failed: %d\n", ret);

Please drop the error message, passing on the error code should be enough.

> +		return ret;
> +	}
> +
> +	u8 *data __free(kfree) =3D out.data;
> +
> +	/*
> +	 * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {IDs=3D0x00060000, Status=
=3DBKBD}.
> +	 * BKBD is at bytes 4-7.
> +	 */
> +	memcpy(&bkbd, data + 4, sizeof(bkbd));
> +	return FIELD_GET(BKBD_FIELD, bkbd);

I think the whole 32-bit status field is meant to be used instead of only =
the first 2 bits.
Can you share the output of "acpidump" on this machine so i can take a loo=
k myself?

IMHO we should verify here that the ID value is correct.

> +}
> +
> +/* Report SW_TABLET_MODE from BKBD.  Caller must hold yb9.lock. */
> +static void yb9_kbdock_report_locked(int bkbd, struct device *log_dev)
> +{
> +	int tablet =3D (bkbd =3D=3D BKBD_DETACHED) ? 1 : 0;
> +
> +	input_report_switch(yb9.input_dev, SW_TABLET_MODE, tablet);
> +	input_sync(yb9.input_dev);
> +	dev_dbg(log_dev, "BKBD=3D%d SW_TABLET_MODE=3D%d\n", bkbd, tablet);
> +}
> +
> +/* Read BKBD and report if both WMI devices are ready.  Caller must hol=
d yb9.lock. */
> +static void yb9_kbdock_sync_locked(struct device *log_dev)
> +{
> +	int bkbd;
> +
> +	if (!yb9.input_dev || !yb9.block_wdev)
> +		return;
> +
> +	bkbd =3D yb9_kbdock_query_locked(log_dev);
> +	if (bkbd >=3D 0)
> +		yb9_kbdock_report_locked(bkbd, log_dev);
> +}
> +
> +/* ------------------------------------------------------------------
> + * sysfs
> + * ------------------------------------------------------------------ *=
/
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	int bkbd;
> +
> +	guard(mutex)(&yb9.lock);
> +	bkbd =3D yb9_kbdock_query_locked(dev);
> +	if (bkbd < 0)
> +		return bkbd;
> +	return sysfs_emit(buf, "%d\n", bkbd);
> +}
> +static DEVICE_ATTR_RO(keyboard_position);

Please mark this attribute as const. The same should be done with yb9_kbdo=
ck_attrs[].

> +
> +static struct attribute *yb9_kbdock_attrs[] =3D {
> +	&dev_attr_keyboard_position.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);
> +
> +/* ------------------------------------------------------------------
> + * Event WMI driver =E2=80=94 LENOVO_BTKBD_EVENT
> + * ------------------------------------------------------------------ *=
/
> +
> +static void yb9_kbdock_notify(struct wmi_device *wdev, union acpi_objec=
t *data)
> +{
> +	u32 bkbd;
> +
> +	/*
> +	 * _WED(0xEB) returns EC.BKBD directly as an integer
> +	 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> +	 */
> +	if (!data || data->type !=3D ACPI_TYPE_INTEGER) {
> +		dev_warn(&wdev->dev, "unexpected event data type %d\n",
> +			 data ? data->type : -1);
> +		return;
> +	}
> +	bkbd =3D FIELD_GET(BKBD_FIELD, data->integer.value);
> +
> +	guard(mutex)(&yb9.lock);
> +	if (yb9.input_dev)
> +		yb9_kbdock_report_locked(bkbd, &wdev->dev);

Please use .notify_new() instead of .notify() to avoid having to deal with=
 ACPI objects.

> +}
> +
> +static int yb9_kbdock_event_probe(struct wmi_device *wdev, const void *=
ctx)
> +{
> +	struct input_dev *input_dev;
> +	int err;
> +
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name =3D "Lenovo Yoga Book 9 keyboard dock switch";
> +	input_dev->phys =3D YB9_KBDOCK_EVENT_GUID "/input0";
> +	input_dev->id.bustype =3D BUS_HOST;
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	err =3D input_register_device(input_dev);
> +	if (err)
> +		return err;
> +
> +	guard(mutex)(&yb9.lock);
> +	yb9.input_dev =3D input_dev;
> +	yb9_kbdock_sync_locked(&wdev->dev);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_event_remove(struct wmi_device *wdev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9.input_dev =3D NULL;
> +}
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9_kbdock_sync_locked(dev);
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_res=
ume);
> +
> +static const struct wmi_device_id yb9_kbdock_event_id_table[] =3D {
> +	{ .guid_string =3D YB9_KBDOCK_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
> +
> +static struct wmi_driver yb9_kbdock_event_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-yb9-kbdock",
> +		.dev_groups =3D yb9_kbdock_groups,
> +		.pm =3D pm_sleep_ptr(&yb9_kbdock_pm_ops),
> +	},
> +	.id_table =3D yb9_kbdock_event_id_table,
> +	.no_singleton =3D true,
> +	.probe =3D yb9_kbdock_event_probe,
> +	.remove =3D yb9_kbdock_event_remove,
> +	.notify =3D yb9_kbdock_notify,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Block WMI driver =E2=80=94 LENOVO_FEATURE_STATUS_DATA
> + * ------------------------------------------------------------------ *=
/
> +
> +static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *=
ctx)
> +{
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	guard(mutex)(&yb9.lock);
> +	yb9.block_wdev =3D wdev;
> +	yb9_kbdock_sync_locked(&wdev->dev);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_block_remove(struct wmi_device *wdev)
> +{
> +	guard(mutex)(&yb9.lock);
> +	yb9.block_wdev =3D NULL;
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_block_id_table[] =3D {
> +	{ .guid_string =3D YB9_KBDOCK_QUERY_GUID },
> +	{ }
> +};
> +
> +static struct wmi_driver yb9_kbdock_block_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-yb9-kbdock-block",
> +	},
> +	.id_table =3D yb9_kbdock_block_id_table,
> +	.no_singleton =3D true,
> +	.probe =3D yb9_kbdock_block_probe,
> +	.remove =3D yb9_kbdock_block_remove,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Module init / exit
> + * ------------------------------------------------------------------ *=
/
> +
> +static int __init yb9_kbdock_init(void)
> +{
> +	int ret;

I think you should do the DMI check here. This would allow you to mark the=
 DMI whitelist
as __initconst.

Thanks,
Armin Wolf

> +
> +	ret =3D wmi_driver_register(&yb9_kbdock_event_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wmi_driver_register(&yb9_kbdock_block_driver);
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

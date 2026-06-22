Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062141A680A
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782163038; cv=none; b=BozxSNdk18XH0HMuefyVraOGlbvoTkwivirLMOR/sjTW8HR3dYm0Nk0qmASNnZ5aMkiviCcIZ2moun7Gl2+7IUOh4waMtL+eLm4XWtx6mDjc9lCxH3CxoFDR6dEq/OSP/eAB7BCbaNpb8xGwj408EpWrxBI6JpY2Yfg98kuSsoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782163038; c=relaxed/simple;
	bh=wNVyhn3YoefmsbBHKhtI2RpETLSPhEn4qK/hfuGvwQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrMIlI5vMeysb4en85aTJaBrjJLS4xkwVr2KjbIYd7Dh7buT2nv7ugf5yCBo6Xs6HoAGjvUbOi7nAr9d29SpgnfQuCBPrlyoaKBTE0lyMsD1r4abyi58TV12Y5lTF7mfGBo4vXZLXNFyuiXwwlKuM0wgdvPWy7HMvU/WGmKb7/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OQXKZUWO; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OQXKZUWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782163030; x=1782767830; i=w_armin@gmx.de;
	bh=pA9/L/IYPvpGvZU525/RfcBBE/ztknLMwDlH25g3LL4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OQXKZUWOdautNsAsFV9JS8NSC6yCNReleOaohvW8BciZ3nnWl9YFn5yX6c9WK5J6
	 aLnVlXccYTelY9GXxE+4p4Vgi6a85bBxhPToucT6BML+H5/Sm8wHqWMqDj+FKD3HV
	 2jf3DFYOsw22BgYyYG/uLAVENkreFB09xYiOTu6/VM5XD4YsBQEQJKJYE7Z4zlA/X
	 zjgVaq+PLH33C01nTdGzqltIxEfOLgc51KFmdDn2Q/jo5M6m4in5DkZB3rnEogIU5
	 ek3xwV5P3/AnPELh2a5cAg25nrjNpcy82N8rxkKRNKlfxeXiNwQGnIMwZwIEVwoYN
	 GQaAByBiot0IGEW1Ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRMs-1wjVm60iRo-00QaMX; Mon, 22
 Jun 2026 23:17:10 +0200
Message-ID: <8f84ca57-b856-4da0-8d90-e2be414f8997@gmx.de>
Date: Mon, 22 Jun 2026 23:17:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard
 dock detection driver
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
 johannes.goede@oss.qualcomm.com
References: <20260616143508.124122-1-carvsdriver@gmail.com>
 <20260621135744.504613-1-carvsdriver@gmail.com>
 <20260621135744.504613-3-carvsdriver@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260621135744.504613-3-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c4hXRThSrFdNDG50UaEqGYGoIS+Bv8uy3P4i+gMRzATCN8OFGaC
 g7cl4Kl0dN4nGTWo1A5/NJmIsceuVfxoRTeIZjeE3Ou90cyu4HFt8EbLdht7UiOZfH2NGtC
 nFOlD/c8aVbeZzADYSvaiBjbwvcu4zoVAGyw3IJFMT+OmyKdHY03E4nKj7NIyMMcuS4aiUz
 rkx+biTC+bHBE+nkUo+sw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yWonv/PDbsc=;kPkhRBbuhpFuT6NpPKzhzeiAi5E
 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
 e/Ad4RmCwYUW3f+zDdrCRzsK27CAhL

Am 21.06.26 um 15:57 schrieb Dave Carey:

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
>     LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
>     The ACPI _WED(0xEB) method returns EC.BKBD directly as an integer,
>     so the notify callback receives BKBD without a separate query.
>
>     LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
>     8-byte buffer {uint32 IDs=3D0x00060000, uint32 Status=3DBKBD}.
>     Used for the initial state read on probe and after resume.
>
> BKBD encoding:
>     0 =3D keyboard detached
>     1 =3D keyboard docked on top half of bottom screen
>     2 =3D keyboard docked on bottom half of bottom screen
>     3 =3D reserved (not observed in practice)
>
> This driver registers two WMI drivers sharing a module-level
> BLOCKING_NOTIFIER_HEAD:
>
>     - The event driver (LENOVO_BTKBD_EVENT) uses .notify_new() to receiv=
e
>       a pre-parsed wmi_buffer and fires the notifier chain with the BKBD
>       value extracted from the buffer.
>
>     - The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_dev i=
n
>       its per-device private struct.  At probe time it registers a
>       notifier_block on the chain and reads the initial BKBD state via
>       wmidev_query_block().  The WMI buffer is parsed as
>       struct lenovo_feature_status { __le32 id; __le32 status; }, and th=
e
>       ID field is verified before the status is used.
>
>     - SW_TABLET_MODE=3D1 is reported when the keyboard is detached;
>       SW_TABLET_MODE=3D0 when docked in either position (keyboard presen=
t).
>
>     - The raw BKBD value is exposed via read-only sysfs attribute
>       "keyboard_position".
>
>     - BKBD state is re-read via wmidev_query_block() on resume from
>       suspend or hibernation.
>
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
>
> Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> ---
>   .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 ++
>   MAINTAINERS                                   |   7 +
>   drivers/platform/x86/lenovo/Kconfig           |  14 +
>   drivers/platform/x86/lenovo/Makefile          |   1 +
>   drivers/platform/x86/lenovo/yb9-kbdock.c      | 322 ++++++++++++++++++
>   5 files changed, 363 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-k=
bdock
>   create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/=
Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> index 0000000..04e5294
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> @@ -0,0 +1,19 @@
> +What:		/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_position
> +Date:		June 2026
> +KernelVersion:	6.16

The Date and Version should show the date on which said ABI was accepted i=
nto the kernel.
So June 2027, 7.3 would be correct.

Please fix.

Other than that:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +		0   keyboard is not docked to any screen (detached)
> +		1   keyboard docked on the top half of the bottom screen
> +		2   keyboard docked on the bottom half of the bottom screen
> +		=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
>
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
>
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
> @@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
>
>   lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+=3D yb9-kbdock.o
>   lenovo-target-$(CONFIG_LENOVO_YMC)	+=3D ymc.o
>   lenovo-target-$(CONFIG_YOGABOOK)	+=3D yogabook.o
>   lenovo-target-$(CONFIG_YT2_1380)	+=3D yoga-tab2-pro-1380-fastcharger.o
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform=
/x86/lenovo/yb9-kbdock.c
> new file mode 100644
> index 0000000..0000000
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,322 @@
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
> + * The event driver (LENOVO_BTKBD_EVENT) fires a notifier chain on each=
 WMI
> + * event.  The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input=
_dev
> + * and registers a notifier_block to receive those events, eliminating =
the
> + * need for shared global state or a mutex.
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
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/dev_printk.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +/* BKBD encoding */
> +#define BKBD_DETACHED		0
> +
> +/* LENOVO_FEATURE_STATUS_DATA feature selector */
> +#define YB9_FEATURE_STATUS_ID	0x00060000u
> +
> +/*
> + * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {uint32 IDs, uint32 Status=
}.
> + * IDs is always 0x00060000; Status holds the BKBD value (0=E2=80=933).
> + */
> +struct lenovo_feature_status {
> +	__le32 id;
> +	__le32 status;
> +} __packed;
> +
> +/* ------------------------------------------------------------------
> + * Notifier chain =E2=80=94 event driver fires it, block driver listens
> + * ------------------------------------------------------------------ *=
/
> +
> +static BLOCKING_NOTIFIER_HEAD(yb9_kbdock_chain_head);
> +
> +static void devm_yb9_kbdock_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb =3D data;
> +
> +	blocking_notifier_chain_unregister(&yb9_kbdock_chain_head, nb);
> +}
> +
> +static int devm_yb9_kbdock_register_notifier(struct device *dev,
> +					      struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret =3D blocking_notifier_chain_register(&yb9_kbdock_chain_head, nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_yb9_kbdock_unregister_notifi=
er, nb);
> +}
> +
> +/* ------------------------------------------------------------------
> + * Block WMI driver =E2=80=94 LENOVO_FEATURE_STATUS_DATA
> + * (owns input_dev, sysfs, PM resume)
> + * ------------------------------------------------------------------ *=
/
> +
> +struct yb9_kbdock_data {
> +	struct wmi_device	*wdev;
> +	struct input_dev	*input_dev;
> +	struct notifier_block	 nb;
> +	spinlock_t		 lock;	/* protects input_report_switch + input_sync */
> +};
> +
> +static int yb9_kbdock_query(struct yb9_kbdock_data *d, u32 *bkbd)
> +{
> +	struct wmi_buffer out;
> +	int ret;
> +
> +	ret =3D wmidev_query_block(d->wdev, 0, &out,
> +				 sizeof(struct lenovo_feature_status));
> +	if (ret)
> +		return ret;
> +
> +	struct lenovo_feature_status *fs __free(kfree) =3D out.data;
> +
> +	if (le32_to_cpu(fs->id) !=3D YB9_FEATURE_STATUS_ID)
> +		return -EIO;
> +
> +	*bkbd =3D le32_to_cpu(fs->status);
> +	return 0;
> +}
> +
> +static void yb9_kbdock_report(struct yb9_kbdock_data *d, u32 bkbd)
> +{
> +	int tablet =3D (bkbd =3D=3D BKBD_DETACHED) ? 1 : 0;
> +
> +	spin_lock(&d->lock);
> +	input_report_switch(d->input_dev, SW_TABLET_MODE, tablet);
> +	input_sync(d->input_dev);
> +	spin_unlock(&d->lock);
> +	dev_dbg(&d->wdev->dev, "BKBD=3D%u SW_TABLET_MODE=3D%d\n", bkbd, tablet=
);
> +}
> +
> +static int yb9_kbdock_sync(struct yb9_kbdock_data *d)
> +{
> +	u32 bkbd;
> +	int ret;
> +
> +	ret =3D yb9_kbdock_query(d, &bkbd);
> +	if (ret)
> +		return ret;
> +
> +	yb9_kbdock_report(d, bkbd);
> +	return 0;
> +}
> +
> +static int yb9_kbdock_nb_call(struct notifier_block *nb,
> +			       unsigned long bkbd, void *unused)
> +{
> +	struct yb9_kbdock_data *d =3D
> +		container_of(nb, struct yb9_kbdock_data, nb);
> +
> +	yb9_kbdock_report(d, bkbd);
> +	return NOTIFY_DONE;
> +}
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buf)
> +{
> +	struct yb9_kbdock_data *d =3D dev_get_drvdata(dev);
> +	u32 bkbd;
> +	int ret;
> +
> +	ret =3D yb9_kbdock_query(d, &bkbd);
> +	if (ret)
> +		return ret;
> +	return sysfs_emit(buf, "%u\n", bkbd);
> +}
> +static DEVICE_ATTR_RO(keyboard_position);
> +
> +static const struct attribute * const yb9_kbdock_attrs[] =3D {
> +	&dev_attr_keyboard_position.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);
> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +	struct yb9_kbdock_data *d =3D dev_get_drvdata(dev);
> +
> +	return yb9_kbdock_sync(d);
> +}
> +static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_res=
ume);
> +
> +static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *=
ctx)
> +{
> +	struct yb9_kbdock_data *d;
> +	struct input_dev *input_dev;
> +	int ret;
> +
> +	d =3D devm_kzalloc(&wdev->dev, sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return -ENOMEM;
> +
> +	d->wdev =3D wdev;
> +	spin_lock_init(&d->lock);
> +
> +	input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name		=3D "Lenovo Yoga Book 9 keyboard dock switch";
> +	input_dev->phys		=3D YB9_KBDOCK_QUERY_GUID "/input0";
> +	input_dev->id.bustype	=3D BUS_HOST;
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	ret =3D input_register_device(input_dev);
> +	if (ret)
> +		return ret;
> +
> +	d->input_dev		=3D input_dev;
> +	d->nb.notifier_call	=3D yb9_kbdock_nb_call;
> +
> +	ret =3D devm_yb9_kbdock_register_notifier(&wdev->dev, &d->nb);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, d);
> +	return yb9_kbdock_sync(d);
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_block_id_table[] =3D {
> +	{ .guid_string =3D YB9_KBDOCK_QUERY_GUID },
> +	{ }
> +};
> +
> +static struct wmi_driver yb9_kbdock_block_driver =3D {
> +	.driver =3D {
> +		.name		=3D "lenovo-yb9-kbdock",
> +		.dev_groups	=3D yb9_kbdock_groups,
> +		.pm		=3D pm_sleep_ptr(&yb9_kbdock_pm_ops),
> +	},
> +	.id_table	=3D yb9_kbdock_block_id_table,
> +	.no_singleton	=3D true,
> +	.probe		=3D yb9_kbdock_block_probe,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Event WMI driver =E2=80=94 LENOVO_BTKBD_EVENT
> + * (fires the notifier chain on each WMI event)
> + * ------------------------------------------------------------------ *=
/
> +
> +static void yb9_kbdock_notify_new(struct wmi_device *wdev,
> +				  const struct wmi_buffer *data)
> +{
> +	/*
> +	 * _WED(0xEB) returns EC.BKBD directly as a 32-bit integer
> +	 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> +	 * Short-buffer guard is handled by .min_event_size below.
> +	 */
> +	u32 bkbd =3D le32_to_cpu(*(const __le32 *)data->data);
> +
> +	blocking_notifier_call_chain(&yb9_kbdock_chain_head, bkbd, NULL);
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_event_id_table[] =3D {
> +	{ .guid_string =3D YB9_KBDOCK_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
> +
> +static struct wmi_driver yb9_kbdock_event_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-yb9-kbdock-event",
> +	},
> +	.id_table	=3D yb9_kbdock_event_id_table,
> +	.no_singleton	=3D true,
> +	.notify_new	=3D yb9_kbdock_notify_new,
> +	.min_event_size	=3D sizeof(__le32),
> +};
> +
> +/* ------------------------------------------------------------------
> + * Module init / exit
> + * ------------------------------------------------------------------ *=
/
> +
> +static const struct dmi_system_id yb9_kbdock_dmi_table[] __initconst =
=3D {
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
> +static int __init yb9_kbdock_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
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
> +
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
>
> 2.47.0
>

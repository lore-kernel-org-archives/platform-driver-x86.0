Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C8B306742
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 21:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779487154; cv=none; b=B7tM5LOZRpZ++lCZkSpvKLKk9/2ZJVCS85lL1QzjckLJUpULdaRit0NQcgMinH/StXYBA/B+Ey9sgsRYEczTAjUj4WlQLv5JT5AcKn05ZKG7sB2ujBiFfgFQ5PXs5gnXPG3bJgdv7QsPOgjKAamXbvyPln5grUdV+zdnQudk0wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779487154; c=relaxed/simple;
	bh=eDVoYcGqcWKNcVNrxEg6IbC/LpvRuF1zxHwIM+fDb8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZHqutTDtDTukOjVz1iupl1cOVpKQlxR+SrlWgbPZZL458j1eBFV92oLo9AbGJRiBoYrCEhp28/FG5KDsI31htcGPQAV6scwr46h/dXOyybBjkwI6bDHpvVrXdQn/+pMv/lMK8qv5iUADx1BfiK4LV7Arzsmzj6bWwZhZzPZKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jcwdz/TO; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jcwdz/TO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779487150; x=1780091950; i=w_armin@gmx.de;
	bh=a38zQdIE0grzwrtsNoZlH5RAuH7zG8iq/OV98YRGdcg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jcwdz/TOW5yEBYGgN2di22o/Q+mi5/dC5IC257+AhpKhP5TuP5w3iVmZln4Mmb9h
	 TqeLaZOgYR6ebofBol+5WA7X2BemyH2Kxr52hLYkbiDd7WZXZlHctJ7BgM/9T2ESz
	 QQgdG5tbKlNnKWWkR0qjDSq2tJ9ShhjR43SG162XgUzDXP+/UTCTpQGtZV7rvLKDN
	 gqNJsEAm4RA+F9GsKgsS7S0v0GElDJloExtx0HSOYi+emsq54xh8aeUT+ysi+aVrZ
	 szc0BRrfADgknIvGbyhRC4nLTA6LFlObSfi8BeTxVNfwO+0vmg3LL+l+TnAXTaHU4
	 ZB/IjUeMDjkxtPz0TA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1wzbbC17QW-00g8wZ; Fri, 22
 May 2026 23:59:10 +0200
Message-ID: <871f18d1-beb7-4d29-8e17-43b806ebcbda@gmx.de>
Date: Fri, 22 May 2026 23:59:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86/lenovo: Add Yoga Book 9 keyboard dock
 detection driver
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com
References: <20260519000239.29446-1-carvsdriver@gmail.com>
 <20260521144034.282419-1-carvsdriver@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260521144034.282419-1-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8cCNHI9VNkuDicu/1fWY0mMHmGe2Q4HaxlbvgozWC5ydnrezIIQ
 b/uVAckyWn1wc+5MG3GPpSp7Vptie4KnJYwWBQwSGzPKU3l7GYL0aHT+e5v63Jc7QoTv+BN
 DcFb8ettBOZjl6oTDv1kvrwCIWc+iNoTpUanijzV+saQlcxp0jbfS5BCuQY0WzMJtPMuPH1
 9qerq0Bncnw4JCZBxOX8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gBQ6XlSSCnE=;zFcN5DBPX5j2xIZtlgm1TiTgwcd
 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

Am 21.05.26 um 16:40 schrieb Dave Carey:

> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboar=
d
> that magnetically attaches to the bottom (secondary) screen in one of tw=
o
> positions.  The Embedded Controller tracks the attachment state in a 2-b=
it
> field called BKBD and signals changes via WMI event GUID
> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
> device).
>
> The current BKBD state is read via WMI query GUID
> E7F300FA-21CD-4003-ADAC-2696135982E6 (WQAF method), which returns an
> 8-byte buffer: bytes [0..3] hold the LFID constant 0x00060000 and bytes
> [4..7] hold the BKBD value.

Hi,

does the device contain embedded BMOF data? Take a look at Documentation/w=
mi/driver-development-guide.rst
to find out how to decode said BMOF data.

>
> BKBD encoding:
>    0 =3D keyboard detached
>    1 =3D keyboard docked on top half of bottom screen
>    2 =3D keyboard docked on bottom half of bottom screen
>    3 =3D reserved (not observed in practice)
>
> This driver:
>    - Registers as a WMI driver on the event GUID.
>    - Queries BKBD state on probe and on each WMI notification.
>    - Reports SW_TABLET_MODE=3D1 when detached, SW_TABLET_MODE=3D0 when d=
ocked
>      in either position (a physical keyboard is present in both cases).
>    - Exposes the raw BKBD value via a read-only sysfs attribute
>      "keyboard_position" for use by userspace (e.g. to distinguish betwe=
en
>      the two docked positions for different UI layouts).
>
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 6.19.
>
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> ---
>   .../testing/sysfs-driver-lenovo-yb9-kbdock    |  21 ++
>   MAINTAINERS                                   |   7 +
>   drivers/platform/x86/lenovo/Kconfig           |  14 ++
>   drivers/platform/x86/lenovo/Makefile          |   1 +
>   drivers/platform/x86/lenovo/yb9-kbdock.c      | 216 ++++++++++++++++++
>   5 files changed, 259 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-k=
bdock
>   create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/=
Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> index 0000000..bb57690
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> @@ -0,0 +1,21 @@
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +		0   detached  =E2=80=94 keyboard is not docked to any screen
> +		1   top-half  =E2=80=94 keyboard docked on the top half of the bottom=
 screen
> +		2   bottom-half =E2=80=94 keyboard docked on the bottom half of the b=
ottom screen
> +		=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +		The value is formatted as "<n> (<name>)\n", e.g. "1 (top-half)\n"

IMHO a simple number would be much easier to parse.

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
> index 0000000..693e287
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,216 @@
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
> + * event 0xEB on the WM10 ACPI device.
> + *
> + * BKBD values:
> + *   0 =3D keyboard detached
> + *   1 =3D keyboard docked on the top half of the bottom screen
> + *   2 =3D keyboard docked on the bottom half of the bottom screen
> + *   3 =3D reserved / not observed
> + *
> + * This driver registers for the WMI event GUID, queries BKBD on probe =
and on
> + * each event, reports SW_TABLET_MODE=3D0 when the keyboard is docked (=
either
> + * position) and SW_TABLET_MODE=3D1 when detached, and exposes the raw =
BKBD
> + * value in sysfs as "keyboard_position".
> + *
> + * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +/*
> + * WM10 ACPI device (_UID "GMZN"):
> + *   Event GUID =E2=80=94 notify ID 0xEB fires on keyboard attachment c=
hange.
> + *   Query GUID =E2=80=94 object "AF", maps to WQAF(); returns 8-byte b=
uffer
> + *                {LFID=3D0x00060000, BKBD[31:0]}.
> + */
> +#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +#define YB9_KBDOCK_QUERY_INSTANCE	0
> +
> +/* BKBD encoding =E2=80=94 keyboard always docks on the bottom screen *=
/
> +#define BKBD_DETACHED		0
> +#define BKBD_TOP_HALF		1	/* docked on top half of bottom screen */
> +#define BKBD_BOTTOM_HALF	2	/* docked on bottom half of bottom screen */
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
> +struct yb9_kbdock_priv {
> +	struct input_dev *input_dev;
> +	unsigned int bkbd;	/* last read BKBD value (0-3) */
> +};
> +
> +/* Read current BKBD state via WQAF.  Returns 0-3 or -errno. */
> +static int yb9_kbdock_query(struct wmi_device *wdev)
> +{
> +	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	acpi_status status;
> +	u32 bkbd;
> +
> +	status =3D wmi_query_block(YB9_KBDOCK_QUERY_GUID,
> +				 YB9_KBDOCK_QUERY_INSTANCE, &out);

That method is deprecated, please use wmidev_query_block(); I suggest you =
use a notifier
to connect both the WMI event device and the WMI blockd device. Take a loo=
k at drivers/platform/
x86/uniwill/uniwill-wmi.c for example.

> +	if (ACPI_FAILURE(status)) {
> +		dev_warn(&wdev->dev, "WQAF query failed: %s\n",
> +			 acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	obj =3D out.pointer;
> +	if (!obj) {
> +		dev_warn(&wdev->dev, "WQAF returned NULL\n");
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * WQAF returns an 8-byte buffer: bytes [0..3] =3D LFID (0x00060000),
> +	 * bytes [4..7] =3D BKBD value.  Guard against short buffers.
> +	 */
> +	if (obj->type =3D=3D ACPI_TYPE_BUFFER && obj->buffer.length >=3D 8) {
> +		memcpy(&bkbd, obj->buffer.pointer + 4, sizeof(bkbd));
> +		bkbd &=3D 0x3;
> +	} else if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +		bkbd =3D obj->integer.value & 0x3;
> +	} else {
> +		dev_warn(&wdev->dev,
> +			 "WQAF: unexpected result type %d len %u\n",
> +			 obj->type,
> +			 obj->type =3D=3D ACPI_TYPE_BUFFER
> +				? obj->buffer.length : 0);
> +		kfree(obj);
> +		return -EIO;
> +	}
> +
> +	kfree(obj);
> +	return (int)bkbd;
> +}
> +
> +static void yb9_kbdock_update(struct wmi_device *wdev)
> +{
> +	struct yb9_kbdock_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +	int bkbd;
> +	int tablet_mode;
> +
> +	bkbd =3D yb9_kbdock_query(wdev);
> +	if (bkbd < 0)
> +		return;
> +
> +	priv->bkbd =3D bkbd;
> +
> +	/*
> +	 * Report tablet mode only when the keyboard is fully detached.
> +	 * Both docked positions (top-half and bottom-half of the bottom scree=
n)
> +	 * indicate a physical keyboard is present =E2=80=94 report laptop mod=
e.
> +	 */
> +	tablet_mode =3D (bkbd =3D=3D BKBD_DETACHED) ? 1 : 0;
> +
> +	input_report_switch(priv->input_dev, SW_TABLET_MODE, tablet_mode);
> +	input_sync(priv->input_dev);
> +
> +	dev_dbg(&wdev->dev, "BKBD=3D%u tablet_mode=3D%d\n", bkbd, tablet_mode)=
;
> +}
> +
> +static void yb9_kbdock_notify(struct wmi_device *wdev, union acpi_objec=
t *data)
> +{
> +	yb9_kbdock_update(wdev);
> +}
> +
> +/* sysfs: keyboard_position =E2=80=94 exposes raw BKBD value */
> +static ssize_t keyboard_position_show(struct device *dev,
> +				      struct device_attribute *attr, char *buf)
> +{
> +	struct yb9_kbdock_priv *priv =3D dev_get_drvdata(dev);
> +	static const char * const names[] =3D {
> +		"detached", "top-half", "bottom-half", "unknown"
> +	};
> +	unsigned int bkbd =3D priv->bkbd;
> +
> +	if (bkbd > 3)
> +		bkbd =3D 3;

I think you should protect bkbd with a spinlock. Or you could just read th=
e current value
from the hardware directly.

> +	return sysfs_emit(buf, "%u (%s)\n", bkbd, names[bkbd]);
> +}
> +static DEVICE_ATTR_RO(keyboard_position);
> +
> +static struct attribute *yb9_kbdock_attrs[] =3D {
> +	&dev_attr_keyboard_position.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);
> +
> +static int yb9_kbdock_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct yb9_kbdock_priv *priv;
> +	struct input_dev *input_dev;
> +	int err;
> +
> +	if (!dmi_check_system(yb9_kbdock_dmi_table)) {
> +		dev_dbg(&wdev->dev, "not a Yoga Book 9, skipping\n");
> +		return -ENODEV;
> +	}
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
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
> +	if (err) {
> +		dev_err(&wdev->dev, "failed to register input device: %d\n", err);
> +		return err;
> +	}
> +
> +	priv->input_dev =3D input_dev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	/* Report initial state */
> +	yb9_kbdock_update(wdev);
> +	return 0;
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_wmi_id_table[] =3D {
> +	{ .guid_string =3D YB9_KBDOCK_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_wmi_id_table);
> +
> +static struct wmi_driver yb9_kbdock_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-yb9-kbdock",
> +		.dev_groups =3D yb9_kbdock_groups,
> +	},
> +	.id_table =3D yb9_kbdock_wmi_id_table,
> +	.probe    =3D yb9_kbdock_probe,
> +	.notify   =3D yb9_kbdock_notify,

Please set .no_singleton =3D true. Also please update the docking state wh=
en resuming from suspend or hibernation.

Thanks,
Armin Wolf

> +};
> +module_wmi_driver(yb9_kbdock_driver);
> +
> +MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
> +MODULE_LICENSE("GPL");

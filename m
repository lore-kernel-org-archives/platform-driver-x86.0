Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD3355C302;
	Thu, 17 Sep 2026 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653579; cv=none; b=cJRKHUc0qITQf/5FKpdI0JS7cxPxUmy+rQrPVfQ2+6EWxSoH7Cu4NHNojOjhYWCD1DIe36QfjyyYg9WGqXyUro/Uy65WZwbv02QTqJVx5MHRNDxaWC7eVNAuoUm4czH+mmTBN6rMtdBB2nOY60sO3bEhFKg+tspdnaH4iNsEdfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653579; c=relaxed/simple;
	bh=lhCs0BDCEAhLHSZYE7IrqbbkdSIjt1PNHV3q4Sfe2z8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sBtHf/YDf8YqI7XM1GBogV5DTYi5IrxmR76O3dQCZ58npn8Kqe/6ItExdV51q/kF148vEDXLiMkeZA2BDLaL3hVu+4UCD9yH+lHibH4RFmXRlwD3C7F6YsPetO0oeB14zBmQd2qXn1vpuIXGU7dTwiH/6oIXbnNyjjiCH9Ey0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Azl83yMW; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Azl83yMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789653576; x=1821189576;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=lhCs0BDCEAhLHSZYE7IrqbbkdSIjt1PNHV3q4Sfe2z8=;
  b=Azl83yMW2OiJdmk+HhFml5KVbHJg1GCwQOkobs5+qGw9IHk3MKe21hN9
   FXmOInHGLoWGkBp/HJKc5vdZ6zNZRYndJ06WfXI5E3FLptL8xssqN2+mt
   bYS1H1SNGb2zZbAF2a1kVFjARJshPK9TytS+Qms5vg8XomwQfodXBK/Wd
   n1vCgF2MZYHsBP0lc/Y1Dolb/Y/K28I4WQ7xnAZxiAYtVAx6PND1tR+/A
   9k7N8FV8MDjUgfUC6gPa3dPLRFXYSt1EhbGBvYuk5oeDHP491YXRXmwmT
   WAeHixuRWAONnejFuMP18yo2CwJY+y+WVjkoGWdKPcmxUTJxYWCFiIVsV
   g==;
X-CSE-ConnectionGUID: 6LId8gE8RNe3LuLCkDmBDg==
X-CSE-MsgGUID: HCJfY4K7Tz61TbUtVu9sRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="584596"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="584596"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:59:35 -0700
X-CSE-ConnectionGUID: rqX/0jSiRE2RyUMCBuyZ3A==
X-CSE-MsgGUID: UCUvb52sQmuxfk1ZVVR54A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269534361"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 06:59:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 16:59:27 +0300 (EEST)
To: =?UTF-8?Q?Ertu=C4=9Frul_Top=C3=A7u?= <ertugtopcu0@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] platform/x86: Add Goodix fingerprint EC mailbox
 transport
In-Reply-To: <20260816194955.468107-1-ertugtopcu0@gmail.com>
Message-ID: <ad3fb967-14cb-9b46-9362-c737457babb5@linux.intel.com>
References: <20260803074454.49474-1-ertugtopcu0@gmail.com> <20260816194955.468107-1-ertugtopcu0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1616873346-1789651701=:1179"
Content-ID: <fc2ebdb5-95d1-8031-1714-93de4bd959f6@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1616873346-1789651701=:1179
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <8e578d10-6704-d952-3a19-1185f19203ed@linux.intel.com>

On Sun, 16 Aug 2026, Ertu=C4=9Frul Top=C3=A7u wrote:

> Some Goodix fingerprint sensors are connected through an ACPI-described
> embedded-controller shared-memory mailbox rather than directly through US=
B
> or SPI.
>=20
> Add a transport driver for the GXFP5130 platform interface. The driver
> owns the MMIO mailbox, GPIO handshakes and IRQ. It exposes opaque mailbox
> records through /dev/gxfp.


> Keep sensor initialization, TLS, capture and image processing in userspac=
e.

Is the part of the interface documented somewhere?

> Restrict the raw transport to CAP_SYS_RAWIO and document the UAPI. Handle
> device removal and system suspend without invalidating open file
> descriptors.
>=20
> Signed-off-by: Ertu=C4=9Frul Top=C3=A7u <ertugtopcu0@gmail.com>
> ---
>=20
> Notes:
>     Changes in v3:
>     - Include the non-atomic low/high 64-bit MMIO helpers so readq() and
>       writeq() are available on 32-bit builds.
>     - Verify the driver with the kernel test robot's i386 W=3D1 configura=
tion.
>=20
>     Changes in v2:
>     - Treat IRQ 0 as valid and always register a successfully resolved IR=
Q.
>     - Replace mailbox handshake busy waits with fsleep().
>     - Remove unverified Nuvoton-specific wording, stale comments and unus=
ed model data.
>=20
>  .../ABI/testing/dev-goodix-ec-mailbox         |  22 +
>  MAINTAINERS                                   |   8 +
>  drivers/platform/x86/Kconfig                  |   2 +
>  drivers/platform/x86/Makefile                 |   3 +
>  .../platform/x86/goodix-ec-mailbox/Kconfig    |  15 +
>  .../platform/x86/goodix-ec-mailbox/Makefile   |   2 +
>  .../x86/goodix-ec-mailbox/goodix_ec_mailbox.h | 113 +++
>  .../x86/goodix-ec-mailbox/goodix_ec_main.c    | 715 ++++++++++++++++++
>  .../x86/goodix-ec-mailbox/goodix_ec_uapi.c    | 360 +++++++++
>  include/uapi/linux/goodix_ec.h                |  37 +
>  10 files changed, 1277 insertions(+)
>  create mode 100644 Documentation/ABI/testing/dev-goodix-ec-mailbox
>  create mode 100644 drivers/platform/x86/goodix-ec-mailbox/Kconfig
>  create mode 100644 drivers/platform/x86/goodix-ec-mailbox/Makefile
>  create mode 100644 drivers/platform/x86/goodix-ec-mailbox/goodix_ec_mail=
box.h
>  create mode 100644 drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main=
=2Ec
>  create mode 100644 drivers/platform/x86/goodix-ec-mailbox/goodix_ec_uapi=
=2Ec
>  create mode 100644 include/uapi/linux/goodix_ec.h
>=20
> diff --git a/Documentation/ABI/testing/dev-goodix-ec-mailbox b/Documentat=
ion/ABI/testing/dev-goodix-ec-mailbox
> new file mode 100644
> index 000000000000..11ca80a41ca7
> --- /dev/null
> +++ b/Documentation/ABI/testing/dev-goodix-ec-mailbox
> @@ -0,0 +1,22 @@
> +What:=09=09/dev/gxfp
> +Date:=09=09July 2026
> +KernelVersion:=09TBD
> +Contact:=09Ertugrul Topcu <ertugtopcu0@gmail.com>
> +Description:
> +=09=09Binary userspace interface for the ACPI Goodix EC mailbox
> +=09=09fingerprint transport. Only callers with CAP_SYS_RAWIO may open
> +=09=09the device. At most one reader may be open at a time.
> +
> +=09=09A write consists of struct goodix_ec_tx_header followed by exactly
> +=09=09payload_len opaque MP payload bytes. reserved and flags must be ze=
ro.
> +
> +=09=09A read returns one struct goodix_ec_record_header followed by exac=
tly
> +=09=09len bytes. mp_type is the normalized MP type and timestamp_ns is a
> +=09=09CLOCK_MONOTONIC timestamp captured when the record entered the RX
> +=09=09queue. Records are never split across reads.
> +
> +=09=09poll(2) reports POLLIN while a complete record is queued. Device
> +=09=09removal reports POLLERR | POLLHUP. System suspend reports POLLERR.
> +
> +=09=09GOODIX_EC_IOCTL_FLUSH_RX discards all queued receive records.
> +Users:=09=09libfprint Goodix GXFP5130 userspace driver
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 92a2167f1eb8..0c62071bbc1b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11109,6 +11109,14 @@ M:=09Maud Spierings <maudspierings@gocontroll.co=
m>
>  S:=09Maintained
>  F:=09Documentation/devicetree/bindings/connector/gocontroll,moduline-mod=
ule-slot.yaml
> =20
> +GOODIX EC MAILBOX FINGERPRINT TRANSPORT DRIVER
> +M:=09Ertugrul Topcu <ertugtopcu0@gmail.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09Documentation/ABI/testing/dev-goodix-ec-mailbox
> +F:=09drivers/platform/x86/goodix-ec-mailbox/
> +F:=09include/uapi/linux/goodix_ec.h
> +
>  GOODIX TOUCHSCREEN
>  M:=09Hans de Goede <hansg@kernel.org>
>  L:=09linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 957034f39e4e..57d1311f8670 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -440,6 +440,8 @@ config FUJITSU_TABLET
> =20
>           If you have a Fujitsu convertible or slate, say Y or M here.
> =20
> +source "drivers/platform/x86/goodix-ec-mailbox/Kconfig"
> +
>  config GPD_POCKET_FAN
>  =09tristate "GPD Pocket Fan Controller support"
>  =09depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 872ac3842391..650ab67f7902 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -54,6 +54,9 @@ obj-$(CONFIG_AMILO_RFKILL)=09+=3D amilo-rfkill.o
>  obj-$(CONFIG_FUJITSU_LAPTOP)=09+=3D fujitsu-laptop.o
>  obj-$(CONFIG_FUJITSU_TABLET)=09+=3D fujitsu-tablet.o
> =20
> +# Goodix
> +obj-$(CONFIG_GOODIX_EC_MAILBOX)=09+=3D goodix-ec-mailbox/
> +
>  # GPD
>  obj-$(CONFIG_GPD_POCKET_FAN)=09+=3D gpd-pocket-fan.o
> =20
> diff --git a/drivers/platform/x86/goodix-ec-mailbox/Kconfig b/drivers/pla=
tform/x86/goodix-ec-mailbox/Kconfig
> new file mode 100644
> index 000000000000..6f43b1323fa4
> --- /dev/null
> +++ b/drivers/platform/x86/goodix-ec-mailbox/Kconfig
> @@ -0,0 +1,15 @@
> +config GOODIX_EC_MAILBOX
> +=09tristate "Goodix fingerprint EC mailbox transport"
> +=09depends on X86
> +=09depends on ACPI
> +=09depends on GPIOLIB
> +=09help
> +=09  Enable transport support for Goodix fingerprint sensors connected
> +=09  through an ACPI-described embedded-controller shared-memory mailbox=
=2E
> +
> +=09  The driver exposes the opaque mailbox transport through /dev/gxfp.
> +=09  Sensor configuration, TLS, capture and image processing remain in
> +=09  userspace.
> +
> +=09  To compile this driver as a module, choose M here. The module will =
be
> +=09  called goodix_ec_mailbox.
> diff --git a/drivers/platform/x86/goodix-ec-mailbox/Makefile b/drivers/pl=
atform/x86/goodix-ec-mailbox/Makefile
> new file mode 100644
> index 000000000000..52e5516eefb0
> --- /dev/null
> +++ b/drivers/platform/x86/goodix-ec-mailbox/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_GOODIX_EC_MAILBOX) +=3D goodix_ec_mailbox.o
> +goodix_ec_mailbox-y :=3D goodix_ec_main.o goodix_ec_uapi.o
> diff --git a/drivers/platform/x86/goodix-ec-mailbox/goodix_ec_mailbox.h b=
/drivers/platform/x86/goodix-ec-mailbox/goodix_ec_mailbox.h
> new file mode 100644
> index 000000000000..6f412c46159b
> --- /dev/null
> +++ b/drivers/platform/x86/goodix-ec-mailbox/goodix_ec_mailbox.h
> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _GOODIX_EC_H_
> +#define _GOODIX_EC_H_
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/ioport.h>
> +#include <linux/kfifo.h>
> +#include <linux/kref.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/wait.h>
> +#include <linux/stddef.h>
> +#include <linux/types.h>
> +
> +#define GOODIX_EC_DRIVER_NAME=09=09"goodix-ec-mailbox"
> +
> +/* Shared-memory mailbox layout. */
> +#define GOODIX_EC_MMIO_SIZE=09=090x1000
> +#define GOODIX_EC_TX_OFFSET=09=090x000
> +#define GOODIX_EC_TX_SIZE=09=090x0200
> +#define GOODIX_EC_RX_OFFSET=09=090x0200
> +#define GOODIX_EC_RX_SIZE=09=090x0e00
> +#define GOODIX_EC_PACKET_ALIGNMENT=098
> +
> +/* EC mailbox framing. */
> +#define GOODIX_EC_PACKET_TYPE=09=090xf0
> +#define GOODIX_EC_SEQUENCE_SEED=09=090x8881

You start filling ->sequence from this +1 ?
=20
IMO, it would would be better to change from the pre-increment to
post-increment.

> +
> +/* MP framing. The payload is opaque to the kernel. */
> +#define GOODIX_MP_HEADER_SIZE=09=094

Is this same as sizeof(struct goodix_mp_header), if yes, why a separate=20
define necessary?

> +
> +/* Mailbox handshake timing. */
> +#define GOODIX_WRITE_DONE_PRE_US=0950
> +#define GOODIX_WRITE_DONE_HIGH_US=094000
> +#define GOODIX_WRITE_DONE_POST_US=09200
> +#define GOODIX_READ_DONE_HIGH_US=0950
> +#define GOODIX_READ_DONE_POST_US=09200
> +#define GOODIX_SYNC_RX_DELAY_US=09=091000
> +
> +struct device;
> +
> +struct goodix_ec_header {
> +=09u8 type;
> +=09__le16 payload_len;
> +=09u8 checksum;
> +=09__le16 sequence;
> +=09u8 reserved[2];
> +} __packed;

Missing include for __packed.

> +
> +struct goodix_mp_header {
> +=09u8 type;
> +=09__le16 payload_len;
> +=09u8 checksum;
> +} __packed;
> +
> +struct goodix_device;
> +
> +struct goodix_model_data {
> +=09const char *name;
> +};
> +
> +struct goodix_device {
> +=09struct device *dev;
> +=09struct kref refcount;
> +=09bool disconnected;
> +=09bool suspended;
> +=09bool irq_enabled;
> +
> +=09void __iomem *mailbox;
> +=09resource_size_t mailbox_phys;
> +=09resource_size_t mailbox_size;
> +
> +=09struct gpio_desc *write_done_gpio;
> +=09struct gpio_desc *read_done_gpio;
> +=09struct gpio_desc *irq_gpio;
> +=09int irq;
> +
> +=09u8 *tx_buf;
> +=09u8 *rx_buf;
> +
> +=09u8 *rx_reassembly;
> +=09size_t rx_reassembly_len;
> +=09size_t rx_reassembly_received;
> +=09u8 rx_reassembly_mp_type;
> +=09bool rx_reassembly_active;
> +
> +=09u16 tx_sequence;
> +=09/* Serializes mailbox TX with threaded-IRQ RX access. */
> +=09struct mutex transfer_lock;
> +
> +=09struct miscdevice miscdev;
> +=09struct kfifo rx_fifo;
> +=09/* Protects the RX FIFO and reader ownership state. */
> +=09spinlock_t rx_fifo_lock;
> +=09/* Serializes record-oriented read operations. */
> +=09struct mutex rx_read_lock;
> +=09wait_queue_head_t rx_wait;
> +=09bool rx_fifo_ready;
> +=09bool rx_reader_open;
> +=09bool misc_registered;
> +
> +=09const struct goodix_model_data *model;
> +};
> +
> +int goodix_ec_sync_send(struct goodix_device *gdev,
> +=09=09=09const u8 *tx, size_t tx_len);
> +bool goodix_ec_device_get(struct goodix_device *gdev);
> +void goodix_ec_device_put(struct goodix_device *gdev);
> +int goodix_ec_uapi_register(struct goodix_device *gdev);
> +void goodix_ec_uapi_unregister(struct goodix_device *gdev);
> +
> +#endif /* _GOODIX_EC_H_ */
> diff --git a/drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c b/dr=
ivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c
> new file mode 100644
> index 000000000000..67e73aa3c6df
> --- /dev/null
> +++ b/drivers/platform/x86/goodix-ec-mailbox/goodix_ec_main.c
> @@ -0,0 +1,715 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Goodix fingerprint sensors behind an EC shared-memory mailbox.
> + *
> + * The tested GXFP5130 platform exposes the fingerprint transport throug=
h
> + * ACPI-described MMIO and GPIO handshakes. The host exchanges opaque MP
> + * payloads with the device through this mailbox.
> + *
> + * Sensor protocol policy deliberately stays in userspace. This driver d=
oes
> + * not know about Goodix commands, checksums, TLS, configuration, captur=
e, or
> + * sensor power states.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/align.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/capability.h>
> +#include <linux/fs.h>
> +#include <linux/kernel.h>
> +#include <linux/kfifo.h>
> +#include <linux/miscdevice.h>
> +#include <linux/poll.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/timekeeping.h>
> +#include <linux/uaccess.h>
> +#include <linux/unaligned.h>
> +
> +#include "goodix_ec_mailbox.h"
> +#include <linux/goodix_ec.h>

Please group linux/ ones in one single group.

> +#define GXFP5130_ACPI_HID "GXFP5130"
> +
> +static void goodix_ec_device_release(struct kref *refcount)
> +{
> +=09struct goodix_device *gdev =3D
> +=09=09container_of(refcount, struct goodix_device, refcount);

Add include.

> +
> +=09kfree(gdev);
> +}
> +
> +bool goodix_ec_device_get(struct goodix_device *gdev)
> +{
> +=09return kref_get_unless_zero(&gdev->refcount);
> +}
> +
> +void goodix_ec_device_put(struct goodix_device *gdev)
> +{
> +=09kref_put(&gdev->refcount, goodix_ec_device_release);
> +}
> +
> +static void goodix_ec_device_put_action(void *data)
> +{
> +=09goodix_ec_device_put(data);
> +}
> +
> +/* EC mailbox transport. */
> +
> +struct goodix_ec_acpi_gpio_state {
> +=09unsigned int gpio_count;
> +=09int irq_index;
> +=09int done_index[2];
> +=09u8 done_polarity[2];
> +=09unsigned int done_count;
> +};
> +
> +static int goodix_ec_acpi_gpio_resource(struct acpi_resource *resource,
> +=09=09=09=09=09void *context)
> +{
> +=09struct goodix_ec_acpi_gpio_state *state =3D context;
> +=09struct acpi_resource_gpio *gpio;
> +=09unsigned int index;
> +
> +=09if (resource->type !=3D ACPI_RESOURCE_TYPE_GPIO)
> +=09=09return 0;
> +
> +=09gpio =3D &resource->data.gpio;
> +=09index =3D state->gpio_count++;
> +=09if (!gpio->pin_table_length)
> +=09=09return 0;
> +
> +=09if (gpio->connection_type =3D=3D ACPI_RESOURCE_GPIO_TYPE_INT) {
> +=09=09if (state->irq_index < 0)
> +=09=09=09state->irq_index =3D index;
> +=09} else if (gpio->connection_type =3D=3D ACPI_RESOURCE_GPIO_TYPE_IO &&
> +=09=09   state->done_count < ARRAY_SIZE(state->done_index)) {

Add include.

> +=09=09state->done_index[state->done_count] =3D index;
> +=09=09state->done_polarity[state->done_count] =3D gpio->polarity;
> +=09=09state->done_count++;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int goodix_ec_add_gpio_mappings(struct device *dev)
> +{
> +=09struct goodix_ec_acpi_gpio_state state =3D {
> +=09=09.irq_index =3D -1,
> +=09=09.done_index =3D { -1, -1 },
> +=09};
> +=09struct acpi_gpio_mapping *mappings;
> +=09struct acpi_gpio_params *params;
> +=09struct acpi_device *adev =3D ACPI_COMPANION(dev);
> +=09LIST_HEAD(resources);

Include?

> +=09bool active_low;
> +=09int ret;
> +
> +=09if (!adev)
> +=09=09return -ENODEV;

Please move adev assignment right before this line as this is its error
handling.


> +=09ret =3D acpi_dev_get_resources(adev, &resources,
> +=09=09=09=09     goodix_ec_acpi_gpio_resource, &state);
> +=09acpi_dev_free_resource_list(&resources);
> +=09if (ret <=3D 0)
> +=09=09return ret < 0 ? ret : -ENOENT;

Split the if to two for clarity.

> +=09if (state.irq_index < 0 || state.done_count !=3D 2)
> +=09=09return dev_err_probe(dev, -ENOENT,
> +=09=09=09=09     "ACPI _CRS does not describe one IRQ and two done GPIOs=
\n");
> +=09if (state.done_polarity[0] !=3D state.done_polarity[1])
> +=09=09return dev_err_probe(dev, -EINVAL,
> +=09=09=09=09     "ACPI done GPIO polarities differ\n");
> +
> +=09active_low =3D state.done_polarity[0] !=3D 0;
> +=09params =3D devm_kcalloc(dev, 3, sizeof(*params), GFP_KERNEL);
> +=09mappings =3D devm_kcalloc(dev, 4, sizeof(*mappings), GFP_KERNEL);
> +=09if (!params || !mappings)
> +=09=09return -ENOMEM;
> +
> +=09params[0].crs_entry_index =3D state.irq_index;
> +=09params[0].line_index =3D 0;
> +=09params[0].active_low =3D false;
> +=09mappings[0].name =3D "irq-gpios";
> +=09mappings[0].data =3D &params[0];
> +=09mappings[0].size =3D 1;
> +
> +=09params[1].crs_entry_index =3D state.done_index[0];
> +=09params[1].line_index =3D 0;
> +=09params[1].active_low =3D active_low;
> +=09mappings[1].name =3D "write-done-gpios";
> +=09mappings[1].data =3D &params[1];
> +=09mappings[1].size =3D 1;
> +
> +=09params[2].crs_entry_index =3D state.done_index[1];
> +=09params[2].line_index =3D 0;
> +=09params[2].active_low =3D active_low;
> +=09mappings[2].name =3D "read-done-gpios";
> +=09mappings[2].data =3D &params[2];
> +=09mappings[2].size =3D 1;
> +
> +=09ret =3D devm_acpi_dev_add_driver_gpios(dev, mappings);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret,
> +=09=09=09=09     "failed to install ACPI GPIO mappings\n");
> +
> +=09dev_dbg(dev,

Please add include.

> +=09=09"ACPI GPIO mappings: irq=3D%d write-done=3D%d read-done=3D%d activ=
e-low=3D%u\n",
> +=09=09state.irq_index, state.done_index[0], state.done_index[1],
> +=09=09active_low);
> +=09return 0;
> +}
> +
> +static int goodix_ec_get_gpio(struct goodix_device *gdev,
> +=09=09=09      struct gpio_desc **gpio,
> +=09=09=09      const char *name,
> +=09=09=09      enum gpiod_flags flags)
> +{
> +=09*gpio =3D devm_gpiod_get(gdev->dev, name, flags);
> +=09if (IS_ERR(*gpio))

Add linux/err.h

> +=09=09return dev_err_probe(gdev->dev, PTR_ERR(*gpio),
> +=09=09=09=09     "failed to acquire %s GPIO\n", name);

Please add braces to multiline blocks.

> +
> +=09if (!*gpio)
> +=09=09return dev_err_probe(gdev->dev, -ENODEV,
> +=09=09=09=09     "%s GPIO missing\n", name);
> +
> +=09return 0;
> +}
> +
> +static void goodix_ec_mmio_write_tx(struct goodix_device *gdev, size_t l=
en)
> +{
> +=09size_t offset;
> +
> +=09for (offset =3D 0; offset < len; offset +=3D sizeof(u64)) {
> +=09=09u64 value =3D get_unaligned_le64(gdev->tx_buf + offset);
> +
> +=09=09writeq(value, gdev->mailbox + GOODIX_EC_TX_OFFSET + offset);
> +=09}
> +
> +=09/* Publish every qword before asserting the write-done doorbell. */
> +=09wmb();
> +}
> +
> +static void goodix_ec_mmio_read_rx(struct goodix_device *gdev)
> +{
> +=09size_t offset;
> +
> +=09for (offset =3D 0; offset < GOODIX_EC_RX_SIZE; offset +=3D sizeof(u64=
)) {
> +=09=09u64 value =3D readq(gdev->mailbox + GOODIX_EC_RX_OFFSET + offset);
> +
> +=09=09put_unaligned_le64(value, gdev->rx_buf + offset);
> +=09}
> +
> +=09/* Complete the mailbox snapshot before parsing its headers. */
> +=09rmb();
> +}
> +
> +static int goodix_ec_pulse_write_done(struct goodix_device *gdev)
> +{
> +=09if (!gdev->write_done_gpio)
> +=09=09return -ENODEV;
> +
> +=09gpiod_set_value_cansleep(gdev->write_done_gpio, 0);
> +=09fsleep(GOODIX_WRITE_DONE_PRE_US);
> +
> +=09gpiod_set_value_cansleep(gdev->write_done_gpio, 1);
> +=09fsleep(GOODIX_WRITE_DONE_HIGH_US);
> +
> +=09gpiod_set_value_cansleep(gdev->write_done_gpio, 0);
> +=09fsleep(GOODIX_WRITE_DONE_POST_US);
> +
> +=09return 0;
> +}
> +
> +static int goodix_ec_pulse_read_done(struct goodix_device *gdev)
> +{
> +=09if (!gdev->read_done_gpio)
> +=09=09return -ENODEV;
> +
> +=09/* RX must be copied before acknowledging that the host consumed it. =
*/
> +=09gpiod_set_value_cansleep(gdev->read_done_gpio, 1);
> +=09fsleep(GOODIX_READ_DONE_HIGH_US);
> +
> +=09gpiod_set_value_cansleep(gdev->read_done_gpio, 0);
> +=09fsleep(GOODIX_READ_DONE_POST_US);
> +
> +=09return 0;
> +}
> +
> +static int goodix_ec_build_packet(struct goodix_device *gdev,
> +=09=09=09=09  const u8 *payload, size_t payload_len,
> +=09=09=09=09  size_t *packet_len)
> +{
> +=09struct goodix_ec_header *header;
> +=09size_t total_len;
> +
> +=09if (!gdev || !payload || !payload_len || !packet_len)
> +=09=09return -EINVAL;
> +
> +=09if (payload_len > U16_MAX)

+ limits.h

> +=09=09return -EOVERFLOW;
> +
> +=09total_len =3D ALIGN(sizeof(*header) + payload_len,
> +=09=09=09  GOODIX_EC_PACKET_ALIGNMENT);
> +=09if (total_len > GOODIX_EC_TX_SIZE)
> +=09=09return -EMSGSIZE;
> +
> +=09memset(gdev->tx_buf, 0, total_len);
> +
> +=09header =3D (struct goodix_ec_header *)gdev->tx_buf;
> +=09header->type =3D GOODIX_EC_PACKET_TYPE;
> +=09header->payload_len =3D cpu_to_le16(payload_len);
> +=09header->checksum =3D header->type + (payload_len & 0xff) +
> +=09=09=09   ((payload_len >> 8) & 0xff);
> +=09header->sequence =3D cpu_to_le16(++gdev->tx_sequence);
> +
> +=09memcpy(gdev->tx_buf + sizeof(*header), payload, payload_len);
> +=09*packet_len =3D total_len;
> +
> +=09return 0;
> +}
> +
> +int goodix_ec_sync_send(struct goodix_device *gdev,
> +=09=09=09const u8 *tx, size_t tx_len)
> +{
> +=09size_t packet_len;
> +=09int ret;
> +
> +=09ret =3D goodix_ec_build_packet(gdev, tx, tx_len, &packet_len);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09goodix_ec_mmio_write_tx(gdev, packet_len);
> +
> +=09ret =3D goodix_ec_pulse_write_done(gdev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09fsleep(GOODIX_SYNC_RX_DELAY_US);
> +=09return 0;
> +}
> +
> +/* MP packet transport. */
> +static void goodix_ec_rx_push(struct goodix_device *gdev, u8 mp_type,
> +=09=09=09      const u8 *payload, size_t payload_len)
> +{
> +=09struct goodix_ec_record_header header;
> +=09unsigned long flags;
> +=09size_t required;
> +
> +=09if (!gdev || !payload || !payload_len ||
> +=09    payload_len > GOODIX_EC_UAPI_RX_MAX)
> +=09=09return;
> +
> +=09memset(&header, 0, sizeof(header));
> +=09header.len =3D payload_len;
> +=09header.mp_type =3D mp_type >> 4;

Is this some field that starts at that bit index? In that case, naming it=
=20
wit GENMASK() + FIELD_PREP() would be better (likely at the caller already
as it too seems to do right shifting).

You may have to rework some of the code to do FIELD_PREP/GET() only when=20
encoding/decoding the field.

> +=09header.timestamp_ns =3D ktime_get_ns();
> +=09required =3D sizeof(header) + payload_len;
> +
> +=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09if (!gdev->rx_fifo_ready || kfifo_avail(&gdev->rx_fifo) < required) {
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09dev_warn_ratelimited(gdev->dev,
> +=09=09=09=09     "RX queue full; dropping %zu-byte packet\n",
> +=09=09=09=09     payload_len);
> +=09=09return;
> +=09}
> +
> +=09kfifo_in(&gdev->rx_fifo, &header, sizeof(header));
> +=09kfifo_in(&gdev->rx_fifo, payload, payload_len);
> +=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +
> +=09wake_up_interruptible(&gdev->rx_wait);
> +}
> +
> +static irqreturn_t goodix_ec_irq_thread(int irq, void *data)
> +{
> +=09struct goodix_device *gdev =3D data;
> +=09size_t chunk_len;
> +=09size_t remaining;
> +=09u16 declared_len;
> +=09u8 mp_type;
> +=09int ret =3D 0;
> +=09int ack_ret;
> +
> +=09mutex_lock(&gdev->transfer_lock);

Please use guard()

> +
> +=09goodix_ec_mmio_read_rx(gdev);
> +
> +=09/*
> +=09 * Continuation IRQs contain raw payload bytes without another
> +=09 * MP header.
> +=09 */
> +=09if (gdev->rx_reassembly_active) {
> +=09=09remaining =3D gdev->rx_reassembly_len -
> +=09=09=09    gdev->rx_reassembly_received;
> +
> +=09=09chunk_len =3D min_t(size_t,
> +=09=09=09=09  remaining,
> +=09=09=09=09  GOODIX_EC_RX_SIZE);

One line.

As both are unsigned(?), min() would probably work too.

> +
> +=09=09memcpy(gdev->rx_reassembly +
> +=09=09       gdev->rx_reassembly_received,
> +=09=09       gdev->rx_buf,
> +=09=09       chunk_len);

Fits easily to 2 lines.

> +
> +=09=09gdev->rx_reassembly_received +=3D chunk_len;
> +
> +=09=09ack_ret =3D goodix_ec_pulse_read_done(gdev);
> +=09=09if (ack_ret)
> +=09=09=09ret =3D ack_ret;
> +
> +=09=09if (!ret &&
> +=09=09    gdev->rx_reassembly_received =3D=3D
> +=09=09    gdev->rx_reassembly_len) {

Fits to two lines.

Consider shortening "reassembly" a bit and "received" -> "rcvd".

> +=09=09=09dev_dbg(gdev->dev,
> +=09=09=09=09"RX reassembly complete: MP=3D0x%02x payload=3D%zu bytes\n",
> +=09=09=09=09 gdev->rx_reassembly_mp_type,
> +=09=09=09=09 gdev->rx_reassembly_len);
> +
> +=09=09=09goodix_ec_rx_push(gdev,
> +=09=09=09=09=09  gdev->rx_reassembly_mp_type,
> +=09=09=09=09=09  gdev->rx_reassembly,
> +=09=09=09=09=09  gdev->rx_reassembly_len);
> +
> +=09=09=09kfree(gdev->rx_reassembly);
> +=09=09=09gdev->rx_reassembly =3D NULL;
> +=09=09=09gdev->rx_reassembly_len =3D 0;
> +=09=09=09gdev->rx_reassembly_received =3D 0;
> +=09=09=09gdev->rx_reassembly_mp_type =3D 0;
> +=09=09=09gdev->rx_reassembly_active =3D false;
> +=09=09}
> +
> +=09=09mutex_unlock(&gdev->transfer_lock);
> +
> +=09=09if (ret)
> +=09=09=09dev_warn_ratelimited(gdev->dev,
> +=09=09=09=09=09     "IRQ %d continuation ACK failed: %d\n",
> +=09=09=09=09=09     irq, ret);



> +
> +=09=09return IRQ_HANDLED;
> +=09}
> +
> +=09mp_type =3D gdev->rx_buf[0];
> +
> +=09if ((mp_type >> 4) !=3D 0x0a &&
> +=09    (mp_type >> 4) !=3D 0x0b &&
> +=09    (mp_type >> 4) !=3D 0x0c) {

As mentioned above, probably you should be naming a field with GENMASK()=20
and using FIELD_GET() to extract it.

Also, name those literals with defines.

> +=09=09ret =3D -EBADMSG;
> +=09=09goto acknowledge;
> +=09}
> +
> +=09if (gdev->rx_buf[3] !=3D
> +=09    gdev->rx_buf[0] +
> +=09    gdev->rx_buf[1] +
> +=09    gdev->rx_buf[2]) {

Is the right-hand side some kind of checksum calculation? I suggest you=20
do that first into a temporary variable which, with good naming, explains=
=20
the intent of this code much better than random additions together. Or add=
=20
a helper.

> +=09=09ret =3D -EBADMSG;
> +=09=09goto acknowledge;
> +=09}
> +
> +=09declared_len =3D get_unaligned_le16(gdev->rx_buf + 1);
> +
> +=09/* The complete payload fits in one mailbox transaction. */
> +=09if (declared_len <=3D
> +=09    GOODIX_EC_RX_SIZE -
> +=09    sizeof(struct goodix_mp_header)) {

Don't break the line at <=3D.

> +=09=09goodix_ec_rx_push(gdev,
> +=09=09=09=09  mp_type,
> +=09=09=09=09  gdev->rx_buf +
> +=09=09=09=09  sizeof(struct goodix_mp_header),
> +=09=09=09=09  declared_len);
> +
> +=09=09dev_dbg(gdev->dev,
> +=09=09=09"IRQ %d RX queued: MP=3D0x%02x payload=3D%u bytes\n",
> +=09=09=09irq,
> +=09=09=09mp_type >> 4,
> +=09=09=09declared_len);
> +
> +=09=09goto acknowledge;
> +=09}
> +
> +=09/* Reassemble payloads delivered across multiple IRQs. */
> +=09gdev->rx_reassembly =3D kmalloc(declared_len, GFP_KERNEL);
> +=09if (!gdev->rx_reassembly) {
> +=09=09ret =3D -ENOMEM;
> +=09=09goto acknowledge;
> +=09}
> +
> +=09chunk_len =3D GOODIX_EC_RX_SIZE -
> +=09=09    sizeof(struct goodix_mp_header);

Unnecessary linesplit, you seem to have many of these...
=20
Please go through your entire file with this problem in mind, I won't=20
be marking them from this point on.

> +=09memcpy(gdev->rx_reassembly,
> +=09       gdev->rx_buf +
> +=09       sizeof(struct goodix_mp_header),
> +=09       chunk_len);
> +
> +=09gdev->rx_reassembly_len =3D declared_len;
> +=09gdev->rx_reassembly_received =3D chunk_len;
> +=09gdev->rx_reassembly_mp_type =3D mp_type;
> +=09gdev->rx_reassembly_active =3D true;
> +
> +=09dev_dbg(gdev->dev,
> +=09=09"RX reassembly started: MP=3D0x%02x total=3D%u first=3D%zu remaini=
ng=3D%zu\n",
> +=09=09 mp_type >> 4,
> +=09=09 declared_len,
> +=09=09 chunk_len,
> +=09=09 (size_t)declared_len - chunk_len);
> +
> +acknowledge:
> +=09ack_ret =3D goodix_ec_pulse_read_done(gdev);
> +=09if (!ret && ack_ret)
> +=09=09ret =3D ack_ret;
> +
> +=09mutex_unlock(&gdev->transfer_lock);
> +
> +=09if (ret)
> +=09=09dev_warn_ratelimited(gdev->dev,
> +=09=09=09=09     "IRQ %d RX handling failed: %d\n",
> +=09=09=09=09     irq, ret);

Please use braces for multiline blocks even if there's just one statement.

But I also don't like how you have "ret" named variable which truly isn't=
=20
return value for the function but just printing it here. The entire play=20
with ret and ack_ret is also ugly.

> +
> +=09return IRQ_HANDLED;
> +}

This function is very hard to read and should be restructured if the line
combining won't make it more readable.
=20
Preferrably, it should use guard/scoped_guard() too.

> +static const struct goodix_model_data gxfp5130_model =3D {
> +=09.name =3D "GXFP5130",
> +};
> +
> +/* ACPI platform driver and model selection. */
> +
> +static int goodix_ec_probe(struct platform_device *pdev)
> +{
> +=09struct device *dev =3D &pdev->dev;
> +=09const struct acpi_device_id *match;
> +=09struct goodix_device *gdev;
> +=09struct resource *resource;
> +=09resource_size_t mailbox_size;
> +=09unsigned long irq_flags;
> +=09unsigned int irq_type;
> +=09int ret;
> +
> +=09match =3D acpi_match_device(dev->driver->acpi_match_table, dev);
> +=09if (!match || !match->driver_data)
> +=09=09return -ENODEV;
> +
> +=09gdev =3D kzalloc_obj(*gdev);
> +=09if (!gdev)
> +=09=09return -ENOMEM;
> +=09kref_init(&gdev->refcount);
> +=09ret =3D devm_add_action_or_reset(dev, goodix_ec_device_put_action, gd=
ev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09gdev->dev =3D dev;
> +=09gdev->model =3D (const struct goodix_model_data *)match->driver_data;
> +=09gdev->tx_sequence =3D GOODIX_EC_SEQUENCE_SEED;
> +=09mutex_init(&gdev->transfer_lock);

Where's pairing mutex_destroy()?
=20
If devm_mutex_init() could be used, use that instead as it handles it for=
=20
you. You seem to use devm below but I'm not sure about that either.

> +=09platform_set_drvdata(pdev, gdev);
> +
> +=09gdev->mailbox =3D devm_platform_get_and_ioremap_resource(pdev, 0,
> +=09=09=09=09=09=09=09       &resource);

gdev seems to be managed by kref, is it safe to use plain devm for some=20
of its members?

> +=09if (IS_ERR(gdev->mailbox))
> +=09=09return dev_err_probe(dev, PTR_ERR(gdev->mailbox),
> +=09=09=09=09     "failed to map EC mailbox MMIO resource\n");
> +
> +=09mailbox_size =3D resource_size(resource);
> +=09if (mailbox_size < GOODIX_EC_MMIO_SIZE)
> +=09=09return dev_err_probe(dev, -EINVAL,

-EINVAL is wrong code to return in this case. If the expected resource
isn't there, isn't that -ENODEV.

> +=09=09=09=09     "EC mailbox resource too small: %#llx\n",
> +=09=09=09=09     (unsigned long long)mailbox_size);
> +
> +=09gdev->mailbox_phys =3D resource->start;
> +=09gdev->mailbox_size =3D mailbox_size;

Why are you storing these? They're only used for the dev_info() print=3D20
below AFAICT. More about that print below...

> +=09gdev->tx_buf =3D devm_kzalloc(dev, GOODIX_EC_TX_SIZE, GFP_KERNEL);
> +=09if (!gdev->tx_buf)
> +=09=09return -ENOMEM;
> +
> +=09gdev->rx_buf =3D devm_kzalloc(dev, GOODIX_EC_RX_SIZE, GFP_KERNEL);
> +=09if (!gdev->rx_buf)
> +=09=09return -ENOMEM;

More devm allocs to kref managed gdev, are they safe?
=20
Or could gdev be directly managed with devm?

> +=09ret =3D goodix_ec_add_gpio_mappings(dev);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D goodix_ec_get_gpio(gdev, &gdev->write_done_gpio,
> +=09=09=09=09 "write-done", GPIOD_OUT_LOW);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D goodix_ec_get_gpio(gdev, &gdev->read_done_gpio,
> +=09=09=09=09 "read-done", GPIOD_OUT_LOW);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D goodix_ec_get_gpio(gdev, &gdev->irq_gpio,
> +=09=09=09=09 "irq", GPIOD_IN);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09gdev->irq =3D gpiod_to_irq(gdev->irq_gpio);
> +=09if (gdev->irq < 0)
> +=09=09return dev_err_probe(dev, gdev->irq,
> +=09=09=09=09     "failed to map IRQ GPIO to an IRQ\n");
> +
> +=09irq_type =3D irq_get_trigger_type(gdev->irq);
> +=09if (irq_type =3D=3D IRQ_TYPE_NONE) {
> +=09=09ret =3D irq_set_irq_type(gdev->irq, IRQ_TYPE_LEVEL_HIGH);
> +=09=09if (ret)
> +=09=09=09return dev_err_probe(dev, ret,
> +=09=09=09=09=09     "failed to set level-high IRQ trigger\n");
> +=09=09irq_type =3D IRQ_TYPE_LEVEL_HIGH;
> +=09}
> +
> +=09dev_info(dev, "bound %s: mailbox=3D%pa size=3D%#llx irq=3D%d\n",
> +=09=09 gdev->model->name, &gdev->mailbox_phys,
> +=09=09 (unsigned long long)gdev->mailbox_size, gdev->irq);

Probe's success path should be quiet.
=20
Also, this is way too technical to be presented to a normal user on=20
info level. What is user supposed to benefit from this information?
=20
Either change to dev_dbg() or drop.
=20
Also, you don't need the intermediate mailbox variables (not in struct=20
nor in local variables but can get them from resource directly).


> +=09irq_flags =3D IRQF_ONESHOT | IRQF_NO_AUTOEN;
> +=09ret =3D devm_request_threaded_irq(dev,
> +=09=09=09=09=09gdev->irq,
> +=09=09=09=09=09NULL,
> +=09=09=09=09=09goodix_ec_irq_thread,
> +=09=09=09=09=09irq_flags,
> +=09=09=09=09=09dev_name(dev),
> +=09=09=09=09=09gdev);

Fits to less lines.

> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret,
> +=09=09=09=09     "failed to request IRQ %d\n",
> +=09=09=09=09     gdev->irq);
> +
> +=09dev_dbg(dev, "IRQ %d registered: flags=3D%#lx trigger=3D%#x\n",
> +=09=09gdev->irq, irq_flags, irq_type);
> +
> +=09ret =3D goodix_ec_uapi_register(gdev);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret,
> +=09=09=09=09     "failed to register userspace interface\n");
> +
> +=09enable_irq(gdev->irq);
> +=09gdev->irq_enabled =3D true;

Does this attempt some kind of synchronization without barriers?

> +=09dev_info(dev, "IRQ %d armed\n", gdev->irq);
> +
> +=09dev_info(dev, "EC mailbox transport ready\n");

Success path should be quiet.

> +=09return 0;
> +}
> +
> +static void goodix_ec_remove(struct platform_device *pdev)
> +{
> +=09struct goodix_device *gdev =3D platform_get_drvdata(pdev);
> +
> +=09if (!gdev)
> +=09=09return;
> +
> +=09WRITE_ONCE(gdev->disconnected, true);
> +=09if (gdev->irq_enabled) {
> +=09=09disable_irq(gdev->irq);
> +=09=09synchronize_irq(gdev->irq);
> +=09=09gdev->irq_enabled =3D false;

There's something odd going on here, why you need to do this?

> +=09}
> +
> +=09goodix_ec_uapi_unregister(gdev);

Add a blank line to separate the critical section clearly.

> +=09mutex_lock(&gdev->transfer_lock);
> +=09kfree(gdev->rx_reassembly);
> +=09gdev->rx_reassembly =3D NULL;
> +=09gdev->rx_reassembly_len =3D 0;
> +=09gdev->rx_reassembly_received =3D 0;
> +=09gdev->rx_reassembly_active =3D false;

What can race with these if you need them under a lock?

> +=09if (gdev->write_done_gpio)
> +=09=09gpiod_set_value_cansleep(gdev->write_done_gpio, 0);
> +=09if (gdev->read_done_gpio)
> +=09=09gpiod_set_value_cansleep(gdev->read_done_gpio, 0);
> +=09mutex_unlock(&gdev->transfer_lock);
> +
> +=09dev_info(gdev->dev, "%s detached\n", gdev->model->name);

Please remove or change to _dbg() level.

> +}
> +
> +static int goodix_ec_suspend(struct device *dev)
> +{
> +=09struct goodix_device *gdev =3D dev_get_drvdata(dev);
> +=09unsigned long flags;
> +
> +=09if (!gdev || READ_ONCE(gdev->disconnected))
> +=09=09return 0;
> +
> +=09WRITE_ONCE(gdev->suspended, true);

Are you duplicating core's PM functionality? Why you need this?

> +=09wake_up_interruptible_all(&gdev->rx_wait);
> +=09if (gdev->irq_enabled) {

What is the scenario you need this for?

> +=09=09disable_irq(gdev->irq);
> +=09=09synchronize_irq(gdev->irq);

/**
 * disable_irq - disable an irq and wait for completion
 * @irq: Interrupt to disable
 *
 * Disable the selected interrupt line.  Enables and Disables are nested.
 *
 * This function waits for any pending IRQ handlers for this interrupt to
 * complete before returning.

> +=09=09gdev->irq_enabled =3D false;
> +=09}
> +
> +=09mutex_lock(&gdev->transfer_lock);
> +=09gpiod_set_value_cansleep(gdev->write_done_gpio, 0);
> +=09gpiod_set_value_cansleep(gdev->read_done_gpio, 0);
> +=09kfree(gdev->rx_reassembly);
> +=09gdev->rx_reassembly =3D NULL;
> +=09gdev->rx_reassembly_len =3D 0;
> +=09gdev->rx_reassembly_received =3D 0;
> +=09gdev->rx_reassembly_active =3D false;
> +=09mutex_unlock(&gdev->transfer_lock);

You've disabled irq already so why you need all this clearing?? What's=20
the concurrent activity you're protecting against with these??
=20
In any case, it seems to be duplicated to multiple places so should
definitely be in a helper instead (if it's presence is justified at all).

> +=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09if (gdev->rx_fifo_ready)
> +=09=09kfifo_reset(&gdev->rx_fifo);
> +=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09return 0;
> +}
> +
> +static int goodix_ec_resume(struct device *dev)
> +{
> +=09struct goodix_device *gdev =3D dev_get_drvdata(dev);
> +
> +=09if (!gdev || READ_ONCE(gdev->disconnected))

Probably missing header for READ_ONCE() though I'm far from convinced
about most of these booleans you've in place.
=20
You've like mix kref, devm, and a large set of booleans. It's very
confusing to follow and to understand why each is required (and I
suspect most are either duplicating kernel core's functionality or
entirely unnecessary).

> +=09=09return 0;
> +
> +=09gpiod_set_value_cansleep(gdev->write_done_gpio, 0);
> +=09gpiod_set_value_cansleep(gdev->read_done_gpio, 0);
> +=09if (!gdev->irq_enabled) {

Can it ever be true here? How?

> +=09=09enable_irq(gdev->irq);
> +=09=09gdev->irq_enabled =3D true;
> +=09}
> +=09/* Permit new writes only after the receive path is armed. */
> +=09WRITE_ONCE(gdev->suspended, false);

Is this doing some kind of adhoc PM counting?

> +=09wake_up_interruptible_all(&gdev->rx_wait);
> +=09return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(goodix_ec_pm_ops, goodix_ec_suspend,
> +=09=09=09=09goodix_ec_resume);
> +
> +static const struct acpi_device_id goodix_ec_acpi_match[] =3D {
> +=09{
> +=09=09.id =3D GXFP5130_ACPI_HID,
> +=09=09.driver_data =3D (kernel_ulong_t)&gxfp5130_model,
> +=09},
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, goodix_ec_acpi_match);
> +
> +static struct platform_driver goodix_ec_driver =3D {
> +=09.probe =3D goodix_ec_probe,
> +=09.remove =3D goodix_ec_remove,
> +=09.driver =3D {
> +=09=09.name =3D GOODIX_EC_DRIVER_NAME,
> +=09=09.acpi_match_table =3D ACPI_PTR(goodix_ec_acpi_match),
> +=09=09.pm =3D pm_sleep_ptr(&goodix_ec_pm_ops),
> +=09},
> +};
> +module_platform_driver(goodix_ec_driver);
> +
> +MODULE_AUTHOR("Ertugrul Topcu <ertugtopcu0@gmail.com>");
> +MODULE_DESCRIPTION("Goodix fingerprint sensors over an EC mailbox");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/goodix-ec-mailbox/goodix_ec_uapi.c b/dr=
ivers/platform/x86/goodix-ec-mailbox/goodix_ec_uapi.c
> new file mode 100644
> index 000000000000..d2f075acb481
> --- /dev/null
> +++ b/drivers/platform/x86/goodix-ec-mailbox/goodix_ec_uapi.c
> @@ -0,0 +1,360 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/capability.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> +#include <linux/kernel.h>
> +#include <linux/kfifo.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +#include <linux/unaligned.h>
> +
> +#include "goodix_ec_mailbox.h"
> +#include <linux/goodix_ec.h>
> +
> +#define GOODIX_EC_RX_FIFO_BYTES (256u * 1024u)

SZ_xx + don't forget include.

> +
> +static bool goodix_ec_rx_ready(struct goodix_device *gdev)
> +{
> +=09unsigned long flags;
> +=09bool ready;
> +
> +=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09ready =3D gdev->rx_fifo_ready && !kfifo_is_empty(&gdev->rx_fifo);
> +=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +
> +=09return ready;
> +}
> +
> +static int goodix_ec_uapi_open(struct inode *inode, struct file *file)
> +{
> +=09struct miscdevice *misc =3D file->private_data;
> +=09struct goodix_device *gdev =3D
> +=09=09container_of(misc, struct goodix_device, miscdev);
> +=09unsigned long flags;
> +
> +=09if (!capable(CAP_SYS_RAWIO))
> +=09=09return -EPERM;
> +=09if (!goodix_ec_device_get(gdev))
> +=09=09return -ENODEV;
> +=09if (READ_ONCE(gdev->disconnected)) {
> +=09=09goodix_ec_device_put(gdev);
> +=09=09return -ENODEV;
> +=09}
> +
> +=09if (file->f_mode & FMODE_READ) {
> +=09=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09=09if (!gdev->rx_fifo_ready) {
> +=09=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09=09goodix_ec_device_put(gdev);
> +=09=09=09return -ENODEV;
> +=09=09}
> +
> +=09=09if (gdev->rx_reader_open) {
> +=09=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09=09goodix_ec_device_put(gdev);
> +=09=09=09return -EBUSY;
> +=09=09}
> +
> +=09=09gdev->rx_reader_open =3D true;
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09}
> +
> +=09file->private_data =3D gdev;
> +=09return 0;
> +}
> +
> +static int goodix_ec_uapi_release(struct inode *inode, struct file *file=
)
> +{
> +=09struct goodix_device *gdev =3D file->private_data;
> +=09unsigned long flags;
> +
> +=09if (gdev && (file->f_mode & FMODE_READ)) {
> +=09=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09=09gdev->rx_reader_open =3D false;
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09}
> +=09if (gdev)
> +=09=09goodix_ec_device_put(gdev);
> +
> +=09return 0;
> +}
> +
> +static ssize_t goodix_ec_uapi_write(struct file *file,
> +=09=09=09=09    const char __user *user_buffer,
> +=09=09=09=09    size_t count, loff_t *position)
> +{
> +=09struct goodix_device *gdev =3D file->private_data;
> +=09struct goodix_ec_tx_header header;
> +=09u8 *mp_packet;
> +=09size_t required;
> +=09int ret;
> +
> +=09if (!gdev || !user_buffer || READ_ONCE(gdev->disconnected))
> +=09=09return -ENODEV;
> +
> +=09if (count < sizeof(header))
> +=09=09return -EINVAL;
> +
> +=09if (copy_from_user(&header, user_buffer, sizeof(header)))
> +=09=09return -EFAULT;
> +
> +=09if (header.payload_len > GOODIX_EC_UAPI_TX_MAX)
> +=09=09return -EMSGSIZE;
> +=09if (header.reserved || header.flags)
> +=09=09return -EINVAL;
> +
> +=09required =3D sizeof(header) + header.payload_len;
> +=09if (count !=3D required)
> +=09=09return -EINVAL;
> +
> +=09mp_packet =3D kmalloc(GOODIX_MP_HEADER_SIZE +
> +=09=09=09    header.payload_len, GFP_KERNEL);

Why you can't use sizeof(header) + ...?

> +=09if (!mp_packet)
> +=09=09return -ENOMEM;
> +
> +=09mp_packet[0] =3D header.mp_flags;
> +=09put_unaligned_le16(header.payload_len, mp_packet + 1);
> +=09mp_packet[3] =3D mp_packet[0] + mp_packet[1] + mp_packet[2];

An unannotated checksum calculation? Add a helper to name the=20
functionality?

> +=09if (header.payload_len &&
> +=09    copy_from_user(mp_packet + sizeof(struct goodix_mp_header),
> +=09=09=09   user_buffer + sizeof(header),
> +=09=09=09   header.payload_len)) {
> +=09=09kfree(mp_packet);

Please use __free() and put the variable declaration on the line where
you do the alloc (as per instruction in the long comment in cleanup.h).

> +=09=09return -EFAULT;
> +=09}
> +
> +=09mutex_lock(&gdev->transfer_lock);
> +=09if (READ_ONCE(gdev->disconnected))
> +=09=09ret =3D -ENODEV;
> +=09else if (READ_ONCE(gdev->suspended))
> +=09=09ret =3D -EHOSTDOWN;
> +=09else
> +=09=09ret =3D goodix_ec_sync_send(gdev, mp_packet,
> +=09=09=09=09=09  sizeof(struct goodix_mp_header) +
> +=09=09=09=09=09  header.payload_len);
> +=09mutex_unlock(&gdev->transfer_lock);

Please use scoped_guard() and return immediately.

> +
> +=09kfree(mp_packet);
> +
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return count;
> +}
> +
> +static ssize_t goodix_ec_uapi_read(struct file *file, char __user *user_=
buffer,
> +=09=09=09=09   size_t count, loff_t *position)
> +{
> +=09struct goodix_device *gdev =3D file->private_data;
> +=09struct goodix_ec_record_header header;
> +=09unsigned long flags;
> +=09u8 *record;
> +=09size_t required;
> +=09int ret;
> +
> +=09if (!gdev || !user_buffer || READ_ONCE(gdev->disconnected))
> +=09=09return -ENODEV;
> +
> +=09ret =3D mutex_lock_interruptible(&gdev->rx_read_lock);

Please try ACQUIRE/ACQUIRE_ERR() to avoid need to manually do the=20
unlock so you can convert those gotos below to direct returns.

> +=09if (ret)
> +=09=09return ret;
> +
> +=09for (;;) {
> +=09=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +
> +=09=09if (!gdev->rx_fifo_ready) {
> +=09=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09=09ret =3D -ENODEV;
> +=09=09=09goto out_unlock;
> +=09=09}
> +=09=09if (READ_ONCE(gdev->suspended)) {
> +=09=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09=09ret =3D -EHOSTDOWN;
> +=09=09=09goto out_unlock;
> +=09=09}
> +
> +=09=09if (kfifo_len(&gdev->rx_fifo) >=3D sizeof(header))
> +=09=09=09break;
> +
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);

And what exactly are you trying to protect here? Can't those check=20
results be invalid right after you release the lock?

> +
> +=09=09if (file->f_flags & O_NONBLOCK) {
> +=09=09=09ret =3D -EAGAIN;
> +=09=09=09goto out_unlock;
> +=09=09}
> +
> +=09=09ret =3D wait_event_interruptible(gdev->rx_wait,
> +=09=09=09=09=09       goodix_ec_rx_ready(gdev) ||
> +=09=09=09=09=09       !READ_ONCE(gdev->rx_fifo_ready) ||
> +=09=09=09=09=09       READ_ONCE(gdev->suspended));
> +=09=09if (ret)
> +=09=09=09goto out_unlock;
> +=09}
> +
> +=09if (kfifo_out_peek(&gdev->rx_fifo, &header,
> +=09=09=09   sizeof(header)) !=3D sizeof(header)) {
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);

I'm totally totally lost now.
=20
Well, technically was lost. I had to go back and figure out you came from
break here but yeah, the code flow handling in your code is way too
complex to be followable for mere mortals such as me (who unfortunately
also happens to be the acting maintainer of the subsystem this code
falls under... :-( ).
=20
I suggest you use cleanup.h in this function. It will force you to
architect sane code flow and lock scoping.

> +=09=09ret =3D -EIO;
> +=09=09goto out_unlock;
> +=09}
> +
> +=09required =3D sizeof(header) + header.len;
> +=09if (kfifo_len(&gdev->rx_fifo) < required) {
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09ret =3D -EIO;
> +=09=09goto out_unlock;
> +=09}
> +
> +=09if (count < required) {
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09ret =3D -EMSGSIZE;
> +=09=09goto out_unlock;
> +=09}
> +
> +=09record =3D kmalloc(required, GFP_ATOMIC);

Please use __free() and move the variable declaration to this lines.

> +=09if (!record) {
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09ret =3D -ENOMEM;
> +=09=09goto out_unlock;
> +=09}
> +
> +=09if (kfifo_out(&gdev->rx_fifo, record, required) !=3D required) {
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09kfree(record);
> +=09=09ret =3D -EIO;
> +=09=09goto out_unlock;
> +=09}
> +
> +=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +
> +=09if (copy_to_user(user_buffer, record, required)) {
> +=09=09kfree(record);
> +=09=09ret =3D -EFAULT;
> +=09=09goto out_unlock;
> +=09}
> +
> +=09kfree(record);
> +=09ret =3D required;
> +
> +out_unlock:
> +=09mutex_unlock(&gdev->rx_read_lock);
> +=09return ret;
> +}
> +
> +static __poll_t goodix_ec_uapi_poll(struct file *file, poll_table *wait)
> +{
> +=09struct goodix_device *gdev =3D file->private_data;
> +=09unsigned long flags;
> +=09__poll_t mask =3D 0;
> +
> +=09if (!gdev || READ_ONCE(gdev->disconnected))
> +=09=09return EPOLLERR;
> +
> +=09poll_wait(file, &gdev->rx_wait, wait);
> +
> +=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09if (!gdev->rx_fifo_ready || READ_ONCE(gdev->disconnected))
> +=09=09mask =3D EPOLLERR | EPOLLHUP;
> +=09else if (READ_ONCE(gdev->suspended))
> +=09=09mask =3D EPOLLERR;
> +=09else if (!kfifo_is_empty(&gdev->rx_fifo))
> +=09=09mask =3D EPOLLIN | EPOLLRDNORM;
> +=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +
> +=09return mask;
> +}
> +
> +static long goodix_ec_uapi_ioctl(struct file *file,
> +=09=09=09=09 unsigned int command,
> +=09=09=09=09 unsigned long argument)
> +{
> +=09struct goodix_device *gdev =3D file->private_data;
> +=09unsigned long flags;
> +
> +=09if (!gdev || READ_ONCE(gdev->disconnected))
> +=09=09return -ENODEV;
> +
> +=09switch (command) {
> +=09case GOODIX_EC_IOCTL_FLUSH_RX:
> +=09=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09=09if (gdev->rx_fifo_ready)
> +=09=09=09kfifo_reset(&gdev->rx_fifo);
> +=09=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +=09=09return 0;
> +=09default:
> +=09=09return -ENOTTY;
> +=09}
> +}
> +
> +static const struct file_operations goodix_ec_uapi_fops =3D {
> +=09.owner =3D THIS_MODULE,
> +=09.open =3D goodix_ec_uapi_open,
> +=09.release =3D goodix_ec_uapi_release,
> +=09.read =3D goodix_ec_uapi_read,
> +=09.write =3D goodix_ec_uapi_write,
> +=09.poll =3D goodix_ec_uapi_poll,
> +=09.unlocked_ioctl =3D goodix_ec_uapi_ioctl,
> +=09.compat_ioctl =3D compat_ptr_ioctl,
> +=09.llseek =3D noop_llseek,
> +};
> +
> +int goodix_ec_uapi_register(struct goodix_device *gdev)
> +{
> +=09int ret;
> +
> +=09spin_lock_init(&gdev->rx_fifo_lock);
> +=09mutex_init(&gdev->rx_read_lock);

Pairing destroy()?

> +=09init_waitqueue_head(&gdev->rx_wait);
> +
> +=09ret =3D kfifo_alloc(&gdev->rx_fifo, GOODIX_EC_RX_FIFO_BYTES, GFP_KERN=
EL);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09gdev->rx_fifo_ready =3D true;
> +=09gdev->rx_reader_open =3D false;
> +
> +=09gdev->miscdev.minor =3D MISC_DYNAMIC_MINOR;
> +=09gdev->miscdev.name =3D "gxfp";
> +=09gdev->miscdev.fops =3D &goodix_ec_uapi_fops;
> +=09gdev->miscdev.parent =3D gdev->dev;
> +
> +=09ret =3D misc_register(&gdev->miscdev);
> +=09if (ret) {
> +=09=09gdev->rx_fifo_ready =3D false;
> +=09=09kfifo_free(&gdev->rx_fifo);
> +=09=09return ret;
> +=09}
> +
> +=09gdev->misc_registered =3D true;
> +=09dev_info(gdev->dev, "userspace interface registered: /dev/gxfp\n");

Success path should be quiet.

> +=09return 0;
> +}
> +
> +void goodix_ec_uapi_unregister(struct goodix_device *gdev)
> +{
> +=09unsigned long flags;
> +
> +=09if (!gdev)
> +=09=09return;
> +
> +=09if (gdev->misc_registered) {

Can this ever be false?

> +=09=09misc_deregister(&gdev->miscdev);
> +=09=09gdev->misc_registered =3D false;
> +=09}
> +
> +=09if (!gdev->rx_fifo_ready)
> +=09=09return;
> +
> +=09spin_lock_irqsave(&gdev->rx_fifo_lock, flags);
> +=09gdev->rx_fifo_ready =3D false;
> +=09gdev->rx_reader_open =3D false;
> +=09kfifo_reset(&gdev->rx_fifo);
> +=09spin_unlock_irqrestore(&gdev->rx_fifo_lock, flags);
> +
> +=09wake_up_interruptible_all(&gdev->rx_wait);
> +=09kfifo_free(&gdev->rx_fifo);
> +}
> diff --git a/include/uapi/linux/goodix_ec.h b/include/uapi/linux/goodix_e=
c.h
> new file mode 100644
> index 000000000000..ff8d0d505ae7
> --- /dev/null
> +++ b/include/uapi/linux/goodix_ec.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +#ifndef _UAPI_GOODIX_EC_H_
> +#define _UAPI_GOODIX_EC_H_
> +
> +#include <linux/ioctl.h>
> +#include <linux/types.h>
> +
> +#define GOODIX_EC_UAPI_MAGIC=09=09'G'
> +#define GOODIX_EC_UAPI_TX_MAX=09=09500u
> +#define GOODIX_EC_UAPI_RX_MAX=09=09(128u * 1024u)
> +
> +/*
> + * read(2) returns one record:
> + *   struct goodix_ec_record_header
> + *   followed by len bytes of MP payload (normally one Goodix frame).
> + */
> +struct goodix_ec_record_header {
> +=09__u32 len;
> +=09__u32 mp_type;
> +=09__u64 timestamp_ns;
> +};
> +
> +/*
> + * write(2) accepts:
> + *   struct goodix_ec_tx_header
> + *   followed by payload_len bytes used as the MP payload.
> + */
> +struct goodix_ec_tx_header {
> +=09__u8 mp_flags;
> +=09__u8 reserved;
> +=09__u16 payload_len;
> +=09__u32 flags;
> +};
> +
> +#define GOODIX_EC_IOCTL_FLUSH_RX=09_IO(GOODIX_EC_UAPI_MAGIC, 0x11)
> +
> +#endif /* _UAPI_GOODIX_EC_H_ */

Well, this was quite messy read but I believe it will get much more=20
readable once you eliminate the excessive linebreaks, replace the adhoc=20
synchronization things with what is available from core, and convert to=20
use cleanup.h.

--=20
 i.
--8323328-1616873346-1789651701=:1179--

Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6F3F0ABA;
	Fri, 10 Jul 2026 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685530; cv=none; b=Lq/Z2uyOtLIkbY+djjNGdRzank4oGywPO0wxtUp7Dit9XkuxC6+g3s97ClwUNOYZW0K9GNBE+VLM/GDcnZ0gzqEza/e/SZvxZiiukUecO1O/GyzhT0VbXw2w8rqjfXmpqespRAYU6qU9cwy+DZ9GLnEU/09htcgfrvserZgM468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685530; c=relaxed/simple;
	bh=xOA3MoAAXnQWw1pxJ08H5pMphCFGS30Tw5RRgu4YPMc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GjSFCQEmkXQitx+jj6pwm7GXucxxgr5ZpTESB376ceoZ1qZeOzJLUcvqFoWEm5/Li5tC+BqocrWOa4/rXXc3eYUCZ1leDPbm+eM19I6pBtKSK5Wksf4TN6mA1p/rNidkXd8bI4O9vz1Ys0yjd11OouKV3vw1iyS3Z+bcgFAimhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=qrTgxpaQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hFZSaKLa; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="qrTgxpaQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hFZSaKLa"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 3AC121380189;
	Fri, 10 Jul 2026 08:12:07 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Fri, 10 Jul 2026 08:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1783685527;
	 x=1783692727; bh=gGlLa973AtKT+e84mHWJHgltyErNIfm3YbFwR/rZUmU=; b=
	qrTgxpaQXDfLmifHZIIrAqkMKKd/ma35zlTZ5EhBKLtqmwg9Fk6d81ir0idEK1OU
	LS+SGoXqpLSbvuQK1Eq08C3PQxAonHG4STclFrmvWQops0H1Ecu8NuAx11CwKRvZ
	XtCsg/BM2aDC72ruyP8YZhaBFZboYEyylVDOxuzlww91sqG6GI34aKiD1KwCwZao
	5ihj0VR/LIoHH6OzPWSZfiDHlMX9GOgv9aRvHeRnb14BMnViVmiCtF8xTA8MUdMx
	vpZ83xSjaFowk7QL31Cu2x11vVS6ZInJF/4AQXZmQeh+duts965aeCvQiPRdNpcP
	LnH74FKpgOn1i/njTbTjOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783685527; x=
	1783692727; bh=gGlLa973AtKT+e84mHWJHgltyErNIfm3YbFwR/rZUmU=; b=h
	FZSaKLa4LvHXXL9LjwctnUWeSve69xtUMScfv+P5EXjweR97w3ZZrGp5LeKMENo+
	dSYJEF5G/1QXdrsju+CqH1yLUy/Qy+9/PxgMdVpiLC9hrPbhkRSq5SUKvn0aVhkH
	hf52NSGEvBgCxBHboiDf4ZhTCQ3S9R0Wh33ugX3Rn5ZrEIw86aGvSd/1F/pF3r3s
	wQGLwIRSZsh69Nvj0TFtbsFgfdl4rd4MjH/xNvIjWyOmomtVFX89rIL3PEMG1l4L
	0ZKLi9y8BktykNs8nV15GNK9OrGs6//ynRnk+Ry/ocazHQJMbhg3jiFX5aNgjE9A
	BxPFCKz5OD2r+SLS6Yplw==
X-ME-Sender: <xms:luFQarjZxtmtYoIBVVsinFPPTjF33X-HwZuBzW4zdecSQBPq3DidAw>
    <xme:luFQai3XdIJ_9Ams9vgeglJuHY9NY04W7qCQ25Sr3UlgmWKePbJ4KBVhHgrYpfvxY
    XBvE6DKnv15OiFONaeL2hEt3rgIhYkInFUsq4hoKY2uBA02sAxNM40>
X-ME-Proxy-Cause: dmFkZTEPESPXoOfQ7a7xo3+2U7yuVR9W0A7OakNavuE/sKzwVuk2AqAeCVFdT2//38YObc
    ENnsW2jiiNKqx9dftijYxyVwp9bJxWd2ywicAuDPb3T7ns5p3j2UkVVKGdg9YUwqCnZBhe
    UUxXLXFFkdoRt6V+g0Z9vXV9d48kneth1bS38xyxhth/YBkBOdrf5ISF8Ze1LcckeCi4HZ
    O1Vb9BHv792NRs3I7osAAvpqnrc8WBtVuyrZGk53k5/86lTwpqioOL/OfqfoIo/FJfPu+h
    EOYDjJ7LjYAJj3Zd9rmlzvtAjeOczH4+bSr8ZOTuP2SqJMtYAxBlpIfKYwuBd0mEycWjDJ
    6FjO7YU44VPPKbR7XxDDwyp2tFONOtJmJAysaSS+DnFBQqPRa4rmhCoBz5AnRI6scMD4Ev
    cK0RCXZq+roYH0dPnYJUUve3FWUqbe0QvWXPeddjYCzKw0NhoT61OclXAA2OcdiH1BdcV9
    RCLpoGqJWWC5V2daIqZOvWk2XJS8rmFS1xwMRcBYlX8I8I2Ljl49OH0n8D4IsWqtQy6KUw
    EKfaRLAAeLC1lUPBgxnSZ7LZiV1DQx0SddNXyFvv2Ki6Kqz/0FfzethG84ONpMhJgLywCf
    vHweCzfeIlbRv1skaVDjGfiiSZyaEW+YZys3Xg9ExQ+5fOhLRlDReyeTq9KA
X-ME-Proxy: <xmx:luFQauT5hn6UKpZThToIF4xH20rhAuxsnzxQu4zt6WPgI0BDIfCEzg>
    <xmx:luFQalfZh80-1f27PD_aJW1AUNzqTWzaQq1TQah4Wwk2QhmXMOM7vg>
    <xmx:luFQavRkTlusKVq6rTzEKSrR9rdN5UE3Loz0TrU7ylTMtGmoZ4DWbQ>
    <xmx:luFQap0pc1Fjg0Kw1RDtL2NF5UPwakU3BgxLo3-F6_lyQEyFTsnbCg>
    <xmx:l-FQav8z4jeyqxxRXPVtm2PTVz9syv5s2ISZR25vgdjaMPz7LMaAOVhK>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0E5C62CE007E; Fri, 10 Jul 2026 08:12:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AMFhOv3h6IR7
Date: Fri, 10 Jul 2026 08:11:45 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Sean Rhodes" <sean@starlabs.systems>,
 "Tzung-Bi Shih" <tzungbi@kernel.org>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Corentin Chary" <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
 "Denis Benato" <denis.benato@linux.dev>,
 "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Jorge Lopez" <jorge.lopez2@hp.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Joshua Grisham" <josh@joshuagrisham.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, Dell.Client.Kernel@dell.com,
 "Brian Norris" <briannorris@chromium.org>,
 "Julius Werner" <jwerner@chromium.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Titouan Ameline de Cadeville" <titouan.ameline@gmail.com>,
 "Kees Cook" <kees@kernel.org>, chrome-platform@lists.linux.dev
Message-Id: <7b850828-6bea-49ec-bffe-967716038a0e@app.fastmail.com>
In-Reply-To: 
 <0d105cd2eb39e1b418095ab6977d9a5e08385ed5.1783663929.git.sean@starlabs.systems>
References: <cover.1783663929.git.sean@starlabs.systems>
 <0d105cd2eb39e1b418095ab6977d9a5e08385ed5.1783663929.git.sean@starlabs.systems>
Subject: Re: [PATCH v3 1/3] firmware: Move firmware attributes class helper
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Fri, Jul 10, 2026, at 2:12 AM, Sean Rhodes wrote:
> Move the firmware attributes class helper from drivers/platform/x86 to
> drivers/firmware and expose its class declaration through a public Lin=
ux
> header.
>
> The helper is not x86-specific. Keeping it in firmware lets coreboot
> firmware drivers use the standard firmware-attributes ABI without livi=
ng
> under platform/x86.
>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  MAINTAINERS                                               | 8 ++++++++
>  drivers/firmware/Kconfig                                  | 3 +++
>  drivers/firmware/Makefile                                 | 1 +
>  .../x86 =3D> firmware}/firmware_attributes_class.c          | 2 +-
>  drivers/platform/x86/Kconfig                              | 3 ---
>  drivers/platform/x86/Makefile                             | 2 --
>  drivers/platform/x86/asus-armoury.c                       | 2 +-
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c        | 2 +-
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c              | 2 +-
>  drivers/platform/x86/lenovo/think-lmi.c                   | 2 +-
>  drivers/platform/x86/lenovo/wmi-other.c                   | 2 +-
>  drivers/platform/x86/samsung-galaxybook.c                 | 2 +-
>  .../linux/firmware_attributes.h                           | 6 +++---
>  13 files changed, 22 insertions(+), 15 deletions(-)
>  rename drivers/{platform/x86 =3D> firmware}/firmware_attributes_class=
.c=20
> (94%)
>  rename drivers/platform/x86/firmware_attributes_class.h =3D>=20
> include/linux/firmware_attributes.h (60%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..ec0a12121357 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10114,6 +10114,14 @@ F:	include/linux/firewire.h
>  F:	include/uapi/linux/firewire*.h
>  F:	tools/firewire/
>=20
> +FIRMWARE ATTRIBUTES CLASS
> +M:	Hans de Goede <hansg@kernel.org>
> +M:	Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/firmware/firmware_attributes_class.c
> +F:	include/linux/firmware_attributes.h
> +
>  FIRMWARE FRAMEWORK FOR ARMV8-A
>  M:	Sudeep Holla <sudeep.holla@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscriber=
s)
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 12dc70254842..78a239f8bbef 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -8,6 +8,9 @@ menu "Firmware Drivers"
>=20
>  source "drivers/firmware/arm_scmi/Kconfig"
>=20
> +config FW_ATTR_CLASS
> +	tristate
> +
>  config ARM_SCPI_PROTOCOL
>  	tristate "ARM System Control and Power Interface (SCPI) Message=20
> Protocol"
>  	depends on ARM || ARM64 || COMPILE_TEST
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index 4ddec2820c96..385b6e8b7fc6 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+=3D memmap.o
>  obj-$(CONFIG_MTK_ADSP_IPC)	+=3D mtk-adsp-ipc.o
>  obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi.o
>  obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg.o
> +obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class.o
>  obj-$(CONFIG_SYSFB)		+=3D sysfb.o
>  obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb.o
>  obj-$(CONFIG_TH1520_AON_PROTOCOL) +=3D thead,th1520-aon.o
> diff --git a/drivers/platform/x86/firmware_attributes_class.c=20
> b/drivers/firmware/firmware_attributes_class.c
> similarity index 94%
> rename from drivers/platform/x86/firmware_attributes_class.c
> rename to drivers/firmware/firmware_attributes_class.c
> index 736e96c186d9..503ecc288086 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/firmware/firmware_attributes_class.c
> @@ -3,7 +3,7 @@
>  /* Firmware attributes class helper module */
>=20
>  #include <linux/module.h>
> -#include "firmware_attributes_class.h"
> +#include <linux/firmware_attributes.h>
>=20
>  const struct class firmware_attributes_class =3D {
>  	.name =3D "firmware-attributes",
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
> index b54b5212b204..beed14c38b54 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -926,9 +926,6 @@ config DASHARO_ACPI
>=20
>  source "drivers/platform/x86/x86-android-tablets/Kconfig"
>=20
> -config FW_ATTR_CLASS
> -	tristate
> -
>  config INTEL_IMR
>  	bool "Intel Isolated Memory Region support"
>  	depends on X86_INTEL_QUARK && IOSF_MBI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
> index 872ac3842391..cab20a4145e3 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -63,8 +63,6 @@ obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+=3D hp/
>  # Hewlett Packard Enterprise
>  obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
>=20
> -obj-$(CONFIG_FW_ATTR_CLASS)	+=3D firmware_attributes_class.o
> -
>  # IBM Thinkpad (before 2005)
>  obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
>  obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
> diff --git a/drivers/platform/x86/asus-armoury.c=20
> b/drivers/platform/x86/asus-armoury.c
> index 495dc1e31d40..93fac0d464d2 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -34,7 +34,7 @@
>  #include <linux/sysfs.h>
>=20
>  #include "asus-armoury.h"
> -#include "firmware_attributes_class.h"
> +#include <linux/firmware_attributes.h>
>=20
>  #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
>=20
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c=20
> b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> index ab46a023cc34..85670be01647 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -16,7 +16,7 @@
>  #include <linux/sysfs.h>
>  #include <linux/wmi.h>
>  #include "dell-wmi-sysman.h"
> -#include "../../firmware_attributes_class.h"
> +#include <linux/firmware_attributes.h>
>=20
>  #define MAX_TYPES  4
>  #include <linux/nls.h>
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c=20
> b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 27fd6cd21529..44314ae4e5e3 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -14,7 +14,7 @@
>  #include <linux/string.h>
>  #include <linux/wmi.h>
>  #include "bioscfg.h"
> -#include "../../firmware_attributes_class.h"
> +#include <linux/firmware_attributes.h>
>  #include <linux/nls.h>
>  #include <linux/errno.h>
>=20
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c=20
> b/drivers/platform/x86/lenovo/think-lmi.c
> index e215e86e3db7..a56f152b5f28 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -20,7 +20,7 @@
>  #include <linux/types.h>
>  #include <linux/dmi.h>
>  #include <linux/wmi.h>
> -#include "../firmware_attributes_class.h"
> +#include <linux/firmware_attributes.h>
>  #include "think-lmi.h"
>=20
>  static bool debug_support;
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c=20
> b/drivers/platform/x86/lenovo/wmi-other.c
> index fbb32bf404f2..e9a2c4684e5f 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -50,7 +50,7 @@
>  #include "wmi-capdata.h"
>  #include "wmi-events.h"
>  #include "wmi-helpers.h"
> -#include "../firmware_attributes_class.h"
> +#include <linux/firmware_attributes.h>
>=20
>  #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
>=20
> diff --git a/drivers/platform/x86/samsung-galaxybook.c=20
> b/drivers/platform/x86/samsung-galaxybook.c
> index 6382af0b106c..74b8c887dd79 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -28,7 +28,7 @@
>  #include <linux/uuid.h>
>  #include <linux/workqueue.h>
>  #include <acpi/battery.h>
> -#include "firmware_attributes_class.h"
> +#include <linux/firmware_attributes.h>
>=20
>  #define DRIVER_NAME "samsung-galaxybook"
>=20
> diff --git a/drivers/platform/x86/firmware_attributes_class.h=20
> b/include/linux/firmware_attributes.h
> similarity index 60%
> rename from drivers/platform/x86/firmware_attributes_class.h
> rename to include/linux/firmware_attributes.h
> index d27abe54fcf9..d4026ba1fcc2 100644
> --- a/drivers/platform/x86/firmware_attributes_class.h
> +++ b/include/linux/firmware_attributes.h
> @@ -2,11 +2,11 @@
>=20
>  /* Firmware attributes class helper module */
>=20
> -#ifndef FW_ATTR_CLASS_H
> -#define FW_ATTR_CLASS_H
> +#ifndef _LINUX_FIRMWARE_ATTRIBUTES_H
> +#define _LINUX_FIRMWARE_ATTRIBUTES_H
>=20
>  #include <linux/device/class.h>
>=20
>  extern const struct class firmware_attributes_class;
>=20
> -#endif /* FW_ATTR_CLASS_H */
> +#endif /* _LINUX_FIRMWARE_ATTRIBUTES_H */

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark

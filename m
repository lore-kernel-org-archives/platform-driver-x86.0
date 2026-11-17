Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951978;
	b=i1WT7N/XM8flT7JLfOauGfkAAQhkhkrCjb1QH7o7S2iO9jBH4PPL9duYxREUM6qkoylV
	 Y2HG2M5SPGwmHhaCBfgd+9H/DebFXoHkCueCy+Yvl+Xv0SB9eY9QYiIj1n2orn6+YEW+I
	 MQ5wgdBqMvKdqg+Ff8adYgDSI7fM5Z1uReCCJfZeq7bbWvg8XV5LxHKvsY8Sbff0xvGlR
	 g69Lo5EFPXVgkHh9xkLMnWNPYa9DKOVsnuCi8nRcYEptAIghHyuLLeGleuyY2abfQYL8X
	 yXu8HtuSIBx5DQK5RFMJap1Jek+TrPAeqLut13kThBEzB/n396FtsKVeY9NA4X4n23Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951978;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=haKrYhi1fLulcTlNf5DAMN7A5q2gdF+ZJB6RZ1UmAFw=;
	b=d6HDb4qyK7eM0LeKesY5iHCklBCmsUmzJYs7YZngz5yxzApWjpuxHe6KMCY+PPUxcxn3
	 yCMCYXGTzXmbCsDuR+nt4nPRcfy2+oxLhRecZHDGA6nPIgfsq+qEkM8io5eaBZ6yiLYhd
	 Wm5Ei6O0Mi3zWMuRamS6+uzfOmsX8KXiS0TIdm9qOHyocRpEShObuxPYMtx6OJtN05Kvy
	 G4ufHf/GS8PGDPL3nOBBykqerVwnpZfi2589dkZEo8mhbShD23fFiT5jPOsXuiDZDL7XB
	 YiiWpz9NdV0F/z9jClb03NsqCjUE5IwvH7MsFlkZGSDNBZ214UWkNS6c81+uzhTKdZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=CTCJVZwy;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D1606A334
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 21:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41D1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=CTCJVZwy
DKIM2-Signature:  i=1; m=1; t=1794951975;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:BANS1HgBYP8VUWc09uYfARuo0ax1
   IbT66bdQZmvVrvH2my5EGC+miEni1fSbES+lNhYMdBFSZUPL7Wqy3eNIFWJyiY9SaqniJandRNr
   rNbEbcxvdcbLwjzP1Ji0I1W2YyPadLjvpWwsc8a6jJHoQKSbGex9es4Xm7Yi/16M7LJmehvYdcJ
   CVmAb1bfRje01lfd971NephFY24FhAECpMkaZnnZQUDHk4H+TMaY+CbL/MNri+I9dFu8enuItSA
   dcPdRy6ZQxyqOhZajZ4tMg4vbFD+VfvoSMDp5K4vXon3gjpWvFf89A3fi1smmzpSuK4r61mrbwG
   iCnQaGPQ3GEzxA==;
Message-Instance:  m=1;
 h=sha256:
   Vb9lSjUFSvSR4M/lADpXa1+kaEOiMnFvOWByLxJ3ZRk=:
   nIKoL4OH1N/1sCOwhAsVh/g803FxILimp7kCUZQ1P64=,
  sha512:
   9R2I698HEDPpVPgwdCHBIWXPMfoI4rOFtke0sQ8fFf0EMhbT7hcAEUuIclbnGplwSyzaNAi98yZPzLKzxGEuLQ==:
   Qkbq94/rXBrM/1UdCWWFTbtdHheNnWzr2JHVhV6d6+qBaT8vaCXqtuqrUZQ3Q4+Uyv4g2nLeV75CaBZihWtTCQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794951969; x=1795556769; i=w_armin@gmx.de;
	bh=haKrYhi1fLulcTlNf5DAMN7A5q2gdF+ZJB6RZ1UmAFw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CTCJVZwy4zfjm/ljR5G35KZ4hMWn5bus4vQ3emohd/EKBmoHWej8rLzcY5timNNV
	 wWpG3Xphf+hh+BFAXN2ozzil6Nk4g/yX3nB2FszK2xlvlwwgBi8L3GgwrlDlLgmzk
	 5IB8Gs9M7ErtCYIZ9oNCubfcS5ZcqCH3BK0NmiaNO1K4QhPtz9eSQltzSjQlYbcIL
	 hYgKP0qzZ1ezOFNUeBRhQ63QgClcAwnAF2MGHwt4xaCJS9UEdJzEagWSo1lWWd6Fx
	 4f2QcAbfduqTGY+GoNECF20tBebYuoKpefBzqVolcPrbb9/0WF5limplwJ/fC9zs1
	 YAblkxUJHghOd/aqzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjjCL-1wjwpn3UcN-00mfOy; Tue, 17
 Nov 2026 22:46:09 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	teolyub@gmail.com
Subject: [PATCH 1/2] platform/x86: dell: Add new dell-wmi-pega driver
Date: Tue, 17 Nov 2026 22:45:03 +0100
Message-ID: <20261117214604.397131-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:feN3W0f3TJbK/0TXO1f050OqelWqnlz6R9f7qOWuE02qfajySow
 VB825zjd3uEebp0u+TCNiI04/8AiBcfsSy7cV22IBoKFwbPdIxzCjA6HgPms+Fp0MfApQFS
 UJq5ZG9vgdX0Zlcky1bcUJBEGtVgmzQrlkngf9t7vfeJCVyojq4mvDOxo3rudhhjPtyzI21
 wiylKbBFAY2XXafLZj+Yw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:msiLdgMfgV0=;MDq6B32P7wSpWkrzL2w/wK0lzo/
 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
 ScXGhjHvDTl0h+tSaKQ==

A user has reported that the WMI hotkey events on Dell All-In-One
machines need to be manually enabled on some models thru a separate
WMI device. This WMI device seems to be present on many other models
but has no effect on them.

Add a small driver for enabling support for this WMI device. This
enables the HDMI Input key on the Dell OptiPlex 7400 All-in-One
machine.

Reported-by: Teodora <teolyub@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/0TZENT.54P2IBFQRED22@g=
mail.com
Tested-by: Teodora <teolyub@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/devices/dell-wmi-pega.rst | 82 ++++++++++++++++++
 MAINTAINERS                                 |  6 ++
 drivers/platform/x86/dell/Kconfig           | 13 +++
 drivers/platform/x86/dell/Makefile          |  1 +
 drivers/platform/x86/dell/dell-wmi-pega.c   | 93 +++++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/wmi/devices/dell-wmi-pega.rst
 create mode 100644 drivers/platform/x86/dell/dell-wmi-pega.c

diff --git a/Documentation/wmi/devices/dell-wmi-pega.rst b/Documentation/w=
mi/devices/dell-wmi-pega.rst
new file mode 100644
index 000000000000..935c8511594b
=2D-- /dev/null
+++ b/Documentation/wmi/devices/dell-wmi-pega.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+Dell All-In-One Series Platform Integration (dell-wmi-pega)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+------------
+
+Many Dell All-In-One devices contain a WMI device for notifying the under=
lying platform
+of various OS-specific events like power up, shutdown and backlight brigh=
tness control.
+
+Not implementing support for this WMI device might prevent hotkeys expose=
d over WMI from
+working on some models.
+
+WMI interface description
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+The WMI interface description can be decoded from the embedded binary MOF=
 (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+ [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
+  Description("Class used to operate method - WMBC"),
+  guid("{2D703EE8-36AC-4F88-BDB5-7556CE6B2946}") : ToInstance]
+ class AcpiOSD_WMBC_method : WMIMethod {
+
+   [key, read]
+   string InstanceName;
+
+   [read]
+   boolean Active;
+
+   [WmiMethodId(1), Implemented, read, write,
+    Description("Invoked by AP when system up.")]
+   void PegaOemNotificationStartUp([out, Description("Return Value")] uin=
t32 RetVal);
+
+   [WmiMethodId(2), Implemented, read, write,
+    Description("Invoked by AP when system is going to off state.")]
+   void PegaOemNotificationStop([out, Description("Return Value")] uint32=
 RetVal);
+
+   [WmiMethodId(3), Implemented, read, write,
+    Description("Invoked by Application to tune up brightness.")]
+   void PegaOemNotificationBrightnessUP([out, Description("Return Value")=
] uint32 RetVal);
+
+   [WmiMethodId(4), Implemented, read, write,
+    Description("Invoked by Application to tune down brightness.")]
+   void PegaOemNotificationBrightnessDown([out, Description("Return Value=
")] uint32 RetVal);
+
+   [WmiMethodId(5), Implemented, read, write, Description("Reserved.")]
+   void PegaOemNotificationRSVD1([out, Description("Return Value")] uint3=
2 RetVal);
+
+   [WmiMethodId(6), Implemented, read, write, Description("Reserved.")]
+   void PegaOemNotificationRSVD2([out, Description("Return Value")] uint3=
2 RetVal);
+ };
+
+The return value of each WMI method should be equal to the WMI method ID.
+
+WMI method PegaOemNotificationStartUp()
+---------------------------------------
+
+Notifies the platform that the OS is operational. On some models this WMI=
 method also enables
+reporting of hotkey events over WMI.
+
+WMI method PegaOemNotificationStop()
+------------------------------------
+
+Notifies the platform that the OS is shutting down.
+
+WMI method PegaOemNotificationBrightnessUP()
+--------------------------------------------
+
+Notifies the platform that the user wants to increase the backlight brigh=
tness. This WMI method
+usually only forwards this request to the acpi-video driver, so the dell-=
wmi-pega driver does
+not use it.
+
+WMI method PegaOemNotificationBrightnessDown()
+----------------------------------------------
+
+Notifies the platform that the user wants to decrease the backlight brigh=
tness. See
+``PegaOemNotificationBrightnessUP()`` for details.
diff --git a/MAINTAINERS b/MAINTAINERS
index bd31e734669e..fb9a80f96900 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7534,6 +7534,12 @@ M:	Pali Roh=C3=A1r <pali@kernel.org>
 S:	Maintained
 F:	drivers/platform/x86/dell/dell-wmi-base.c
=20
+DELL WMI PEGA DRIVER
+M:	Armin Wolf <W_Armin@gmx.de>
+S:	Odd Fixes
+F:	Documentation/wmi/devices/dell-wmi-pega.rst
+F:	drivers/platform/x86/dell/dell-wmi-pega.c
+
 DELL WMI SYSMAN DRIVER
 M:	Prasanth Ksr <prasanth.ksr@dell.com>
 L:	Dell.Client.Kernel@dell.com
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell=
/Kconfig
index 9f0016056d7e..289379383ccb 100644
=2D-- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -228,6 +228,7 @@ config DELL_WMI_AIO
 	depends on ACPI_WMI
 	depends on INPUT
 	select INPUT_SPARSEKMAP
+	imply DELL_WMI_PEGA
 	help
 	  Say Y here if you want to support WMI-based hotkeys on Dell
 	  All-In-One machines.
@@ -262,6 +263,18 @@ config DELL_WMI_LED
 	  This adds support for the Latitude 2100 and similar
 	  notebooks that have an external LED.
=20
+config DELL_WMI_PEGA
+	tristate "Dell WMI AIO Platform Support"
+	default m
+	depends on ACPI_WMI
+	help
+	  This option adds support for WMI-based platform integration on Dell Al=
l-In-One machines.
+	  This driver is necessary for enabling the delivery of hotkey events to=
 the dell-wmi-aio
+	  driver on some machines.
+
+	  To compile this drivers as a module, choose M here: the module will be=
 called
+	  dell-wmi-pega.
+
 config DELL_WMI_SYSMAN
 	tristate "Dell WMI-based Systems management driver"
 	default m
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/del=
l/Makefile
index 470874c6e6e6..46c91c240a2c 100644
=2D-- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -27,5 +27,6 @@ obj-$(CONFIG_DELL_WMI_AIO)			+=3D dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+=3D dell-wmi-descriptor.o
 obj-$(CONFIG_DELL_WMI_DDV)			+=3D dell-wmi-ddv.o
 obj-$(CONFIG_DELL_WMI_LED)			+=3D dell-wmi-led.o
+obj-$(CONFIG_DELL_WMI_PEGA)			+=3D dell-wmi-pega.o
 obj-$(CONFIG_DELL_WMI_SYSMAN)			+=3D dell-wmi-sysman/
 obj-$(CONFIG_DELL_DW5826E_RESET)		+=3D dell-dw5826e-reset.o
diff --git a/drivers/platform/x86/dell/dell-wmi-pega.c b/drivers/platform/=
x86/dell/dell-wmi-pega.c
new file mode 100644
index 000000000000..ddb1b6cc6b1c
=2D-- /dev/null
+++ b/drivers/platform/x86/dell/dell-wmi-pega.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * WMI platform integration for Dell All-In-One series.
+ *
+ * Copyright (C) 2026 Armin Wolf <W_Armin@gmx.de>
+ *
+ * Based on earlier work by Teodora <teolyub@gmail.com>.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/device/driver.h>
+#include <linux/dev_printk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+
+#define PEGA_GUID	"2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
+
+enum dell_pega_method {
+	DELL_PEGA_NOTIFICATION_STARTUP		=3D 0x01,
+	DELL_PEGA_NOTIFICATION_STOP		=3D 0x02,
+	DELL_PEGA_NOTIFICATION_BRIGHTNESS_UP	=3D 0x03,
+	DELL_PEGA_NOTIFICATION_BRIGHTNESS_DOWN	=3D 0x04,
+	DELL_PEGA_NOTIFICATION_RESERVED_1	=3D 0x05,
+	DELL_PEGA_NOTIFICATION_RESERVED_2	=3D 0x06,
+};
+
+static int dell_wmi_pega_invoke(struct wmi_device *wdev, enum dell_pega_m=
ethod method)
+{
+	struct wmi_buffer input =3D { };
+	struct wmi_buffer output;
+	int ret;
+
+	ret =3D wmidev_invoke_method(wdev, 0x0, method, &input, &output, sizeof(=
__le32));
+	if (ret < 0)
+		return ret;
+
+	__le32 *result __free(kfree) =3D output.data;
+	/* The return value should always be equal to the WMI method ID */
+	if (le32_to_cpu(*result) !=3D method)
+		return -EIO;
+
+	return 0;
+}
+
+static int dell_wmi_pega_probe(struct wmi_device *wdev, const void *conte=
xt)
+{
+	int ret;
+
+	ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STARTUP);
+	if (ret < 0)
+		dev_err(&wdev->dev,
+			"Failed to notify platform of startup, some hotkeys might not work\n")=
;
+
+	return ret;
+}
+
+static void dell_wmi_pega_shutdown(struct wmi_device *wdev)
+{
+	int ret;
+
+	ret =3D dell_wmi_pega_invoke(wdev, DELL_PEGA_NOTIFICATION_STOP);
+	if (ret < 0)
+		dev_warn(&wdev->dev, "Failed to notify platform of shutdown\n");
+}
+
+static const struct wmi_device_id dell_wmi_pega_id_table[] =3D {
+	{ PEGA_GUID, NULL },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, dell_wmi_pega_id_table);
+
+static struct wmi_driver dell_wmi_pega_driver =3D {
+	.driver =3D {
+		.name =3D "dell-wmi-pega",
+		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table =3D dell_wmi_pega_id_table,
+	.probe =3D dell_wmi_pega_probe,
+	.remove =3D dell_wmi_pega_shutdown,
+	.shutdown =3D dell_wmi_pega_shutdown,
+	.no_singleton =3D true,
+};
+module_wmi_driver(dell_wmi_pega_driver);
+
+MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
+MODULE_DESCRIPTION("Dell All-In-One series platform integration");
+MODULE_LICENSE("GPL");
=2D-=20
2.56.1


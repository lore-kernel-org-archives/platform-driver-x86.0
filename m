Received: from tpecef22.compal.com (exmail3.compal.com [59.120.207.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2E63A9870;
	Mon, 25 May 2026 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=59.120.207.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692334; cv=none; b=potlptTEcWMUZXyzPqWT6eJkGxhXmWq5R9DQ0/qhSeCPeYKZ4cZXdx3l7JoYHHgvtpUt5aTyt2BxrvPk+eahDZ8KYv7s4YzKAqrp9K8Am6LyN+LxEUs2gQoiVch/hUSVs4KwsZCA5zvHq8qzxhfeLFyg+u7uADCOnfZZ6lI7E9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692334; c=relaxed/simple;
	bh=Xw4TWd/hqSbP5kio/emvf/1XW12D41UQ0G7F3p82Kks=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ah9hbJsn8uFjeXlcoUuFwsrCP6zfd+tBqHO0H/nOZTVLEpysXpheToJpceBKbppzmWNp4OBjWm57dptkdv9zd8fEm2IHHfnZbE8zEetnRsooayIajRuyj12S1qV/rz6dmxa91Pr/xlJWH82k5+d0kbGbBCUCFCVnlO6gkDRIoFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.com; spf=pass smtp.mailfrom=compal.com; arc=none smtp.client-ip=59.120.207.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.com
X-UUID: 24c8bfce580711f1a87c2323a98e90a4-20260525
X-CID-CACHE: Type:Local,Time:202605251458+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:6d6c6eb5-5be1-4e61-b650-475a4a285d4f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:c9c6421f-023f-4f87-9e9c-6c116c694fb3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|850|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 24c8bfce580711f1a87c2323a98e90a4-20260525
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 577830645; Mon, 25 May 2026 14:58:33 +0800
X-UUID: 2071aff8580711f1943831befd1aa4bc-20260525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:19d117ed-0c86-4e08-b371-652f9b24d68c,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:92c6421f-023f-4f87-9e9c-6c116c694fb3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|850|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2071aff8580711f1943831befd1aa4bc-20260525
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1287935412; Mon, 25 May 2026 14:58:25 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Mon, 25 May 2026 14:58:24 +0800
Received: from SDMR01.tpe.compalcomm.com (10.113.2.107) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 25 May 2026 14:58:24 +0800
Received: from localhost ([10.113.70.1]) by SDMR01.tpe.compalcomm.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 May 2026 14:58:21 +0800
From: Jack Wu <jackbb_wu@compal.com>
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: Mario Limonciello <superm1@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/2] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Date: Mon, 25 May 2026 14:58:21 +0800
Message-ID: <20260525065821.507535-1-jackbb_wu@compal.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 25 May 2026 06:58:21.0569 (UTC) FILETIME=[DFB07710:01DCEC13]
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3239-9.1.2019-29966.005
X-TM-AS-Result: No-10--14.938100-8.000000
X-TMASE-MatchedRID: lHzeI+asw8Ol7UtMwmq5WffKbx7F+zg4uKgGjerL2kiW56JO955kYASg
	qzsOhOQ6Ye8VLqfk6Tvi8HzKNwucr/E/L8pOdd3zFm7cDHk2CrxSJdgFmaKbIyI7QKake6Vzexb
	12ZFRcU2Ztc7QBVAwZL5C8BWGerpZvFPZxCr4G3zcCt2ily5SwBXe4MXLih6z2ubnxCjreJ99OD
	X3a/d/aTkJ8R13PVYv32I4flMOPqat12LbDh9v0IYtgu3ZTSlq64sq6ekYKa2Jn31pYGuALcsdV
	qfxZJjGJD3uGQh9bMC+DPPfjZUIlc9A4BdNBny9fNX4pFGIMi2HinyqT9K5gGR0upRzBwsgHq8j
	2d3LWzz0mw2fTpRyC5psX71XTVcqy+N8eJ3oimywHXnHVkAsxb2XNUZZqZaA4ftEeSASkbK/2tJ
	3foSBQtCgcFayVUiIB73xunbyKrpX3c1VEV2BJ+aOLqeqLSis+HbeSxXzODxeC5QGf1QQ3s9ecM
	dDehA7AyitGyTFxZH1oCdtaxbMdw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.938100-8.000000
X-TMASE-Version: SMEX-14.0.0.3239-9.1.2019-29966.005
X-TM-SNTS-SMTP: DF8B0BCCCE0499E259A7B892A65158E67BD03773599BA3120EF5292AA705E5412000:8

If the DW5826e is in a frozen state and unable to receive USB commands,
this driver provides a method for the user to reset the DW5826e via ACPI.

E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
v7:
  - Place BIT() into PALC_DSM_FN_TRIGGER_PLDR define
v6:
  - Use same define for the DSM check
v5:
  - Use BIT() for the DSM method
v4:
  - Fix version of the ABI documentation to 7.2
  - Add include linux/types.h
v3:
  - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
  - Add ABI documentation for the wwan_reset sysfs interface
  - Validate _DSM method availability in probe using acpi_check_dsm()
v2:
  - Remove extra empty line
  - Add missing includes and Remove unnecessary includes, sort includes alp=
habetically
  - Remove noisy dev_info()
  - Handle obj->type !=3D ACPI_TYPE_BUFFER as error with proper return code
  - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATTR_WO=
) to reduce boilerplate
  - Propagate trigger_palc_pldr() return code to userspace
  - Convert from acpi_driver to platform_driver
---
---
 .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
 drivers/platform/x86/dell/Kconfig             |  6 ++
 drivers/platform/x86/dell/Makefile            |  2 +
 .../platform/x86/dell/dell-dw5826e-reset.c    | 93 +++++++++++++++++++
 4 files changed, 110 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-res=
et
 create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c

diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b/Do=
cumentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
new file mode 100644
index 000000000000..a665e265633f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
@@ -0,0 +1,9 @@
+What:          /sys/bus/platform/devices/<PALC0001 device>/wwan_reset
+Date:          April 2026
+KernelVersion: 7.2
+Contact:       Jackbb Wu <jackbb.wu@compal.com>
+Description:
+               Writing to this file triggers a Platform Level Device Reset
+               (PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
+               method. This can be used to recover the modem when it is in
+               a frozen state and unable to respond to USB commands.
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/=
Kconfig
index 738c108c2163..c4540c837a88 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
          To compile this driver as a module, choose M here: the module wil=
l
          be called dell-wmi-sysman.

+config DELL_DW5826E_RESET
+       tristate "Dell DW5826e PLDR reset support"
+       default m
+       depends on ACPI
+       help
+         This adds support for the Dell DW5826e PLDR reset via ACPI
 endif # X86_PLATFORM_DRIVERS_DELL
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell=
/Makefile
index c7501c25e627..8150283cfd1d 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)             +=3D dell-w=
mi-descriptor.o
 obj-$(CONFIG_DELL_WMI_DDV)                     +=3D dell-wmi-ddv.o
 obj-$(CONFIG_DELL_WMI_LED)                     +=3D dell-wmi-led.o
 obj-$(CONFIG_DELL_WMI_SYSMAN)                  +=3D dell-wmi-sysman/
+obj-$(CONFIG_DELL_DW5826E_RESET)               +=3D dell-dw5826e-reset.o
+
diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platf=
orm/x86/dell/dell-dw5826e-reset.c
new file mode 100644
index 000000000000..1ca7c3421bb5
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  dell-dw5826e-reset.c - Dell DW5826e reset driver
+ *
+ *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+#define PALC_DSM_FN_TRIGGER_PLDR    BIT(1)
+
+static guid_t palc_dsm_guid =3D
+       GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8,=
 0xfd, 0xfe, 0x59);
+
+static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
+{
+       union acpi_object *obj;
+       int ret =3D 0;
+
+       obj =3D acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TR=
IGGER_PLDR, NULL);
+       if (!obj) {
+               dev_err(dev, "Failed to evaluate _DSM\n");
+               return -EIO;
+       }
+
+       if (obj->type !=3D ACPI_TYPE_BUFFER) {
+               dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type=
);
+               ret =3D -EINVAL;
+       }
+
+       ACPI_FREE(obj);
+       return ret;
+}
+
+static ssize_t wwan_reset_store(struct device *dev, struct device_attribut=
e *attr,
+                               const char *buf, size_t count)
+{
+       acpi_handle handle =3D ACPI_HANDLE(dev);
+       int ret;
+
+       ret =3D trigger_palc_pldr(dev, handle);
+       if (ret)
+               return ret;
+
+       return count;
+}
+static DEVICE_ATTR_WO(wwan_reset);
+
+static struct attribute *palc_attrs[] =3D {
+       &dev_attr_wwan_reset.attr,
+       NULL
+};
+ATTRIBUTE_GROUPS(palc);
+
+static int palc_probe(struct platform_device *pdev)
+{
+       acpi_handle handle;
+
+       handle =3D ACPI_HANDLE(&pdev->dev);
+       if (!handle)
+               return -ENODEV;
+
+       if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_=
PLDR))
+               return -ENODEV;
+
+       return 0;
+}
+
+static const struct acpi_device_id palc_acpi_ids[] =3D {
+       { "PALC0001", 0 },
+       { }
+};
+MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
+
+static struct platform_driver palc_driver =3D {
+       .driver =3D {
+               .name =3D "dell-dw5826e-reset",
+               .acpi_match_table =3D palc_acpi_ids,
+               .dev_groups =3D palc_groups,
+       },
+       .probe  =3D palc_probe,
+};
+module_platform_driver(palc_driver);
+
+MODULE_DESCRIPTION("Dell DW5826e reset driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("JackBB Wu");
--
2.34.1



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This message may contain information which is private, privileged or confid=
ential of Compal Electronics, Inc. If you are not the intended recipient of=
 this message, please notify the sender and destroy/delete the message. Any=
 review, retransmission, dissemination or other use of, or taking of any ac=
tion in reliance upon this information, by persons or entities other than t=
he intended recipient is prohibited.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

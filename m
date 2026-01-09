Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FEF157487;
	Fri,  9 Jan 2026 21:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995202; cv=none; b=vFoEGmj/3MLi8XonXdMkaIN/KMjSpsqvGv8SYzojvDlVwHUEmIAqhBfxtHjMvcmiaj/23rTijEzcuaFmKpmeuQzvkvX4JpRTue/PPZc68RzraMXYGe477+8UiUXRMsEOohAKTmPUeoSTZJQbie4Z6DIr9gji+TnGkyub/dUaPUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995202; c=relaxed/simple;
	bh=7lv7dl94TLAa8utM25KtA1qUFVlG4bmIVKIeE3hUllo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TakoCQoPACVEvODMUTEi+wbrU4dup6mZbk2ifRKPcMbFVaBX8Ad/JGwW3EX7L5JJFXeMl6TX1I1QU1hxKxTjNWLLJGnaao1qiT5lqRy2FEOek/WER2xWnUCdY1s/lcygwvAXPdbuh15V2jLpc/CIAZAHu7XppJ+55WeE+HY6ln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=N3NspNE3; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="N3NspNE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995198; x=1768599998; i=w_armin@gmx.de;
	bh=PM9dWNrr5vcKN24N1IFbxWjuH139BVKsH3YStFxw+P0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=N3NspNE3hUjG8yNtzRKp6FrCFuXuGHpRQPSE+abMHnC+lxpYJDp1+YtKat5nAuvA
	 u4MNzFSsSMwy/ibl6vjIh23jSnfcB8xY8TBQwkUkAige8/tFdYhM/V9JtUjL0RSkE
	 TyYOrBnDi7C10D0eAUgsrVDtwrfHcQBkyEHZctbUYhnH97kDerCfz2uB3qvT5Qj5S
	 e/LXUyNbHhca5Jv3ssSDonabFtpqYxTzXaWSkf0qiaRgGQojx+5he5paXX8efxV0o
	 M/ppYrztyqspl/Zr/DrAMLOc9nN+/pHZFSZQq6QvoHJ/a/1eihzzmFd2Ur5Zu3+bu
	 unL4sxiUScNduaG5ug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MybGh-1w3PCi3ThN-00ru4X; Fri, 09 Jan 2026 22:46:38 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/9] platform/wmi: Introduce marshalling support
Date: Fri,  9 Jan 2026 22:46:11 +0100
Message-Id: <20260109214619.7289-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260109214619.7289-1-W_Armin@gmx.de>
References: <20260109214619.7289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ewMP6dAhh2GTYrL6FCVP3g/+G+bdUpknvfIDs2/5T2NvKfq1+rQ
 zWFucPf/wY3CXPSJZXKnwbpsN4wxUvNDiVIt2lRitNSb1wvnZych/0Mmet3c10JUYV2qxSt
 JRdFkMRy36dZejKvrb7x0dt2LTcxiH666d2MvWUemZ4NbPCvsja2MsS1Vtjat6XCw4MqSfx
 EFyC8PpLOgc21CuzFVlQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4qenYJBiK94=;tCdegUsXK2Eg180Wr5qIXM5vylm
 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
 IiUJTs3QMm5FMZuJlBy5

The Windows WMI-ACPI driver likely uses wmilib [1] to interact with
the WMI service in userspace. Said library uses plain byte buffers
for exchanging data, so the WMI-ACPI driver has to convert between
those byte buffers and ACPI objects returned by the ACPI firmware.

The format of the byte buffer is publicly documented [2], and after
some reverse eingineering of the WMI-ACPI driver using a set of custom
ACPI tables, the following conversion rules have been discovered:

- ACPI integers are always converted into a uint32
- ACPI strings are converted into special WMI strings
- ACPI buffers are copied as-is
- ACPI packages are unpacked

Extend the ACPI-WMI driver to also perform this kind of marshalling
for WMI data blocks, methods and events. Doing so gives us a number
of benefits:

- WMI drivers are not restricted to a fixed set of supported ACPI data
  types anymore, see dell-wmi-aio (integer vs buffer) and
  hp-wmi-sensors (string vs buffer)

- correct marshalling of WMI strings when data blocks are marked
  as requiring ACPI strings instead of ACPI buffers

- development of WMI drivers without having to understand ACPI

This eventually should result in better compatibility with some
ACPI firmware implementations and in simpler WMI drivers. There are
however some differences between the original Windows driver and
the ACPI-WMI driver when it comes to ACPI object conversions:

- the Windows driver copies internal _ACPI_METHOD_ARGUMENT_V1 data
  structures into the output buffer when encountering nested ACPI
  packages. This is very likely an error inside the driver itself, so
  we do not support nested ACPI packages.

- when converting WMI strings (UTF-16LE) into ACPI strings (ASCII),
  the Windows driver replaces non-ascii characters (=C3=A4 -> a, & -> ?)
  instead of returning an error. This behavior is not documented
  anywhere and might lead to severe errors in some cases (like
  setting BIOS passwords over WMI), so we simply return an error.

As the current bus-based WMI API is based on ACPI buffers, a new
API is necessary. The legacy GUID-based WMI API is not extended to
support marshalling, as WMI drivers using said API are expected to
move to the bus-based WMI API in the future.

[1] https://learn.microsoft.com/de-de/windows-hardware/drivers/ddi/wmilib/
[2] https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/
    driver-defined-wmi-data-items

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/Makefile      |   2 +-
 drivers/platform/wmi/core.c        | 160 ++++++++++++++++++-
 drivers/platform/wmi/internal.h    |  17 ++
 drivers/platform/wmi/marshalling.c | 241 +++++++++++++++++++++++++++++
 include/linux/wmi.h                |  40 ++++-
 5 files changed, 453 insertions(+), 7 deletions(-)
 create mode 100644 drivers/platform/wmi/internal.h
 create mode 100644 drivers/platform/wmi/marshalling.c

diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefile
index 98393d7391ec..6f2bf8cc709e 100644
=2D-- a/drivers/platform/wmi/Makefile
+++ b/drivers/platform/wmi/Makefile
@@ -4,5 +4,5 @@
 # ACPI WMI core
 #
=20
-wmi-y			:=3D core.o
+wmi-y			:=3D core.o marshalling.o
 obj-$(CONFIG_ACPI_WMI)	+=3D wmi.o
diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 6878c4fcb0b5..1601bf9fe135 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -23,6 +23,7 @@
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/rwsem.h>
@@ -33,6 +34,8 @@
 #include <linux/wmi.h>
 #include <linux/fs.h>
=20
+#include "internal.h"
+
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("ACPI-WMI Mapping Driver");
 MODULE_LICENSE("GPL");
@@ -302,7 +305,7 @@ acpi_status wmi_evaluate_method(const char *guid_strin=
g, u8 instance, u32 method
 EXPORT_SYMBOL_GPL(wmi_evaluate_method);
=20
 /**
- * wmidev_evaluate_method - Evaluate a WMI method
+ * wmidev_evaluate_method - Evaluate a WMI method (deprecated)
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  * @method_id: Method ID to call
@@ -360,6 +363,70 @@ acpi_status wmidev_evaluate_method(struct wmi_device =
*wdev, u8 instance, u32 met
 }
 EXPORT_SYMBOL_GPL(wmidev_evaluate_method);
=20
+/**
+ * wmidev_invoke_method - Invoke a WMI method
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @method_id: Method ID to call
+ * @in: Mandatory WMI buffer containing input for the method call
+ * @out: Optional WMI buffer to return the method results
+ *
+ * Invoke a WMI method, the caller must free the resulting data inside @o=
ut.
+ * Said data is guaranteed to be aligned on a 8-byte boundary.
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
+			 const struct wmi_buffer *in, struct wmi_buffer *out)
+{
+	struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev);
+	struct acpi_buffer aout =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer ain;
+	union acpi_object *obj;
+	acpi_status status;
+	int ret;
+
+	if (wblock->gblock.flags & ACPI_WMI_STRING) {
+		ret =3D wmi_marshal_string(in, &ain);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (in->length > U32_MAX)
+			return -E2BIG;
+
+		ain.length =3D in->length;
+		ain.pointer =3D in->data;
+	}
+
+	if (out)
+		status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, &aou=
t);
+	else
+		status =3D wmidev_evaluate_method(wdev, instance, method_id, &ain, NULL=
);
+
+	if (wblock->gblock.flags & ACPI_WMI_STRING)
+		kfree(ain.pointer);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (!out)
+		return 0;
+
+	obj =3D aout.pointer;
+	if (!obj) {
+		out->length =3D 0;
+		out->data =3D ZERO_SIZE_PTR;
+
+		return 0;
+	}
+
+	ret =3D wmi_unmarshal_acpi_object(obj, out);
+	kfree(obj);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wmidev_invoke_method);
+
 static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 				 struct acpi_buffer *out)
 {
@@ -432,7 +499,7 @@ acpi_status wmi_query_block(const char *guid_string, u=
8 instance,
 EXPORT_SYMBOL_GPL(wmi_query_block);
=20
 /**
- * wmidev_block_query - Return contents of a WMI block
+ * wmidev_block_query - Return contents of a WMI block (deprectated)
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  *
@@ -452,6 +519,33 @@ union acpi_object *wmidev_block_query(struct wmi_devi=
ce *wdev, u8 instance)
 }
 EXPORT_SYMBOL_GPL(wmidev_block_query);
=20
+/**
+ * wmidev_query_block - Return contents of a WMI data block
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @out: WMI buffer to fill
+ *
+ * Query a WMI data block, the caller must free the resulting data inside=
 @out.
+ * Said data is guaranteed to be aligned on a 8-byte boundary.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out)
+{
+	union acpi_object *obj;
+	int ret;
+
+	obj =3D wmidev_block_query(wdev, instance);
+	if (!obj)
+		return -EIO;
+
+	ret =3D wmi_unmarshal_acpi_object(obj, out);
+	kfree(obj);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(wmidev_query_block);
+
 /**
  * wmi_set_block - Write to a WMI block (deprecated)
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417=
f2f49ba
@@ -486,7 +580,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 =
instance, const struct acp
 EXPORT_SYMBOL_GPL(wmi_set_block);
=20
 /**
- * wmidev_block_set - Write to a WMI block
+ * wmidev_block_set - Write to a WMI block (deprecated)
  * @wdev: A wmi bus device from a driver
  * @instance: Instance index
  * @in: Buffer containing new values for the data block
@@ -535,6 +629,46 @@ acpi_status wmidev_block_set(struct wmi_device *wdev,=
 u8 instance, const struct
 }
 EXPORT_SYMBOL_GPL(wmidev_block_set);
=20
+/**
+ * wmidev_set_block - Write to a WMI data block
+ * @wdev: A wmi bus device from a driver
+ * @instance: Instance index
+ * @in: WMI buffer containing new values for the data block
+ *
+ * Write the content of @in into a WMI data block.
+ *
+ * Return: 0 on success or negative error code on failure.
+ */
+int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct w=
mi_buffer *in)
+{
+	struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev);
+	struct acpi_buffer buffer;
+	acpi_status status;
+	int ret;
+
+	if (wblock->gblock.flags & ACPI_WMI_STRING) {
+		ret =3D wmi_marshal_string(in, &buffer);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (in->length > U32_MAX)
+			return -E2BIG;
+
+		buffer.length =3D in->length;
+		buffer.pointer =3D in->data;
+	}
+
+	status =3D wmidev_block_set(wdev, instance, &buffer);
+	if (wblock->gblock.flags & ACPI_WMI_STRING)
+		kfree(buffer.pointer);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wmidev_set_block);
+
 /**
  * wmi_install_notify_handler - Register handler for WMI events (deprecat=
ed)
  * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
@@ -862,7 +996,7 @@ static int wmi_dev_probe(struct device *dev)
 		return -ENODEV;
 	}
=20
-	if (wdriver->notify) {
+	if (wdriver->notify || wdriver->notify_new) {
 		if (test_bit(WMI_NO_EVENT_DATA, &wblock->flags) && !wdriver->no_notify_=
data)
 			return -ENODEV;
 	}
@@ -1221,6 +1355,8 @@ static int wmi_get_notify_data(struct wmi_block *wbl=
ock, union acpi_object **obj
 static void wmi_notify_driver(struct wmi_block *wblock, union acpi_object=
 *obj)
 {
 	struct wmi_driver *driver =3D to_wmi_driver(wblock->dev.dev.driver);
+	struct wmi_buffer buffer;
+	int ret;
=20
 	if (!obj && !driver->no_notify_data) {
 		dev_warn(&wblock->dev.dev, "Event contains no event data\n");
@@ -1229,6 +1365,22 @@ static void wmi_notify_driver(struct wmi_block *wbl=
ock, union acpi_object *obj)
=20
 	if (driver->notify)
 		driver->notify(&wblock->dev, obj);
+
+	if (driver->notify_new) {
+		if (!obj) {
+			driver->notify_new(&wblock->dev, NULL);
+			return;
+		}
+
+		ret =3D wmi_unmarshal_acpi_object(obj, &buffer);
+		if (ret < 0) {
+			dev_warn(&wblock->dev.dev, "Failed to unmarshal event data: %d\n", ret=
);
+			return;
+		}
+
+		driver->notify_new(&wblock->dev, &buffer);
+		kfree(buffer.data);
+	}
 }
=20
 static int wmi_notify_device(struct device *dev, void *data)
diff --git a/drivers/platform/wmi/internal.h b/drivers/platform/wmi/intern=
al.h
new file mode 100644
index 000000000000..9a39ffa31ad1
=2D-- /dev/null
+++ b/drivers/platform/wmi/internal.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Internal interfaces used by the WMI core.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#ifndef _WMI_INTERNAL_H_
+#define _WMI_INTERNAL_H_
+
+union acpi_object;
+struct wmi_buffer;
+
+int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer);
+int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buffe=
r *out);
+
+#endif /* _WMI_INTERNAL_H_ */
diff --git a/drivers/platform/wmi/marshalling.c b/drivers/platform/wmi/mar=
shalling.c
new file mode 100644
index 000000000000..ef9fb4ffb15f
=2D-- /dev/null
+++ b/drivers/platform/wmi/marshalling.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ACPI-WMI buffer marshalling.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/align.h>
+#include <linux/build_bug.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/wmi.h>
+
+#include <kunit/visibility.h>
+
+#include "internal.h"
+
+/*
+ * The WMI buffer data needs to be aligned on a 8 byte boundary to proper=
ly
+ * support 64-bit WMI integers.
+ */
+static_assert(ARCH_KMALLOC_MINALIGN >=3D 8);
+
+static int wmi_adjust_buffer_length(size_t *length, const union acpi_obje=
ct *obj)
+{
+	size_t alignment, size;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		/*
+		 * Integers are threated as 32 bit even if the ACPI DSDT
+		 * declares 64 bit integer width.
+		 */
+		alignment =3D 4;
+		size =3D sizeof(u32);
+		break;
+	case ACPI_TYPE_STRING:
+		/*
+		 * Strings begin with a single little-endian 16-bit field containing
+		 * the string length in bytes and are encoded as UTF-16LE with a termin=
ating
+		 * nul character.
+		 */
+		if (obj->string.length + 1 > U16_MAX / 2)
+			return -EOVERFLOW;
+
+		alignment =3D 2;
+		size =3D struct_size_t(struct wmi_string, chars, obj->string.length + 1=
);
+		break;
+	case ACPI_TYPE_BUFFER:
+		/*
+		 * Buffers are copied as-is.
+		 */
+		alignment =3D 1;
+		size =3D obj->buffer.length;
+		break;
+	default:
+		return -EPROTO;
+	}
+
+	*length =3D size_add(ALIGN(*length, alignment), size);
+
+	return 0;
+}
+
+static int wmi_obj_get_buffer_length(const union acpi_object *obj, size_t=
 *length)
+{
+	size_t total =3D 0;
+	int ret;
+
+	if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
+		for (int i =3D 0; i < obj->package.count; i++) {
+			ret =3D wmi_adjust_buffer_length(&total, &obj->package.elements[i]);
+			if (ret < 0)
+				return ret;
+		}
+	} else {
+		ret =3D wmi_adjust_buffer_length(&total, obj);
+		if (ret < 0)
+			return ret;
+	}
+
+	*length =3D total;
+
+	return 0;
+}
+
+static int wmi_obj_transform_simple(const union acpi_object *obj, u8 *buf=
fer, size_t *consumed)
+{
+	struct wmi_string *string;
+	size_t length;
+	__le32 value;
+	u8 *aligned;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		aligned =3D PTR_ALIGN(buffer, 4);
+		length =3D sizeof(value);
+
+		value =3D cpu_to_le32(obj->integer.value);
+		memcpy(aligned, &value, length);
+		break;
+	case ACPI_TYPE_STRING:
+		aligned =3D PTR_ALIGN(buffer, 2);
+		string =3D (struct wmi_string *)aligned;
+		length =3D struct_size(string, chars, obj->string.length + 1);
+
+		/* We do not have to worry about unaligned accesses here as the WMI
+		 * string will already be aligned on a two-byte boundary.
+		 */
+		string->length =3D cpu_to_le16((obj->string.length + 1) * 2);
+		for (int i =3D 0; i < obj->string.length; i++)
+			string->chars[i] =3D cpu_to_le16(obj->string.pointer[i]);
+
+		/*
+		 * The Windows WMI-ACPI driver always emits a terminating nul character=
,
+		 * so we emulate this behavior here as well.
+		 */
+		string->chars[obj->string.length] =3D '\0';
+		break;
+	case ACPI_TYPE_BUFFER:
+		aligned =3D buffer;
+		length =3D obj->buffer.length;
+
+		memcpy(aligned, obj->buffer.pointer, length);
+		break;
+	default:
+		return -EPROTO;
+	}
+
+	*consumed =3D (aligned - buffer) + length;
+
+	return 0;
+}
+
+static int wmi_obj_transform(const union acpi_object *obj, u8 *buffer)
+{
+	size_t consumed;
+	int ret;
+
+	if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
+		for (int i =3D 0; i < obj->package.count; i++) {
+			ret =3D wmi_obj_transform_simple(&obj->package.elements[i], buffer,
+						       &consumed);
+			if (ret < 0)
+				return ret;
+
+			buffer +=3D consumed;
+		}
+	} else {
+		ret =3D wmi_obj_transform_simple(obj, buffer, &consumed);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer)
+{
+	ssize_t length;
+	u8 *data;
+	int ret;
+
+	ret =3D wmi_obj_get_buffer_length(obj, &length);
+	if (ret < 0)
+		return ret;
+
+	data =3D kzalloc(length, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	ret =3D wmi_obj_transform(obj, data);
+	if (ret < 0) {
+		kfree(data);
+		return ret;
+	}
+
+	buffer->length =3D length;
+	buffer->data =3D data;
+
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(wmi_unmarshal_acpi_object);
+
+int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buffe=
r *out)
+{
+	const struct wmi_string *string;
+	u16 length, value;
+	size_t chars;
+	char *str;
+
+	if (buffer->length < sizeof(*string))
+		return -ENODATA;
+
+	string =3D buffer->data;
+	length =3D get_unaligned_le16(&string->length);
+	if (buffer->length < sizeof(*string) + length)
+		return -ENODATA;
+
+	/* Each character needs to be 16 bits long */
+	if (length % 2)
+		return -EINVAL;
+
+	chars =3D length / 2;
+	str =3D kmalloc(chars + 1, GFP_KERNEL);
+	if (!str)
+		return -ENOMEM;
+
+	for (int i =3D 0; i < chars; i++) {
+		value =3D get_unaligned_le16(&string->chars[i]);
+
+		/* ACPI only accepts ASCII strings */
+		if (value > 0x7F) {
+			kfree(str);
+			return -EINVAL;
+		}
+
+		str[i] =3D value & 0xFF;
+
+		/*
+		 * ACPI strings should only contain a single nul character at the end.
+		 * Because of this we must not copy any padding from the WMI string.
+		 */
+		if (!value) {
+			/* ACPICA wants the length of the string without the nul character */
+			out->length =3D i;
+			out->pointer =3D str;
+			return 0;
+		}
+	}
+
+	str[chars] =3D '\0';
+
+	out->length =3D chars;
+	out->pointer =3D str;
+
+	return 0;
+}
+EXPORT_SYMBOL_IF_KUNIT(wmi_marshal_string);
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index 665ea7dc8a92..81f24d238a2c 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -8,9 +8,11 @@
 #ifndef _LINUX_WMI_H
 #define _LINUX_WMI_H
=20
+#include <linux/compiler_attributes.h>
 #include <linux/device.h>
 #include <linux/acpi.h>
 #include <linux/mod_devicetable.h>
+#include <linux/types.h>
=20
 /**
  * struct wmi_device - WMI device structure
@@ -36,6 +38,37 @@ struct wmi_device {
  */
 #define to_wmi_device(device)	container_of_const(device, struct wmi_devic=
e, dev)
=20
+/**
+ * struct wmi_buffer - WMI data buffer
+ * @length: Buffer length in bytes
+ * @data: Pointer to the buffer content
+ *
+ * This structure is used to exchange data with the WMI driver core.
+ */
+struct wmi_buffer {
+	size_t length;
+	void *data;
+};
+
+/**
+ * struct wmi_string - WMI string representation
+ * @length: Size of @chars in bytes
+ * @chars: UTF16-LE characters with optional nul termination and padding
+ *
+ * This structure is used when exchanging string data over the WMI interf=
ace.
+ */
+struct wmi_string {
+	__le16 length;
+	__le16 chars[];
+} __packed;
+
+int wmidev_invoke_method(struct wmi_device *wdev, u8 instance, u32 method=
_id,
+			 const struct wmi_buffer *in, struct wmi_buffer *out);
+
+int wmidev_query_block(struct wmi_device *wdev, u8 instance, struct wmi_b=
uffer *out);
+
+int wmidev_set_block(struct wmi_device *wdev, u8 instance, const struct w=
mi_buffer *in);
+
 acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance, =
u32 method_id,
 				   const struct acpi_buffer *in, struct acpi_buffer *out);
=20
@@ -54,9 +87,11 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
  * @probe: Callback for device binding
  * @remove: Callback for device unbinding
  * @shutdown: Callback for device shutdown
- * @notify: Callback for receiving WMI events
+ * @notify: Callback for receiving WMI events (deprecated)
+ * @notify_new: Callback for receiving WMI events
  *
- * This represents WMI drivers which handle WMI devices.
+ * This represents WMI drivers which handle WMI devices. The data inside =
the buffer
+ * passed to the @notify_new callback is guaranteed to be aligned on a 8-=
byte boundary.
  */
 struct wmi_driver {
 	struct device_driver driver;
@@ -68,6 +103,7 @@ struct wmi_driver {
 	void (*remove)(struct wmi_device *wdev);
 	void (*shutdown)(struct wmi_device *wdev);
 	void (*notify)(struct wmi_device *device, union acpi_object *data);
+	void (*notify_new)(struct wmi_device *device, const struct wmi_buffer *d=
ata);
 };
=20
 /**
=2D-=20
2.39.5


Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665F2267F57;
	Sat, 22 Nov 2025 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843913; cv=none; b=J4V3zRNIwu/HcP+43bMe3Uhstcyq6vSW5GVNqeGeiz2NmzTTh5kr8ACLkBvfHjRJZQfn3V9Mez48X2+M8+S3lTR/9wf6dFAxexTR8M2876Z9ayaoAlVhMvzoYkVvI3rZADzl1c7u8OsFAAPvOh/TRayCNw4+oXzx8WnWc/pA1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843913; c=relaxed/simple;
	bh=+f95zJcvI0/rxUUgSjBFd7sMhiwQpEdJpxwQpZDWd/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKSANY8OeJ/3uG7C9URe6TketijTq5zx6q+3UXpgBX51z4ei09hWvR+Ab1pAa8urwt3HmccUhejZeO8Xivz8sP7qVwUGfDD6ewBg1onKY6PMNW6qgD5ls0cgeuTDqxogeVvHkYL0D3RWCppvDqjCo91oinisrp5tOTNqw0/K1OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CQ+6FYdy; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CQ+6FYdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843904; x=1764448704; i=w_armin@gmx.de;
	bh=t+vdb8PzR+iZbH2mF3hPHdKjMwT1fhwXg+m+xenSrQE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CQ+6FYdyN1T/+jTKI4h3RpMRgMicWco1cHAgR1FgwJNwrMRJ4NK17BojPJbhfvkS
	 Dv8yvRDMgG8vR9w9ckc4N+EtUDduxjRiIimAW3ns89PXqZaLb07pck6fLtS7+4iMp
	 DzOQTsDt9PPWI0IQyqSD5cxTzC6t6IsM7u6L57kUOSV4q3KDmlue2AHKSW9w/oRQ7
	 gRuRLurWVK6mrXyMoNElC2tCEdEgMkkVBGFKIW2NsogV64fu6vXI+Ck1BlvgKSIqE
	 cXKEz6NOwmGvv21i9KyKlCutrAMg6vSl6Q6XVAEgR2WCGRa1U0xw4hmaNeozvEP2I
	 sEOpzBnnCxJOxsN/Cg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MG9kC-1vLoSa09jo-00D5Ym; Sat, 22 Nov 2025 21:38:24 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/9] platform/wmi: Introduce marshalling support
Date: Sat, 22 Nov 2025 21:37:55 +0100
Message-Id: <20251122203803.6154-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122203803.6154-1-W_Armin@gmx.de>
References: <20251122203803.6154-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZV/yzOTErBihA/FH8QfjOF4h/LKN+H3hRCdSMa7WZJnddy0iBzS
 8/XnaQpm/2rItGGowaZMou+HrymsE+BgdES4ejdjRK/RjHjQ7Br182x4X9LksYl+Wvv9v4Q
 F6wuK8KVyRO9Ni8UmsWlYM2qCKa/p4Xttz14HZISQUjDSFsTVlxZg/m9DVoi737jpkYVDPF
 T9ItT3T0F4HnkdE3p8i4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7HTpIQAuUBI=;faVPjV1ZzguozZDp0hTnaLevhvP
 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

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
for WMI data blocks, methods and events. During so gives us a number
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
 drivers/platform/wmi/core.c        | 160 +++++++++++++++++++-
 drivers/platform/wmi/internal.h    |  14 ++
 drivers/platform/wmi/marshalling.c | 233 +++++++++++++++++++++++++++++
 include/linux/wmi.h                |  39 ++++-
 5 files changed, 441 insertions(+), 7 deletions(-)
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
index 000000000000..707d1a4711e0
=2D-- /dev/null
+++ b/drivers/platform/wmi/internal.h
@@ -0,0 +1,14 @@
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
+int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer);
+int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buffe=
r *out);
+
+#endif /* _WMI_INTERNAL_H_ */
diff --git a/drivers/platform/wmi/marshalling.c b/drivers/platform/wmi/mar=
shalling.c
new file mode 100644
index 000000000000..476b87b145e3
=2D-- /dev/null
+++ b/drivers/platform/wmi/marshalling.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ACPI-WMI buffer marshalling.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/wmi.h>
+
+#include <kunit/visibility.h>
+
+#include "internal.h"
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
index 665ea7dc8a92..4c2fc3c1f0de 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/acpi.h>
 #include <linux/mod_devicetable.h>
+#include <linux/types.h>
=20
 /**
  * struct wmi_device - WMI device structure
@@ -36,6 +37,37 @@ struct wmi_device {
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
@@ -54,9 +86,11 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
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
@@ -68,6 +102,7 @@ struct wmi_driver {
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


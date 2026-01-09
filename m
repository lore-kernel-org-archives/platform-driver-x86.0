Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7A81A3029;
	Fri,  9 Jan 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995204; cv=none; b=RIXVbl4BLfNK4Qu7wv9aw2Uumdgft1WOzIxiSvMJgzP+jfr1Hx9rVJ2iWc/e6GGMzjCEAFVi0qbvNWrgfcGIEQkzPgEIykcbXJ8jY0Cr0CzC94qF6DIxFJ9hPk6w5L2s8DH41YxPvwdEr9ILkv1vepUNCOweBHWd86kbIZiRMMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995204; c=relaxed/simple;
	bh=ILx11DLH3slyAHbtvjBd+zKe/Z16z3WeGpR8oC4qU4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jMYJnjLp9G+JVa/Zj+8EehJsHue24bZv9YYf8gMzPbH7LUFkAaUD9z13n2SsBQ9qA4TK+Rs+JnB+qc2qEfLqMYnWmAjGkq+fFYFrF5Slo+Xnzgj1zZO9STjC2au54cB2X8UvMEvH6DvvG9EWuUJvIymw8FvFs585T4DqUi2m+0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QAn+AldT; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QAn+AldT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995200; x=1768600000; i=w_armin@gmx.de;
	bh=7XKG6H6VwUerChqrJhGlkgKXRhw5nOU9QVW/ZR/2gTY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QAn+AldTkijNDo2s30tgJL+EhaevAHcB63f3zTLCDBPjS+sw+32FnzDgOZ2Z6xAO
	 lAGHDNeIA8v7+4EleUqyfDQIafx8FKLwEwQK+8mfwAm5OfhYsFqKRkevHV2VJOSBX
	 2B15y8D63I+K4i3UyWLP9USjWNrQbAwxO6mx5VMwyOvTytCoUPUtTb4hmNqkCq3a6
	 1fosZJVwGycxtHE0pgxgqz3f97zHexbTLxIWrf9ouNHybuszRFhrpuGzY/MN0NKQJ
	 9wElTnLq5s9YW7AQV7j1YfT+DPIlOCqdt1AXsiA1emroJD5Ug+OXUWlEuwuqikz4O
	 vaGjk+nZbpoYFVLWcA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MPog5-1vRJV646Dr-00KUQV; Fri, 09 Jan 2026 22:46:40 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 2/9] platform/wmi: Add kunit test for the marshalling code
Date: Fri,  9 Jan 2026 22:46:12 +0100
Message-Id: <20260109214619.7289-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260109214619.7289-1-W_Armin@gmx.de>
References: <20260109214619.7289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N0+BRUG7XStbNViKCqsMMP1F0UVA8Jr+qCzOttHSWt3nFso9qEl
 NY7TNSAsQhwOqes9FZLc62xJhasTRtyYY+ESXMHGXuLBTm6HD7JaO1yshpgyXpop4E1FPuZ
 2tFrLquzXIXpcGKI/cIe1A2CcZwBAXVfIRnUgU3yQzppq9aEQwRNfRUZg+rA5iHsLt+JU3a
 Ep0T4nqHDdJr0lE6NVPcw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HWS0/Ml0vr0=;rGxT1Now+4aYzptaMim8yuEhk2V
 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

The marshalling code used by the WMI driver core is implemented as
a separate component, suitable for unit tests.

Implmented such a unit test using KUnit. Those unit tests verify that
ACPI objects are correctly converted into WMI buffers and that WMI
strings are correctly converted into ACPI strings. They also verify
that invalid ACPI data (like nested packages) is rejected.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/Kconfig                  |   2 +
 drivers/platform/wmi/Makefile                 |   3 +
 drivers/platform/wmi/tests/Kconfig            |  16 +
 drivers/platform/wmi/tests/Makefile           |   8 +
 .../platform/wmi/tests/marshalling_kunit.c    | 449 ++++++++++++++++++
 5 files changed, 478 insertions(+)
 create mode 100644 drivers/platform/wmi/tests/Kconfig
 create mode 100644 drivers/platform/wmi/tests/Makefile
 create mode 100644 drivers/platform/wmi/tests/marshalling_kunit.c

diff --git a/drivers/platform/wmi/Kconfig b/drivers/platform/wmi/Kconfig
index 77fcbb18746b..21fa3e440042 100644
=2D-- a/drivers/platform/wmi/Kconfig
+++ b/drivers/platform/wmi/Kconfig
@@ -31,4 +31,6 @@ config ACPI_WMI_LEGACY_DEVICE_NAMES
 	  userspace applications but will cause the registration of WMI devices =
with
 	  the same GUID to fail in some corner cases.
=20
+source "drivers/platform/wmi/tests/Kconfig"
+
 endif # ACPI_WMI
diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefile
index 6f2bf8cc709e..93f37ce519ae 100644
=2D-- a/drivers/platform/wmi/Makefile
+++ b/drivers/platform/wmi/Makefile
@@ -6,3 +6,6 @@
=20
 wmi-y			:=3D core.o marshalling.o
 obj-$(CONFIG_ACPI_WMI)	+=3D wmi.o
+
+# Unit tests
+obj-y			+=3D tests/
diff --git a/drivers/platform/wmi/tests/Kconfig b/drivers/platform/wmi/tes=
ts/Kconfig
new file mode 100644
index 000000000000..efcbcb51c251
=2D-- /dev/null
+++ b/drivers/platform/wmi/tests/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# ACPI WMI KUnit tests
+#
+
+config ACPI_WMI_MARSHALLING_KUNIT_TEST
+	tristate "KUnit Test for ACPI-WMI marshalling" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for the ACPI-WMI marshalling code.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
diff --git a/drivers/platform/wmi/tests/Makefile b/drivers/platform/wmi/te=
sts/Makefile
new file mode 100644
index 000000000000..252c3125353a
=2D-- /dev/null
+++ b/drivers/platform/wmi/tests/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Makefile for linux/drivers/platform/x86/wmi/tests
+# ACPI WMI KUnit tests
+#
+
+wmi_marshalling_kunit-y				:=3D marshalling_kunit.o
+obj-$(CONFIG_ACPI_WMI_MARSHALLING_KUNIT_TEST)	+=3D wmi_marshalling_kunit.=
o
diff --git a/drivers/platform/wmi/tests/marshalling_kunit.c b/drivers/plat=
form/wmi/tests/marshalling_kunit.c
new file mode 100644
index 000000000000..1a32323663cc
=2D-- /dev/null
+++ b/drivers/platform/wmi/tests/marshalling_kunit.c
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit test for the ACPI-WMI marshalling code.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/wmi.h>
+
+#include <kunit/resource.h>
+#include <kunit/test.h>
+
+#include "../internal.h"
+
+struct wmi_acpi_param {
+	const char *name;
+	const union acpi_object obj;
+	const struct wmi_buffer buffer;
+};
+
+struct wmi_string_param {
+	const char *name;
+	const char *string;
+	const struct wmi_buffer buffer;
+};
+
+struct wmi_invalid_acpi_param {
+	const char *name;
+	const union acpi_object obj;
+};
+
+struct wmi_invalid_string_param {
+	const char *name;
+	const struct wmi_buffer buffer;
+};
+
+/* 0xdeadbeef */
+static u8 expected_single_integer[] =3D {
+	0xef, 0xbe, 0xad, 0xde,
+};
+
+/* "TEST" */
+static u8 expected_single_string[] =3D {
+	0x0a, 0x00, 0x54, 0x00, 0x45, 0x00, 0x53, 0x00, 0x54, 0x00, 0x00, 0x00,
+};
+
+static u8 test_buffer[] =3D {
+	0xab, 0xcd,
+};
+
+static u8 expected_single_buffer[] =3D {
+	0xab, 0xcd,
+};
+
+static union acpi_object simple_package_elements[] =3D {
+	{
+		.buffer =3D {
+			.type =3D ACPI_TYPE_BUFFER,
+			.length =3D sizeof(test_buffer),
+			.pointer =3D test_buffer,
+		},
+	},
+	{
+		.integer =3D {
+			.type =3D ACPI_TYPE_INTEGER,
+			.value =3D 0x01020304,
+		},
+	},
+};
+
+static u8 expected_simple_package[] =3D {
+	0xab, 0xcd,
+	0x00, 0x00,
+	0x04, 0x03, 0x02, 0x01,
+};
+
+static u8 test_small_buffer[] =3D {
+	0xde,
+};
+
+static union acpi_object complex_package_elements[] =3D {
+	{
+		.integer =3D {
+			.type =3D ACPI_TYPE_INTEGER,
+			.value =3D 0xdeadbeef,
+		},
+	},
+	{
+		.buffer =3D {
+			.type =3D ACPI_TYPE_BUFFER,
+			.length =3D sizeof(test_small_buffer),
+			.pointer =3D test_small_buffer,
+		},
+	},
+	{
+		.string =3D {
+			.type =3D ACPI_TYPE_STRING,
+			.length =3D sizeof("TEST") - 1,
+			.pointer =3D "TEST",
+		},
+	},
+	{
+		.buffer =3D {
+			.type =3D ACPI_TYPE_BUFFER,
+			.length =3D sizeof(test_small_buffer),
+			.pointer =3D test_small_buffer,
+		},
+	},
+	{
+		.integer =3D {
+			.type =3D ACPI_TYPE_INTEGER,
+			.value =3D 0x01020304,
+		},
+	}
+};
+
+static u8 expected_complex_package[] =3D {
+	0xef, 0xbe, 0xad, 0xde,
+	0xde,
+	0x00,
+	0x0a, 0x00, 0x54, 0x00, 0x45, 0x00, 0x53, 0x00, 0x54, 0x00, 0x00, 0x00,
+	0xde,
+	0x00,
+	0x04, 0x03, 0x02, 0x01,
+};
+
+static const struct wmi_acpi_param wmi_acpi_params_array[] =3D {
+	{
+		.name =3D "single_integer",
+		.obj =3D {
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D 0xdeadbeef,
+			},
+		},
+		.buffer =3D {
+			.data =3D expected_single_integer,
+			.length =3D sizeof(expected_single_integer),
+		},
+	},
+	{
+		.name =3D "single_string",
+		.obj =3D {
+			.string =3D {
+				.type =3D ACPI_TYPE_STRING,
+				.length =3D sizeof("TEST") - 1,
+				.pointer =3D "TEST",
+			},
+		},
+		.buffer =3D {
+			.data =3D expected_single_string,
+			.length =3D sizeof(expected_single_string),
+		},
+	},
+	{
+		.name =3D "single_buffer",
+		.obj =3D {
+			.buffer =3D {
+				.type =3D ACPI_TYPE_BUFFER,
+				.length =3D sizeof(test_buffer),
+				.pointer =3D test_buffer,
+			},
+		},
+		.buffer =3D {
+			.data =3D expected_single_buffer,
+			.length =3D sizeof(expected_single_buffer),
+		},
+	},
+	{
+		.name =3D "simple_package",
+		.obj =3D {
+			.package =3D {
+				.type =3D ACPI_TYPE_PACKAGE,
+				.count =3D ARRAY_SIZE(simple_package_elements),
+				.elements =3D simple_package_elements,
+			},
+		},
+		.buffer =3D {
+			.data =3D expected_simple_package,
+			.length =3D sizeof(expected_simple_package),
+		},
+	},
+	{
+		.name =3D "complex_package",
+		.obj =3D {
+			.package =3D {
+				.type =3D ACPI_TYPE_PACKAGE,
+				.count =3D ARRAY_SIZE(complex_package_elements),
+				.elements =3D complex_package_elements,
+			},
+		},
+		.buffer =3D {
+			.data =3D expected_complex_package,
+			.length =3D sizeof(expected_complex_package),
+		},
+	},
+};
+
+static void wmi_acpi_param_get_desc(const struct wmi_acpi_param *param, c=
har *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(wmi_unmarshal_acpi_object, wmi_acpi_params_array, wmi_a=
cpi_param_get_desc);
+
+/* "WMI\0" */
+static u8 padded_wmi_string[] =3D {
+	0x0a, 0x00,
+	0x57, 0x00,
+	0x4D, 0x00,
+	0x49, 0x00,
+	0x00, 0x00,
+	0x00, 0x00,
+};
+
+static const struct wmi_string_param wmi_string_params_array[] =3D {
+	{
+		.name =3D "test",
+		.string =3D "TEST",
+		.buffer =3D {
+			.length =3D sizeof(expected_single_string),
+			.data =3D expected_single_string,
+		},
+	},
+	{
+		.name =3D "padded",
+		.string =3D "WMI",
+		.buffer =3D {
+			.length =3D sizeof(padded_wmi_string),
+			.data =3D padded_wmi_string,
+		},
+	},
+};
+
+static void wmi_string_param_get_desc(const struct wmi_string_param *para=
m, char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(wmi_marshal_string, wmi_string_params_array, wmi_string=
_param_get_desc);
+
+static union acpi_object nested_package_elements[] =3D {
+	{
+		.package =3D {
+			.type =3D ACPI_TYPE_PACKAGE,
+			.count =3D ARRAY_SIZE(simple_package_elements),
+			.elements =3D simple_package_elements,
+		},
+	}
+};
+
+static const struct wmi_invalid_acpi_param wmi_invalid_acpi_params_array[=
] =3D {
+	{
+		.name =3D "nested_package",
+		.obj =3D {
+			.package =3D {
+				.type =3D ACPI_TYPE_PACKAGE,
+				.count =3D ARRAY_SIZE(nested_package_elements),
+				.elements =3D nested_package_elements,
+			},
+		},
+	},
+	{
+		.name =3D "reference",
+		.obj =3D {
+			.reference =3D {
+				.type =3D ACPI_TYPE_LOCAL_REFERENCE,
+				.actual_type =3D ACPI_TYPE_ANY,
+				.handle =3D NULL,
+			},
+		},
+	},
+	{
+		.name =3D "processor",
+		.obj =3D {
+			.processor =3D {
+				.type =3D ACPI_TYPE_PROCESSOR,
+				.proc_id =3D 0,
+				.pblk_address =3D 0,
+				.pblk_length =3D 0,
+			},
+		},
+	},
+	{
+		.name =3D "power_resource",
+		.obj =3D {
+			.power_resource =3D {
+				.type =3D ACPI_TYPE_POWER,
+				.system_level =3D 0,
+				.resource_order =3D 0,
+			},
+		},
+	},
+};
+
+static void wmi_invalid_acpi_param_get_desc(const struct wmi_invalid_acpi=
_param *param, char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(wmi_unmarshal_acpi_object_failure, wmi_invalid_acpi_par=
ams_array,
+		  wmi_invalid_acpi_param_get_desc);
+
+static u8 oversized_wmi_string[] =3D {
+	0x04, 0x00, 0x00, 0x00,
+};
+
+/*
+ * The error is that 3 bytes can not hold UTF-16 characters
+ * without cutting of the last one.
+ */
+static u8 undersized_wmi_string[] =3D {
+	0x03, 0x00, 0x00, 0x00, 0x00,
+};
+
+static u8 non_ascii_wmi_string[] =3D {
+	0x04, 0x00, 0xC4, 0x00, 0x00, 0x00,
+};
+
+static const struct wmi_invalid_string_param wmi_invalid_string_params_ar=
ray[] =3D {
+	{
+		.name =3D "empty_buffer",
+		.buffer =3D {
+			.length =3D 0,
+			.data =3D ZERO_SIZE_PTR,
+		},
+
+	},
+	{
+		.name =3D "oversized",
+		.buffer =3D {
+			.length =3D sizeof(oversized_wmi_string),
+			.data =3D oversized_wmi_string,
+		},
+	},
+	{
+		.name =3D "undersized",
+		.buffer =3D {
+			.length =3D sizeof(undersized_wmi_string),
+			.data =3D undersized_wmi_string,
+		},
+	},
+	{
+		.name =3D "non_ascii",
+		.buffer =3D {
+			.length =3D sizeof(non_ascii_wmi_string),
+			.data =3D non_ascii_wmi_string,
+		},
+	},
+};
+
+static void wmi_invalid_string_param_get_desc(const struct wmi_invalid_st=
ring_param *param,
+					      char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(wmi_marshal_string_failure, wmi_invalid_string_params_a=
rray,
+		  wmi_invalid_string_param_get_desc);
+
+KUNIT_DEFINE_ACTION_WRAPPER(kfree_wrapper, kfree, const void *);
+
+static void wmi_unmarshal_acpi_object_test(struct kunit *test)
+{
+	const struct wmi_acpi_param *param =3D test->param_value;
+	struct wmi_buffer result;
+	int ret;
+
+	ret =3D wmi_unmarshal_acpi_object(&param->obj, &result);
+	if (ret < 0)
+		KUNIT_FAIL_AND_ABORT(test, "Unmarshalling of ACPI object failed\n");
+
+	kunit_add_action(test, kfree_wrapper, result.data);
+
+	KUNIT_EXPECT_EQ(test, result.length, param->buffer.length);
+	KUNIT_EXPECT_MEMEQ(test, result.data, param->buffer.data, result.length)=
;
+}
+
+static void wmi_unmarshal_acpi_object_failure_test(struct kunit *test)
+{
+	const struct wmi_invalid_acpi_param *param =3D test->param_value;
+	struct wmi_buffer result;
+	int ret;
+
+	ret =3D wmi_unmarshal_acpi_object(&param->obj, &result);
+	if (ret < 0)
+		return;
+
+	kfree(result.data);
+	KUNIT_FAIL(test, "Invalid ACPI object was not rejected\n");
+}
+
+static void wmi_marshal_string_test(struct kunit *test)
+{
+	const struct wmi_string_param *param =3D test->param_value;
+	struct acpi_buffer result;
+	int ret;
+
+	ret =3D wmi_marshal_string(&param->buffer, &result);
+	if (ret < 0)
+		KUNIT_FAIL_AND_ABORT(test, "Marshalling of WMI string failed\n");
+
+	kunit_add_action(test, kfree_wrapper, result.pointer);
+
+	KUNIT_EXPECT_EQ(test, result.length, strlen(param->string));
+	KUNIT_EXPECT_STREQ(test, result.pointer, param->string);
+}
+
+static void wmi_marshal_string_failure_test(struct kunit *test)
+{
+	const struct wmi_invalid_string_param *param =3D test->param_value;
+	struct acpi_buffer result;
+	int ret;
+
+	ret =3D wmi_marshal_string(&param->buffer, &result);
+	if (ret < 0)
+		return;
+
+	kfree(result.pointer);
+	KUNIT_FAIL(test, "Invalid string was not rejected\n");
+}
+
+static struct kunit_case wmi_marshalling_test_cases[] =3D {
+	KUNIT_CASE_PARAM(wmi_unmarshal_acpi_object_test,
+			 wmi_unmarshal_acpi_object_gen_params),
+	KUNIT_CASE_PARAM(wmi_marshal_string_test,
+			 wmi_marshal_string_gen_params),
+	KUNIT_CASE_PARAM(wmi_unmarshal_acpi_object_failure_test,
+			 wmi_unmarshal_acpi_object_failure_gen_params),
+	KUNIT_CASE_PARAM(wmi_marshal_string_failure_test,
+			 wmi_marshal_string_failure_gen_params),
+	{}
+};
+
+static struct kunit_suite wmi_marshalling_test_suite =3D {
+	.name =3D "wmi_marshalling",
+	.test_cases =3D wmi_marshalling_test_cases,
+};
+
+kunit_test_suite(wmi_marshalling_test_suite);
+
+MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
+MODULE_DESCRIPTION("KUnit test for the ACPI-WMI marshalling code");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+MODULE_LICENSE("GPL");
=2D-=20
2.39.5


Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59138238C0F;
	Sat, 22 Nov 2025 20:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843911; cv=none; b=XYbpponSUgqD362BF4sSnx2IwbY59yUcT+YAEW0RMVGG/Ms7g/JVCuUD+0DOeg99VQtPrnpC7uLuT9veL52+44SXFYNTgM0rcVTzqniFelFv9fn3ecyUWMAb/+fBwR6UWivlwfb5uk0TSOYXf2mM7U9/StU//fFP5g9+0QxWa/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843911; c=relaxed/simple;
	bh=Qrm452hUDjTo+GGxWQlTtlWPQVOZ0d4S83JUqVH1EZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FLaw02WPuGWJIw+k+YFW0Cpegu1hNOSw/mtfqXiP56SIi50L04AAU7nZB4xMd/niiae+4fy4A5nX6OEajM4YpVL6/X+chcEPlA9iGDnJSscTubulOkYk2auROvDHoHeh+dUvPgHM/OQBnj0fOPtCRWWExIREoGUqkDkwR+7udCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sStzDIW+; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sStzDIW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843906; x=1764448706; i=w_armin@gmx.de;
	bh=N9BmCru5mgQ6rDPFZe/LRPDn2TWbLydNIGh64PrC9Fs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sStzDIW+OsNkgUcpcgHUE4CCG+lTR3tlayLFaYprZmY84BtKteoxR5O0Es0vaETX
	 id4lKyl3XKWw5aI/sj+no0wwD3smVERzHYpn2+ZfoVddUYsxgYnfiew2PbV3Tgb/l
	 IE7/dDY/aTTBwgS1uisQJae2dqsAuBsYvZah1mv9VjImk9+UKPtT1h9x5eB9yeX7p
	 EpL1e+ym/rTj37ObZCNh3W5RyBVOgD4iKcmTeV2bCkhEPtDDMaAz4vSwGkxW7H20G
	 EL1jwfaiDiRRkZTL+m19ngJ4UxaJ6TpcN5Qlifz2GGiZTNHG58IorZJj4iwo9CdFd
	 auemamXSzXulk+dacw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MvsEx-1wEjFV0H6F-00wOs1; Sat, 22 Nov 2025 21:38:26 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/9] platform/wmi: Add kunit test for the marshalling code
Date: Sat, 22 Nov 2025 21:37:56 +0100
Message-Id: <20251122203803.6154-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122203803.6154-1-W_Armin@gmx.de>
References: <20251122203803.6154-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5JXo/gwcuDraKfbhwZcah1A6/zNTIbVrBpRjHbesmFgtWCF8SAk
 13rnYZHSjrPuXJAD3el5syck83UTKyZX7tU6ExFbtyHg0ShSCK6/YdAksLlfWfvXyq9aMcC
 dDhcQUTY0a3zr6HABnGjJKcmhlBYvK6AKKzVFKAgb3c/6fAGBvMGLwJPxsotWA7KGEiWE4s
 0pv33Z1FtbuUTBRLR8JJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:thkb54ueZeQ=;3Fr41OLkRPcl4UBLkRQ4bfKoW62
 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
 HigvjAq4=

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
 .../platform/wmi/tests/marshalling_kunit.c    | 448 ++++++++++++++++++
 5 files changed, 477 insertions(+)
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
index 000000000000..e339791e81e5
=2D-- /dev/null
+++ b/drivers/platform/wmi/tests/marshalling_kunit.c
@@ -0,0 +1,448 @@
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
+	0x0a, 0x00, 0x54, 0x00, 0x45, 0x00, 0x53, 0x00, 0x54, 0x00, 0x00, 0x00
+};
+
+static u8 test_buffer[] =3D {
+	0xab, 0xcd
+};
+
+static u8 expected_single_buffer[] =3D {
+	0xab, 0xcd
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
+	0x04, 0x03, 0x02, 0x01
+};
+
+static u8 test_small_buffer[] =3D {
+	0xde
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
+	0x00, 0x00
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
+	0x04, 0x00, 0xC4, 0x00, 0x00, 0x00
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


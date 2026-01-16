Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C972EFD8C;
	Fri, 16 Jan 2026 20:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596108; cv=none; b=g8S9IJJDZWHOw7f7wPNQmcAWhw2DNSBDm5lIB/oqecC2fRTZGI6wDxA9+UVwg6+UPpaEljAvNTyBvIoo9L8XFo7cKLe8qxkI50M94g0fL78roCLJmcCmBS7APlhDgF9CATAtEjE7fbBr0jm/xmN95rjn/nIv3o60rNiw14zOUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596108; c=relaxed/simple;
	bh=rWFjzn6ChiNUZ+H6bv/SNmNEoNsBlOwztJtvRjqImhU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HA4LqtV0hf6RFdCfTDA6YnqgCTr8Sln4B4LB4+XsMSDCGW0mFo4qRow8bKN0MuQ5PbxEUeFVrlKnBkxgVHT2Gu1zsS+Wp4zCdMpijgg7iffl4g8o72hjT7Ku0h1jXtOEk0apX1M+RKBWxdz0sTY2cZOkNAD//P/8QOJIQkZ0gqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dnkgBriG; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dnkgBriG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596095; x=1769200895; i=w_armin@gmx.de;
	bh=2sCOQ2tqK7flcAoAeZW1LxP5AlXh8g4weJFvuNUa5QI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=dnkgBriGSkfstjOWv74QU6Zb8ABMqnQLfIpcdcRTNr4Bdz69zkmlgvzrX8NEOaLu
	 a94MayAyhaN3Z9zURDmcCP2PPrMqehX17SBkO5HvgF7SQuPU525Bk2XwZtbxXoAPN
	 7zqah7Tasiu2gzV3I9ordeur6SlySbVb7H55MjFPvPAODPFBjngyuutt4rNYp2O87
	 tHGKPSEApiMMm2sdB1HxOloDF9YetubsbPMhcosq3FFkfqiC5xkycG6l8BPea+bIg
	 1b5x9aLK/gs6p2J7N99J4Wetjj+B587hLxDiKbf8E9+y0TtHYbQXlzZmBNW38gqV1
	 UmG2U2KkNhL0/p+LjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N0G1d-1w3ci13Fe3-00uFQg; Fri, 16 Jan 2026 21:41:35 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 2/9] platform/wmi: Add kunit test for the marshalling code
Date: Fri, 16 Jan 2026 21:41:09 +0100
Message-Id: <20260116204116.4030-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116204116.4030-1-W_Armin@gmx.de>
References: <20260116204116.4030-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0VS5ftU/baipwonB+L57ri82pYLoBcOs+sJyUUrAxnVnjHaJHp0
 PEKKPN1slRuKj/zj/gVtTSi0AY7gAdR27oLF5JoLxcnL9TKSpn7kdvrF02WnyYhkjM+Ht8d
 XvSAOFUHqnOP9+Fbpy72/skgpxS2EQmr/E5iiutw9zvzFg9EhUvx5V8V+FdqgM44By4QJh+
 cZmgQg8DHXpSzsN9MtCOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JnaRMgkeqr8=;VIPk4cqijxIogf4K8Um4UuVqC8X
 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
 7Q7NfRJ13UkmW1/orZLw

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
 .../platform/wmi/tests/marshalling_kunit.c    | 452 ++++++++++++++++++
 5 files changed, 481 insertions(+)
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
index 000000000000..0c7cd8774aa3
=2D-- /dev/null
+++ b/drivers/platform/wmi/tests/marshalling_kunit.c
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit test for the ACPI-WMI marshalling code.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/acpi.h>
+#include <linux/align.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/types.h>
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
+	KUNIT_EXPECT_TRUE(test, IS_ALIGNED((uintptr_t)result.data, 8));
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


Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C95313542;
	Sat, 20 Dec 2025 20:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263630; cv=none; b=u/fa+W/mfU8Dll84pOycvjBBws3+b7Hj/p63dylz93PQvdeVoJ8InDLRXSkuYpM/636QJszZ6VwmWGkTVRPGwx4Fg8D337yLygcgM6xV9rHbsHNeRsJjMoR82G/tUmak0osS+JoIGZGIihaw3IyafE6W6RrAj4gkn1NX7VC65ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263630; c=relaxed/simple;
	bh=Qrm452hUDjTo+GGxWQlTtlWPQVOZ0d4S83JUqVH1EZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fGXHZSMoVVskKgPvrDWM6crkMPm6RPSdYCliLLgk8HKC6nPIaFc9/1sEfgVmCmUfYFmUCL3xwwpHrN6M/ZnUnb3aAvjAG7WEsaK8v91GcAj6DlP9l0wxn0vUeZhLoj/3peDuzv9rUxtaGT+x1rEzUt50Y1RuLrn2kstiOMsDh1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CkP/DIW6; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CkP/DIW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263615; x=1766868415; i=w_armin@gmx.de;
	bh=N9BmCru5mgQ6rDPFZe/LRPDn2TWbLydNIGh64PrC9Fs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CkP/DIW68+sY3/veraHA+YjYSTyvTw+aQbMMcPUzpPiDCoZ2AnKJ86z3/rzAlLAv
	 yXsvDG/FhpWaIIDMKn09XqEl5vbbBQ3g/FqVIPvuTqmVdw4Q1UwxhzQSVtNfomOOJ
	 9bKqIni69fUpO+Caaid1IqjXGAN25JpNzyPAv0JdBWG6zMsUXQryFPzGsOU7xI+Ci
	 /kk1l2BQo8vZuSGfudbOEyNh0mhV2TQe+8pWJ8rOMrXi7rGNBTSXAF9oIDZCOffyO
	 T+E+MtpCo/MvVYcQQpFll2Ku+3i8TIcWzGcI69RjcihWH+hj/iyTl2WmLgDdVU85y
	 dAvyv9bW9ccs0/VbMQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MAwXh-1vhoHP2vUH-00H81w; Sat, 20 Dec 2025 21:46:54 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/9] platform/wmi: Add kunit test for the marshalling code
Date: Sat, 20 Dec 2025 21:46:15 +0100
Message-Id: <20251220204622.3541-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251220204622.3541-1-W_Armin@gmx.de>
References: <20251220204622.3541-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p1/WqCkdS0bdgCbrZaslj4Jks8UangUAKguqxxSp3DInL7YH5AX
 zCWtq57qcRWyix6nGCaH8n2RoIUo3Ku84bMBGAuAX9qolHG7LoetpgidUrwqDjYFT8MilbB
 lKXn5s0gGYkkNtb8lOl4Vc5VwDdiIA2zYgTvsB2bcD/IbAc7f4bTS2xs/hqU6e0SXN4Ojj0
 c9eBTC3zh47PibmR2qlOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uu4nwwcpnUw=;6e4tF+MwhKPqJac+iRIgEUgYnIw
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


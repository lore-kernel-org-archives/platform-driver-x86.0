Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7262FD69D;
	Fri, 16 Jan 2026 20:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596116; cv=none; b=hlXR56XkO/Z+M5AIrhfX9or8MEo8NidxSDO3rCtVZped8l6au4Q0jGq1D3Kwsn9Y5z2HReezKhgw8HT/9U6vrvmYMXeODbTVd57GE8jDXjKEdP/lgwQnhw+ZKTZEWSACTpUP/ctgllxJcx0zqr9wdZbLwJmaSbBr5JPvZntE1UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596116; c=relaxed/simple;
	bh=ky6Uv9/uEc7uB1evuRXEl6vo13vIWeN02C3RIC6h4Jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ojuR2SV4R2bPTItDVpO+bMd+cYQ0mNSqyqmuMgrY8dGIcsifVnJ2qYulLuXC3cSZGla0KJRNbOmPXBiL0q8yxjK9EMNuRBzgVkKKzM1au1ZfpA8EutQRQC6czSnz1tzjinutFjURRS0W07VREK6C45fDCU84UeiNk1CzkSZW68w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=O7XxjA/G; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="O7XxjA/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596099; x=1769200899; i=w_armin@gmx.de;
	bh=NitAERjcXLJHRK6288iehSoLRg5EoInw/6zaVgJadU8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=O7XxjA/Gr//Nn2yZz3x0AHeJAmNwhySmT5WMXzz5BF7nIihGc1NBGZ/dT8dY4Era
	 QNXWNVpMs+VSeBS1zZ2FcpCNRgtwz9zB6hmc8D3YpJn3SR9BhE4hG4E2I1dewpguI
	 Va/acxmXOPsFfyCNu6YsisjvIZ8jtx8fEiMG/7DZJYO6d+jJcI8f6dzS38XekJzka
	 Teu/GHbVimSslvIwOJHQVkkByTsaY/EI/IqsXQ0moM1gaYgxNbRbo2OurBkqXHAKN
	 W50xDD7zX8cnJOEUfuO15naRVWhY8ZSJmpQp63PrPFFGH90WzOVMOsvwk6DzvAPpt
	 OHv2V53/U0V54JzSsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M9Wuk-1vmMx51BOW-004Cyl; Fri, 16 Jan 2026 21:41:39 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 4/9] platform/wmi: Add kunit test for the string conversion code
Date: Fri, 16 Jan 2026 21:41:11 +0100
Message-Id: <20260116204116.4030-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116204116.4030-1-W_Armin@gmx.de>
References: <20260116204116.4030-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HfmAtz1JIlFISwwccmPzkh9Ef5biaNxo9mwrrvr34TE7717mkFZ
 ODtKyme2eyJXF7owmySchV9SkVgT9UzFp5WvIOvqK1mRNuJLCvJcTkF3Aqf7w4aye7D0iGp
 KBEJ1HbWDWtSmOnQkMPdZOTngQbzFTd3K2apq9DUydu98OPcR7SRTDbFicc7K1LU3qfhA6R
 rvLKrgtQIYEKsoZ461wvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/poB6mX+ROw=;qpmyJ0aa4Bz6q+dObNn5IqIWO+Y
 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

The string conversion frunctions provided by the WMI driver core
have no dependencies on the remaining WMI API, making them suitable
for unit tests.

Implement such a unit test using kunit. Those unit tests verify that
converting between WMI strings and UTF8 strings works as expected.
They also verify that edge cases are handled correctly.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/tests/Kconfig        |  11 +
 drivers/platform/wmi/tests/Makefile       |   3 +
 drivers/platform/wmi/tests/string_kunit.c | 278 ++++++++++++++++++++++
 3 files changed, 292 insertions(+)
 create mode 100644 drivers/platform/wmi/tests/string_kunit.c

diff --git a/drivers/platform/wmi/tests/Kconfig b/drivers/platform/wmi/tes=
ts/Kconfig
index efcbcb51c251..f7f0f3c540f5 100644
=2D-- a/drivers/platform/wmi/tests/Kconfig
+++ b/drivers/platform/wmi/tests/Kconfig
@@ -14,3 +14,14 @@ config ACPI_WMI_MARSHALLING_KUNIT_TEST
 	  to the KUnit documentation in Documentation/dev-tools/kunit/.
=20
 	  If unsure, say N.
+
+config ACPI_WMI_STRING_KUNIT_TEST
+	tristate "KUnit Test for ACPI-WMI string conversion" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for the ACPI-WMI string conversion code.
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
diff --git a/drivers/platform/wmi/tests/Makefile b/drivers/platform/wmi/te=
sts/Makefile
index 252c3125353a..62c438e26259 100644
=2D-- a/drivers/platform/wmi/tests/Makefile
+++ b/drivers/platform/wmi/tests/Makefile
@@ -6,3 +6,6 @@
=20
 wmi_marshalling_kunit-y				:=3D marshalling_kunit.o
 obj-$(CONFIG_ACPI_WMI_MARSHALLING_KUNIT_TEST)	+=3D wmi_marshalling_kunit.=
o
+
+wmi_string_kunit-y				:=3D string_kunit.o
+obj-$(CONFIG_ACPI_WMI_STRING_KUNIT_TEST)	+=3D wmi_string_kunit.o
diff --git a/drivers/platform/wmi/tests/string_kunit.c b/drivers/platform/=
wmi/tests/string_kunit.c
new file mode 100644
index 000000000000..9aa3ffa85090
=2D-- /dev/null
+++ b/drivers/platform/wmi/tests/string_kunit.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit test for the ACPI-WMI string conversion code.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/wmi.h>
+
+#include <kunit/resource.h>
+#include <kunit/test.h>
+
+#include <asm/byteorder.h>
+
+struct wmi_string_param {
+	const char *name;
+	const struct wmi_string *wmi_string;
+	/*
+	 * Remember that using sizeof() on a struct wmi_string will
+	 * always return a size of two bytes due to the flexible
+	 * array member!
+	 */
+	size_t wmi_string_length;
+	const u8 *utf8_string;
+	size_t utf8_string_length;
+};
+
+#define TEST_WMI_STRING_LENGTH 12
+
+static const struct wmi_string test_wmi_string =3D {
+	.length =3D cpu_to_le16(10),
+	.chars =3D {
+		cpu_to_le16(u'T'),
+		cpu_to_le16(u'E'),
+		cpu_to_le16(u'S'),
+		cpu_to_le16(u'T'),
+		cpu_to_le16(u'\0'),
+	},
+};
+
+static const u8 test_utf8_string[] =3D "TEST";
+
+#define SPECIAL_WMI_STRING_LENGTH 14
+
+static const struct wmi_string special_wmi_string =3D {
+	.length =3D cpu_to_le16(12),
+	.chars =3D {
+		cpu_to_le16(u'=C3=84'),
+		cpu_to_le16(u'=C3=96'),
+		cpu_to_le16(u'=C3=9C'),
+		cpu_to_le16(u'=C3=9F'),
+		cpu_to_le16(u'=E2=82=AC'),
+		cpu_to_le16(u'\0'),
+	},
+};
+
+static const u8 special_utf8_string[] =3D "=C3=84=C3=96=C3=9C=C3=9F=E2=82=
=AC";
+
+#define MULTI_POINT_WMI_STRING_LENGTH 12
+
+static const struct wmi_string multi_point_wmi_string =3D {
+	.length =3D cpu_to_le16(10),
+	.chars =3D {
+		cpu_to_le16(u'K'),
+		/* =F0=9F=90=A7 */
+		cpu_to_le16(0xD83D),
+		cpu_to_le16(0xDC27),
+		cpu_to_le16(u'!'),
+		cpu_to_le16(u'\0'),
+	},
+};
+
+static const u8 multi_point_utf8_string[] =3D "K=F0=9F=90=A7!";
+
+#define PADDED_TEST_WMI_STRING_LENGTH 14
+
+static const struct wmi_string padded_test_wmi_string =3D {
+	.length =3D cpu_to_le16(12),
+	.chars =3D {
+		cpu_to_le16(u'T'),
+		cpu_to_le16(u'E'),
+		cpu_to_le16(u'S'),
+		cpu_to_le16(u'T'),
+		cpu_to_le16(u'\0'),
+		cpu_to_le16(u'\0'),
+	},
+};
+
+static const u8 padded_test_utf8_string[] =3D "TEST\0";
+
+#define OVERSIZED_TEST_WMI_STRING_LENGTH 14
+
+static const struct wmi_string oversized_test_wmi_string =3D {
+	.length =3D cpu_to_le16(8),
+	.chars =3D {
+		cpu_to_le16(u'T'),
+		cpu_to_le16(u'E'),
+		cpu_to_le16(u'S'),
+		cpu_to_le16(u'T'),
+		cpu_to_le16(u'!'),
+		cpu_to_le16(u'\0'),
+	},
+};
+
+static const u8 oversized_test_utf8_string[] =3D "TEST!";
+
+#define INVALID_TEST_WMI_STRING_LENGTH 14
+
+static const struct wmi_string invalid_test_wmi_string =3D {
+	.length =3D cpu_to_le16(12),
+	.chars =3D {
+		cpu_to_le16(u'T'),
+		/* =F0=9F=90=A7, with low surrogate missing */
+		cpu_to_le16(0xD83D),
+		cpu_to_le16(u'E'),
+		cpu_to_le16(u'S'),
+		cpu_to_le16(u'T'),
+		cpu_to_le16(u'\0'),
+	},
+};
+
+/* We have to split the string here to end the hex escape sequence */
+static const u8 invalid_test_utf8_string[] =3D "T" "\xF0\x9F" "EST";
+
+static const struct wmi_string_param wmi_string_params_array[] =3D {
+	{
+		.name =3D "ascii_string",
+		.wmi_string =3D &test_wmi_string,
+		.wmi_string_length =3D TEST_WMI_STRING_LENGTH,
+		.utf8_string =3D test_utf8_string,
+		.utf8_string_length =3D sizeof(test_utf8_string),
+	},
+	{
+		.name =3D "special_string",
+		.wmi_string =3D &special_wmi_string,
+		.wmi_string_length =3D SPECIAL_WMI_STRING_LENGTH,
+		.utf8_string =3D special_utf8_string,
+		.utf8_string_length =3D sizeof(special_utf8_string),
+	},
+	{
+		.name =3D "multi_point_string",
+		.wmi_string =3D &multi_point_wmi_string,
+		.wmi_string_length =3D MULTI_POINT_WMI_STRING_LENGTH,
+		.utf8_string =3D multi_point_utf8_string,
+		.utf8_string_length =3D sizeof(multi_point_utf8_string),
+	},
+};
+
+static void wmi_string_param_get_desc(const struct wmi_string_param *para=
m, char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(wmi_string, wmi_string_params_array, wmi_string_param_g=
et_desc);
+
+static void wmi_string_to_utf8s_test(struct kunit *test)
+{
+	const struct wmi_string_param *param =3D test->param_value;
+	ssize_t ret;
+	u8 *result;
+
+	result =3D kunit_kzalloc(test, param->utf8_string_length, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, result);
+
+	ret =3D wmi_string_to_utf8s(param->wmi_string, result, param->utf8_strin=
g_length);
+
+	KUNIT_EXPECT_EQ(test, ret, param->utf8_string_length - 1);
+	KUNIT_EXPECT_MEMEQ(test, result, param->utf8_string, param->utf8_string_=
length);
+}
+
+static void wmi_string_from_utf8s_test(struct kunit *test)
+{
+	const struct wmi_string_param *param =3D test->param_value;
+	struct wmi_string *result;
+	size_t max_chars;
+	ssize_t ret;
+
+	max_chars =3D (param->wmi_string_length - sizeof(*result)) / 2;
+	result =3D kunit_kzalloc(test, param->wmi_string_length, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, result);
+
+	ret =3D wmi_string_from_utf8s(result, max_chars, param->utf8_string,
+				    param->utf8_string_length);
+
+	KUNIT_EXPECT_EQ(test, ret, max_chars - 1);
+	KUNIT_EXPECT_MEMEQ(test, result, param->wmi_string, param->wmi_string_le=
ngth);
+}
+
+static void wmi_string_to_utf8s_padded_test(struct kunit *test)
+{
+	u8 result[sizeof(padded_test_utf8_string)];
+	ssize_t ret;
+
+	ret =3D wmi_string_to_utf8s(&padded_test_wmi_string, result, sizeof(resu=
lt));
+
+	KUNIT_EXPECT_EQ(test, ret, sizeof(test_utf8_string) - 1);
+	KUNIT_EXPECT_MEMEQ(test, result, test_utf8_string, sizeof(test_utf8_stri=
ng));
+}
+
+static void wmi_string_from_utf8s_padded_test(struct kunit *test)
+{
+	struct wmi_string *result;
+	size_t max_chars;
+	ssize_t ret;
+
+	max_chars =3D (PADDED_TEST_WMI_STRING_LENGTH - sizeof(*result)) / 2;
+	result =3D kunit_kzalloc(test, PADDED_TEST_WMI_STRING_LENGTH, GFP_KERNEL=
);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, result);
+
+	ret =3D wmi_string_from_utf8s(result, max_chars, padded_test_utf8_string=
,
+				    sizeof(padded_test_utf8_string));
+
+	KUNIT_EXPECT_EQ(test, ret, sizeof(test_utf8_string) - 1);
+	KUNIT_EXPECT_MEMEQ(test, result, &test_wmi_string, sizeof(test_wmi_strin=
g));
+}
+
+static void wmi_string_to_utf8s_oversized_test(struct kunit *test)
+{
+	u8 result[sizeof(oversized_test_utf8_string)];
+	ssize_t ret;
+
+	ret =3D wmi_string_to_utf8s(&oversized_test_wmi_string, result, sizeof(r=
esult));
+
+	KUNIT_EXPECT_EQ(test, ret, sizeof(test_utf8_string) - 1);
+	KUNIT_EXPECT_MEMEQ(test, result, test_utf8_string, sizeof(test_utf8_stri=
ng));
+}
+
+static void wmi_string_to_utf8s_invalid_test(struct kunit *test)
+{
+	u8 result[sizeof(invalid_test_utf8_string)];
+	ssize_t ret;
+
+	ret =3D wmi_string_to_utf8s(&invalid_test_wmi_string, result, sizeof(res=
ult));
+
+	KUNIT_EXPECT_EQ(test, ret, sizeof(test_utf8_string) - 1);
+	KUNIT_EXPECT_MEMEQ(test, result, test_utf8_string, sizeof(test_utf8_stri=
ng));
+}
+
+static void wmi_string_from_utf8s_invalid_test(struct kunit *test)
+{
+	struct wmi_string *result;
+	size_t max_chars;
+	ssize_t ret;
+
+	max_chars =3D (INVALID_TEST_WMI_STRING_LENGTH - sizeof(*result)) / 2;
+	result =3D kunit_kzalloc(test, INVALID_TEST_WMI_STRING_LENGTH, GFP_KERNE=
L);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, result);
+
+	ret =3D wmi_string_from_utf8s(result, max_chars, invalid_test_utf8_strin=
g,
+				    sizeof(invalid_test_utf8_string));
+
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+static struct kunit_case wmi_string_test_cases[] =3D {
+	KUNIT_CASE_PARAM(wmi_string_to_utf8s_test, wmi_string_gen_params),
+	KUNIT_CASE_PARAM(wmi_string_from_utf8s_test, wmi_string_gen_params),
+	KUNIT_CASE(wmi_string_to_utf8s_padded_test),
+	KUNIT_CASE(wmi_string_from_utf8s_padded_test),
+	KUNIT_CASE(wmi_string_to_utf8s_oversized_test),
+	KUNIT_CASE(wmi_string_to_utf8s_invalid_test),
+	KUNIT_CASE(wmi_string_from_utf8s_invalid_test),
+	{}
+};
+
+static struct kunit_suite wmi_string_test_suite =3D {
+	.name =3D "wmi_string",
+	.test_cases =3D wmi_string_test_cases,
+};
+
+kunit_test_suite(wmi_string_test_suite);
+
+MODULE_AUTHOR("Armin Wolf <W_Armin@gmx.de>");
+MODULE_DESCRIPTION("KUnit test for the ACPI-WMI string conversion code");
+MODULE_LICENSE("GPL");
=2D-=20
2.39.5


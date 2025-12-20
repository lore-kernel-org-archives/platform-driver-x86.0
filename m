Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42628750B;
	Sat, 20 Dec 2025 20:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263624; cv=none; b=G2Z/cLDRRfIW25Kx50x2v/LWscp641fgkMa2vcz2HtluKHZnnoySNpKS1J6nuklI+fTtV2qvKMvVMpLw6J0aD7y6offqDbLmJeB/dT99yZdhUUxplbd6whadU0aEnfpmXa4XverHXhcK0h3gRub8B6DF3+mBHskSlG3Debnice4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263624; c=relaxed/simple;
	bh=l2YJRNguf8wk88SUlTEgZ+7KnTWqdISh9C3Qj15haMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iAU7tG706d3MraUNmGdO/E6HVi36K1QjpkopQDl5f7WPKJu1MpZ5b2/CO+2Uaz1VnO18b2k0dHQGJvIWTuXCUyxBmomfnaxlXlR0T2cfCjIqvGyr4lMiajqF3ygLxbL5MWBt4/lPvGf2dqNgcHWGh505eMZT0HS914rg4dZn2es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=iXFYtJrL; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="iXFYtJrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263618; x=1766868418; i=w_armin@gmx.de;
	bh=xdpKouYgk0YDoP2WSwdh/NcjNQm8drFIQ/Nv0Bk/AOc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iXFYtJrLzbdQYf3O6Ij3xku6ud0PXSkkTuy5z0VNDVLXnJwZrUFLxB8S68u5RIEX
	 q24ICJmxF7OItvG5wBkpMiYzBjzhDyaOEiagOYb0P1fPZ+zD33N3SMLM560gCSq7r
	 H30V9hKERZQBiz2Y7oV8LAzQ0ZlZY2XE/STlSXppflbTRICTEY1HCSAiFlCCLIlDp
	 9IULhQ7dnoYaz+LgbyxYAVbAnHanvxFyMf3kdDjVRmzddzvkJzMstjh4UwBykdJ06
	 SH1YkEvfsVZi95pFhmMqu1B9GQRiIy+EHPJYPbyjpD+KFaCIrD7eYb7lwbPJxu+Dp
	 KxTMkV9c58Eb44xr3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MTABT-1vOdG11eBj-00X0oT; Sat, 20 Dec 2025 21:46:58 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 4/9] platform/wmi: Add kunit test for the string conversion code
Date: Sat, 20 Dec 2025 21:46:17 +0100
Message-Id: <20251220204622.3541-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251220204622.3541-1-W_Armin@gmx.de>
References: <20251220204622.3541-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ODKHqPbc/s16Xh/mpygSIoFrIVje5XO4sUcZ/aj6x5JrDVSV/qB
 BdpYcForqroR5fzXAJJ7P5tS/kuqW4zUM3qcgFOhG1q+Fy6kXIKAU+2LeaP3YYDu7tHAZBk
 Mq4bnuqUVAl5KnC9yxqMCeqk37EIctvzMBuJxqZtLacT7hOSNMjXtqXyHa4g6R64fkqevei
 evIMIGCUHfU2Y0Br8vzVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iYpRPKOvtS4=;EuuIOsZYmTDg2atACXlcsP7Zgva
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
 drivers/platform/wmi/tests/string_kunit.c | 277 ++++++++++++++++++++++
 3 files changed, 291 insertions(+)
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
index 000000000000..4544ae453365
=2D-- /dev/null
+++ b/drivers/platform/wmi/tests/string_kunit.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * KUnit test for the ACPI-WMI string conversion code.
+ *
+ * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
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


Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5AD2848A8;
	Sat, 22 Nov 2025 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843919; cv=none; b=WEz7u/mGpQF6o+7rO0Cih7drBJx+WCCEDnSDLpVu8cW1Fk2/wVS1/ZBUfFVZMisnJ+rgPrmbZ4kSCu3Qh7iL3KVLVxyIMlz0uCJ1Hon+2vmarg0zcfEC6t5fhtriLtJiCoOeFKJ0acUJ7ozZQAQkSMDOW0Fw0sui5GnIRIhfW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843919; c=relaxed/simple;
	bh=l2YJRNguf8wk88SUlTEgZ+7KnTWqdISh9C3Qj15haMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nEyle699Wa1xIfawqrw+MzVfxZyx1SzHe5xJ8uOlfvduSJ7USEhELtL1XShJHHy41bOrxqWm+3z/cdx9cRDfKhADx61TSQEMjzSs6ahrknTxDTGuO3ceN4duvUlFDQzHbvLKyDa7mjQqwHcLNioE5b9GmlpQtFqK7ft5j8aAr7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ntLlFLLW; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ntLlFLLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843912; x=1764448712; i=w_armin@gmx.de;
	bh=xdpKouYgk0YDoP2WSwdh/NcjNQm8drFIQ/Nv0Bk/AOc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ntLlFLLW8yRmitZFzZtqMjPcn8ssBYPfXInTgwgvHW5hnzgHme40lGVo+WE+phO4
	 +Q05eQcgwJj78uMhWtN8GkUiG7ROcBMvbVsrAP7jgIOS7jG/+sHIS03p3cBFPYYjk
	 JnXdViYt5c9s2j0GpHmXrr91zRDLp+D5/1ScGna9vOoYM0ZlA8udb6Jh/ZTg6zI4T
	 A0Fx5VETW3+M2hbfcLsUVdTztKkvDV1srI5LawuxBV/sRViO/TgLJeoB73xzUJWK4
	 /HVhVQW5LYAMU02LvVx6AtWDKxKdkFwj6zFDSpX9JJ0Iq72Y0b4cyF52Doi8Yf/We
	 OdZf8AYnHgJN+dDaJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N33Ib-1w8huf0GuT-010xRE; Sat, 22 Nov 2025 21:38:32 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 4/9] platform/wmi: Add kunit test for the string conversion code
Date: Sat, 22 Nov 2025 21:37:58 +0100
Message-Id: <20251122203803.6154-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:oUkENQFfk5B43bUSyXXTZSn/ZvfCAw5nuwEn7OU8K9N2cJgo0QJ
 rqs4pivspi8mZI/c0V1vveR6AXNPSI7MyfvN38qZE7JYIvIj7AMyO9P+Yutl66avHvFZLQO
 qHx/HO3R4aJilbUl6OhpF7zSsadYYEUWHjvK6k8UXbVhbMfz4GHyYLBHk+rl5ZP7oRnpzaq
 og1Hg70BDhrDx274q3Itw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/CwSvMUUw5E=;0Q6ksOMJYSMHoGwfHvsxmQpsHvJ
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


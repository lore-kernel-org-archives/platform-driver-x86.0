Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA1A33E378;
	Fri,  9 Jan 2026 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995218; cv=none; b=c154uOwf4jRi1+siVo5/wa/3csgv599Te1xUYxWjZmMBv1FgkvWBB1ow7d81vOSevKpIf1SzsGni5vPfhMvXur1luI4QSG1xwkbgl8Hc76/TWmgLCEyjJhnqR0fDLzfjPL0/Jwaw1XNLiTUHpdFSDIOEZ4A1Aoljlzye5Tz7cgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995218; c=relaxed/simple;
	bh=ky6Uv9/uEc7uB1evuRXEl6vo13vIWeN02C3RIC6h4Jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j2YTfu/iPXhLvVegtG/KPVXfEqGwk+IuREMjYErwQdlf2hjwyw/W6XQS3kxxd2SQsg5b/EBMYX/7zX85lR3UOR2ka59RvAyIbC/95v7iwAXGYZIti33r+WTLBfFxOwWetFcNbLoh38fZaCAgyVwtpHTqq3j6swe0HZgEbUVdAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cArdKqNM; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cArdKqNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995205; x=1768600005; i=w_armin@gmx.de;
	bh=NitAERjcXLJHRK6288iehSoLRg5EoInw/6zaVgJadU8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cArdKqNMjV17l9k7SZ6bmZhY4+KU9HRRRNfgi8sPe1OzHmIXY+a7ty0JXi93UXaG
	 MHjLSnNRPKRUI0B91obrDuiSt7OY2rU9c0a9RUW/9AHi67B1L215mhZc4sxlwUadX
	 vR32NkCUkAlz0anMt5XNElWkeCybAjB+flhDGK5oaDcduvkalkeZDheM1eBLEYV40
	 4e0VdOh/AHOWcSir8d3K9q9JzoF9sZkfNcmU7lXXtMm+6Sh/LdrM88Mm1xt6fXdKg
	 xgSLrkyfflLc2w77X4MTaA7Ue6K2/9ysd80wO4ZEodBXKMMraxKq+6z1bPmjGSMD3
	 rXHRdTDbe/l54UT1aA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MPGW7-1vU4Mr3sEv-00KasE; Fri, 09 Jan 2026 22:46:45 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 4/9] platform/wmi: Add kunit test for the string conversion code
Date: Fri,  9 Jan 2026 22:46:14 +0100
Message-Id: <20260109214619.7289-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:18qiiithjGkB4g8k532jBMoP1W1MLvz7U7ePJ3iIWlusNljBQ9z
 8WBTneWPTMud48FvcRYR3jrotURMsoSGD5tAo3Bsq++b5ER9a9KYQJBb1lRiVu5DfkDJTlW
 HHsTwg2ZVJU5h/J/m+6+MMfdQRyrTvdsHeqN3LzxIAQj3PAfuMW+IW+mzkNrREySVH6yAYN
 6SINvB/C0vGu5T0cmtt6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QzSF2KKyJrM=;jR5HXMkKCWt/B3oLGhzgiB63Sch
 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
 0jXLEEX2uvl3U3OLeRbY

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


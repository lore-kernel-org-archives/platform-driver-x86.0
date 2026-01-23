Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B33EBF3B;
	Fri, 23 Jan 2026 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769202953; cv=none; b=p/fSfyJwLFyo0Rl8DMTxhQ/gCOT2tsErv2TdsA0HsV1Xno86Ou5qyKd9ZJ/evd8f9TZrTEmQrWU4Dn+dDVCOIOf1E/kQv9GjcIfjga+3OxsvZTh6sHUqDaP4k77nXh+nunbibCSZSBU5kOq2T6jtEtiGG1j0Wd0twiLUtgiF6Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769202953; c=relaxed/simple;
	bh=cMvpB3tbdx+Ir5joqBpK82ppqsjTU0DdNNRcOz88mAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R4MEuL9gKLjDKZ5fmpGobTaO8nE7IXjCe3QbjwAb9Hh3y0veE64a6OsJtdc7+rvIQsVP53rINoIH6lLEeEHq8l+0Rk8XAJgOJCH/J6yMCBzjMUehNpRvXGXoXtCWV6aVy5UMqfybEmVDPwjUi77KWhwC7Be1pVEB+NXPoU+w3R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pq0lGFfK; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pq0lGFfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769202949; x=1769807749; i=w_armin@gmx.de;
	bh=4gkhjFnSq6sjTl08fgnb1tAfyFyYgO66qR2R3XB3Eik=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pq0lGFfKbVrS7MSq2HDEOg7QCi9mdAjh3MylmhfTRkVg2MHwshTb4L8XofCea33W
	 H02ceXTJ7dX+K4PEdMBtsRClBPIjFEynpLkwpTno62tuPtxjdbLxDn/D9SkdQPgwn
	 4pS3gQia0w+ArX0Yq0/BYGHSiIRWh84/pa3bzoU52JiCwM+Vc4N+3uYGqoomJpULD
	 h9BTtJSaS6QLsMRt2CFtShjRKYCm7SsKgSY5m5kL7miyAXvrbsOAi9v3drRi3NTbL
	 vxuqne46Cl1FD65OUq9h9+sYzG6IQW0vX2YVnPwit6YS8bpPU4S6YRh5ZZ5rTvske
	 NAOLubMQ8u2fVlFO0g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MIMfW-1vXH283fNM-00HUZw; Fri, 23 Jan 2026 22:15:49 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: nathan@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/wmi: string-kunit: Add missing oversized string test case
Date: Fri, 23 Jan 2026 22:15:37 +0100
Message-Id: <20260123211537.4448-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f3PzZHweBQvHJjyo0BOxTR3tJiKknxqHu/6lNp3upznOreW9MYL
 6HFuAm0UX6Puz8iN1gsZZyTWHAEfeDNaXLsdo7AWWU1OyRvhcsOlW6G8ESklzoUjPnYc1hA
 ZTkN3QfqDrR3ZsPwX90NQdcjUyNRMe02iG7cVpqX8Glcn0+bRxD7ANpcsGsReijom+LLEZ4
 pEjPRb/xWD96s3pp8Nx+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xcFgXHvHH0s=;dl+vmkLUorWmUXNn0rad0JKtYvZ
 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

When compiling the WMI string kunit tests using llvm, the compiler
will issue a warning about "oversized_test_utf8_string" being unused.
This happens because the test case that was supposed to use said
variable was accidentally omitted when adding the kunit tests.

Fix this by adding the aforementioned test case.

Fixes: 0e1a8143e797 ("platform/wmi: Add kunit test for the string conversi=
on code")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/platform-driver-x86/20260122234521.GA41318=
3@ax162/
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/tests/string_kunit.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/wmi/tests/string_kunit.c b/drivers/platform/=
wmi/tests/string_kunit.c
index 9aa3ffa85090..117f32ee26a8 100644
=2D-- a/drivers/platform/wmi/tests/string_kunit.c
+++ b/drivers/platform/wmi/tests/string_kunit.c
@@ -228,6 +228,23 @@ static void wmi_string_to_utf8s_oversized_test(struct=
 kunit *test)
 	KUNIT_EXPECT_MEMEQ(test, result, test_utf8_string, sizeof(test_utf8_stri=
ng));
 }
=20
+static void wmi_string_from_utf8s_oversized_test(struct kunit *test)
+{
+	struct wmi_string *result;
+	size_t max_chars;
+	ssize_t ret;
+
+	max_chars =3D (TEST_WMI_STRING_LENGTH - sizeof(*result)) / 2;
+	result =3D kunit_kzalloc(test, TEST_WMI_STRING_LENGTH, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, result);
+
+	ret =3D wmi_string_from_utf8s(result, max_chars, oversized_test_utf8_str=
ing,
+				    sizeof(oversized_test_utf8_string));
+
+	KUNIT_EXPECT_EQ(test, ret, sizeof(test_utf8_string) - 1);
+	KUNIT_EXPECT_MEMEQ(test, result, &test_wmi_string, sizeof(test_wmi_strin=
g));
+}
+
 static void wmi_string_to_utf8s_invalid_test(struct kunit *test)
 {
 	u8 result[sizeof(invalid_test_utf8_string)];
@@ -261,6 +278,7 @@ static struct kunit_case wmi_string_test_cases[] =3D {
 	KUNIT_CASE(wmi_string_to_utf8s_padded_test),
 	KUNIT_CASE(wmi_string_from_utf8s_padded_test),
 	KUNIT_CASE(wmi_string_to_utf8s_oversized_test),
+	KUNIT_CASE(wmi_string_from_utf8s_oversized_test),
 	KUNIT_CASE(wmi_string_to_utf8s_invalid_test),
 	KUNIT_CASE(wmi_string_from_utf8s_invalid_test),
 	{}
=2D-=20
2.39.5


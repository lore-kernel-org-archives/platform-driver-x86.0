Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82AE30FC1F;
	Mon,  6 Apr 2026 21:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510249; cv=none; b=OxcOZDiJBum0wSlY4MmOrc3074TVJFRNhcBwhWhw1PYHcccl8zC8tRv8vOAumbLI2QdpcZhJGg84dlo9P5EDf2vsuJknW6xdSbKoNBTjMmvBytvCPhuCsOO1AFCQbdPrvJvryqEMnvn0VcYXe86wkyr+eAwKQxvHccwzuAA759I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510249; c=relaxed/simple;
	bh=hEWJhuMsVFbg+UgdKh1O7JI/2FEJFPY2u+6cZWEmEuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=neDM6CBPoObcukqb7RMits8sTLOZ96OQhN3/oyBeri4i00PPM79tQL8QNgfPJ5rfmN3ttemx4AD2Jd3LeC/uxr/UYvJUU0cRMlftToMgOtuWtNNmSHdBJhUxkI7MW7QwX3ah+wDs+TVd89N+/kZosTs2/+B5Nm/DFb35zBbAlUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bPQ2kQ/Z; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bPQ2kQ/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775510236; x=1776115036; i=w_armin@gmx.de;
	bh=Do44YT9yJWMjxYLdrsyR3mHLGEEVoaTSmw2TV1tzGpU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bPQ2kQ/Z0EdpZypHDAUlQnvAZzaYkPTL1ykhHcoOQsejatFToeaKg/hpy7tkD7lr
	 pxxN3cVpZNrH8mKV7QLtBAlFCAzFiMLynbb+NoLhqJVqm9Iod64j1j2qiubFQ3NAZ
	 cMBsPFF3gZ1d5PigBeAEmgLg9vPp/44sQSvF4rTOuvhugT7HNEbJFyA9E7N7fG6dk
	 bETd0lWC02jvcBJejGprIksaAbeSnm0pqR5ffaviA5NI+u/Gp0JB57l3kvJAruxsc
	 pjT6jj2WXBf++5tlTP3hpJ7OgkyVt+unkFjDk0VpKbZ+X0YFulIHydu5OSeS+zXhR
	 m9X2TkguYt9KUT6/fg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1vikBC3Xwj-00oxZf; Mon, 06
 Apr 2026 23:17:15 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] platform/wmi: Prepare to reject undersized unmarshalling results
Date: Mon,  6 Apr 2026 22:32:34 +0200
Message-Id: <20260406203237.2970-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406203237.2970-1-W_Armin@gmx.de>
References: <20260406203237.2970-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nikvwRgrjilbEfAECxKFLR7PkdEhgobrqLNjTbV0ISoO5anNwhG
 /mIgvvn4KD0gVqXA5pStgGgJlk/6oQ1lHn+l3Ov+K25vUgYCVCIQKeITn8ioASJz89IdIiY
 kz02UJ7ZyjVHfY56PXgROD54M7ax9PQqjoAGNUGW+vR8a+yOWnR7VFdsALBKmDlI6N6g4As
 gHwGaotTLwR2M2kLXrk0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XD3iq0pF0FI=;A8dwXAg4dDcY0+bdQJ6iSF77ojL
 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
 xLd4pyTLbfv0fNmdFG0EOqvsszVa5k/yg==

Driver using the buffer-based WMI API usually reject buffers resulting
from WMI method calls or block queries if they contain not enough data.
Prepare the WMI core for assisting in this by automatically rejecting
undersized unmarshalling results.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/wmi/core.c                   |  6 ++---
 drivers/platform/wmi/internal.h               |  3 ++-
 drivers/platform/wmi/marshalling.c            |  6 ++++-
 .../platform/wmi/tests/marshalling_kunit.c    | 24 +++++++++++++++++--
 4 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 7cc5ca11a60d..66ec885bffd7 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -420,7 +420,7 @@ int wmidev_invoke_method(struct wmi_device *wdev, u8 i=
nstance, u32 method_id,
 		return 0;
 	}
=20
-	ret =3D wmi_unmarshal_acpi_object(obj, out);
+	ret =3D wmi_unmarshal_acpi_object(obj, out, 0);
 	kfree(obj);
=20
 	return ret;
@@ -583,7 +583,7 @@ int wmidev_query_block(struct wmi_device *wdev, u8 ins=
tance, struct wmi_buffer *
 	if (!obj)
 		return -EIO;
=20
-	ret =3D wmi_unmarshal_acpi_object(obj, out);
+	ret =3D wmi_unmarshal_acpi_object(obj, out, 0);
 	kfree(obj);
=20
 	return ret;
@@ -1416,7 +1416,7 @@ static void wmi_notify_driver(struct wmi_block *wblo=
ck, union acpi_object *obj)
 			return;
 		}
=20
-		ret =3D wmi_unmarshal_acpi_object(obj, &buffer);
+		ret =3D wmi_unmarshal_acpi_object(obj, &buffer, 0);
 		if (ret < 0) {
 			dev_warn(&wblock->dev.dev, "Failed to unmarshal event data: %d\n", ret=
);
 			return;
diff --git a/drivers/platform/wmi/internal.h b/drivers/platform/wmi/intern=
al.h
index 9a39ffa31ad1..c02908694563 100644
=2D-- a/drivers/platform/wmi/internal.h
+++ b/drivers/platform/wmi/internal.h
@@ -11,7 +11,8 @@
 union acpi_object;
 struct wmi_buffer;
=20
-int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer);
+int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer,
+			      size_t min_size);
 int wmi_marshal_string(const struct wmi_buffer *buffer, struct acpi_buffe=
r *out);
=20
 #endif /* _WMI_INTERNAL_H_ */
diff --git a/drivers/platform/wmi/marshalling.c b/drivers/platform/wmi/mar=
shalling.c
index 63a92c4ebab5..87091832568e 100644
=2D-- a/drivers/platform/wmi/marshalling.c
+++ b/drivers/platform/wmi/marshalling.c
@@ -151,7 +151,8 @@ static int wmi_obj_transform(const union acpi_object *=
obj, u8 *buffer)
 	return 0;
 }
=20
-int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer)
+int wmi_unmarshal_acpi_object(const union acpi_object *obj, struct wmi_bu=
ffer *buffer,
+			      size_t min_size)
 {
 	size_t length, alloc_length;
 	u8 *data;
@@ -161,6 +162,9 @@ int wmi_unmarshal_acpi_object(const union acpi_object =
*obj, struct wmi_buffer *b
 	if (ret < 0)
 		return ret;
=20
+	if (length < min_size)
+		return -ENODATA;
+
 	if (ARCH_KMALLOC_MINALIGN < 8) {
 		/*
 		 * kmalloc() guarantees that the alignment of the resulting memory allo=
cation is at
diff --git a/drivers/platform/wmi/tests/marshalling_kunit.c b/drivers/plat=
form/wmi/tests/marshalling_kunit.c
index 0c7cd8774aa3..471963076d58 100644
=2D-- a/drivers/platform/wmi/tests/marshalling_kunit.c
+++ b/drivers/platform/wmi/tests/marshalling_kunit.c
@@ -372,7 +372,7 @@ static void wmi_unmarshal_acpi_object_test(struct kuni=
t *test)
 	struct wmi_buffer result;
 	int ret;
=20
-	ret =3D wmi_unmarshal_acpi_object(&param->obj, &result);
+	ret =3D wmi_unmarshal_acpi_object(&param->obj, &result, param->buffer.le=
ngth);
 	if (ret < 0)
 		KUNIT_FAIL_AND_ABORT(test, "Unmarshalling of ACPI object failed\n");
=20
@@ -389,7 +389,7 @@ static void wmi_unmarshal_acpi_object_failure_test(str=
uct kunit *test)
 	struct wmi_buffer result;
 	int ret;
=20
-	ret =3D wmi_unmarshal_acpi_object(&param->obj, &result);
+	ret =3D wmi_unmarshal_acpi_object(&param->obj, &result, 0);
 	if (ret < 0)
 		return;
=20
@@ -427,6 +427,25 @@ static void wmi_marshal_string_failure_test(struct ku=
nit *test)
 	KUNIT_FAIL(test, "Invalid string was not rejected\n");
 }
=20
+static void wmi_unmarshal_acpi_object_undersized_test(struct kunit *test)
+{
+	const union acpi_object obj =3D {
+		.integer =3D {
+			.type =3D ACPI_TYPE_INTEGER,
+			.value =3D 0xdeadbeef,
+		},
+	};
+	struct wmi_buffer result;
+	int ret;
+
+	ret =3D wmi_unmarshal_acpi_object(&obj, &result, sizeof(expected_single_=
integer) + 1);
+	if (ret < 0)
+		return;
+
+	kfree(result.data);
+	KUNIT_FAIL(test, "Undersized unmarshalling result was not rejected\n");
+}
+
 static struct kunit_case wmi_marshalling_test_cases[] =3D {
 	KUNIT_CASE_PARAM(wmi_unmarshal_acpi_object_test,
 			 wmi_unmarshal_acpi_object_gen_params),
@@ -436,6 +455,7 @@ static struct kunit_case wmi_marshalling_test_cases[] =
=3D {
 			 wmi_unmarshal_acpi_object_failure_gen_params),
 	KUNIT_CASE_PARAM(wmi_marshal_string_failure_test,
 			 wmi_marshal_string_failure_gen_params),
+	KUNIT_CASE(wmi_unmarshal_acpi_object_undersized_test),
 	{}
 };
=20
=2D-=20
2.39.5


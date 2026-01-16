Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E632FC881;
	Fri, 16 Jan 2026 20:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596114; cv=none; b=rBCAD7P/EAhbMt668QDnxXTg2oE324QLSy6UrBBf+QmLC0muk6K5/o9VF4hRLQgA/w3b0BWWr/zCerbgX8vwWIcVcWi1ETm34tRKRuxJj1jv8toq9TxqV6cjcN/i03K3kJORAXq4ZIa8xSA7hR1iYaoghRJtEklYBRAgYY2gQT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596114; c=relaxed/simple;
	bh=TvDAHqOndFQ+sdZIj1OoGw4fU13kcnFTYjuqXVcz0M0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jRaosjN7/YB33JHeSCJgwjIugsCsW9U+lRVth1YG9D1k6CzVkPejOSFuZKfKg/f3v7RRvTQ5bNO9MkbnyQY2pjbWDVuRTkU/KYLqLq+wGxwg2T5cn0lad5/i3pHsBQCJqAxa3a4biKri/kSCkrKfhdDCbRU9rovppONXcMCtmgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LyJ5V0z1; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LyJ5V0z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596104; x=1769200904; i=w_armin@gmx.de;
	bh=7qlUiAsQVud9Gn3ClRs8IiSZLr9lSLU4BHxB9Zp6gLM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LyJ5V0z1FGDg2xka99ThcudA7RvXhWDz11YRhUyj2vukFDwuc+YuYrEJOG+4hI19
	 hemvz5OFsFsUSq7oWSB0aMB4H7WpHaJC1N1epdbU2pfw+1b7jZCzZAoT7iDbUEnf/
	 AZhnofk3zfBe/2/EVLypOFhNkdGZYt+ePBT24NqkvCVEZV37x64cCeAFrcl6ZZKfY
	 +h2ZHYndwGei8L67LYlvz5o2CQEEsKsQd5tlDzw6ETUgq3SbdiZ/eUTxI3+jWkMcl
	 3SuGuBkJh6QcIpAEOCM6G3+NAS5QzrVzUtlpg3UE7Ot3jmQDG3eTZZw4ON4ZlJPKP
	 e/fHbag9gqiWEe4+cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MqaxO-1wBUVL3IdE-00lGx6; Fri, 16 Jan 2026 21:41:43 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
Date: Fri, 16 Jan 2026 21:41:13 +0100
Message-Id: <20260116204116.4030-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:uQFPOVKwRyNOxlO4oqMXTWageCh915brrJ7rY6h0RvXv/bMTCGi
 rH9r82WLUieIbBDJW3btYbvKgc5+to0mg7MFiRNMWpagE22xTOXldwMAIku31c8VmFWkKCY
 r/z4M+WDJfcv7sJCEn3KMVeDPE4DeHPwxllG7yoUF9uMqNrpqNAHwe2+fBNp5Qj0JOEQ8a4
 v63944JlnM21qLZ3fiNDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UUv+IsplAHU=;1Xh+HGa1XewMrM4gAKPpX8heJW6
 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
 835K1yBgReToNSzjwazqKMmKj+pgQ

Use the new buffer-based WMI API to avoid having to deal with ACPI
at all.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/intel/wmi/thunderbolt.c | 26 +++++++++-----------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/wmi/thunderbolt.c b/drivers/platfo=
rm/x86/intel/wmi/thunderbolt.c
index 08df560a2c7a..f01dd096c689 100644
=2D-- a/drivers/platform/x86/intel/wmi/thunderbolt.c
+++ b/drivers/platform/x86/intel/wmi/thunderbolt.c
@@ -7,7 +7,6 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
@@ -23,24 +22,21 @@ static ssize_t force_power_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	struct acpi_buffer input;
-	acpi_status status;
+	struct wmi_buffer buffer;
+	int ret;
 	u8 mode;
=20
-	input.length =3D sizeof(u8);
-	input.pointer =3D &mode;
+	buffer.length =3D sizeof(mode);
+	buffer.data =3D &mode;
+
 	mode =3D hex_to_bin(buf[0]);
-	dev_dbg(dev, "force_power: storing %#x\n", mode);
-	if (mode =3D=3D 0 || mode =3D=3D 1) {
-		status =3D wmidev_evaluate_method(to_wmi_device(dev), 0, 1, &input, NUL=
L);
-		if (ACPI_FAILURE(status)) {
-			dev_dbg(dev, "force_power: failed to evaluate ACPI method\n");
-			return -ENODEV;
-		}
-	} else {
-		dev_dbg(dev, "force_power: unsupported mode\n");
+	if (mode > 1)
 		return -EINVAL;
-	}
+
+	ret =3D wmidev_invoke_method(to_wmi_device(dev), 0, 1, &buffer, NULL);
+	if (ret < 0)
+		return ret;
+
 	return count;
 }
=20
=2D-=20
2.39.5


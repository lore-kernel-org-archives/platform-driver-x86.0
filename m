Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CC02DC346;
	Fri,  9 Jan 2026 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995226; cv=none; b=fa9mPFqh/gijuaTAoadaDtyJSwnCLdzhgFrM6IrdIl0c/2NfpVltUQd8SyT5G3ylovCKTo0Ckmm+RvjcT3LZk28wDP+US4GiapiTH5JSYb9PcK3yJaPL9G5UjjXZajl+0qdx8aytc6Ap0AofALVNNcS+KhE1HWM7R5GB2fACZpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995226; c=relaxed/simple;
	bh=TvDAHqOndFQ+sdZIj1OoGw4fU13kcnFTYjuqXVcz0M0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YoeSE9dwbCC1KFSb1TvqlWces8DtjpocgjCvmg98/2MNaP8iRlLTrT9HmXV/yFDtC+XGir8OWOdkgVEZVlNrX1ZmSwSWwCO8qo/O8MXFfAaP93PB1f5cxNd0p7bOtOyjzrdoaJy1zE56Cy9d67aPCwVmUj+3tWjwQAPXxoHO8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IQnEZidX; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IQnEZidX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995209; x=1768600009; i=w_armin@gmx.de;
	bh=7qlUiAsQVud9Gn3ClRs8IiSZLr9lSLU4BHxB9Zp6gLM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IQnEZidXQr1o3nlpFG0MTiyLS9X+YF1d6EJ+mhsTYg28VI/UOBsHw3rd6SXDjKGg
	 pSZiVGMcbZ8pXFuwfM5Z1vlywdYhKOgwgoEVxs8lZ3ll/N0QIB0R7fMt0NMkHdb7I
	 6evO0Vvgrf3F00Cc1sMB3Yz078ge/pJJR+zK7ROsenEMtJjffOdHOd+ABcQDiCjEe
	 54srdG7BJKuQYZS61tUPRsueQuCoMto0JRt5nqCTaBo9661BGLBu7KW+VewFn8XLx
	 egQ2/rVVREETC0JSS0+ch9HSJDkSir0emwDo1roHhNev81yUodCfPTgsbH7KxxTdu
	 5v2ba0urJLwbIw/Y3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N3bWr-1vnQt81dYJ-015BXy; Fri, 09 Jan 2026 22:46:49 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
Date: Fri,  9 Jan 2026 22:46:16 +0100
Message-Id: <20260109214619.7289-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260109214619.7289-1-W_Armin@gmx.de>
References: <20260109214619.7289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MOW2W0LBYDaCCleLS9sEk3+Kn8Z5KazgxsewoMhQ1h+DFsIayuV
 tjAQn4Qzyr/AejhkcqCNhJA7kcrwJ04UHoc9wgcVlYS68lSCIDRt3JWkubUgI7ZoPm2cPl3
 hJ+s7FD4VQxGx8MYGZu943a5KjGMJM4xGHJiYAgnEfkM6LulzaUbfUzhVOwu5QYkeUPeez2
 BHRyWrbngZBNagpOuIiBA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/iSSIR+59No=;TXG8DMDYclg9CB997NPgAEmEUxS
 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
 zd6Pi9xYP7ZQmM+zNH9FeUHjoCDx8

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


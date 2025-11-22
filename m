Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801A2D7392;
	Sat, 22 Nov 2025 20:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763843927; cv=none; b=a1AR0CE/CS96OAAptaSX1+VObIL2+ElO6xrOG3w2V8qIDrgf10SLTGH2lhPlNaEf3kf2Cs8ujJrQoikCfLbTNHFAKH4c3wDzg0qvo/CqoaI3XdrD63Ca2GB/DKM0sQRbP7PNfmsZNZVWDZK3tJ/p48HTdH0O7mc41uF4V7rcO1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763843927; c=relaxed/simple;
	bh=TvDAHqOndFQ+sdZIj1OoGw4fU13kcnFTYjuqXVcz0M0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IbWYfqw+ipUsRG1Navh1Dpa92YOgVTcMPHqW926eawKIQHp6aIoNQ4I0KCH3K6x6t1vAVgIuO4X/ic946YdiIFW+PvcZ92i9kK2w0UB5dKQEWF9est8Uj4YZp9R3L9NOKs2yafG17EpygANeemgPg0piuGjtVONJ8JxSqj7Xsi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=afz2b+po; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="afz2b+po"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763843917; x=1764448717; i=w_armin@gmx.de;
	bh=7qlUiAsQVud9Gn3ClRs8IiSZLr9lSLU4BHxB9Zp6gLM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=afz2b+pojAoozOVD/WYzlQw+OGs0VA4nZeDmCKeLSjJg+vCvdN96LQZjAv1uhO1T
	 600h/+tM+ZkLRv7OZrr+6NF7k3/K5lylEdHdfFVjeNBwXwFDyNJSTRlNYlMGVQhSS
	 aZ/3wTHMUMB03seXvnTGrfKz8W28MR/eY3H6qBVIXARABGVZ2OkLDw8lD7jnIpREd
	 2jw7uS2nKezBSe76513r4mFKx/d+RU9rwlcWDgomZ9QLV+GLz1uK1sIZin19eHTcN
	 h4U5p/rNLLYDRWqqlJ1V6e2SuCrHgexodjLFbLGZNIMzgu0ZtlUrJibn6cbb5JnOV
	 by7VyOwq/BMoY7CTMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M89Gt-1vR0ql3wgN-000CET; Sat, 22 Nov 2025 21:38:37 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
Date: Sat, 22 Nov 2025 21:38:00 +0100
Message-Id: <20251122203803.6154-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122203803.6154-1-W_Armin@gmx.de>
References: <20251122203803.6154-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6Jnpu7dLbFY5hYtaahzg8PSXU7x3hjygRF86iyhXdyDfQVeqelg
 JE784oYUuCY8kdLAdXnqkxS9tnTOvXM1mBfpH8OlaGS5hTNQZYURtdUnSqpU+alHna5bXCe
 bF4PCKWMV30+jRfDVnSAxUlHAYFNx9AXzfWNYovmsAYTXz1uoN2Ay/FaDxPOguWZwZSVIOl
 nkvIUlXjcQQXjQJORZCxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fU2oyRmqm8Y=;g4sTseh6EeLrsnJsVozEWWRBVpJ
 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

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


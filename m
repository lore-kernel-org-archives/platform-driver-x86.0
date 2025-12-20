Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1D3128B8;
	Sat, 20 Dec 2025 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263640; cv=none; b=VihU6cXHjSC/KktnB6jMQbXM7MqpP/8ooiTC6T5rs/0nH42wXg5lXOtoHZ9HNijrEG7FRqyDwQZfWq8K1OLM6KXpUccYbT8zCgo5Wo6+AeXaV3ufvxUdK03csWaN2MznTjGGfUGP/QNVOzg/RLExuQSVv7SQSa4zK55vHl7qj2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263640; c=relaxed/simple;
	bh=TvDAHqOndFQ+sdZIj1OoGw4fU13kcnFTYjuqXVcz0M0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VyLws5dG2nmC51D0DkD4UJk6G7QmsdrkgeNZVnaAJc9tmS2g6aQKmw04gZKxCVEi7JHNEYcc1W4DX87KN4goqZ4p3frtUtujKDgdZf6q2+m9uEEnvlMvZHRZFn9Ts48SUdP2seXFeAgArMDPRYxbl3B1Szr4PZq3wUN4CX5Xp+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qGcGXQq7; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qGcGXQq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263622; x=1766868422; i=w_armin@gmx.de;
	bh=7qlUiAsQVud9Gn3ClRs8IiSZLr9lSLU4BHxB9Zp6gLM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qGcGXQq7uzNZx1T9cQMptqfXRtE4VQ5txjACgMflLCCllfz6mF3HAY1DbpZiVG/O
	 C393oVIPOK+GfGyVLLOzfHt+VdCBkFRGYgc/66iMRkO03e8T0KwCCgLSR48sn59W5
	 xGMsT9NeX8rIJfpTzm5t5hbrJsRc7vAMiAlQ8GvV9y3Ych0Sewdsf9OPq39OA3mhZ
	 OBhUzZhCpnbVBRqF1yaIvplt9quF2ertbeTRbQBwKQNtWrQj8ROj0wRCs//RgTFdL
	 YxlasWoDVZuaqbi0v5zlAGfKIvKoC5lugACrgFR+MKKSkprRLc98LDSKGSacQTGuU
	 fNR5EBtjByraVSB64w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MTRQq-1vPSbS23Yq-00XpzC; Sat, 20 Dec 2025 21:47:02 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 6/9] platform/x86/intel/wmi: thunderbolt: Use new buffer-based WMI API
Date: Sat, 20 Dec 2025 21:46:19 +0100
Message-Id: <20251220204622.3541-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:ZJDXW/fXC2waWjXhVuqZRXo2wkARi1M0vzhd4rXv2ddHHrIbvEP
 pBvWCXxA6/hmGG4Olcg6koQ6OWwbkJJVLz/yMmdV+5qmMn5czYHBH10/SD10cRFVpMqA62O
 hX3/cI2DVBKMiz1V0NrD128P8i19zsRrUPUGq+7AqyuglA/9WOBvp1LCAurRTlxMBlwgyK6
 7DNvkOL23mQT/7C/jfbcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U01SrZ2wBQY=;uQ08EJ8jikp71/jUiFIIHqVmARw
 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
 NcUkctFY=

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


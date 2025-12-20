Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF73313E25;
	Sat, 20 Dec 2025 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263640; cv=none; b=ghmvBOjPF6OuHFnQ7f1bSlSGV0Mc8LzR87Hqaw/qBXMASv9swAaNwR+0KiXiagbDwro1PZe+tThzRuiRf+sjPxHsLWTFjDyPhUu036Tbf9921dp8rvM1RHoaujJ3nJG33gIfFEXeeA14P5ekM3HBgWI2Ht8r4wLWHHW+3JLCgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263640; c=relaxed/simple;
	bh=TJgLzTksdV6FW6f/rYwBBRpRBJulZLasWdVu8QXIRik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y26uW+56wJNt5gnt7vJVYoxd1Nr3gulVPuXwEEUgXRpuOk0M5p2OmbcBsZgj0tiONQiIrNyIa+R4fPJNWx9kyQmlFHQc8z4rK8uDDsCr7NWeNjpftOG7NiPd4DuE3Y36LW0z3vMgUoOyNTDRG3M2yGAfXgtToJk1jX20p2tMEMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Tpj2xZVh; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Tpj2xZVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263625; x=1766868425; i=w_armin@gmx.de;
	bh=my3Bwy9Nqnm5Ql6505L7xx+AOmSQ2MHcXjgLv2xvJRI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Tpj2xZVh9x6W2rUNuGH9oSeyEiRXUrWHeq+c/B09XcrirIJJg6nMHnKRgnB9GDXi
	 O75XsH3tS2zjMkwyAn7MvA6WvArPupRdsFE4oXOPWyVbnxd1odZJrOb73mB7F5Oc6
	 jEdvkKkqXVHoAluG0byMjwWf/78xmkGcep/T/rDAD/+DRNFl/beyjDweDALQ/yAAU
	 IjxXXif86JHYUd8t6y07Y5bfUUVd0H7hz2z/7Tkbjn5QUbnykxHvtPi04tMGGUXoB
	 UEelC+qcFU02dGz3cXhr/zIi3C567jw8TU+uYqqRTVG9XlYK+pin/OFNGdlch5EBG
	 vX3TH8ldxD0MoeZ7RA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MJVHU-1vHipE36cK-00Q9En; Sat, 20 Dec 2025 21:47:04 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
Date: Sat, 20 Dec 2025 21:46:20 +0100
Message-Id: <20251220204622.3541-8-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:2QjoIkMJ1p4DZt7TOLVaOMwVT6ipP1nyPG8SxmwpPsPWFkGarih
 u/WFg0klKdbohsM7KgIUs/h+cqK3VOdTAR0DJD1pztm8Ixlg5gbeGa+kOBFNeESCenOVo51
 AvmE9dHGCNDmvuHFb+kNS/gGr3U3UxyxsyEiles6v+YDURqA4Bncx53icgf3WlkE4ic2OWq
 bqU+yi3cPgm121XJIt0yQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dj7aV+zmw20=;g5xZS7i7Y3Nulx7I+qn0RJGzopi
 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

Use the new buffer-based WMI API to avoid having to deal with ACPI
at all.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/xiaomi-wmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/xiaomi-wmi.c b/drivers/platform/x86/xiao=
mi-wmi.c
index b892007b9863..badf9e42e015 100644
=2D-- a/drivers/platform/x86/xiaomi-wmi.c
+++ b/drivers/platform/x86/xiaomi-wmi.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /* WMI driver for Xiaomi Laptops */
=20
-#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/input.h>
 #include <linux/module.h>
@@ -56,7 +55,7 @@ static int xiaomi_wmi_probe(struct wmi_device *wdev, con=
st void *context)
 	return input_register_device(data->input_dev);
 }
=20
-static void xiaomi_wmi_notify(struct wmi_device *wdev, union acpi_object =
*dummy)
+static void xiaomi_wmi_notify(struct wmi_device *wdev, const struct wmi_b=
uffer *dummy)
 {
 	struct xiaomi_wmi *data =3D dev_get_drvdata(&wdev->dev);
=20
@@ -85,7 +84,7 @@ static struct wmi_driver xiaomi_wmi_driver =3D {
 	},
 	.id_table =3D xiaomi_wmi_id_table,
 	.probe =3D xiaomi_wmi_probe,
-	.notify =3D xiaomi_wmi_notify,
+	.notify_new =3D xiaomi_wmi_notify,
 	.no_singleton =3D true,
 };
 module_wmi_driver(xiaomi_wmi_driver);
=2D-=20
2.39.5


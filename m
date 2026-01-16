Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B73A63E7;
	Fri, 16 Jan 2026 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596122; cv=none; b=XhDmytUlHsEtIA2xQv4c4Nsm7mut44v1Nvh4fIr2F4q8M8+LpibA4M6hljd7VBNE1EVgbJOiNe/fNvzIBP5jHC3AXQf3L2Ax38auXj+l2Xu4EAjral7QWLyDHa5o4ee09z3PaREyCJNOPUKQvo2uj8C3zauZrdTfdfKNuHD8WkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596122; c=relaxed/simple;
	bh=TJgLzTksdV6FW6f/rYwBBRpRBJulZLasWdVu8QXIRik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l0N0hkBS/OfCFVKATl6anaw6kcENBX9CTGb/vvdO+G4+jWmOx6nk7DsT3eTvwKWi+2FK/mRNpAp9051nTuOf23Qce27rq0MEu0TZwFN613xrnLmykXDuPezcEX+naHnGV45PdS2csKa8fko40FOSuViGGAzXUtuOGC5A93d4ymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aboy+SSf; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aboy+SSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596106; x=1769200906; i=w_armin@gmx.de;
	bh=my3Bwy9Nqnm5Ql6505L7xx+AOmSQ2MHcXjgLv2xvJRI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aboy+SSfG5LkHjV6K9+Z8HGKSiKhb8xkw62RI2fdNIfUpFesNtLM9/mFbbM+82Uj
	 Qft8OtpOH0a1LH22tiAWTdmBTVoWrbj3oisyhW8Stw0AaJk2o53cWBlhCg6ZRjkgs
	 mp6CIcLc5bNZsa9df8L6i7HHaS87tnDQc8FcqIluQxYbxhxwg6RT6PpPyjKw0Z10T
	 WGg38WFAZjnyS55NcA+tmnIwra3glD5kSVmsw2fRUt5Z0+v1+2lQkBOERNh/n1I8S
	 tmdF3OiwE0VRmugCNAUkSNiO6Klb/lOL+y4f5H1QYKWJ1xcayVoyC3oWl5F+wLF+b
	 MlTkAbHsliF08q0kOA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M9Wys-1vmMxB3eZI-002Ksm; Fri, 16 Jan 2026 21:41:46 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
Date: Fri, 16 Jan 2026 21:41:14 +0100
Message-Id: <20260116204116.4030-8-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:nKMeIxKX/Y2HAk5aXLgGHNLe9fcRooHkvrCxOWPBujlzQHgrfXR
 DygKgKbgjMyBruLQAmhBAzdo9NEPPVqaQJ0ub790VOVY0Vm3bBdoAyd7uqRzwnAcg+/mPH8
 t//wEvql/7rCWUEz5+FQfRorv7X4H8ZHqH7NjtGmCBGT9npdHWttc+ZcFrYRucg4GT1EcAx
 yC6ASXxb0kifwmVCalQDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o5VL95Aq4+I=;iHQGzyelPeKASV9P0rJWfjAluZj
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


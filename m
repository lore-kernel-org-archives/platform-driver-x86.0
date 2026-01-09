Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514E1A3029;
	Fri,  9 Jan 2026 21:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995226; cv=none; b=am2k0QO9ZdEBhkQ4DzsWt/+qWDPogd7QobntnrHfw3f4MuY8Y0f1IBG9PchTBlYqY4oWRbqReW/TSd8NJr6hyC5JTa+ylP4lNw93EXsVvq989ivM+i1DfA3mrwDwWbuCcmREooDn1VVQ7ov+6NjVzjFhpbez8V4RdQd/CoWfF2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995226; c=relaxed/simple;
	bh=TJgLzTksdV6FW6f/rYwBBRpRBJulZLasWdVu8QXIRik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=no7ws6GOhDVwq+JA5BLurb/jTsUrQsBNh1i5h5NRyHRz08M1mbl3JCEhD/S7JgKRJbnPc9fK4WfUzci+c+z/E6qmMUk88HZz9GL7WLOdi9nKBYKT3SPCch49Dz19D0FoT7p4JkIn7MC8sNDAruuXBD8OAveo4UjdyTCtrIeMd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FVNdyhKv; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FVNdyhKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995212; x=1768600012; i=w_armin@gmx.de;
	bh=my3Bwy9Nqnm5Ql6505L7xx+AOmSQ2MHcXjgLv2xvJRI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FVNdyhKvd20QVD4ubQttWzb8QZXEx7sf4QwVgIJXkpPTfGreVpS6Ma9TwB++UXq2
	 aamBZup0XTMRlKu/vcV1/tvaPVZuHC6RRZgMuUyvInhKCxCX/IWuVgBqFjoXmJstB
	 RuowJBtfy/NJuKIzicpRwMjAp+UEHwrpvdJ4a47XvpnUnTTgwTIj4HTvtS0WXcWnV
	 JP9WqFZtfgPWopAGjBMdC7HPje4yGn+IifeEMyBeBBC11Dmfq+1ddNUNpoO1WEAwi
	 TsEtfEUzfiJgpkJqFsHDEwqjCfkNCAc2yO2a0gQ5qeWkD16h8v8MOyuQ4loCPNhZL
	 mAtSFGSlhSnJNrE4pA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MrhQ6-1wAJ6F3AZg-00ip3O; Fri, 09 Jan 2026 22:46:52 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 7/9] platform/x86: xiaomi-wmi: Use new buffer-based WMI API
Date: Fri,  9 Jan 2026 22:46:17 +0100
Message-Id: <20260109214619.7289-8-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:xJQk9S1wX/ArNO54dcNnROKXFl1/WMVM5OE8fzQoWzdwLb3Pj8U
 HAVEbyg6Uk9WhhZWgIO2hPF0IDWX/p0sg+Y6RkUQdSM7rYL/wlZo38GzrosuZQ07sGROx92
 NPTG/19T5OR+2J2RD6+bMQq+fl/Bc9oqlt7qIaCjK086fVMftLtexeNpLcb6iuaRGzKbXhm
 kwlWp1p47TkiJV4XmfFVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TBAb6aKPTyk=;JAP+ezpn8LNWoUuYJIgnbpO/dLb
 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
 veFG3KrkEajSczbv31QLBD28YI7ww

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


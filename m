Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576D31C233E;
	Fri,  3 Jan 2025 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945520; cv=none; b=e9xp5hEkgB9L9qIhGaGz1AoJNeAf8i8qSCUCFWT0CpzHIi3nDWuNaasnDZ/uWV1seHRuc8WbPDPa+Z9U5GIJeafL2yXlohirZ+oYZG5yXVCqt5HjwOO6Jno3UwU1yvPeVJZHTbTK82ZuP81oFXE5/olKGSiQe8e1QFOpVx8lajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945520; c=relaxed/simple;
	bh=E7ejxYXjSdZnnJX5sX8/IXcBFjrKTYbqZ98oCMMDu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhekh3Rnec5RwwI89d5kJCwUaCbRXNBUSvCwlp/bc5Kfkod4rKXT3JTCbVu7LvXyD/WCnno7+ycEH2sDFtJvivbEMu3pR3ZAuhQUeKAtpqTpNMNAQ3R6fjr8tPegNTi6bN+/afB/Ywy7+xqkSHjpYWqI4Dzd4s8fqu4wmtKwzvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=bMlhSuZ6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="bMlhSuZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735945513;
	bh=E7ejxYXjSdZnnJX5sX8/IXcBFjrKTYbqZ98oCMMDu48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bMlhSuZ6jDps3/nGiXZfr8Qo1cpLqmp1nCRQLdpb78V/OL5pgfJcwIYa/CaOvQvD4
	 DUyCjhGLXdIJBxUKoQ782f00GslGRs4L2khi1OmNRpHcP7UctbELuEWVrJlPfEv+iW
	 J6ayCgEfkwpT5eqzhubEglm7sJPEBGyVQNJhzkvI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Jan 2025 00:05:11 +0100
Subject: [PATCH 3/6] platform/x86: think-lmi: Directly use
 firmware_attributes_class
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250104-firmware-attributes-simplify-v1-3-949f9709e405@weissschuh.net>
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
In-Reply-To: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735945513; l=1895;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=E7ejxYXjSdZnnJX5sX8/IXcBFjrKTYbqZ98oCMMDu48=;
 b=aWnDEvPI1inx2DMtb915hPLdi+vRiFSrPiA57zezpZyk5AbXtlwqnTtMksLEElPB+sSS5xTza
 2Y+cGh2ZIC5CTG/QCKbGYwM91U4j08Z8pJ92ucLCreTybccLMpSPr+y
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The usage of the lifecycle functions is not necessary anymore.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/think-lmi.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
index 38de0cb20d7785d4e3b490e07edaf4d02f8f3370..323316ac6783aa343c4c6430040a4af648786880 100644
--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -194,7 +194,6 @@ static const char * const level_options[] = {
 	[TLMI_LEVEL_MASTER] = "master",
 };
 static struct think_lmi tlmi_priv;
-static const struct class *fw_attr_class;
 static DEFINE_MUTEX(tlmi_mutex);
 
 static inline struct tlmi_pwd_setting *to_tlmi_pwd_setting(struct kobject *kobj)
@@ -1446,11 +1445,7 @@ static int tlmi_sysfs_init(void)
 {
 	int i, ret;
 
-	ret = fw_attributes_class_get(&fw_attr_class);
-	if (ret)
-		return ret;
-
-	tlmi_priv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
+	tlmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
 			NULL, "%s", "thinklmi");
 	if (IS_ERR(tlmi_priv.class_dev)) {
 		ret = PTR_ERR(tlmi_priv.class_dev);
@@ -1563,9 +1558,8 @@ static int tlmi_sysfs_init(void)
 fail_create_attr:
 	tlmi_release_attr();
 fail_device_created:
-	device_destroy(fw_attr_class, MKDEV(0, 0));
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
 fail_class_created:
-	fw_attributes_class_put();
 	return ret;
 }
 
@@ -1788,8 +1782,7 @@ static int tlmi_analyze(void)
 static void tlmi_remove(struct wmi_device *wdev)
 {
 	tlmi_release_attr();
-	device_destroy(fw_attr_class, MKDEV(0, 0));
-	fw_attributes_class_put();
+	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
 }
 
 static int tlmi_probe(struct wmi_device *wdev, const void *context)

-- 
2.47.1


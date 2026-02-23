Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A68369980;
	Mon, 23 Feb 2026 20:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880353; cv=none; b=TYFLAj/CGHsEai2HzwwncPzyNBMItO+j7fpkelIZzSfluZJiQh7PRMNNELoBqn1zOTgbOla5EJCmRlFFJDUIARUqwxDyQpaRCjeshYCuz1iwXr7IpvG8Kvpv+IREn+BejDHH5An3xrZLvyLLtTKn4JAhHFTVm+fSrkIuqtEtegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880353; c=relaxed/simple;
	bh=nEyKiJmEdjBdewWjr4+jLxQsfDEhyRckIVi4xpBNTIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CIYS71+dVyDE6xAqzd4HC0FZZKriM/1+ADJLVqmB6jFTF8SjsfjBM6cxhXn3W0TeESKZWOadIjXDlJs+DX6z4CH6gcE/LNbLaKV/Pdqkz9Ae13DL0rAqoIAXF1KdvXIlueDooHNUlkJsJpEeMywDf9ELXziTlamMk+GZq1rHPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CHq3HWN4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CHq3HWN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1771880349;
	bh=nEyKiJmEdjBdewWjr4+jLxQsfDEhyRckIVi4xpBNTIM=;
	h=From:Date:Subject:To:Cc:From;
	b=CHq3HWN4+Ui/v7DPWpim50onry3RfXjNsmHR8rZ6VXBjvIeGXaoXQptAIXrqoYa+q
	 UH5EHPvXJ/jnBjPfVT7Yu904Lc0tvgXFfb/MOo5+iymMpUuCHbKXCnRKe9HUsF+ef5
	 TExS5jg2eO0/zel5wMjkhY8mw3Zg+6mSTMxIQU3U=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 23 Feb 2026 21:59:07 +0100
Subject: [PATCH] platform/x86: dell-wmi-sysman: Use standard kobj_sysfs_ops
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-sysfs-const-dell-wmi-sysman-v1-1-8a690884044e@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTuQTEXUq4iLNJnqQJJKpmhLy
 N2NLt9f/ArKRVjhOlQo/BaVJXfYwwD+6fKDUUI3kKGTIRpRd50V/ZJ1xcAx4ifJLyaXcfJ0vHg
 +kyUD/fAqPMv2v9/urX0BGWapq20AAAA=
X-Change-ID: 20260223-sysfs-const-dell-wmi-sysman-bc249ce82120
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771880348; l=2009;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=nEyKiJmEdjBdewWjr4+jLxQsfDEhyRckIVi4xpBNTIM=;
 b=VnweaTt2/ZCb7+cywE5jKJMEJI6AnXd5Dgt81WTPWioyUheii1i9f4nhvCFLDONikMcbInUwX
 02PLoRsCkPCACILRibHKCi+B2kXkmkwROxRIKSxUxsmws4FzXdXunJG
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

wmi_sysman_kobj_sysfs_ops are identical to the standard kobj_sysfs_ops.

Drop the unnecessary custom copy.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Only compile-tested.
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 31 +---------------------
 1 file changed, 1 insertion(+), 30 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 9dddab6c9397..6241f16fd3da 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -220,35 +220,6 @@ static int create_attributes_level_sysfs_files(void)
 	return 0;
 }
 
-static ssize_t wmi_sysman_attr_show(struct kobject *kobj, struct attribute *attr,
-				    char *buf)
-{
-	struct kobj_attribute *kattr;
-	ssize_t ret = -EIO;
-
-	kattr = container_of(attr, struct kobj_attribute, attr);
-	if (kattr->show)
-		ret = kattr->show(kobj, kattr, buf);
-	return ret;
-}
-
-static ssize_t wmi_sysman_attr_store(struct kobject *kobj, struct attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct kobj_attribute *kattr;
-	ssize_t ret = -EIO;
-
-	kattr = container_of(attr, struct kobj_attribute, attr);
-	if (kattr->store)
-		ret = kattr->store(kobj, kattr, buf, count);
-	return ret;
-}
-
-static const struct sysfs_ops wmi_sysman_kobj_sysfs_ops = {
-	.show	= wmi_sysman_attr_show,
-	.store	= wmi_sysman_attr_store,
-};
-
 static void attr_name_release(struct kobject *kobj)
 {
 	kfree(kobj);
@@ -256,7 +227,7 @@ static void attr_name_release(struct kobject *kobj)
 
 static const struct kobj_type attr_name_ktype = {
 	.release	= attr_name_release,
-	.sysfs_ops	= &wmi_sysman_kobj_sysfs_ops,
+	.sysfs_ops	= &kobj_sysfs_ops,
 };
 
 /**

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-sysfs-const-dell-wmi-sysman-bc249ce82120

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


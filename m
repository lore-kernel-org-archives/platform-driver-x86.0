Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F603456DE5
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 19:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365524; cv=none; b=uifHthzyCo8dTaox+x3rYIkp0CpLwMVTUkmy+ViDuDfdcB5WRl+RObYEKNLxjawcIPGxryDvnWcnlScp8uR9f11GmbIXZbbmrgrqw4dMvSV/WLB9iKc5XBMoqBQ3YlcC05GyAXAYCtxaMqUI43xuVI11vLANwUjTcI4SGXktCRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365524; c=relaxed/simple;
	bh=DqTT+AgNC8GkL2FYVXCwLzqAXTrl0cGMSGWREvIxuOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kNxmD6XbZ22ypj81OSN07h0B6YxWQZyqwR32HDDIay13sYovwAi+LO9HaFcjrvUuYcm0gPSwPgwROliXYMPkev94cJMm05UZIPM/AI0eBLNMTzOAnA9xUYrMMaYzAYZHDvUUiBdfdAqXu210NFVToktcgkQC2pPSKnwNMW4iAHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJCiSmeR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJCiSmeR"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c20ce3c118aso195917866b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 12:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790365522; x=1790970322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZ0Ynd0dcBFAAuLycdGPDDj0ISpvrRpLcRrTrN/I9bc=;
        b=hJCiSmeRKMKnELDMhYNo84BNeBjYUjN2NeHVVzrgvz7kKn3WHTF3vyBsQ5uFJBkdMt
         irYVYCOSj9pkk52Y2ZznutZlXcmJLQ6xTC5LlRKJpSEJXE0xYSxKuHbZWwVZT5tTMBky
         Zusx2SB9tXBlZiBNQmK8bV9uKORoEZvxw1tOoa/V52XX5gKaquFHqlfLVl3YJGUKlIvW
         Esm5m5Ph8T8RwZUX7u39o/BTcOPTrqSvstHmTMmHICid91BdZB9mS+DAylfHVxdJRYKO
         vM6+hBaovH5/CzDQCRDZCfIQerL2TLQRagquHSSMxEs9P7waG1Yli91xl8r0jNwDji1j
         tT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790365522; x=1790970322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ0Ynd0dcBFAAuLycdGPDDj0ISpvrRpLcRrTrN/I9bc=;
        b=x61TkPq7bDJc1zdNEBOO1EiZ7oIG8s7zLIP3S8LN+JtGY7iigElav2trJEILvAt4Fo
         biCx1Mh8V0IWmJoliNGR/fqQDpb9abQ67HnZGiI3fXENDuJgpKgrYIyq4KEGZfJS2lcj
         XKN+htrrC3k2vS7Xk0B8qOXHYJbsJt3DxqSG5glNkSubshmjxi3jBPc+Mx1Vq8c0CPV+
         DYQ7fyxIe6XLQ3m5GCNfp5CcZRpELEhQIMU8iWxdof7vZ07Rv+xNqI8EX+67yAiiyHVO
         4qjk2wPynNITYoN/GTt+tvbrbTlgyMSSLVLchKRCBK3Yy+LNK2BvHRMyooPdHshrtvzc
         kNUg==
X-Gm-Message-State: AFuF++mse3H0Yl1DuOfTkPMGA8enP9e4oN1gkKd0HcYBtPSH4ny02KqL
	dY+BhrGmtWCHTj3WC5qRHcpyRDtNkXvZE3GglMXr4WJXmjknGbrc9u0=
X-Gm-Gg: AYBFou2096r90swKpnJ/ZeZAf6OlUnRiA/aGH2scdayMQcBWf4L6cBSbzMZ7vNlksDG
	Nv4aVm6/umDoqtJQZxhgIZPHjofWHaT4bdaGvkk21VbsmOHIIAWtPE5dS2uRpPNIlqnUDhc08EV
	8Zh44DODdqIqTSAfj5mbiioFFI5Pkxv0GXq0wVkMx7ispLcH0yNJ604Tq9KDj0/l6bsecBHN9fB
	RH5xW1T8YE/ZrYjMJ9Ld4PeI8ndtHsdGaxWwjpnUwpo7N+6yTF23hv0f48L8eUWxzLzLUcQW+e5
	meGE7daplGz/F7JTNXWBl7YZ8pPVyhlVkdy+PuV9MEq7KBom/gpIuQFSHkLdJpdygeB+RGfZEPu
	HF2vNJ+fO0e24eMej1tZua1kPfb9i/k60AaiY5saKB1Ch2du0UkxkNmpLmyWV6qKPmNbNUGNxPu
	1o+KT3L9yuh2Utm4r0rt36PmqUAiSlM0SB5VGW6oGTW0JXn3UPtbdN3AcgQnGloT0x/oPOcpNP9
	U2XwL4=
X-Received: by 2002:a17:907:daa:b0:c25:f7dc:2d9 with SMTP id a640c23a62f3a-c2ac23815a1mr612064266b.26.1790365521464;
        Fri, 25 Sep 2026 12:45:21 -0700 (PDT)
Received: from okuroshi-laptop ([185.229.191.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae782a2d2sm162896766b.61.2026.09.25.12.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:45:21 -0700 (PDT)
From: Artem Maksimov <okuroshioffc@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Artem Maksimov <okuroshioffc@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: Support allocation bios vars
Date: Fri, 25 Sep 2026 22:44:54 +0300
Message-ID: <20260925194454.6850-1-okuroshioffc@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On HP systems with a large number of BIOS
attribute instances, the kzalloc_objs()
allocation in hp_alloc_ordered_list_data() and
hp_alloc_string_data() can fail when physical
memory is fragmented, leaving the driver
unable to register those attributes.

The same failure mode was already fixed for enumeration_data in
hp_alloc_enumeration_data() by commit 916727cfdb72 ("platform/x86:
hp-bioscfg: Support allocations of larger data"), reported on HP
Z2 Tower G9 and Z4 G5 Workstation systems:

  https://bugs.debian.org/1127612

order-list-attributes.c and string-attributes.c use
the identical allocation pattern and are still affected.
Apply the same fix: fall back to kvzalloc_objs()/kvfree()
instead of kzalloc_objs()/kfree(), and return -EINVAL
early when the instance count is zero.

Link: https://bugs.debian.org/1127612
Signed-off-by: Artem Maksimov <okuroshioffc@gmail.com>
---
 .../x86/hp/hp-bioscfg/order-list-attributes.c         | 11 ++++++++---
 .../platform/x86/hp/hp-bioscfg/string-attributes.c    | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index 5bf8d40bdf81..80ac15435a18 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -98,8 +98,13 @@ int hp_alloc_ordered_list_data(void)
 {
 	bioscfg_drv.ordered_list_instances_count =
 		hp_get_instance_count(HP_WMI_BIOS_ORDERED_LIST_GUID);
-	bioscfg_drv.ordered_list_data = kzalloc_objs(*bioscfg_drv.ordered_list_data,
-						     bioscfg_drv.ordered_list_instances_count);
+
+	if (!bioscfg_drv.ordered_list_instances_count)
+		return -EINVAL;
+	bioscfg_drv.ordered_list_data =
+			kvzalloc_objs(*bioscfg_drv.ordered_list_data,
+						bioscfg_drv.ordered_list_instances_count);
+
 	if (!bioscfg_drv.ordered_list_data) {
 		bioscfg_drv.ordered_list_instances_count = 0;
 		return -ENOMEM;
@@ -438,6 +443,6 @@ void hp_exit_ordered_list_attributes(void)
 	}
 	bioscfg_drv.ordered_list_instances_count = 0;
 
-	kfree(bioscfg_drv.ordered_list_data);
+	kvfree(bioscfg_drv.ordered_list_data);
 	bioscfg_drv.ordered_list_data = NULL;
 }
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index f3dfba270f7e..095201004d87 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -101,8 +101,13 @@ static const struct attribute_group string_attr_group = {
 int hp_alloc_string_data(void)
 {
 	bioscfg_drv.string_instances_count = hp_get_instance_count(HP_WMI_BIOS_STRING_GUID);
-	bioscfg_drv.string_data = kzalloc_objs(*bioscfg_drv.string_data,
-					       bioscfg_drv.string_instances_count);
+
+	if (!bioscfg_drv.string_instances_count)
+		return -EINVAL;
+	bioscfg_drv.string_data =
+			kvzalloc_objs(*bioscfg_drv.string_data,
+					bioscfg_drv.string_instances_count);
+
 	if (!bioscfg_drv.string_data) {
 		bioscfg_drv.string_instances_count = 0;
 		return -ENOMEM;
@@ -390,6 +395,6 @@ void hp_exit_string_attributes(void)
 	}
 	bioscfg_drv.string_instances_count = 0;
 
-	kfree(bioscfg_drv.string_data);
+	kvfree(bioscfg_drv.string_data);
 	bioscfg_drv.string_data = NULL;
 }
-- 
2.53.0


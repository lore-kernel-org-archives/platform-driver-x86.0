Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660E302163
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 02:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786414954; cv=none; b=uazIkYPJM7d1moi/e/FXttDA9d1JsxTnTejP2Y8k2Py+AtUqrnsgVC/TwPkItSgcBU9+QdWYg1WNTV3l9YHXeIKsCSt4RQVegIU4Qy3tybnH2oXt/ETxMLwjWJpxaTnIkJetNE0Eve+PZssTiSjmYzHYJrQSRNR6qxgOcQ16mmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786414954; c=relaxed/simple;
	bh=Kn0zI7rxyZegx1vgsxplNTyY4hoKLKQ2bDgVGgQ9eYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Os16dxYcNqd2LjKs9H8YhQX7aA600keE+N88WwjrsBJMHsOrg9kTBmzAuprT84XRbEFHC+9gqZLy9oLcTz/u4w3iR0iqpqwVkeBiflknFO+K2YjLBHuM3/6agFLpGLu70BjdQ5gFTkliRIFGs2VPqNT3sbpQeeYKuifrscGxbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d0344e1ce9so12344285ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 19:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786414952; x=1787019752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiV0HEnxmelGmu45/owXrOpkoTF5j4XifJDvDbQKI/8=;
        b=o4WABA7nulKErudxO6f/QBnlaMV4lDKXKyAynBwhBtOaSx9of3j7x8G3MqXe9EwxCr
         wRWdw28Wt4wwNUKnx79nLuW+1bMgNDgMNH6hvs3mzRVxXSbjkD108CYpgURzhSplLaLm
         XF6P2eqKfMYFWhrNgatZqJ9Fcm2ANKJZjw4hnhT1BBKAet7Vu8n3fATeAxK+Cg58OaFB
         rIB264fIyaWY98vPiC1QLSG97LASw9+P4aIRSHESqVPIhrhtAltNTBK0bA3C9Lpjaa+1
         lpZzPj5cfLvYyW7f2a3W/RWQJUnJIZp9Pwa1ftW2Iaxls3SPsv7hHUZIjolf9f0+V4eT
         76wg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/MAeoWHv1gLuWw6YK952GqxuG7Q+DCStGlWO0HWIbdQJCoYUIJqMY6Hn6gudRfxWvzV0AMwlrPUbCNxkaOr0jgRvf@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8fQ9vUZ7ta0fFIr7QgSqcP8dRYWKcj0fnelBNDGgbK9zszn4L
	p7+Pf0FUZIZTEEP0cXid1JCFgHxoX+B/7OwEaK3V/q0HFedm2IDKiWXx
X-Gm-Gg: AR+sD11pOe6OKDo7yc/wK49DIGgAJe2joNxkJ39IRKQ+DqI3JwUd5+sW3h7RHIlGBek
	H2NmdhSq9xNlcACVnbC+IbAXevORNpGA43EVVnO3ZdcNoLhAgxJg1+3uKYUNTNeaEcoU5ekajbl
	vODCrC011yABZNu6PoQFBV+RHnc8DAFeEGuvr4mpo6gl3ceJRuxRoT9C/eXmN7DXTXA2WGCyllM
	E3hi6E7amqTBN75sO7TZLrWDSfS1pVqjyeSC7bAKQcI2sxO38n8loBJ0i9FPoCZFQOao4asfz0V
	wpp3qGoSyaYH9/pdrVmkNO0iJMhBN3xNZIlsK8d09JKPgj+EXH/WeGfiJeen+jYj77IFz6cOo3s
	NT4d0OT1Q7gwSF2JBanHTE9n209XNsDypKJIVS7sPshvFE3oCYQoufMsLHf6tecLFc1oZjLEpey
	l+vwbBgcN53uPYMKSk2iPm4osoqBOYeQR0vkXLco0FDfcDF3NBWVBVBu16ZCl6fSgN9WQLSYRZk
	TKNogCuLQ==
X-Received: by 2002:a17:902:f689:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d31779b7e9mr1705365ad.6.1786414952391;
        Mon, 10 Aug 2026 19:22:32 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f29afdsm389365ad.19.2026.08.10.19.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:22:31 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: herton@canonical.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rafael.j.wysocki@intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH] platform/x86: Add ACPI_COMPANION() NULL check in topstar_acpi_probe
Date: Tue, 11 Aug 2026 10:21:15 +0800
Message-ID: <20260811022115.338595-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NULL check for ACPI_COMPANION() in topstar_acpi_probe() to prevent
NULL pointer dereference when driver_override matches a device without
ACPI companion.

Fixes: 3471415c8186 ("platform/x86: topstar-laptop: Convert ACPI driver to a platform one")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
---
 drivers/platform/x86/topstar-laptop.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 0e842c55dcc5..730a599abf0f 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -287,10 +287,14 @@ static const struct dmi_system_id topstar_dmi_ids[] = {
 
 static int topstar_acpi_probe(struct platform_device *pdev)
 {
-	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
+	struct acpi_device *device;
 	struct topstar_laptop *topstar;
 	int err;
 
+	device = ACPI_COMPANION(&pdev->dev);
+	if (!device)
+		return -ENODEV;
+
 	dmi_check_system(topstar_dmi_ids);
 
 	topstar = kzalloc_obj(struct topstar_laptop);
-- 
2.43.0


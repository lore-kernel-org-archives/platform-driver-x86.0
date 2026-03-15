Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F52472A2
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773613246; cv=none; b=FGV1Vgmui/qbwI/OOT94YnQhQ1dsQKnpOdFSkE+NNAi18XD+W9WWSf/xUNFMHd7+8izjhkqo/9stNk2TSACJm8pyzZvgfCfyKJ0VTj6MfW66CywqhYK4RZISFHDDwqnUEffLgYg065SsnmfRrq8kAzkoLdBenzcZ5e+mbdg4Wac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773613246; c=relaxed/simple;
	bh=oOvWfhRkf5OBj5wu+oQpsajq+P1fnPHlOTGZkcFTyGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DEaIoRka16hIgW++cAH0webpQoFigq98eVHLbADuXqFJV7vUuTdrXlKgJYh+ojr7/P7psRCdiDBqI3bOzEWqe25jcj9xyExB5fJLDxHRVbh8cAAeqawcNn3HajRR443K2uEzJoO6H3aQVb2xnR/egkz3QXCFyzlw8uG4+v5HdA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiGavZC0; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiGavZC0"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-359fea895b5so2208745a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773613244; x=1774218044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svmo5aWxoEnBP2787XF4CmgcR+jwYxqJJ3ujEK+SovQ=;
        b=aiGavZC0i0mBJJnIkR8/OnHudd2BQJlKMd6ZqUNKEhpenswrdhKP2RDo1RIfkYS5hm
         pGfdiRmuixRkxe7zCZMTHxEqM8Koa3MCOodoHW6MdpQFTmhj8cJT9O7+hmopNC9Vz4SF
         8/i8X7knRuLFmGvH8DacsOs5YoX0Y/ePe0My5O9v46/MkqvSyCEfzlHRBoId4H505Edy
         V2V7QRK1SshdMMuRBvKSW0auBQQFWnUuwDD+q4RB6xeS4YFs1GEOtUCLLphSD59jdB7d
         5BN8DQEt23nQIxRHTPjwv30HbFsu9ysfkcpX8iNVImkgyzpEG0tNilN6p9+dJMwoQ22R
         Gfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773613244; x=1774218044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=svmo5aWxoEnBP2787XF4CmgcR+jwYxqJJ3ujEK+SovQ=;
        b=pQHHVrBFQS4m/0b/Uof8CvV+hpiKMgGhqE33KNe4ymqkYLapqSIDkpLbhKfbkZ5SFf
         QNxrtYtB1KYLOYvWnFU/fJNyFnouahgm8VJqrllhabVmFpNVhYyA1JbOi1JujsF1ZJaA
         Pzc41GiLNa2su6eb3Ay2i3UymznPoJ5TPUvTqqPQjUgnEKknZcUp2kSIj65R3ZXez6Wp
         amwOB+uIT9Lk5nG08IWqZ0fakayX5slq2EO/XD08LJ5YVTgX3uLPdEHFq0WAFUO4MJMD
         P3C70ciHCz3kI6m5JCeedGhSVpPhepgTRkA92GfYItvT8hjcU743nMvnLeJPn9tiT0aG
         6oWA==
X-Forwarded-Encrypted: i=1; AJvYcCULLOKVM6yS8GFGVXZjPVHG0pOcHqvQ6a2svcBPgNfymrOvw1aLD/c82y1v8vR8VJSc1zLPkLY6AXwgc8JJyD9/jmub@vger.kernel.org
X-Gm-Message-State: AOJu0YwKMoUb2Ty2VJ0ksf64auP5zK2gPdfCQKilnzYyA+BIpk44oaKB
	aJUs37hBjIjCAuo/9keu9TjVSNtHOx4Zg9+KjwX73O8+TDb+/5JRV98=
X-Gm-Gg: ATEYQzzcKT72xsvn8XhLvoQf+c/srxg4SEXebhW/Eq6yafOY0VyzLqv6QueUOE3fcHe
	BPwndozIxvqQjvosocr8gSOQ+Dwusipmn6TFEvqtCA93qKLxZEvCJ+KlKsMJhMUgm42lDmtuxdr
	I3LxcqL25XLOeuixaisiPCwvCO7WL9/OuhN/fTfUTQE3hMrLJRShlZL3adILJcL4QNTEBJyTR4m
	hI1Df/jTnj72QkDw6EthdbdjtAwGiCBjl/xzBF39yP3tYZqXBG7l1fgT14DGCbxFbh6qjMRJvCb
	OVUuxNCaEHGwAFwGdet0YqySgcEp3zV37QiUS2nFNXwgqCkk5q2oXqI+BSwTAZYQTEskMGVjlJ8
	YgQf/rwDci+VZja258QW7jQLRztfp+1twxKJki4oWMph4CL/1VqNazSbfWAoLRolL5ZOTeAcsaD
	qUfb1G3StVwJ2f3yl4ZtCSR9UWZqLSqzPiMrWvWWysqRWC8oFgUMCcwzfwNjeZ1t0=
X-Received: by 2002:a17:90b:4e84:b0:35b:9d0c:a2f5 with SMTP id 98e67ed59e1d1-35b9d0cb646mr1425497a91.33.1773613244590;
        Sun, 15 Mar 2026 15:20:44 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b98f0e5a6sm2547141a91.5.2026.03.15.15.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 15:20:44 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v3 2/2] platform/apple-gmux: use apple_brightness to save brightness to EFI
Date: Mon, 16 Mar 2026 03:50:00 +0530
Message-ID: <20260315222020.24341-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260315222020.24341-1-atharvatiwarilinuxdev@gmail.com>
References: <20260315222020.24341-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use apple_brightness to save brightness to EFI.

(tested on iMac20,1)

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 1417e230edbd..3797a0e7ff40 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
+#include <linux/platform_data/apple-brightness.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -78,6 +79,8 @@ struct apple_gmux_data {
 	/* debugfs data */
 	u8 selected_port;
 	struct dentry *debug_dentry;
+
+	bool save_efi;
 };
 
 static struct apple_gmux_data *apple_gmux_data;
@@ -960,6 +963,13 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	}
 
 	gmux_init_debugfs(gmux_data);
+	if (IS_ENABLED(CONFIG_APPLE_BRIGHTNESS)) {
+		ret = apple_brightness_probe(gmux_data->bdev, &gmux_get_brightness);
+		if (ret)
+			pr_warn("Unable to Enable EFI brightness save: %d\n", ret);
+		else
+			gmux_data->save_efi = true;
+	}
 	return 0;
 
 err_register_handler:
@@ -1012,6 +1022,16 @@ static void gmux_remove(struct pnp_dev *pnp)
 	kfree(gmux_data);
 }
 
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+
+	if (gmux_data->save_efi)
+		apple_brightness_shutdown();
+
+	gmux_remove(pnp);
+}
+
 static const struct pnp_device_id gmux_device_ids[] = {
 	{GMUX_ACPI_HID, 0},
 	{"", 0}
@@ -1026,6 +1046,7 @@ static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
+	.shutdown	= gmux_shutdown,
 	.id_table	= gmux_device_ids,
 	.driver		= {
 			.pm = &gmux_dev_pm_ops,
-- 
2.43.0


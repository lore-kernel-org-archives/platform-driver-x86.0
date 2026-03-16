Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B063A1A56
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675273; cv=none; b=j6YD2NPheEG7cN7VkSRTTtJjkVqqr6zfGkuBLckqfiau/IdiM9oeh9roQXjLjfqNn63Ycap12VUMVQ2ZFeGKQQ7l/N5YZVreEzqaeB8sL5XySBIXbSSpjf9qY4asNTYZ7kOpHBl2Z789uxb5+zqf0zJpNNJ0xNVXU/N4mzVs5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675273; c=relaxed/simple;
	bh=0jF/Skpappl8e6rE9BFwQF2Uw2riMyYj60IKPk3xg88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2X0Cw26KS8YyvruhWtyHzFCwTU18HuvecByBBNE33SXSYSJrDVNdf1TIZCpTzUvBNQ6vSDkpdigy2+ymtWKRc3rlYce2u/E67/FRmGq6g5ovaPXL7fsZy7CIfsgbyV8cQQVdXP/KST/vRryjI6n7/HNKevgntM+vKrbcklf9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw+LfReC; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw+LfReC"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so5146711a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773675272; x=1774280072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3HNVJWbjalr4X65+4J0/1uR1SNrklyVdLh0q57Y2MA=;
        b=mw+LfReCM1NkM1ZStYqvyX6Cju5EHMOnR3HZqoLOrxmRcvimxpy/0oRtOgaZZxxgNM
         EnFJDex88yUACc5vKaxgl+FD5pcNjuOW6R/3/ubiAaIIl9z29uaeKA4yO0YjH/psU26a
         nB1HTjzjDgUxa/TpoJ9hBiA72rJ+Owh0jZlITtPOFLYq/tOcoEIvkCuqFI3pSrzd4oTd
         31JdgmHV+F/kQGa7RWOFOy8iHBHLIj9emvsG+FS5xeOqQUk7g1cWl2khnLuF6p/uynuY
         Tgxwt6i7pYo8WtIjHOIsVOqXlB1I63/mgDCPTQx7YF+tDciQ7L3KNKXajFiM181j8OJf
         Ct3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675272; x=1774280072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3HNVJWbjalr4X65+4J0/1uR1SNrklyVdLh0q57Y2MA=;
        b=kQ5g6hbhteAbVXoF0t01XVVEglH4ys0EaPtoWcQpDBNsFAkGnZFlsJWdQM7Qk2v9W3
         Xy8/2lWWOHXZErcw5h95+3VDQJf+fCJzVxoqYFgVuY1Jrfs8I3DJPpJzvNQS8J6zaTJK
         BI8YqLAt/3+UBB3+Hs/fb+olMo7ZQ276kIHKsD0spJAs5yb4tqgq2rwkP5LviAUMo5O+
         +keW53rPIkZXLte5fueb73x2+JDSFz5Jn81X6hAq7AzFJVQPY26/SEpIK1MokwNdJPlU
         dBYcqno7dgrD06tHe2yIw0vqvUFb/qbP+NUOqJbEm+1KUAQbW+iGCBX0ngj9ZzqACB0P
         NEyg==
X-Forwarded-Encrypted: i=1; AJvYcCXET70eMSHgHi3hU5+LooLFRrzzeCwr0ex3OV9xLsXoMOlL5DnMrjofcxwU7+Eb7RMRRusdVrB1s+z1u/kjHdXOZNfh@vger.kernel.org
X-Gm-Message-State: AOJu0YxZZ0p3e0QEW1CnlHgrWpFlJ32SS+VPlm/nGfTPZSebUUPtw/pj
	jZgQ0dLCtatsuoS7oigd/VbYcWIdhkc0oVqTEZnRYfvIbbdZKOEBkrw=
X-Gm-Gg: ATEYQzxR8f8BiBrfDyP2w+HXEgCbpvfbzS3WjCwXVYZzZ4kICOBjFSNmmXbRRHtJ/LM
	e3oaYdO0I66/kc5rdL9x4Yqn1wRpvb55JSthr8E/CyqFhaiipWE5VTRxDTzCcYxTl7wI9ycbPkr
	0SEJoLzU5C2AGDCeupjEjINk3l98bgiuKn5CREPyU3dd5Iq+JKe9e0QQslMHygWtbxeqfhpZl4p
	xlu5tc1Yw3FDCbn2W+Bn+Ihe08a6FShGqmAnlPb2vbmUQyfF376xzqp/BjUfbTloSgg0n3RJ/gD
	echdxlqMmucivd33miGKMGLSWYB/SDTD94q1CRzBTv9imBedf42tKvS7opxCS25oYeJNLgG9WTH
	kTq1TdQwnSOlP27+UXi/8MCBPJOlAZ7or6k/it7mCqHv1Z246tp52+snljYs1YAzSAcr1+NYYTV
	0ZLKrHgOAbn044Ql7hdhT/QIsEcyr9eKwDuJDCPjjHDhGyL/Z97riZrWae5gxhJU0=
X-Received: by 2002:a17:90b:1d88:b0:35b:9c13:30cc with SMTP id 98e67ed59e1d1-35b9c133309mr4190158a91.23.1773675271990;
        Mon, 16 Mar 2026 08:34:31 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badb906c6sm2685a91.9.2026.03.16.08.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:34:31 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/2] platform/apple-gmux: use apple_brightness to save brightness to EFI
Date: Mon, 16 Mar 2026 21:03:47 +0530
Message-ID: <20260316153407.1781-3-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316153407.1781-1-atharvatiwarilinuxdev@gmail.com>
References: <20260316153407.1781-1-atharvatiwarilinuxdev@gmail.com>
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
index 1417e230edbd..cab3122c1a86 100644
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
+	if (IS_ENABLED(CONFIG_APPLE_BRIGHTNESS) && gmux_data->save_efi)
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


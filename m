Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BA3365A1B
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100282; cv=none; b=jbhCRfYzt6F5HYLU7PHIcl0pC0macSpkp6rDYuJQhU8+UJbzzRvD9uukGLij7ChLXjxyLG2t/GFxpfAXBMjGJnRjUOdZXmnCciw+FWajO6s2OCRD3cR5MI0m4oE6zfSb7eJbq11B9n36QyB9RS0GeCluA274hqer8m+CbJ7Qi5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100282; c=relaxed/simple;
	bh=WMysZ52oSNBakQksYCHeaVkUqkeNNcoimYTv8lkjwoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DbnqWWljbVt0StxJ9pnTVQnAQl3ZeNfl3n/xDJ1jK4n5hSn3nHH9/n205RZE6aOY2ppLaN1Ilhn3aO2N1u78ottFWPp0URbpqKv0eYeNg3/TPDdqhgEMlcWcA4wM3otqzB4pR2vzW/GtmL+IK0VhFQOaHAK/dXeG8jFiAJ3kiZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9Y35ngJ; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9Y35ngJ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so1038979eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100278; x=1775705078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EO0kfkAc/BO0FF9zBAWzVI8l6UMi0BZlbrLXFCaNrd0=;
        b=j9Y35ngJ16n/xf/PjCz61hNfp4ymVoTr4pAREDEsKXd7lRRKgAKFRHu7fDPWpT9bqL
         7filhOtKRkdVmZNItGOQXTn780eVA+xiNOJQr/KAgGzltbMt3RECuuhsd4PpuCJFK5Ks
         7FuthAxxwLJIm7eJ/Ays4lXXT0Zq2rdaF04XTpF1hx6iTPRsyPOHtYEaMzh3C8vWLmkV
         EwQgy3MOdSdLBe9Wup6goYgwDES6e+JKE2TK1CtWUKKjo3UMsVwImPvGUFnXnsSrLe7a
         4I7AACxzo1szyjCA0Uo4XGNEzB9YHYIsfnYeNYbL37g4VxnUXvxu26S4S/mlMTsrN1xS
         pENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100278; x=1775705078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EO0kfkAc/BO0FF9zBAWzVI8l6UMi0BZlbrLXFCaNrd0=;
        b=RApHhKo3WwK53ywwvc4J/iSd/gTGedrHkp6irYl77iFJaJ8Zx3FRko5ibwgEg1U1oR
         0vCt/0Y2ZtqcCzFa2XK+efW4Je7XBz8vaaVoL4YtQtouKBtSloEEE8d06CEDfob3YEYz
         3xT1w44RxE0rxgWineo9A5zG/Q/E3F6D8SNy/wEDsabzvpQAmiAcskA7Acft8n2b6aRH
         N/+9ceI/TC8m54YfA0YJ/kF828b1KvEB+tsrboM1L2uO99jbOCXKeXpdL1wnftNWvvfF
         KqesRSGANugC8YN9imUoqocfw2+Ku2umvdgwOm5u+zrCZsosuSH0tfjwr8DpQcO6G0KI
         u4zQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe9Io0BN+wZLDF3+xl+g1oGdZBA0Iw4RNOCHmUYil932EbB8RrkoHifz6p24A9XYK0UGhBiSEPuvDEsW6mb+jUriyB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1vH8T6VKh5TsTlDPG1pOnZrNlahT2WlSrNjV4a+YxYSOYk9Q
	9Oub4RrgVzP3H99gBph4JkLt0XLZCIyYrI3PuF6gGgAjZSSYCOq5zKX9
X-Gm-Gg: ATEYQzzAAr772T81aAsIJln6oZ+PNOoULJz4tVSNlozLiKAW3QpsLia7lDjn8G5ZPxh
	t8WF4WPhIeG5scvxa1Lcjp9/ZBBCFc9xDQ/9zMLXv/2Bi1r08xj6L5IPAN/nTBhWFwXhAi6eMr7
	XKQyiColdzbP1okCFFp+14YdtKi33W1RnN8gdik1F33nlhCpnUixFeMWOTOdzE00NnPj79Zcm1Q
	hrS5CjYWNW9Kxayz9vEfYzoXbqKtobG7F11IrqU6RucGQOiBzwLI5uGIikKuP1iybceZSVhz+oX
	tlnBKKxw7/47AkNfo7RiQWnbmYVmAG1a7/8r9pJ9Q/8RE8CrSooT2gOqIKadVu6h/aNv0UntTVT
	I9h+qwubjavGdrl/06BDGgj7E4oLFr/xCCX5y3ibol5kMRhfatqXH6j4Bbd/rTAhFBXhLA4fg/z
	UEg/AONPJZa90iSKYTGqLKKeDAQdpm+ma9UXeqXiOid+ddN67956jZIApzxyxGY7qRzXJTkrBX9
	kPM
X-Received: by 2002:a05:7300:6d1f:b0:2c8:6361:ab58 with SMTP id 5a478bee46e88-2c931276e6amr3837194eec.13.1775100278227;
        Wed, 01 Apr 2026 20:24:38 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:37 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 15/16] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Thu,  2 Apr 2026 03:24:23 +0000
Message-ID: <20260402032424.678528-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

We are about to add debugfs support for lenovo-wmi-capdata. Let's setup
a debugfs directory called "lenovo_wmi" for tidiness, so that any
lenovo-wmi-* device can put its subdirectory under the directory.
Subdirectories will be named after the corresponding WMI devices.

Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v7:
  - Use subsys_initcall() instead of module_init().
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 34 +++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-helpers.h |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 5fa7a92c145e..0446d25adf6e 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -17,6 +17,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
 #include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -186,6 +188,38 @@ int lwmi_tm_notifier_call(enum thermal_mode *mode)
 }
 EXPORT_SYMBOL_NS_GPL(lwmi_tm_notifier_call, "LENOVO_WMI_HELPERS");
 
+static struct dentry *lwmi_debugfs_dir;
+
+/**
+ * lwmi_debugfs_create_dir() - Helper function for creating a debugfs directory
+ * for a device.
+ * @wdev: Pointer to the WMI device to be called.
+ *
+ * Caller must remove the directory with debugfs_remove_recursive() on device
+ * removal.
+ *
+ * Return: Pointer to the created directory.
+ */
+struct dentry *lwmi_debugfs_create_dir(struct wmi_device *wdev)
+{
+	return debugfs_create_dir(dev_name(&wdev->dev), lwmi_debugfs_dir);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_debugfs_create_dir, "LENOVO_WMI_HELPERS");
+
+static int __init lwmi_helpers_init(void)
+{
+	lwmi_debugfs_dir = debugfs_create_dir("lenovo_wmi", NULL);
+
+	return 0;
+}
+subsys_initcall(lwmi_helpers_init)
+
+static void __exit lwmi_helpers_exit(void)
+{
+	debugfs_remove_recursive(lwmi_debugfs_dir);
+}
+module_exit(lwmi_helpers_exit)
+
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
 MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/x86/lenovo/wmi-helpers.h
index ed7db3ebba6c..039fe61003ce 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.h
+++ b/drivers/platform/x86/lenovo/wmi-helpers.h
@@ -16,6 +16,8 @@ struct wmi_method_args_32 {
 	u32 arg1;
 };
 
+struct dentry *lwmi_debugfs_create_dir(struct wmi_device *wdev);
+
 enum lwmi_event_type {
 	LWMI_GZ_GET_THERMAL_MODE = 0x01,
 };
-- 
2.53.0


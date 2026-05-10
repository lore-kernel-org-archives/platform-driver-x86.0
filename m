Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92762E7635
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387166; cv=none; b=rRUCBnaDD1gyyNRyatF0Ba6cFlJZ38Zb500AKFXjJx4e3DBBqZwGrJpRTCbKDnEgTLnB9dogSg+PhwYe4i8PwNbw1Wrx5lFYwAXdQ6CaO7aCy0g/Y6lXVaqUazvWJVmZh46w+gMaDkkg3Y9xNoTXoKNULaXXqnXP5NyC6Jy7SoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387166; c=relaxed/simple;
	bh=nw7kdTs1biYqcCyLBgFFjUVOcmzqKE/6nPTRSBdw19M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAZ9e/O7f2Y/46ZtSKQ+uKxQ8wtDKFjolpOCXyVhAVREDkdocgrMCYPuqLDco1uTSDXv+9mEKHqKqbtfQ2ooqK+Zw5twSJRjsxNfh5OIof90U2rqqor7COS894dB2dmCnrgGuB+SmYARonsw7NdGtBQcruLfr2bbVyMpRJl5cjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVaj5vAr; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVaj5vAr"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso1906149eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387162; x=1778991962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=iVaj5vArUDb5f+y/YnzWpnxrblO7yot8i/mGsffmXVPKdjenuaTA42a6KQp/0qkKs4
         Myp2REDqwlWFzXstIKzuBlOONdd36zmb+EupxnWPnzNc/uHf3DoTXnfqBng7uaRDkB6R
         yMvlZKkNgsMaXW4/004sMmzg3RPdTkSRC3XRHbvcq8S00Fn8uUk4LLRMIs+j59Fom5cK
         SW/g4bnDtAhiAcKAmccnAaQdroDeitT6PtFQYnGmIqdVf95ehDkTiVDpNLYRfhdtTfRQ
         kGG6wwr1ObgPiz/hKXYBQA+zKbWVCUvbRwnJpI2X2kx/QmpISqamYFFvwyjs/onoYNpx
         tapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387162; x=1778991962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZGzwivOSp3+FMEX/5WCBroL/DIUwpA8g1utSU5YDlE=;
        b=oAsHr57zotqxDk8uYcOSkC0j2ZNnjoU0+qVLizCZfgAs44TSJuvaKANI5tybVWiTpN
         DSYzfBJ2Rb0SmMQGn7f/8GKom0N2XJgQEbFwGgcEu2IxJ2DIwWG/7V5S+dpXxOgsOZB7
         yX8evydg9zxwMMXCQn+bB5zP3zcvd5ilvyJz6kBs+2e+SBF6KJ48XQzz1NseJCEHH+rE
         kvqtMTnDQZ9kxYfX+NG8+/Sp2hJXYdyeorcGXqH7keFCqF/vRvWh3rhK8TQuTATInuoR
         eMLBzq46wQfDzyEtrQt2NEzhOP/y8dJJcE/4ePyG2wT1IeXVj3aZ74/mIaokLrx9aI+N
         faaA==
X-Forwarded-Encrypted: i=1; AFNElJ9qWhW5s9Xa9g35ooFku/blmyPhNg1qE/s06N3a8Bs9BRWZPuPMZ8bbPRNYLsTyvxSzFkp2Qeo3TpnYYECZtVVpEMsu@vger.kernel.org
X-Gm-Message-State: AOJu0YxDDMOdg2Gdh+WNkkVbrbp8FhJfdXUazBdo8eewnynCh/V73uKk
	2O5xHDNxXIEIxPZsXJp5+SJeoqgbnC/g7E2G96nsi3V+99oVFBlK6jne
X-Gm-Gg: Acq92OF5OMm/toyTjrR4vMwy3OFg91+DCYOuXomGXTYtuKTeeadNvRiHMof/8jq56/j
	PFgMtoDpgs63Uenztpp92HGtCpOyLEivGfXXSbPrlXnpksGLjKfF3c7fnCH3+3kJDpPRinv3EMp
	CX3E9ANF1qdTAX9r+gL7Yb9ITdQIYfSascEvawU+ttyXtt1zcUMlGT/7AFVYHLfz4tsWADe+gTX
	Zgrxk+/cENbbuO9nYFi2YfBGPjxN0gV0paz7utrI7aE01jWLFiiOz7vxDW8g53TlV36wDhYqMsw
	aW8AXwX9FK4KNCky+yTQjMQd+wJJlDD3VqDQTeD+umgEBi4mXCZ8wVuv8573xR8XU0Fq+HSrFvE
	6bTcrzNvRm8NswzPVr/Co62adySxMTIwgiWI/t55o+R7gcMelCX7+Djo74fuM1+Eu/fph6ol8eW
	3CsWQT7x3WM72DKzFX1Jyk26OEFPNcwP02cFpIfVsuOLCGBEMyXEA89L0tXyXnWKZMiQn/E5EOM
	r92
X-Received: by 2002:a05:7301:9f03:b0:2be:ca4:e114 with SMTP id 5a478bee46e88-2f6e3e93a6amr5658200eec.9.1778387162042;
        Sat, 09 May 2026 21:26:02 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:26:01 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 15/16] platform/x86: lenovo-wmi-helpers: Add helper for creating per-device debugfs dir
Date: Sun, 10 May 2026 04:25:45 +0000
Message-ID: <20260510042546.436874-16-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
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
index 7a198259e393..82dfd26c9c2b 100644
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
@@ -185,6 +187,38 @@ int lwmi_tm_notifier_call(enum thermal_mode *mode)
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


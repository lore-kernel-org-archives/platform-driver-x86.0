Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC57311967
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364539; cv=none; b=I32Mm8mJ/mpr2nZ3fXj8d8lGAqo4skaEMs/N74UZsVZVSefHTBkMCmfDqqvTGgmfbY9BQlYxLtRQy+H4OVBmozsRbKAtL945Wop7yvT5Re1PVPHacWWzleOjkzqSbzFWjGjqr5vPtM6ACSKS2kHYf0cmHrEBEl61gayX5Oz2Ge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364539; c=relaxed/simple;
	bh=k/xPuNkR/BIM30zNpAyI8wz6sFjBLq7tGwi2ZmqSds4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U83kn2wNOoXm7GUYv0hVB9uFL8h4XGo7HLs2Pi0jQ2PKf49D1cqeV/Mg90xkRQIzb9jARhGlnPP9RwDYK5Fp+DN/N9vaF8t0XTmIWNi0Qzu0GmYtCRAqsj3KIOoge65Bpo9LyPSJrD+xGIC0p2prAmLXLlymRp1nLJUhl1UIFiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUO10Vj4; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUO10Vj4"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f83bd32efso8246467b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 01:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777364538; x=1777969338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VMU6unxhoyoC/YoKPR6+gEr9cN2ykfBZJQ5EWE+zSYU=;
        b=RUO10Vj4t1iGmwVIKWM4qfhBRXSiVZcDJBXYRee1lWptk3fk1Clg47pkVA/Zc1mBc+
         Qw9al4udFFqDKmXVGnRbYCHZYlt+W9sJlCjiyHios0g/NfPshqIM2tLhaNNA8L8vOAAt
         ke87ubTdlNLSmae9ioPLCeFR494/lY0dgb6Q/Rl5jXOYRifs1f90dzn1mofqVTPFBAAL
         ZXacniqYG5P6gjdfPxRqgFnyBriLtLNxYgHYpPAhi8EpF8lN1OqWmgvYXvF832V5k7mi
         BZLKjNzSxyxPr9vAjElgHAxH7J5kodDktNM0ekbmYIxMuTh3QhB4d5U06sue74s/ChtT
         H0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777364538; x=1777969338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMU6unxhoyoC/YoKPR6+gEr9cN2ykfBZJQ5EWE+zSYU=;
        b=fq1nmX1/BofzcquxlTe1BbBwKqGaXpUCcWvzU5LVEANuO6BOH+6iVt26tuER751Ccz
         QmSkhx1kdOHedzEOTx4ODETUrYNMcQarPXMFX14dB5vBOzw+bC+MG9o3YCkSI9J0n2HH
         SqzoN8+Cl/QWoOiq+YnubqnLKPBIfDbu4+0WMnWHz5awjH1Ko+EH+Jjk6qb6qRV+ZOnN
         tCvf+sdKW/6s+G5CW3/TsMaDNQ5bSMyD8TyrBicAlEYm+XYRvZeC7wwykYXDv6p+puGe
         K9ACSfti3usOnAx7rucg0DuFQq3XLnUXPG4BBIMek1/jkM2fkvYoJT8tyosatSSATOqr
         oJvg==
X-Forwarded-Encrypted: i=1; AFNElJ/UrUBP5F1VojW7OOWvvS8o4/wwfCnAnSpWB1oLuQ+fYP+kNIxjbTG2V7TVJUdR7teSu8nvsQRG4o4Je1G8lhL71WpF@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTXLypGREXq6ipWpm8xYZLee79HRvraRlmwvw8tAsYwsZcifA
	BkkMj3WjJ8fwbCptGrwuaAfdOlZ4q1slBo6I4qpGa+0LE/gUqS7ztGjB
X-Gm-Gg: AeBDieujC9X/bIzLLTmz9NbAsxalX2NfcoUrfmer6aSTpZm/XfzacfAFymo7z/y+YDj
	N9gtTHjmgfdVONOhgKReFf84inW7Oreq/Iq0Y/+mFF8ozmb2vRsva519mrEvMSEHSSNHwN3MVLR
	VdJOcm2OhuJkCoMKXc5y8RpqwCPjIYZaBYhYZusCpqDGDgOALs9D186kPxTVIT+WtFxJCuhUCfy
	QAjT9+8g/haS3NUstKQaQhIB6HsOdLyqb2XWF1/AEWwZ0lVDnNdt5b8FsqMNH+0g2Zc/3Alt7oi
	APAlLQaBS+GPhmwX12Uz1Z9UVqX0L+waauwa0I702EqCUXKeb6sW8+k/0dDpxI9Hh6aG/KF/H0B
	O8xJu5t6XU2i59w/s7hMiU6u4x7sGjUkQvTUs3RGk9Z52+rvL4v0gHZis+MKCrf7s0Igp488PlM
	8dZf3Umw7vwIPCijsIj45qpjj4
X-Received: by 2002:a05:6a00:929d:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-834dda870b4mr2351108b3a.5.1777364537850;
        Tue, 28 Apr 2026 01:22:17 -0700 (PDT)
Received: from lgs.. ([152.32.133.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf624d9sm1850084b3a.43.2026.04.28.01.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:22:17 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] platform/x86: think-lmi: fix possible memory leak in tlmi_sysfs_init()
Date: Tue, 28 Apr 2026 16:22:07 +0800
Message-ID: <20260428082207.357522-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once kobject_init_and_add() fails, kobject_put() should be called to
decrement the reference count for cleanup. Otherwise, the memory associated
with the object may leak.

tlmi_sysfs_init() jumps to fail_create_attr after kobject_init_and_add()
fails. The error path calls tlmi_release_attr(), which walks the kset
lists and puts the kobjects found there. However, when the add operation
fails, the kobject core removes the failed object from the kset list
before returning the error. Therefore tlmi_release_attr() cannot put the
kobject whose kobject_init_and_add() failed.

Fix this by calling kobject_put() for the failed kobject before jumping to
the common error path. Since pwd_admin's saved signatures are released
outside of its kobject release callback, release them before putting a
failed pwd_admin object.

This issue was found by a static analysis tool I am developing.

Fixes: 9110056fe10b ("platform/x86: think-lmi: Fix kobject cleanup")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 40 ++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index e215e86e3db7..994475eb0b9c 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -1454,8 +1454,10 @@ static void tlmi_release_attr(void)
 	kset_unregister(tlmi_priv.attribute_kset);
 
 	/* Free up any saved signatures */
-	kfree(tlmi_priv.pwd_admin->signature);
-	kfree(tlmi_priv.pwd_admin->save_signature);
+	if (tlmi_priv.pwd_admin) {
+		kfree(tlmi_priv.pwd_admin->signature);
+		kfree(tlmi_priv.pwd_admin->save_signature);
+	}
 
 	/* Authentication structures */
 	list_for_each_entry_safe(pos, n, &tlmi_priv.authentication_kset->list, entry)
@@ -1526,8 +1528,11 @@ static int tlmi_sysfs_init(void)
 		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
 		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
 					   NULL, "%s", tlmi_priv.setting[i]->display_name);
-		if (ret)
+		if (ret) {
+			kobject_put(&tlmi_priv.setting[i]->kobj);
+			tlmi_priv.setting[i] = NULL;
 			goto fail_create_attr;
+		}
 	}
 
 	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
@@ -1548,33 +1553,52 @@ static int tlmi_sysfs_init(void)
 	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
 	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype,
 				   NULL, "%s", "Admin");
-	if (ret)
+	if (ret) {
+		kfree(tlmi_priv.pwd_admin->signature);
+		kfree(tlmi_priv.pwd_admin->save_signature);
+		tlmi_priv.pwd_admin->signature = NULL;
+		tlmi_priv.pwd_admin->save_signature = NULL;
+		kobject_put(&tlmi_priv.pwd_admin->kobj);
+		tlmi_priv.pwd_admin = NULL;
 		goto fail_create_attr;
+	}
 
 	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
 	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
 				   NULL, "%s", "Power-on");
-	if (ret)
+	if (ret) {
+		kobject_put(&tlmi_priv.pwd_power->kobj);
+		tlmi_priv.pwd_power = NULL;
 		goto fail_create_attr;
+	}
 
 	if (tlmi_priv.opcode_support) {
 		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
 		ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
 					   NULL, "%s", "System");
-		if (ret)
+		if (ret) {
+			kobject_put(&tlmi_priv.pwd_system->kobj);
+			tlmi_priv.pwd_system = NULL;
 			goto fail_create_attr;
+		}
 
 		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
 		ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
 					   NULL, "%s", "HDD");
-		if (ret)
+		if (ret) {
+			kobject_put(&tlmi_priv.pwd_hdd->kobj);
+			tlmi_priv.pwd_hdd = NULL;
 			goto fail_create_attr;
+		}
 
 		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
 		ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
 					   NULL, "%s", "NVMe");
-		if (ret)
+		if (ret) {
+			kobject_put(&tlmi_priv.pwd_nvme->kobj);
+			tlmi_priv.pwd_nvme = NULL;
 			goto fail_create_attr;
+		}
 	}
 
 	return ret;
-- 
2.43.0


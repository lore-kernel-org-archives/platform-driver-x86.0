Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D8E2C326D
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 18:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760378763; cv=none; b=ABp2NGWyUixZYeWNXyrM6+u8T/jEG19Yro+Zs1wSKZYuvTRgBBWYGZVTc8a7gwk4nMcnp79z51wYkLNpDPxWm3IsMQowJG6OmSNd7FNy81aq5Twtdb2UV7q4a6mPEcymGWWjUN2tz963jomvXsSmsj7M0o8VAjMnmYOU82NYAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760378763; c=relaxed/simple;
	bh=N2ZXUZbekSyi2QUa5AhmczgUZDM3XEWCe9o7oZmLxSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBgI0A3fbbxdoQ0Iv6XtVjpqQmRpz+0gNU3asXLJDq08/zeucvUBK30h+M+aAIV4eLi38UJ1CtLskM3+PEZyur6VfVEK7vR+CyPjj8zxUJxDzokkSAR8tm5VgoW6s63Nxb8CGIwKr/kTbejUvKqPtM8GtONd4HE986uFBz6F2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BV4TihKH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BV4TihKH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46fc5e54cceso9129545e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760378760; x=1760983560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAfg/MBoirlA9xSB1hCJrMdG5U1jpf80VoCLnIdIJws=;
        b=BV4TihKH3ZOnIP904W58dafZYvN8FwqWc8yNSUUi4UBVXfFvFenKCoHrw0v4El+o1b
         wDkERrHHM6R4QeK+pmd7lKzclNOfrG0w0UfudHMcyeZT421lHpFBheY25uChxqLU+D0g
         ZNzjXQy9uqvdSnqLq/WX3IAHZ4VjLxOvDRXKuKEjpUBCeTiBKac/Pj6kwMW43VAejUNo
         4SkTAeDE7dFh8nAKhR3eJY8oYIY3kigaWjqxIe8j6aNUk/UISQe8TzrBTR6dDzbIDH2b
         piANbxDA0dpIQ7yIWECnHNcKETtGFMi+Zw03jNcwQw+P7/6Kk16ku4+5904ZNHIyV5Ov
         mFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760378760; x=1760983560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAfg/MBoirlA9xSB1hCJrMdG5U1jpf80VoCLnIdIJws=;
        b=v2UAEG15hHaCwBQaP2I1yQWbyJw9B3kKjTcmKfy6xiD096jiSgvo4LRxYTImgF6XCA
         Cn4lxRwb23STmqaCUr6/dJVC/Q5OjITBc6ZALq7wLH5LWo0N+kZZecHROR2RTqzBjO41
         rknPTgtKCkDRvjA7i40vGffPGjT6673mkVJBcX5FK5lwBh4f25p6soQIKdED0kpCZZA1
         dG0DQ2AyAFung4Djrn46A/C7VpAnNqEV2Jd6EDb1RBSbUElVNNTSU0Z4rrsh8M5naKgz
         VGCtCVI+FcdQtKTkHBookQzMdHWXQK0MfFKkOggGT74qV2X9eDd0rFFi8hZvxqjkozZb
         c79w==
X-Gm-Message-State: AOJu0Yx9d5PCUDUVMmWA36xLaD4ZLP6FYBs6Y3V8+sm97vnehTZ2l/b6
	yGhZWkEh9YuS9N+cR/JPc7QdYHDiO4ey2dvcFzlypNDeVMM6IVbqOhow
X-Gm-Gg: ASbGncuvru9w0rmg1GxO6aAXCBIRg7nNhOIiPLEqcUmmsqJQ+vJWs9sBVNdppU7j2YM
	08dl/kjUCrto0Zrz3IeFYSzEswRYzj0rNoH7mpbD55IaLp7VFx6ZKpXOZs5Vpzdi82I0M2gKM1y
	rmSoAfTbKOaoK6G0La6iXsc2Zox5RXNsRr/yshwdZ0W/pdcvpNtm9G4ypM+kbrFfg064+c4rGZ4
	AAi6Yizqxogsju7Kq9pVbKrG2mj0WrCA3iciFoUIqQv0dr4Ej6OPobliJZ54/l3oWGdGsrGLdNS
	+ehvYG61INXM+EKBvEw4Txg1v3zrV3hFQWQJ0fjp5Vc8joN9dkAmy+reflz1VRxNL2p6YZEiN3q
	WcV/bLILLcR0cVOTolC6+RoVXYIHv+kEJf/22FLKZ9df7Vtn8QVJGqMFD
X-Google-Smtp-Source: AGHT+IFfDwwsAH09+g4Iav/Kv9Dm8NCqclnvfRSKnJYDbTBfQmTlV4Qida/l+KvTxHEmIMF+71kyaQ==
X-Received: by 2002:a05:600c:4687:b0:46e:37a4:d003 with SMTP id 5b1f17b1804b1-46fae33dbbdmr140036145e9.8.1760378759648;
        Mon, 13 Oct 2025 11:05:59 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589b3dsm19933428f8f.24.2025.10.13.11.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:05:59 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v13 1/8] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Mon, 13 Oct 2025 20:05:27 +0200
Message-ID: <20251013180534.1222432-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013180534.1222432-1-benato.denis96@gmail.com>
References: <20251013180534.1222432-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Export symbols for reading/writing WMI symbols using a namespace.
Existing functions:
- asus_wmi_evaluate_method
- asus_wmi_set_devstate
New function:
- asus_wmi_get_devstate_dsts

The new function is intended for use with DSTS WMI method only and
avoids requiring the asus_wmi driver data to select the WMI method.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/asus-wmi.c            | 40 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  5 +++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e72a2b5d158e..38ab5306e05a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -390,7 +390,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
 {
 	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
 }
-EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
+EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, "ASUS_WMI");
 
 static int asus_wmi_evaluate_method5(u32 method_id,
 		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
@@ -554,12 +554,46 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
 	return 0;
 }
 
-int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
-				 u32 *retval)
+/**
+ * asus_wmi_get_devstate_dsts() - Get the WMI function state.
+ * @dev_id: The WMI method ID to call.
+ * @retval: A pointer to where to store the value returned from WMI.
+ * @return: 0 on success and retval is filled.
+ * @return: -ENODEV if the method ID is unsupported.
+ * @return: everything else is an error from WMI call.
+ */
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, retval);
+	if (err)
+		return err;
+
+	if (*retval == ASUS_WMI_UNSUPPORTED_METHOD)
+		return -ENODEV;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(asus_wmi_get_devstate_dsts, "ASUS_WMI");
+
+/**
+ * asus_wmi_set_devstate() - Set the WMI function state.
+ * @dev_id: The WMI function to call.
+ * @ctrl_param: The argument to be used for this WMI function.
+ * @retval: A pointer to where to store the value returned from WMI.
+ * @return: 0 on success and retval is filled.
+ * @return: everything else is an error from WMI call.
+ *
+ * A asus_wmi_set_devstate() call must be paired with a
+ * asus_wmi_get_devstate_dsts() to check if the WMI function is supported.
+ */
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
 {
 	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
 					ctrl_param, retval);
 }
+EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, "ASUS_WMI");
 
 /* Helper for special devices with magic return codes */
 static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 8a515179113d..dbd44d9fbb6f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -166,6 +166,7 @@ enum asus_ally_mcu_hack {
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
 void set_ally_mcu_powersave(bool enabled);
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
 int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 #else
@@ -179,6 +180,10 @@ static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
 {
 	return -ENODEV;
 }
+static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	return -ENODEV;
+}
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
-- 
2.51.0


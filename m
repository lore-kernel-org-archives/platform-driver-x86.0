Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650C2F7478
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 01:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492982; cv=none; b=nOS9sqZHyoUBLSjCFRkEOELYcqNWh7DQpy4VDqlX1KBzwfq8V7NEgZNLdVxcLRqlnxea7cAilyw/JFbDu2ua02KC7Vsrt1euvfETHDD2t83i5YAeEBQeV8yt2euTKOUFxlOqMxS8aTW9JHEBirs7DeNALvNsmhZchd83AKlSn10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492982; c=relaxed/simple;
	bh=N2ZXUZbekSyi2QUa5AhmczgUZDM3XEWCe9o7oZmLxSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvbP6IZNIdY6xEo6be1G/iuRzQcZEy06tWlEIi21ZWEjUFk3D1W0odkL7x6cXpNlY4fvU/ruuupPc7vTSBnp+JloWwvUp1NwRYafTmYKE34Bx8QjxpVK5dLT9UON2sdUwqSROyu0u3bmfirZH4tIEBBJThI8bYW2mvN3u6Qkefg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2TUAtXn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2TUAtXn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e542196c7so2102475e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 18:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760492979; x=1761097779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAfg/MBoirlA9xSB1hCJrMdG5U1jpf80VoCLnIdIJws=;
        b=Z2TUAtXneAPoNDYb2yPUnbL9yEejKHlsvHZ6yVFiZSQ+4CLyiO7pdO4VKzlGp1bI3q
         kA/w3yOi/mM78XslsxUMkQxU257+6NIWSA3VFUvTcr1haBJUq1i9Tdk+/3syXW+uC0NZ
         3Pqx+V5vjLwPclziiLKiqIwsNvGyXGioxqqgU8Qq9baUbGF3bQ7rpb3iHokLGtccltqj
         Q5zWNgCNvm+4wzeJnGlV5ii4DhcL5dV/ODFhoPxV7Yt5Dhb/DN6dKiMxTV9rFGjTjlA5
         f/cs2EjGsVLBRhKR9tLyl7WC6nOi2SSIZtOeoECQ0QO5xw3aw9lrtVqW8Uzqv0C5+Alc
         Uyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492979; x=1761097779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAfg/MBoirlA9xSB1hCJrMdG5U1jpf80VoCLnIdIJws=;
        b=UWUdpQwRx5pdPCTCDC69Sqr1NfkFPYg6gFtaUa7907Bfwq5NnGPEgLvZ3yV0PTiATX
         FcKV2Lw/HUmBG31ia3VOb2raeIovK+uFxXOSd5bTFQ7mdrtM0pMRZGj/rs03O4LAAK8e
         6B1IrDj6Mlq+JCE92xCae+ycxXk60gkrD8VA47kPd8EY06e7nXeFU6uhpjcOtYJ/7q6D
         N+os+swPoinAnRFt4fa0TCMQfX8iAEYxlw1ojTrftPxnhQA2e1JK6zPcHso5+kT0zdGk
         HDmGpwsD2KFjzEY+G9zyZ6CpxNiwMtglx6vQUpmhL/QyaL0dUI/E1MatPOPmjJGcF3sa
         Fybg==
X-Gm-Message-State: AOJu0YxCjDaHbNjPAMo3bKhT+EpmhMHSx6ubeznBKuygCLqP49UywIYk
	zcv3fTo82vAeFDlThcmT6adhO+2YE5QP5CkEPRmmem3sbpN1aL4R6tqG
X-Gm-Gg: ASbGnctEmKCBIQm334LDoDGPH6FSbqwJKFpTPZzdNZ1uA+kd+lcbJRSQ8kg34Y03uy9
	CH+QfYHKSEnn4Z2TvioTaE20JGp398rQUvDFmPr6UJ53ECjXExGbZHaiIGKBgj74BEZ+a2PNyJK
	m3YBzK5028OFNjC/1ZBepdp3gvYKPA3slQfxomjw9zg+mvedxaJEbCWy5l++koMhb+S43Ikktpj
	8dwDbOVv+jdIbnz9i8Hi0iww16pnglJ+TsR3OPU9IDiecCBcvm8rM4uE3oUhtnvkzcpzCLcSRNN
	0DbwYs2j6mRyedDy3FZOhSDkaE6aNhAwAOwnD48gX0HRpfZxr9kyV/yM19qabJ2HT9pYsGu0vtH
	/zH5RAHNreFs5PP2Q+kUXP6KLXi2yRqZMrH+FKcrUolCuqw==
X-Google-Smtp-Source: AGHT+IH/Rgbsaf/t/Bc4toQHfowqH1dvCeQd6O+WD6I4l2IVMqFglFEro+LMSxQz51gM61rLYnG74g==
X-Received: by 2002:a05:600c:4e0c:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-46fa9e8dd5emr199678525e9.4.1760492978873;
        Tue, 14 Oct 2025 18:49:38 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm27368995f8f.10.2025.10.14.18.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:49:38 -0700 (PDT)
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
Subject: [PATCH v14 1/9] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Wed, 15 Oct 2025 03:47:28 +0200
Message-ID: <20251015014736.1402045-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015014736.1402045-1-benato.denis96@gmail.com>
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
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


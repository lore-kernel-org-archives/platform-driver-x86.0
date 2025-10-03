Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3A2DA77F
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Oct 2025 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517739; cv=none; b=Snz/9qq1ADc04V85vwsaS90gWtr1AMBLJdngR5rQXzWzY4nhHMo7LpeYm3HokNX+OVhU7BolJ6miy+yfA8P/k4Du4PQeqQP+1aPg20XUX9UzZcOv3cZB5R9/QIyi3YSl8DXNaELg8oSpfkkqcimL/uhn1Y437Ob/4Dwwd+/CVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517739; c=relaxed/simple;
	bh=N2ZXUZbekSyi2QUa5AhmczgUZDM3XEWCe9o7oZmLxSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSLi3MJgwvROAXQvIrduO42zo+zpWoBELB0IWaUqtu6UDSCjehkgGBr/+ehQxuvQO4q11xGsRdD8An6/XO+ZoNgOt6is/y8pJeg/t2TxxbP23p/o5CobpXap6msadmyfEy4jUvFi+xGg+cE8asyuyEmkUpD8izb6XByy9sHwZ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5E4x7le; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5E4x7le"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso1535271f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Oct 2025 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517736; x=1760122536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAfg/MBoirlA9xSB1hCJrMdG5U1jpf80VoCLnIdIJws=;
        b=N5E4x7leRUsLXckET8vly/pYSZixIGYd5Qkk4YQGcQeYy89Bb/fj6/z9PU849LqUNu
         lYOig0pHyJ5VNN70aXizMBAGDWRrC8IDG7SK3Ijs6tnevCwm1dxLu3NpashQb6QL+2lx
         3w//COvntYwF/RBprVUpFOUsCW12bMwMiiM7Cf4xp/frZsSBLG1voyj3lZ2Aw7cd6VHu
         +g5MiN88J5qfB4ZPNLa3YrravPWi1cb099DpFOa3Hob00fi51yN2CgJLW+67kuELUWQ1
         YvRK8XHEaHZBb3uNkasUpzUJ8N47dj/0u0U3h05orB/HJYCyjV3rpuqGKWP36JywPWld
         glgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517736; x=1760122536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAfg/MBoirlA9xSB1hCJrMdG5U1jpf80VoCLnIdIJws=;
        b=qbhL/zhA6Toa8TRgTTO1J5WFWMox42+SWDSQ0oA0wUIamRnzaEN3jsAkL8KJdrh6WH
         OndQwFebrAJIBKsZKvqZWp921IziyfUse8MeecYxWL6dm7wmxshn/i3Gh+orDd3PnxVu
         I7JYO/KCUCv+26cqe1Eg+8A5qrfqlwKX1lnm4jjkUnQHGdI7BLJtg5E4pk+0QwbEEcd4
         Vie8WBpruTbGYhNnsKj4Eru+zxivOYn1Csyb9l4OefZt6PyLlVTNT8hzJu2HQ54aqX6E
         DPFkzroitAGf4LdK72654DyexrFW5y5bjjXAs5/0lgcxHajQwDCsS57R89Gcpe7ogqg7
         BaOA==
X-Gm-Message-State: AOJu0YxtYERWuXGE+JO3D4Kd94kyJI9vdpXCcrqRiV6qhk1zAUZ7hYHv
	VwLfuTOHURpmUp98oi9aXSXQGryARNA5J0/O9C6bH+WClsUNPDINobeyvG/1gSxs
X-Gm-Gg: ASbGnctVsjPHn74RqGQQxMltUuvRUzUMcBioDXfX6lelTHTe3SnayiwGYtsXlVQh7Az
	NwvKNXrXgiqYdKx+TvXN0v/yHALyqMQpPmmcF/0/w80Bb2y71jnX2jAwPZDcDxNxitth4wcBcPn
	S6Gi3ifUX4GRHhUrYAYArVkcCil5D6H8JpgPYA51Hlz8UQzckRRoGQ5OBI9OJrpL/C2df6x95ok
	9bLKvh6kdb1E9jserCGXgR8SestO0wv2cXm0jWcSNorO4KBLqnsabvZE99peZldqsFtvJRiezyK
	HQCyFSJgch8vzQ8BY7OT96d7ZSOlYM+Rl4HpJUXxWmGDA+q+Hyku1T+GH05/ZFtGoOdxR5nIOxQ
	+FtoKXVIzn+bFSxavRTUdQjmm/L5fYF/19bfmU6LUOue9M5cvdVKOdjOsbtnEPA==
X-Google-Smtp-Source: AGHT+IHSDPkUOEz2UT7aQlYiPocEemISwJfvL6QJuuYJ8ih8sI991uu/dhvmWK1BFMOQ8fnS5epEzg==
X-Received: by 2002:a05:6000:2311:b0:3b7:8da6:1bb4 with SMTP id ffacd0b85a97d-425671c54bamr2826496f8f.58.1759517735928;
        Fri, 03 Oct 2025 11:55:35 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9762sm8946927f8f.38.2025.10.03.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:55:35 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>
Subject: [PATCH v12 1/8] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Fri,  3 Oct 2025 20:55:13 +0200
Message-ID: <20251003185520.1083875-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003185520.1083875-1-benato.denis96@gmail.com>
References: <20251003185520.1083875-1-benato.denis96@gmail.com>
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


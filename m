Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706160;
	b=IvZ/h6K9HmrkHSzrYfWzFagx+p6c3DiNF8zT7VeaXTdPCARVulDiSeMZXozCYDMZ8G3F
	 d0vEer+RLEhf6gGIs42XKcsbrfnSfQY75kA3kejsOnxPutAavRTH3f1YaGzM4zoFjOzBK
	 l+UJqgemEZwauCConKKgW++IVpsDYrZVEZG2R1pqGc1GYKHCoaYm3uJESqFbatp4vIPY8
	 bH1fIP2Gb1p0cI6W4EtgWKnoiGfpAfzvE2qCurh20jQ0Z/mpTyaeoVEBmA+BgIsoGuoxN
	 BcVI2XT+jj0GvY9E1m6Ogry6m5CJjGOw1pV/ygSC14T7937EcekWacYeCm1frJw/7AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706160;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=t/lDhgKlQkx0pAXroCUHY/H/NSJkxUxrBgb5za1VTHM=;
	b=CZzICiJRVeVIB6x+C0wbTEAr7EBkgAT2FF01pfJ7PA9UsvqGVCbV0k8x4/7oa4gKku+z
	 mgZW56uBE8Rq9TaPaTZM0FR1JB8JZxg0ibPb5SGMWJSS8B33wmykoLpcOC6NztS/ZA8ek
	 Jy6+/ypmGiQoKHvaZj5v7oQ0WdohwsOtwMQGYvDFfehfMFPPp2/ERU1RIg7ul3Rw4nEeL
	 b0RaAc+xcnAjv5ZwQ6B5cvuieuSvlIKNfwiQ7HAXlJhsglSD6ffOw0/5bMRhloLdrR3YG
	 v1/iKfu5zNITN0aChxT5xfBKrSGB6Czhn6UzOzs8J97B4I4Zsgu0vYBIYHAv8xOeSrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=m8v278T0;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABCB606D831;
	Tue,  3 Nov 2026 11:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ABCB606D831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=m8v278T0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706105;
	bh=t/lDhgKlQkx0pAXroCUHY/H/NSJkxUxrBgb5za1VTHM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=m8v278T04p+PQs/LFbDTFLeRNHfnTRRjv3FOOLqyUNmiq6Qh5R/fUCRgjFK+4JhpT
	 /dC+YZVZ/TVT/Ok0HP9m0PIdW9/OgDzO6pH197aFQ1TxvCsrkI4eafkWxSz5O0fPp+
	 tmOc7DFfY10Wi7lyaRrpkIsn/57U6xiL9iHDVzlo=
X-QQ-mid: zesmtpip2t1793706098tb4439a4b
X-QQ-Originating-IP: M4QcscpcJDntKtUfDUJnG2TSnnfcVItDF3013iCA5gQ=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:41:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5780474121569114850
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Len Brown <len.brown@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-laptop: terminate the INIT model name
Date: Tue,  3 Nov 2026 19:41:37 +0800
Message-Id: <20261103114137.75497-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: ORMmCSiz9W+DUNY5IRjeTjK27/bAvytu/c0VhHkb4LMENHr8WwfcD9qp
	pUXoTDak8Fu3rNwULKpwP2+ncROyan1SiFIFT51ywI51ZTD72TB+birTQ81v1z9wXrH1TgL
	+vJ7JwgHRGmHj0oD89WVWdoqqC061bzE1NQkcrSQUtq3Gpqo5s8bBtWIX5HtAPoRX1xHRWX
	ua64G7LOKCJ5JWfWHOIyOCEtbacihkLgp4B1we5wcAqX7kWRJR2fcfrHTBEDt+ZGXGEUZhd
	QY7kXYn3Fw+/mJ2ohbmxL5AqbpCICiWxVrVYcIxMy3Wq7x58wFQs8vfjrtKSb2K23B6jEcW
	k1lX75jkwYgTP6GnTd+BHxnyFrUw158wTMa/npge03AQ63Mj1UvB6SOsgfJpVmWbHF6GMr2
	RT/+xBbmmZxVsEFoLF0K9OOcYo6xZUJ1OYsdar0FhUp8RLCxVyyzahDIwmFiC/no+5AmI3R
	YQmHOLLbHzLqEgizM1ovPEw59TIlqBRteKcTXmn0Nd10x5qweeGu40V4/PiFRkHiPKCJzhq
	QaLaNGQqFghIgqRzJAXp5rirAMq46z3KjXW61k62vG4eHxnlL8kRbONunISnIuUxD6jLU7F
	Ii/czpd25hFXMoB3YHQBJgoTuMrmEifuO+8dUZXjyE80b5DXCKFTwXk6Vu0VWm7uLbcKI6M
	glrLK74+5ccjlBflycSYNykeb58rWzvEs8s2RJMmoIWLlUViiEssRxwkjyJbqRmgbyN3d2h
	s9CZul7QJZoOpyJXVPb11bBsbTqgOVs9Rma5ShLlojhtFci3WCYn57X3k2LIDyeymCB0Xqf
	nZ++aLaiEiT+DpnQq5nqup4t0r2GmEvkNz3gzYKqUs8u4zCKdFHOTghsUFJKJXXCAQGcF/r
	G3fHjG18VMMUISYZRYEB6rAc2vbeK3P7ZMAi2tpgabCe4ZQ/VE2GZjRkEabZSbWsMbbXY4v
	O+ANht/LWy+/JtnUuqZt1zfOo1s/+c+8wMZKJFcIHI1xDGeWmLGUXYP1kmWleTBOgOjivG8
	BlCRnzNOWPR+smP8aKyDFmr0fEZVmnTiI8kF5aEcq4rliDX8fF2OSU3Ym+rRDiUmFuuKLO7
	A==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

asus_laptop_get_info() treats the buffer returned by INIT as a C string
and passes it to kstrdup().  ACPICA zeroes the tail of the buffer data
area only up to the native word boundary, so a buffer whose length is a
multiple of the word size can be left without a NUL terminator.
kstrdup() and the following pr_notice() then read past the allocation.

Copy the string and buffer cases with kmemdup_nul() using the length
reported by ACPICA, which guarantees a terminator.  Reject a missing
INIT object explicitly before copying.  Also drop the DSDT table
reference on the error paths and in remove.

Fixes: 85091b718969b ("asus-laptop: add base driver")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 drivers/platform/x86/asus-laptop.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index e4f20ab5250a..eb6c182d862d 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1667,6 +1667,14 @@ static struct platform_driver platform_driver = {
 	},
 };
 
+static void asus_put_dsdt(struct asus_laptop *asus)
+{
+	if (asus->dsdt_info) {
+		acpi_put_table(asus->dsdt_info);
+		asus->dsdt_info = NULL;
+	}
+}
+
 /*
  * This function is used to initialize the context with right values. In this
  * method, we can make all the detection we want, and modify the asus_laptop
@@ -1678,6 +1686,7 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
 	union acpi_object *model = NULL;
 	unsigned long long bsts_result;
 	char *string = NULL;
+	size_t string_len = 0;
 	acpi_status status;
 
 	/*
@@ -1694,6 +1703,7 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
 	/* We have to write 0 on init this far for all ASUS models */
 	if (write_acpi_int_ret(asus->handle, "INIT", 0, &buffer)) {
 		pr_err("Hotkey initialization failed\n");
+		asus_put_dsdt(asus);
 		return -ENODEV;
 	}
 
@@ -1720,23 +1730,31 @@ static int asus_laptop_get_info(struct asus_laptop *asus)
 		switch (model->type) {
 		case ACPI_TYPE_STRING:
 			string = model->string.pointer;
+			string_len = model->string.length;
 			break;
 		case ACPI_TYPE_BUFFER:
 			string = model->buffer.pointer;
+			string_len = model->buffer.length;
 			break;
 		default:
 			string = "";
 			break;
 		}
 	}
-	asus->name = kstrdup(string, GFP_KERNEL);
+	if (!string) {
+		kfree(buffer.pointer);
+		asus_put_dsdt(asus);
+		return -ENODEV;
+	}
+
+	asus->name = kmemdup_nul(string, string_len, GFP_KERNEL);
 	if (!asus->name) {
 		kfree(buffer.pointer);
+		asus_put_dsdt(asus);
 		return -ENOMEM;
 	}
 
-	if (string)
-		pr_notice("  %s model detected\n", string);
+	pr_notice("  %s model detected\n", asus->name);
 
 	if (!acpi_check_handle(asus->handle, METHOD_WL_STATUS, NULL))
 		asus->have_rsts = true;
@@ -1903,6 +1921,7 @@ static int asus_acpi_probe(struct platform_device *pdev)
 fail_backlight:
 	asus_platform_exit(asus);
 fail_platform:
+	asus_put_dsdt(asus);
 	kfree(asus);
 
 	return result;
@@ -1921,6 +1940,7 @@ static void asus_acpi_remove(struct platform_device *pdev)
 	pega_accel_exit(asus);
 	asus_platform_exit(asus);
 
+	asus_put_dsdt(asus);
 	kfree(asus->name);
 	kfree(asus);
 }
-- 
2.34.1


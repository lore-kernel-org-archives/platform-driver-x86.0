Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5212021CA03
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 02:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317020; cv=none; b=p7bX/dNEU7PGSlOd2uaamEDT6Db55GQmdlJrW/l2udQIpwysQP0UiC2pZn5JLxfR6aavgNTt/Kaz7XGn/w+mFl6osa+Tzl/FRsTDNfEKJAnOO15Q6N/OBzakquQzunbjIUjAHLuXhSJLbZc4FqYsGp5wfx2PfWTWl7OamwDzLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317020; c=relaxed/simple;
	bh=i6MFtNvxolieN4lk5VN/96A2bl1Y4HNUU5VxSOuv454=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awt9AP2bGMPfAbgHL5JBWHSLKR4uzSUwO4hIIWJ1Pfo8rvy5qU/kiTaY2Pphqrlv9jsfKdHABDN6pZGk62wQJ6bp4wG5/oE9lgSoy0uPMJcjCdbBzbB5t1j6VIUkBlebuG0pt661oIO8PR82SFCLe0CqV/EMmOVlNHjligbvaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1dNcbAx; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1dNcbAx"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137d464c47eso1544680c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 19:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781317018; x=1781921818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIOz3zm+RSFHd4HOq3rk3uZ1Gb4SoU/OadQL7cr2so8=;
        b=n1dNcbAxOTGCK5BS7DrX0ilbhgk9toysyVBAn7IPuyrXuApv7GlfIG+T0nPeP8fcu8
         65XOlVHhEzCh055rGF24diOOAE1gJF6ufNVaeU4q8WBN5xZ06nERK+B8nF83kV+Jhf08
         caT3sbI6QK/ZB1jusCaiVc4H5m7Vv+nNPxkBE5KMx2zSY1YLFrCwhx6GOWF8RQWMMuBZ
         zxfOKvuuI25IiyXm3IRmjsBeRhUHiAhk10O2p7U7KvMj9mLzOl2xrMDpZ0OGCtIzTcHT
         ny3ivPerlbebaSdTmX8IHnljS4d7AUYAl5y9DTLVmrUmAbjT+VmDVvrc7jh18bZoiR42
         jshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781317018; x=1781921818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIOz3zm+RSFHd4HOq3rk3uZ1Gb4SoU/OadQL7cr2so8=;
        b=jMRZP9vOwCtrdPg4LbBs1Jo1P3Kq0qK/l+DYu43TbSOprGdryKyAPIt5QtFM8umjRs
         RqviGojxSeP/BqzBzubD5YvqpCHDribjaaDCl8C5sstFdFg0cpyYPGY7DXl5yVLph5ec
         FuvyxzXd8V5DQRPgGkShk3hW3WBKKuo5E/+nF5UQwBNzlE+Sc1JNFlARx/aNFd15AnLN
         Wmk8OajWfjB4uJl0DSe1hRA9AHR3irtjOMkY3BeU4A1du+01mC0DZb17mR+JwT/gKtj4
         mQZH9Ks34sUyG+Tu6J4wVJz8+6XRX35ma/fK9+msQgKf8/e7NlSqc6zBMbhFuncNO4Ye
         JgDg==
X-Forwarded-Encrypted: i=1; AFNElJ+Tl1IFdJPpEBMGKyzhIPXymqmvqZFVpJVrw93CJRBT8KVYPmmmPGQ9suuZdjbtJ1EoWfPLjq636AY43O7P/usxnPIH@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ8vxWIpLvDJJzimtxhe1Zw6Gu5PJ4sBvurhDUWkHoSZxlQP2P
	x9fQFYC+FN8fje4xHH381Io8gxm6r9RnHfNrV7Jqo7zKvf2a32j0mRBh
X-Gm-Gg: Acq92OFDsk6lk0KhhBI5zMrg+pkRbpRrTP4+c/YXLM/LG2xdE+Abeuo7cK/LIXrm0Ul
	OYiRmjf0SB86LPNRHEAhPgknKoE1xLXQAAgEq3496yqY2Me62RjCM3ErVa3TA8SZeZGVywhCcjL
	0E3een36jz5S7rRzkbX5EbHiZhbX09gk8Ucwo+bDQQ9LUU8rqBlBdJ1YkJpGrQlpMxUyXBlLatd
	YwGMu1YRRol8EKUqm9w9O3fRJbeBNLbGn6blcJKHpl8H99IM66nQup8S432NK1WpDv0+ykt20fs
	A0OWqtnuODE3qEEL1EKwlEXcRLu2JLdLBLnLpVCEjIlB8xgzEwaA9WtZcQSQVOUsbWLVBTOv8nr
	LPZLgIOJLsODvPKo0/jkl+OlkKg09I0FA3csHouuOe7nu8bwIwx8eJdQcvkA69YwADefqSS7R7D
	afl1OVAR5qlWLwuWmeAtEDQ+MaKqZfQNTXYFLMUqmyHvISN3Gd4CfPHGc44c9FeH48v2DzI6bRE
	AWkl8QR9pLs3Pg=
X-Received: by 2002:a05:7022:6727:b0:137:24c9:fb7a with SMTP id a92af1059eb24-1384b39a6f1mr2777016c88.2.1781317018208;
        Fri, 12 Jun 2026 19:16:58 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm6417828eec.4.2026.06.12.19.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:16:57 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Thomas Renninger <trenn@suse.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: msi-wmi: Reformat msi_wmi_notify()
Date: Fri, 12 Jun 2026 19:16:53 -0700
Message-ID: <20260613021654.933618-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613021654.933618-1-derekjohn.clark@gmail.com>
References: <20260613021654.933618-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformats msi_wmi_notify() to use a switch statement that reduces nesting
and prepares the function to support additional ACPI types.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 71 +++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 4a7ac85c4db4..d00ced756581 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -172,44 +172,51 @@ static const struct backlight_ops msi_backlight_ops = {
 
 static void msi_wmi_notify(union acpi_object *obj, void *context)
 {
-	struct key_entry *key;
+	struct key_entry *key = NULL;
+	int eventcode = 0;
 
-	if (obj && obj->type == ACPI_TYPE_INTEGER) {
-		int eventcode = obj->integer.value;
+	if (!obj)
+		return;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		eventcode = obj->integer.value;
 		pr_debug("Eventcode: 0x%x\n", eventcode);
-		key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
-				eventcode);
-		if (!key) {
-			pr_info("Unknown key pressed - %x\n", eventcode);
+		break;
+	default:
+		pr_info("Unknown event received\n");
+		return;
+	}
+
+	key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev, eventcode);
+
+	if (!key) {
+		pr_info("Unknown key pressed - 0x%x\n", eventcode);
+		return;
+	}
+
+	if (event_wmi->quirk_last_pressed) {
+		ktime_t cur = ktime_get_real();
+		ktime_t diff = ktime_sub(cur, last_pressed);
+		/* Ignore event if any event happened in a 50 ms
+		 * timeframe -> Key press may result in 10-20 GPEs
+		 */
+		if (ktime_to_us(diff) < 1000 * 50) {
+			pr_debug("Suppressed key event 0x%X - Last press was %lld us ago\n",
+				 key->code, ktime_to_us(diff));
 			return;
 		}
+		last_pressed = cur;
+	}
 
-		if (event_wmi->quirk_last_pressed) {
-			ktime_t cur = ktime_get_real();
-			ktime_t diff = ktime_sub(cur, last_pressed);
-			/* Ignore event if any event happened in a 50 ms
-			   timeframe -> Key press may result in 10-20 GPEs */
-			if (ktime_to_us(diff) < 1000 * 50) {
-				pr_debug("Suppressed key event 0x%X - "
-					 "Last press was %lld us ago\n",
-					 key->code, ktime_to_us(diff));
-				return;
-			}
-			last_pressed = cur;
-		}
+	/* Brightness is served via acpi video driver */
+	if (key->type == KE_KEY &&
+	    (backlight || (key->code == MSI_KEY_BRIGHTNESSUP ||
+			   key->code == MSI_KEY_BRIGHTNESSDOWN)))
+		return;
 
-		if (key->type == KE_KEY &&
-		/* Brightness is served via acpi video driver */
-		(backlight ||
-		(key->code != MSI_KEY_BRIGHTNESSUP &&
-		key->code != MSI_KEY_BRIGHTNESSDOWN))) {
-			pr_debug("Send key: 0x%X - Input layer keycode: %d\n",
-				 key->code, key->keycode);
-			sparse_keymap_report_entry(msi_wmi_input_dev, key, 1,
-						   true);
-		}
-	} else
-		pr_info("Unknown event received\n");
+	pr_debug("Send key: 0x%X - Input layer keycode: %d\n", key->code, key->keycode);
+	sparse_keymap_report_entry(msi_wmi_input_dev, key, 1, true);
 }
 
 static int __init msi_wmi_backlight_setup(void)
-- 
2.54.0


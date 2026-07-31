Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC16942A140
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 15:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510029; cv=none; b=NIi4qwrL7pNGmUUrWQVaeWrNtMo71x+YcEaJhXo8gSk41DXSWBkPlwYhCIfd+uL4hT/aiwaVSZ5fvr8+BpFDeuVUqmD4pzN/Y5/AG95qjQJWmy/YNBCaNFVBKndIzc+AnTe1jb0gf2oQjktMBU+u5rlCWRG2Bnp9qcRSyVn2Osw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510029; c=relaxed/simple;
	bh=qC8SBGSDaVZzK5t8Ty11OP9/qCN13H0ZY2jhQfa1Ewg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HCd3fO2KALCSzxLYAPpguZSfw/ckCij4VjWwDw+MHq0i1VqTH+PIqd0v+tbjibG8PNMddF3dbWLlBfetgQ3Pk9NJZyEXDBQQxUAVpwQ9/o9nSxqGXx4IhSJVr3El4sDsqPyskvoTdpaZH2FXYVwUV2Rz7qLYPyYJc0Gb0yd8/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBK8+ORN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBK8+ORN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848593533cbso689528b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 08:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785510028; x=1786114828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a7YUAfWF28CYZia0ko86rgI/yXiMxE4LGUbouzjes4Y=;
        b=cBK8+ORN4Xm5bs76Or0WJqAusDAsPd9ugBTCHim55g5C/4A3oUIwMDKiHO8OmvdRu/
         BoZplosbI0spegb1wL1HUNQaG5pCNHTAFiQBKolvyi8rLQKyZbkGOi6mzB/DpiuZkz4z
         t5U3C1FqlLvHbhQt2S73xZj8alGJKdk6eS7rDmWdUXA6V307WGMqME0GsJxgnN+/3q/4
         4JhaVlohoqjQ/Hgaaj5fBMKd8vwm8yt0CEanzty+jHWGQRg4rybE2I5jvCJVuZbKYyGj
         ADsNURbkRkIICwnKczeQEHuXXaEZSXC47NDbuPeTGuiyJaqdWc3K55ZOGJ4SfOXjTmzU
         0jAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510028; x=1786114828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7YUAfWF28CYZia0ko86rgI/yXiMxE4LGUbouzjes4Y=;
        b=s6r2irztPqkzsC2GpNtq7W27sDFqKLK0oiCuTZaDIIM6tjOf634r6XP5ckGqSty88B
         MOtGoz+4PDJedSuofgO3321/9KyYONjrkQzAmOzXWetUFC00o4B5ZR6a9LYkf3Ts0bs+
         rtW6G74qN7BGQp8kW7cVoVkzt47h18uZ2fCxWZ5FVFgQiQySBiqsuFCKHW7Ji/I+OlZJ
         KuPqLKEg0YHPNPBDviFW82LyAbpnbgWhzzuL26FqhDGy+ulkRto6U4wVh5dtW1KQhhrr
         bvO5IIkp6LIk219prGhUUPA9DSKiFJixXdAmpy4EwPEnrXshEWesg1NhJpygr0hSS21j
         okbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq77qY9gULs1N4EXEY0xptoVlEZlHxZFABADeVgZzerhL6MCC1sD0KSDL3Y2thoHjsZ/uMEkDzD80sTwBZ9HBokw0s4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9YWVj8CWgnbOhRjoAlVokWNsl7nlqKM5wmviGxQ3/p3xdok2z
	ksJkS6gVfLXuveYdJGXJIaj/JuXsfu2G7CczTbiMFquWEkyjCOwS8Pis
X-Gm-Gg: AR+sD10yFhXBxH0mHY/X5C1m+gJ5nTMO7n8MqX7sFPeguT7o2F9eSbnOtG5swfVtaAz
	TqlAmT2P9EEBEJyXhtZn37+PI5mOVoFXBZkCGP70WJks1talH9FGGwjVxy+VCLSI9B+19XJWLBr
	JfeIBJFgmC+/zvHlbn8tQ9dP2iw3TKHyF+43k3dXcnf2goInvhujOoDMba+0ZS9hW+7dP5sgpY1
	flq4XQsOd+C84zvcQA2mmYgM0EvIb43PvjlzkK9PQu/svT4Y4CUDjtUG5XZG0XSauHqRYRKrdli
	7eG4RkfwWi2JrXGNGIEwLlBpSpkVLYktqYG5zWbyvtmqvTG+z6zZiuYgjjduny8ds52O0FsGYEn
	xpfLvskyIX3z3/NXO9nCoiTckjmMmBIPihLIsMyvV7D5eEQLUi2Qn18LrEsDv5vnDoHANxbqgne
	NM+cEfHwkFJSYqEjixQDdyp8HneYrFQ1azPFFVObKqE4FtMUc09NapPyzWDgHMQdcI3A==
X-Received: by 2002:a05:6a00:802:b0:848:2f71:b657 with SMTP id d2e1a72fcca58-84ed71ab465mr1914520b3a.66.1785510027778;
        Fri, 31 Jul 2026 08:00:27 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39ea9c50sm689194a12.27.2026.07.31.08.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:00:26 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Azael Avalos <coproscefalo@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: toshiba_haps: Remove unnecessary ret in toshiba_haps_resume()
Date: Sat,  1 Aug 2026 00:00:07 +0900
Message-ID: <20260731150010.1025556-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of toshiba_haps_protection_level() is ignored because
ret is immediately overwritten by the toshiba_haps_reset_protection()
call.

And ret is only used by the check, which has no effect because both
branches return the same value. So remove the check and ret, and
return the value directly.

No functional change.

Found by the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
The platform/x86 patch of the treewide v1 series [1] is posted
separately. You can find the Coccinelle script in v1 [1].

---
Changes from v1 [1]
- Change base to platform-drivers-x86/for-next
- Filter only toshiba_haps changes
- Remove the unused ret variable
- Update the subject

[1] https://lore.kernel.org/all/20260723184538.3888637-1-ekffu200098@gmail.com/
---

 drivers/platform/x86/toshiba_haps.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index c6633b74029f..b2eb91929d1d 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -244,18 +244,13 @@ static int toshiba_haps_suspend(struct device *device)
 static int toshiba_haps_resume(struct device *device)
 {
 	struct toshiba_haps_dev *haps = dev_get_drvdata(device);
-	int ret;
 
 	/* Set the stored protection level */
-	ret = toshiba_haps_protection_level(haps->acpi_dev->handle,
-					    haps->protection_level);
+	toshiba_haps_protection_level(haps->acpi_dev->handle,
+				      haps->protection_level);
 
 	/* Reset the protection on resume */
-	ret = toshiba_haps_reset_protection(haps->acpi_dev->handle);
-	if (ret != 0)
-		return ret;
-
-	return ret;
+	return toshiba_haps_reset_protection(haps->acpi_dev->handle);
 }
 #endif
 
-- 
2.43.0


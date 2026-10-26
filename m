Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003453;
	b=oPx3cW6ELbVNN2wb0Hlezu7mQf30BaEQaG3Cbc9GLJ4vur2L4S76p08FskcDtQIkPEAU
	 ThEsNGow+yUYZyEci3igvEWgDNfiSIondza0H/vd0OCcXAm5P/DUX1W8mzOuC3TT/TaTs
	 /B6IloKNgc5RGw9O+UTsMclovBmxwK7CTbimZE8pr7ZE3yxL3wolvtz30UiZrMQjgAhLC
	 doMcJUj15p1NrrvUK8o1HFy6zUaeCnSUiR/3JxL6/iWdRU+RfZJVGoXrFv7Fd9LKwB+UK
	 LYNZ4DrtWFZ9AlzU/bnjZ4s4wxxt6RO3lbLtDd2TVXhCzELoAUErXxpN+L4z5hBx2dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/7TxP0v0CwRMpmnuZd6/tuNx/k5bWUFvFfdUCTCmnjo=;
	b=v1yTQy6W0rL500m8b0YgdcH0pnO57/JP5N6hBNMPIyO3QOl9v9VAGChnpnpEuFwb47Pi
	 yZXzyWX8gKVCIM1isG+FjigD5vawJ78KAc7Zc1pWqZB6Ia6CRGITgHNr5O8VCP5eGfZBh
	 Y0sNjHWxXElcQm4hDADrQI8YbVMGHWqzglsfzXbs7cyh5NPk129tfVz9MZ9qk9RO727zj
	 vKdjsgBm1JrurZodxp0iWEliyteNfLyg/MgayxWqzZx7cXGb39l97TGAqI0ITWmbMCNoU
	 E0KEOYzCCLRQS7f0q8vFR1kQyEVKkjd3eQ/5sm9N16QgsCRJuOeivGtZG+qXE8ucAVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAvD4XZE;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E41606A331
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 08:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E41606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qAvD4XZE
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e812e2b31bso15583735ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003452; x=1793608252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7TxP0v0CwRMpmnuZd6/tuNx/k5bWUFvFfdUCTCmnjo=;
        b=qAvD4XZE4lDyXVZfGlRec+31mDHK+yBDOxa07rhGV7u1dQaJxSweK/VxGCqd9NM3Kl
         NUNqYwtczRP0TAiTVQ+znqCAsrLArktdEzE0YIGwikiCGpRMMofQtyJmHFtppmVvea0C
         4YXWB/kMpoaeQwSKnZ51sUKb+1nxqVw79gUs9spBZ6goknRJYWqYMNTO1Ef47F9xsYFJ
         ycjDvpttjYP/bHhyD0lMhYiDV5Ejtqw9+a5AqEzoX81AlSrMP2bW2wze3Kvn/0/TKXz8
         p/t6nhvUk+trz7t+35jX96tVyJ/uR5C8okZBOGpQKXgDWXKL5puJibdjiQ42CqUZXWId
         BHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003452; x=1793608252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7TxP0v0CwRMpmnuZd6/tuNx/k5bWUFvFfdUCTCmnjo=;
        b=eSs2YNu7ZwRaSaKKMxhkYsHMJh46XLGj49gr55YUp15ZcVIqEJnd/petKBX35X06ok
         9tVJ1CjKN64QZp88EfDILOER4OH00TGQ1pzza8w6H5XCG8CrzYWFhxGyPwl0IzugiA8y
         D1CdRALBeltedpZXqNzEU3GFWV5lV8VsL82GeQX0gKmS+z6zXxs6p0+yj3xwLgw3xXb6
         N69AwhIkhsrklZeeKF/ET/Fm2A78XwOi3ER0fp/zcmTgZ2NukVTZHDY/rfCiy8/ZSPH6
         2uPAfbyUhC0nFZy+1kyKgMBS/E3JtXypKP7sp0qE0CnX5weZAi6UeAAHKJSDoYRouMau
         VKKA==
X-Forwarded-Encrypted: i=1; AKwUvBzNoEZRrqHde4QToU9FxmnyZpORlH7zKC60sxLNJqkteF8OYUQY5nTLCp+pCVFSuKsd0AO/aWEEPKBWjaD3d7KXT4nR@vger.kernel.org
X-Gm-Message-State: AFq9FYIBN0oHsjqO2Fe9MlU7UYnwEOIPi45m6jwt/+QP3RyNpyhtNxcR
	Cx0ysHNbFAMpFZLAsGw5BJPuk1u3Qytm6XHHuXPhj76X/pS++3C5hBRC
X-Gm-Gg: AYBFou1op3W8kNFrtjnsrXIjy2o4cmQlY3P/S55IRu1q6BZK+afO+qurepuH6UskYCI
	6yWi/qchy4WO9cJlnK442DC8kHoJtJ+o8yVY20kdWeK7aTAGrrR9x/LWQpNRN/vR2ELTXkuWKJx
	KKOA6Twb2QLSIFYNEO6nkMM3BVGkm0M5PxRdxvn4Lnb4mmUTk0RvTRl89uIu+qjFsfrBLB46mNy
	bCV3HkRuijlDQr0n4c9xeDXR6RDx6Tko920gP0R2foX8NAVJNKa97Tf3sf7M5taJ03aqmCDhWuB
	ukILcoVFRRXSh88IrhJOFIMcrrFYTbmLxx1lwr90rf/ejPV4YlHHSxhr7PdK/2tZlL/aOQfqgjl
	r9x0Bn0Ye19wNbwHoqlEhWOjuoCXCA+P+cqWbBDdqVqoCvJDDc1V00Ql8KHf5e1lRrOATzvhJI4
	o9KTeMfv+tml7avm8gmKu7HsXY82d/jwsxrONhA4yeqDIwH7uWzlMidPAV9FFehiqcAhFYiSZfz
	fdik1ev8w5W0hW0+RD1WqYotafnTWGns8Cyo4oqd5DSAlFlvmO3rw==
X-Received: by 2002:a17:903:b85:b0:2df:9497:3c89 with SMTP id d9443c01a7336-2ea9c953f2fmr49737205ad.59.1793003451901;
        Mon, 26 Oct 2026 01:30:51 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eac37ba924sm5584415ad.49.2026.10.26.01.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:30:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Azael Avalos <coproscefalo@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: toshiba_acpi: fix UAF after IIO registration failure
Date: Mon, 26 Oct 2026 16:30:42 +0800
Message-ID: <20261026083042.3982005-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When iio_device_register() fails, the error path frees dev->indio_dev
but leaves the pointer non-NULL. Since the probe continues, a later
driver removal or a subsequent probe failure can reach
toshiba_acpi_remove(), which may call iio_device_unregister() and
iio_device_free() through the dangling pointer.

Set dev->indio_dev to NULL after freeing it so the remove path skips
the already-freed IIO device.

This issue was found by our static analysis tool under development.

Fixes: 98010f1ea0cc ("toshiba_acpi: Add IIO interface for accelerometer axis data")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index a0b8060836d0..7a7afae0fe45 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -3493,6 +3493,7 @@ static int toshiba_acpi_probe(struct platform_device *pdev)
 		if (ret < 0) {
 			pr_err("Unable to register iio device\n");
 			iio_device_free(dev->indio_dev);
+			dev->indio_dev = NULL;
 		}
 	}
 iio_error:
-- 
2.43.0


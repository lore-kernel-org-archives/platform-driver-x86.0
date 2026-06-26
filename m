Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D563B38AF
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496899; cv=none; b=hUm6biiVa9Zfhdx4dU3mnJwCZghjJLsXpOCKWRtp00uPs906AnGuPq7DAvc1T8rGK3uSbYCcxTswKAsCdgKaOTO87bbtxZXhp1HNG+yiDlaLiLaCwLfY7CSIxBAKpkFP7YYYPaQn6UotBXXxjfn6/15oDpm1QRGfFlkwv2IRgvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496899; c=relaxed/simple;
	bh=Ti4xAK0aZxKA63iDkpRacsZNVJcxpYm2xXoKrIgaHrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGmUNnzkXqfm9Xgz9mJRfH5jtZtrBIIFRO2JmMRbPK7AblJKois/VLSJZlVhMypWgSR2q5anIrVhwTcAaRfAjvah2+lyKpBR0AWZ+UIGk/cTXa8Cfpxf2ZxLnO8UT/TsRKdDjcCJkuVrs7DKQWRV/rH008XWskldVJ1WpfQOfak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GvWT18eO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GvWT18eO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b7866869so10665945e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496896; x=1783101696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5F56V6TivwoM87mZcUfN4olOBk5hmiDgGPcNzNgHJ4=;
        b=GvWT18eOrS6ctLf9AJ/2ueAtxbdpGdejyz1TgYVOMZrJDLWe2kUNHOwgSZ6RzuZeig
         TpwhycquIRBgKVaUXDDKQZtx4YLABYfLvTE7+N7gmwPdyNngf0PhkL9qEAPokNDyUF2F
         l4THudifeVPIw6j+GThoKhBtZgJGeiEX3QKSrfD0IAhkL8NH43XlE1ti/N2JZWU9YYnj
         FA6Gu4wRVauJT5sAE/Ehzo/AzobWVSsiChr1EFzujCYLycf7Cgu7YY22kxd62eCiwypy
         SJjDNA2cTjBgfSiyWj4WVLXbctAjoPqzFCgbNlpFyy8GaMIdr3vByet5lVoXlP7BT/9B
         CAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496896; x=1783101696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5F56V6TivwoM87mZcUfN4olOBk5hmiDgGPcNzNgHJ4=;
        b=T2t2JPYVx2AkVOvYFmEi6EAZXqMQrJlco5vDU9n8ETtHl6Cs0ILbKJyORaZK+f+Kaf
         hjFwPQSUpjDdWp/APm1zwOvX+O7WLPPvv08JKIWvm1tkmtZZPgvbqolMMzRgZVWaLqkE
         8omb5fCFsOhTvIa0+011fcTGhxiQ/eBE5uzkMXY0ckxf/9f+DfctddTP2uBMBQO4VpL+
         +qga/oLqnsJQu8rG3FbYa+7DAGk5ajaNqL3QcNL2Xo9bpWcslYjsUEibBdjXnsNLW0y4
         /Y49rExf2l08UozK/urlc6DJCQgz4a2EOINB5q/X1smP++yZcwXPrVnfcX8X0FKTfpCv
         nSyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dRPx6LfbdXP3mhBTQji+s7qi6cPCY2uBNQMQ4oYAGDZ9Qjb7VdDy3IvUmprS+MbTUAV2v7PfRjkhlq6mrKocO0F/1@vger.kernel.org
X-Gm-Message-State: AOJu0YwrUiYF0H9qf5Vc3OX0xDviPAwhWmXDPa02h3VzMlAeTBj8gEDz
	QsrpF9zSGe9E9Sgonidkf47R/Urmx08NqGGT504Iqp6rqQ7CthVxiefETHH5yUpFIBU=
X-Gm-Gg: AfdE7clQfsGcK9CZcHp2QP/hpXhOrt6Tc6038e+Y4iucj1CQw7S8vuLOEduY+vOMQeT
	tEbCjKJdnim4LPYGbYYQIN+eUGWaX1yrTFEXL9TnBYeqDHN5rgWYCtOeoIgKg3uqIInb6P/OZVs
	N5Tyk9XVrtu+lCYTJYe3OQ+NaL6B5ISTSv/umuKdtw/7X+Q7+wn70jgb2mjkFBk/jUMO1Uqe6x9
	HNflXZJgR2XIKisi2zo+ujc2jLY5k+xbqLDZOaCoYWYrTqX2sJymBguFUAazPJlJNpg8fdiLUd6
	V/2bmW/63jnpGGNpbUaAP6eFEtYA0yo4TiwN019EJs1CEunwBxkzxUQLNfotZv/CxOrQXcyJnrw
	yXmuvgBHyxrJDNniWgItZ18Oe0UzB3YsT0fcPHe5m1TRTSYrwPtLlYrTP+wMs703cEfplAboCYg
	dcw8yMR/nq+4NsYjhcknPogRLiaH+2xHXzRVvYZh2mnmkoS00bDqwHgahn3XXXd+3pbX2Hyb7Ti
	71Q/eX8sCgPTSQ=
X-Received: by 2002:a05:600d:1a:b0:492:7083:e5a with SMTP id 5b1f17b1804b1-49270830ea1mr14837125e9.31.1782496896302;
        Fri, 26 Jun 2026 11:01:36 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926c286442sm37266555e9.1.2026.06.26.11.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/17] platform/x86: msi-ec: Ensure dmi_system_id is defined
Date: Fri, 26 Jun 2026 20:00:26 +0200
Message-ID:  <5654e3022e4fc7514aee3c2d2cffa892e7f1a24e.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=942; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Ti4xAK0aZxKA63iDkpRacsZNVJcxpYm2xXoKrIgaHrs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5HFar9yKniEt7Uj1aZaYmkcaxAfnKUWRVNb No3y90xkHuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+RwAKCRCPgPtYfRL+ TtNAB/9Qqx+B9EWO+OInQCtHMkNzGEWeawLU//jAXpr8xiYycYsn5Ao1ysltCvx+tseBGQp/HIy pOdyaABou5dldBzWlrVSlTKPol+bgFF9VGqa834T9gLyn/tFeciOkiLi8udcYUA8n/wbwH7uVkt U8jG5GKdEnSZbjtHRsxFo9x3qkM+icruJL7/qRhD4ERyHvhhIz6Y2W7bRlygeiIkw0z+PkrR9xF +dm+bFVvz4joyXT1EaxmtA1+lZ9OQoiWjGLDhfJbmN/aPnuCXLdOR1/6oyKr6byFAc+aysH13O7 Iw63Z0bhiyXnOoyrXZNX9/aOeBfLyLTmkCRb2FTqcjU2UQTa
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/acpi.h> includes <linux/mod_devicetable.h> and thus
dmi_system_id is available for the driver. To disentangle includes
<linux/acpi.h> will be changed to only include the header for
acpi_device_id instead of the full <linux/mod_devicetable.h>. To prepare
for that include the dedicated header for struct dmi_device_id.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/platform/x86/msi-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index f19504dbf164..ccc7c7e467b5 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mod_device_id/dmi.h>
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
-- 
2.47.3


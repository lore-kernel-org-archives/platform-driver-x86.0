Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D95E3BED23
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 22:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782684006; cv=none; b=B8bck27MAQVhAi0R0lU38R12rfC5YFjAs4aoCUdF/77wfCY3DRPh0HGDUzVAbZGijJwi+I/ZbVQBjh+o19OBU2DTj8yDBwoF3R+owgT8R5xxKKWR1zwtJHz+iR9oX+xbUrceXuC7CvDhW4dEDxSR8LA0DIB2RnHemdfziSGZ85c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782684006; c=relaxed/simple;
	bh=xDf6QYT/CUeUtiHRT7c90bmfJPrNQggoiFQgcdjQiLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fup751Aftk0occwPuVfn9BCsJXfVpJ/aWOZxLYF7FTIL8mf+1EKEPPlcK0tPXxv7VyCKlsN0hAmk5clS/Mqbj317+i27uN1h9buO6dKjKT1KsmATQKbiLZ7nWK94fzdutZE/uHjjTSaZGJfhzuLEtj0EJX93dnF9fhpeRJgb0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GrVU/kR/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GrVU/kR/"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493a613571eso6691565e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Jun 2026 15:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782684003; x=1783288803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sjxYoRpV/RRQ4RWkCzzFONGZhH7ViiTBVaKBG9/Q2s=;
        b=GrVU/kR/PKsfV2F5A5KYJX5zjSI6OomUgeOVxFBmYqYewAWsQMQV8lqul+rALtGErz
         4wE7HmyViCcE4MbSUKPtuiWfrTSGKvCWG977+Aau4JiI320xvKDWCDAOlZjxVfIOEtXN
         s+LsEQrNTS7NReb6Mf3IgNT09ZxKUHbHtHsRY+f2opV/Dcu/sCHM9l6S4snaC2xZ5dPL
         cUxbAN/E6zgROwu3I8MZ1XE8f17nBMtJnjOF6Cqnjl9+0M9Gyb7OWg2ecHzzWD8yACub
         2Ow67HVRMcrNxCfBePOuGkOGPt6ukqtm6whP9C11NSqjEdVDzIOencAJ1Xti2msqxGNv
         M/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782684003; x=1783288803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sjxYoRpV/RRQ4RWkCzzFONGZhH7ViiTBVaKBG9/Q2s=;
        b=ntWzs4A7ofiXlyclARCgt5CL9zxo+n5OkVtKPMka/fJbcFU7YQfEjgv9YJfmhAeD9s
         2wq6huI5013cQLCajnJgDxR6mOd61O8lkfFTRyN56KhNf+g3LQFB0czd8BHIIKplm9qL
         E16RGMfnhbWp23Cjlkqv0TuRvM2YIxwXd+u5dlw4LnKGTQ+M6UFadZwL/+C/DBBXgSmE
         aEUjxhX7I2t7UiG355afgwyM3io1QFCTRvaSNqmGLOyGr5SIEquiWnNCKucoP1rU1ySZ
         ybKym03MDrtOHCVD1Ekm2cUJV6AEXqoXs6dK0D3QyGjliHJlPXXU2r7XSBivO5hpfIBS
         7fcA==
X-Forwarded-Encrypted: i=1; AFNElJ+vA8ZKfYccLuTXy71cY3EJipCpQKDxWEZ0NqEWodyxLFhmgcT8GwwhpC1gRxa9bsMPebLkAJq9Y4+OZ4ABDSnC11e8@vger.kernel.org
X-Gm-Message-State: AOJu0YwriHQFYxeBhyq05DBT7eRM5iCCKgpT5V8eLaZdN6dHYk/1g9g9
	YqDApsXfKdts6IfhNB72aVjHfSeIAz0LnlohDbWiItH0xlcwLnWDlnNgIN/pAYAANvA=
X-Gm-Gg: AfdE7cmXsficLrXjKAj2nd+H/jevyqkr4jEgE/aKwobylPrtgnd1EJWCkzMV/eB2loR
	/InQSvN1dj1ZrqPQZHBo1eagN1eMdmJ+pixKvSvsqOowYHsoKy/ZXddgO7IxmegkSeZmf/LML6Y
	JNtHqeMlFA+Tbw9OiBJnVr1CTS818If/HF3acZJ1m4apl4F8fJnz1/rCZ5MM9fElkJLAuKNFXKE
	7g87RRnQtSMzHG/SUn1X7vW7FsDMdQqDsb15N5sLT17CDDH/SjRkP3K/EwNMF8yjvZLkjzbI7so
	TVLdqRJQRxGFdbtLxitWH70vkstnvPJSmBWkuOhkE0YUwr0DiGnpA28sQvb0a8aFA7bEA+1ew1p
	HFkUdAEbkfzYxQvlN59ok4MbKrbdmnv6CG/JPw8ZrLPU/6MJ17JBP95U6qx0EOo9GLfcNhpSMJP
	we0etbFYbeXthV7nJRQulI5dnhLiM1
X-Received: by 2002:a05:600c:8b61:b0:493:a966:d5b5 with SMTP id 5b1f17b1804b1-493a966d67fmr43673485e9.2.1782684003099;
        Sun, 28 Jun 2026 15:00:03 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46f86c34d76sm19744114f8f.3.2026.06.28.15.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:00:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 10/16] platform/x86: int3472: Add include defining struct dmi_system_id
Date: Sun, 28 Jun 2026 23:58:45 +0200
Message-ID:  <55c02bb0f0577ea1534a1969e72cb6b771b8c5c4.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xDf6QYT/CUeUtiHRT7c90bmfJPrNQggoiFQgcdjQiLo=; b=owGbwMvMwMXY3/A7olbonx/jabUkhizHmapFJVscJ01lfyxrMVfzUX5Tlv//vkNWtiaB/gExY TMSpcs7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIhB3s//3ubBGu+8Q7Qyn0 mpnMstllP3ZJn5iY6nTPvutUXpn1gsVGnQoVl/5Xx/beawwUn8lkeCxZbZZez3uxydxna7bv4fN I3fwgqkZwQbSNpOKlFwvsH4sqrj6baqh2QLj09csXb/tY7ZaZXDnCJMrdb3xMi6Wd0atxx/ULOo x79ykaPd9+yv6WlqudfuchKffX95e1LhXWy3R1/GTju5/FKEqGoernq5mrC51Eu9Tt+BKy8hbZb 05pP377p5Jvi3UV/6S6DT8+r+SfuUHJJfK1z3w5Tb1qlmk3fJL/iszhqkzTt1x3TPDV/mX5Z6VM d933D11QrP9184KC7X47bsUtE/lledA8OmNh2cNZp5jUAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/mod_devicetable.h> is included transitively in
int3472.h via

	<linux/clk-provider.h> ->
	<linux/of.h> ->
	<linux/mod_devicetable.h>

However these includes will be tightend such that only the bits relevant
for of will be provided by <linux/of.h>. To ensure that dmi_system_id
stays around, include the respective header explicitly.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/platform_data/x86/int3472.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 93f1e1fe09b4..a73841dfae27 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -13,6 +13,7 @@
 #include <linux/leds.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/device-id/dmi.h>
 #include <linux/types.h>
 
 /* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to include/linux/i2c.h */
@@ -72,7 +73,6 @@
 	container_of(clk, struct int3472_discrete_device, clock)
 
 struct acpi_device;
-struct dmi_system_id;
 struct i2c_client;
 struct platform_device;
 
-- 
2.47.3


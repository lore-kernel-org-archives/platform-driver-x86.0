Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142A46C4B7
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192487; cv=none; b=jdeYz6gGUl75FE7cS7VdYP9QrCNQZdfz5HjdnQ+o2xDj+HuwlHHnxaYr7kJ5+4M6fjOPzRFRFOSjzAI+SqoWuQ1hh7h7WerxxoY+kTLOyhec2OM5cKY3cYjwAVEEkvAyyss8/DsRKJx6As4euq4+Plz9acuTIMYuc1qy57IASeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192487; c=relaxed/simple;
	bh=rixrGDaEFtrVbXBwzSvfQXpzKwFy07ICwTeW89xWQtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XryrCp4yXd3KFuGoZjua6WSKwrodlz4vAHFMkNyGC/ffPGnrKUmqPAeqKk7tjZmFVl35U8Z6I9M9aOofZDOKdNacdHW5fPSlKrcfsvxAeXB0+/7xEvn5sT5u6dqYk95BkSs+MsRc0Hz7wbiQHlPlb7pen8qXfpDG8+96BEd6KAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgYnqY+1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgYnqY+1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484374f54d0so1025758f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788192483; x=1788797283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=sgYnqY+1nIN+Yy/JpGx+qrCC9cn/uyObs73JgKp/tkEZ7o4A0UMVzon4caTx7kbECZ
         5kDW/zxDyn+gya8srpoaUtB0XjsCNjZSv/F1IlqCVB6V10q16X/adnC5fPrvNjgRPkkf
         mnTDvcr85AXgZ6YVxoWOjyrCqAJf12XWXpzf9ZTtuGi3177igPeSn24dNfHAoZDjhJXo
         +DFoC+3QKR+LCHGu6nZFddSRrISlQHPoQdD1yGc6imjqKW8Znm+IpAESmAO6UaeFHpVM
         wR/gnPxwSO3uH4gmH7yGJOwtMWTCDTyYQUn2FNiAyfq9AooqblGytA00KxERZ5OpUp2D
         oy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192483; x=1788797283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=GfEm5WmHnUMnXz5KJXxLmjepy6TvkpZid47btbTiyKLE4kz+9BU7jQrFn6KBmpULb/
         kB2fDdf0ZkJrhdsCvt3rrjEiWsFlT14SaDSrz8Y/jDr7N4H1AKbmZUodFDvZ3jxNvASz
         6zWrPQVvER0BQ6gmuV2Anb81ScYDjGqRZpAFeokHVmLVv8StYM1qy8DUHTRPG58QEfvU
         scccq1XDxa96tlSEk+GEnqk+2r+e7XSHx2bDUtNRSTB8aa2bC0m2E6pSXqo/Z0M4pkpD
         N21XfqYWsiXE4ZcIlJMIcLHOmfcxKinLuirLZQqqtbizXi24PfQyGvP8IsIVji58I9eK
         ZRLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyRSb/JKiKhAzEKUHSShGXLpaQu/riTaeUf/jnFl3TSmJ9NGLbTCdm4OETBEzgamGymZWE7p+x1OtfdNpFtKRjQ7la@vger.kernel.org
X-Gm-Message-State: AFuF++mw0BZW+iu594cs9A0qROPjU5YC93bqlcJYI31wlcZQ+JIuF7zF
	MYQcByLLGfFcBaB07/W5QgIr4QaVoUkIuRNNVaCrpHZJ6hkRiYOwpT72rRB/9hQ2WwvxJA==
X-Gm-Gg: AYBFou0f0mYDGskQblvz+LvmqB303eBAXiheuM2IzRpUABaPjWTotij02mnWQrtu9X0
	CimXqtgzd+f1XvIlBG9lqvD0BCZRLhpnQImy3cPN/lIIrexH6VSboWW3IEDy2GncY/uds66X2H/
	3JQiuDN5FF0B89gcomLmDLt/8cuk1jcyZqdIqmBFcan5RvHTX1Ur6Vmu+xvj45B36HaqDeTOZ2r
	y4JmN/os/A48EPJb9h9z/JbVO6I9a6q/u8IcvkFRumcEXwf7Qm+ABFKG4NmeyoLdYSuTbrXkWHT
	z3wLJHYjaWr8ygrlixOTe0rzaM4gGcO+5aSQLmd3mgLuk9SJwTigjEHcKKftfuQ2cysvrlS9J3u
	Kin1Hz7TXW0V54KXzsgF7mzGMzG19+dW1qJtw4sQO+lorMrfL2W3x64OBEpBKTeE9nsJ61W9ra5
	XzyHIjUH4ac1unUDTsje0kkBkXhpqHN5y4DoL2zDPOVS5Ud/gAyMA6er1X
X-Received: by 2002:a5d:518c:0:b0:484:3310:710c with SMTP id ffacd0b85a97d-4844102655bmr3118067f8f.24.1788192483493;
        Mon, 31 Aug 2026 09:08:03 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:ccbd:b529:37d3:c1b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f3asm23849760f8f.3.2026.08.31.09.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:03 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v10 2/8] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Mon, 31 Aug 2026 18:07:48 +0200
Message-ID: <20260831160754.9857-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831160754.9857-1-tchatard@gmail.com>
References: <20260831160754.9857-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO lookup table loops in the probe and remove paths iterate up to
board_data->n_gpiod_lookups, which is unsigned int. Use unsigned int for
the loop counters to match and avoid a signed/unsigned comparison.

No functional change.

Assisted-by: Claude Code:claude-opus-4-8
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a77ed32ab..35909a683 100644
--- a/drivers/platform/x86/intel/int3472/tps68470.c
+++ b/drivers/platform/x86/intel/int3472/tps68470.c
@@ -149,8 +149,8 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 	struct regmap *regmap;
 	int n_consumers;
 	int device_type;
+	unsigned int i;
 	int ret;
-	int i;
 
 	if (!adev)
 		return -ENODEV;
@@ -234,7 +234,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0


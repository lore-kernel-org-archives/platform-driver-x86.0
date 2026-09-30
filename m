Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E84051FCC2
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804625; cv=none; b=G7bgZN0ApD/uLdgtMUHw1ROO5IiZgVjsSrEVyGJLay8wDjqGZlISStznaAwMEuaQoYTNA4/O1q+SOFpCUJvXKzYvMvjYtgk7hDsctyasibgbIOKwUX3aLSunsrWcKwcH2Pmc5rwNgqIdIS48INlhMMtphm9MO56NQPh9OW1NXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804625; c=relaxed/simple;
	bh=rixrGDaEFtrVbXBwzSvfQXpzKwFy07ICwTeW89xWQtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEggHAMv6S7xVHXLrSVZ4PQz1G+mRoclwDTd0eS1Ad7ad23OY5qUMw9nv+zp/Uiw1Imd0JDz79eljCrOndPYGRq1jrp9UGVZWsyW4KW8uzWo7G4UFYNBbj+SS761dj/3fLo9OgWctBYVEnb38WLIcK9/jY5iK7YOG2AOiaBNO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV/4KmoG; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV/4KmoG"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2c7eb3b8cso11490475ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804622; x=1791409422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=PV/4KmoGaHRkxR0mn4UdkccuvQ0/9zkU6s+rwOK2jRaiOOzn9u3XlimVdakiJ9Jygq
         lvNFzjRUh1EHP/AYnbAGyccjZAbeGrhFYR0cFwqbW2LJuc5B4Wb+4nkyWcL8XqPwxBum
         NcAt22HJ0vuBOVvop6lyKHl9kyedqwu+GE9jKBTg1g75FJ6F8LESsyglybA3hJuJt5SN
         la6pvpiXVhX9KZDeO9rZKzaiz7z1waxeUFafQW3wqHV3PSmhTHirO3XX5Dq1cVh1U2AY
         mJb4Sw7KSZvmvhCyld67uMIMstLopTNP7X+/0lfi/YwZq/JUR6mU/dJgQcHAoAcPhVkF
         K52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804622; x=1791409422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDP4t5CtJDB/rNbN9Zai4pex9QrrqfqlqT133UxmlQ0=;
        b=Ci5zpeSRXXXUaEY1N/ZTjRyVlQtR5kWxF3BEka+8cfmu5r03Chddskwc8W6eVpmuQJ
         aCqkz8/JIGJDwSrruzHmUPmon2XNRozi7mPDDaoxZoU3rq3vQkMFaCCq9HfLZwGK+JmQ
         pMf86qLrVMKE1amOvTb56IBSoG8OAkwMKIl7bRInKIOX1FmHvjxWmMyAIwI1Q3DOeOGI
         nZJ3kv9+PP5k7KrjduVu5au/x8dphW6AmKQCJfRqpkF6PHZvl1uH4gMGsxRoxpK9gwSU
         jT1Qpl/X5pP01Oa84FT96GmnynCtdeAypvho6gSKpM6s3qt+O9DPsRv9AEwi1pxrPiFA
         7BiA==
X-Forwarded-Encrypted: i=1; AKwUvBxyFjCOrD5mL9oStRHo8X6D5P/QMv9l4tHTSLVW6kScXKsmcU8NL3K35Wybh2SGFBWCDaroO5ObZmK64mUPo5csuZRq@vger.kernel.org
X-Gm-Message-State: AFq9FYKmUwrEc5C5faXwYgOAS3arg5eQ9fj/UfXaX/RIv/8g8K0zs6eP
	9JlW0MNEY6knN95s7SlRJzrmwMJKej9YIyM8VGeLyyl5qmQ4VJZj4LqnvAAaJAS0
X-Gm-Gg: AYBFou1EUJmjexk76HJMdRXu2CGEw3VtiNoIXsvIYRg0i7H+yNafLUdIijOAQuN7O7w
	/ikCt0bg5DM/2ohkESp9IbS2Uz2h931xECSBFkXrTMpXwQSlyH+RG5N0s5/+d4aihlaSCBnerzt
	VEmyrOWCsltzUdU5K6i9frU8n43i7kntcb5FNO1n8cwzPcBR2SxSKOquXVOvgYy7EIubeTuBPlf
	UbaosWiCRwHWEPjgLaEdmousa0J45zOVAEDP/nbczZtalbu0e4q9NFJTg909ivOhzVUOa07eRlR
	PdIh4UUxEhzuA6cLUl5udrbd6fHiPc2Du2mcCYsxeAIhvU1DEOCXJT/8PxkY/AkAA9EhbyppDyg
	O9biL4tfhtBOSMyVpE8oMjlVkSm2DyGhzQwJLKPuYRxZVNZlVV9T/kxeP7vLW1XloqnDMN7eqss
	R4fF2Yqtxjhs/+mwaQOUR13nWcOeljroG4ejOlik0Ojurhx+bzsfYkQP4lw3G7/BWfZgk=
X-Received: by 2002:a17:90a:297:b0:3a4:d883:3edf with SMTP id 98e67ed59e1d1-3a4d8835ff0mr1175083a91.9.1790804622483;
        Wed, 30 Sep 2026 14:43:42 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:41 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 3/9] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Wed, 30 Sep 2026 14:43:15 -0700
Message-ID: <20260930214321.600863-4-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
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


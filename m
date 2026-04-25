Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A352BE7CD
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777094066; cv=none; b=THddcGV+6b23mzI37RW91c/fmTtsCf5i5MVhi0noVcfxXiX2X7RrN81nTFsFecBnoYr3gJgOd5EnZohHKGIH7oHkQGnQOfAj+ET8dc4A483A5TiSNyUFk2GRvBkq2i5k7BaOerxxIE8ORocy+eT8mY8/XxS0WDWbSvwltbIJo5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777094066; c=relaxed/simple;
	bh=JeFAGlclU046JIgSg4OVyBoSGPhLkEXsWzJ0ES221g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6EuPcdbF9Mc4TDtffy3aZ0cKItLL9+M785xsFzA4WxU9HPaz8T1M5eviN9RAcVoQguj9tpeeTrK2bT2KAWm8yPM+K2c8bHaQDrNSZlEPssjqIPMiYFW8hWLZj1ep1bdaLdR5vqdFf8Wqj0ygbeKIJ3U1emI+fb2Xf0ZBtAUM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVV1R5+G; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVV1R5+G"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so2289136eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 22:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777094061; x=1777698861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=SVV1R5+Gzq15bpmV1aPLDHLsU4agB3GI7Q+b4K2Oiyi29MenjdLQt4dQ338YBy06WY
         eOINBK1UXsfwpKDHI+cIG/st4azyzyubBql9kQKzfIQ7EMjFuGnNi/udoH9FDagLBlXw
         zRDdim+fOExHtBcMoFCIFSh5k+0h8D1h/lMuDYKmdKdn0BNBBMpjGZznvhuP9UlGvTBM
         pRz33W0MiRkjfhodHinzsffA5hm9LC7fGugjpjAwssIDvXJR+WKtg889ISrNHYLeXowK
         xNPI0vjGAwptRE09samJN8B+k+e5wL8O5zP1z5jo+AqOkl/B3G43zDiVxIh75uXN3PGh
         Bc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777094061; x=1777698861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=tE10h5tQ2dMGzNAzvJR5vmas5LMj1KPuS9M8ic40jiIrVwYkC6EdD2SXfU1YPn0bLz
         ThQSVZL8k9ZWB3iePq5H+kG+qGx94ZL5l2auwP0lTTQF7ydRHlcj2LK/9BXk8eExwAy7
         6NYwj9NCni0azQI+cDc4iG/uh7Ja4h3t4NyzqRY4ofGfwgMFD4Sx0iOK9LFjvqjctopc
         wSi9xupm+j2ioE5g/3JS20LE1EmfNUPEg/6w6eqnuW18JL12P0aH0/ZI7vFmC1YJq1yT
         NWtL9EqUJjc78BGyW0WvWvQV+WXOOwxVGN1lMbZ+LxetIcNH5Ww1oXuENlmTriptYYs1
         K4BA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZhWgK6MHSrFvZWP/BPEH4PLU1Gz6LrZal1xNH6T05SEsfAlLxNYsp82S4tio6FPIY6H0WUuHusY458YIkbJxgZ7FN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9se+KjzkLF18bmdfhxMPBaixFl0vEWzzfe4AD0GuubM9/QAoD
	jiWh7l2RUONkjI81NKEGrkuQTDUdEWIjqteCzR2ntrQ7+g6b/2x3FNPn
X-Gm-Gg: AeBDiesyMAXhDXEwkNS//kxIeMRMyHtdzPuMrOoL0UPUA1dLbolwJdOA6btEk9BCTuK
	PwMGSEaZIIYMhNHmWn1u2dq4CNdLVu9mhhW3Jv1nSzeB6DBx1+CScjsyiixwMId4HI/9cyeT2ur
	5W7+q5itdOVELGoFASdJ5A83sE28/bImHFmIuAuawq+8ROA0PQPgAa3rUn7Q9qq6WZ/riLprIJu
	du9bjiNpkW5WoW7QcBlHN7sCQ6W9+X4VgSfV13UupDhbfi+eH7yfue6scdHAN1uchq4o4ciVDyh
	EFP4DPWnA5FswReHYBtBju5RebjuBAWGZNAqB/kGJ8aPPsC1gj/KUTo0c+n0K2oJyhMLEHx+uK/
	4DEW7WKWeVz95bUbTA6kqCK70JsUF2NPn1Dy+ax9jpWQFTr8GRdO8/4gQGOoX4sqnSO0SHnw3ff
	ohTRmofhTkFXY06gIF6+wBMAqr4lfmXtTywPPB3Cy2fUNB
X-Received: by 2002:a05:7301:4586:b0:2c8:7172:3b7b with SMTP id 5a478bee46e88-2e478646190mr21819283eec.18.1777094061175;
        Fri, 24 Apr 2026 22:14:21 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.142.131.45])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm35973806eec.13.2026.04.24.22.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 22:14:20 -0700 (PDT)
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
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v5 5/5] media: ov8858: add ACPI device ID INT3477
Date: Fri, 24 Apr 2026 22:13:42 -0700
Message-ID: <20260425051342.8960-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425051342.8960-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425051342.8960-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

The supply names are reordered to dvdd before dovdd so that core power is
stable before the I2C passthrough opens (on this platform dovdd maps to
the VSIO/S_I2C_CTL regulator, which gates I2C access to the sensor).

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..a1fa0be52 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -79,8 +79,8 @@
 
 static const char * const ov8858_supply_names[] = {
 	"avdd",		/* Analog power */
-	"dovdd",	/* Digital I/O power */
 	"dvdd",		/* Digital core power */
+	"dovdd",	/* Digital I/O power */
 };
 
 struct regval {
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.51.0


Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349E35028C
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883508; cv=none; b=ZbUOzSZPmDicOnyulKrxs9KrAHZL5WLK6toPbg+UoxWKZG1SGgeQsK9t3jONo3TqsVn0OaPlGDlaMlaLYnsYWiTiRYWEdJ4ouDkalzCkIhdZ7+lLZ0R47ZhRragogHwb5m4S3cq+/+R1qnyNSJZjpffya0b+CYyQN9vH11wcu6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883508; c=relaxed/simple;
	bh=OUxOe0sW+QI2+/asw+Rm8pPJ/9U73JyumcpRZT5LkIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nX6+DiHJD+8oM33TaaEqJsWOccKd1iTbjA9F0XzpAjlDT60dWErBzWEI0NZos0jH1ejSC6DmBEqCnPXo/WvfysXVnN2BsYOfAJkACURLObI/LFlTNymqFeXqOk5oTXBxwgycqHFEqlh4xd3Ipo5zr8OA1Ti4RaHHgA2My7uzwYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXdX3r/f; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXdX3r/f"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso10242045e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883505; x=1784488305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frDoO0Io/dnJJiitJ0VcVtCpsSSLpGhnyEgqLZ2vYe0=;
        b=gXdX3r/fup37VbkseTLFtTC+a7XI3hz4PceXc73FPqUUjCjGMsrkd2B0BpaDYzyXyt
         O1UL2j0Y2+ahDibPy07TY/1HYv/xZE+18rxXaJFKjpGOfVZziiEmv3kkBL3TZkMA4tIy
         qWMlO99ZmKh7dyRQK1EY9//j9Ndzlxy8nFnZsJGPgEaOeRlYVU4wi7ccO6DHyIvSX/WA
         Fu7+N7SPQB9UH16J/UDCIATVthl+t7JK6ibC6w6wHrHAqr9BBki4FxV7ekEhg58m5COK
         GufowsFR/fjAWTDI+gItKFpi7u3PeH4NONrp3kkTlIGJ/sujaLb+Ta8O71Ir9ChvXkPy
         e5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883505; x=1784488305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=frDoO0Io/dnJJiitJ0VcVtCpsSSLpGhnyEgqLZ2vYe0=;
        b=mdm6bQduKCTR07xGRxffNQp+VTSSyDpwDAK86f3/B4tv9ttpfRJB+mI9t99a4nMzcE
         OKER6fT9t+4KNY8tW4UUQJ/LIqlGyeECEjEk1B2Rhr6FG12e5qdwYE/tcC4Bek1MwfHc
         uOTavObF/xP0onHzVNiHLnZ5EuPi0datiS2q3Ft1oY4GaWo/8Xd1EB92owx69SIgiElW
         ZRdnOvizmNxHHS5jtyBjyQz4njmLzDwjeMXAKayXs7NA3bd/pl7ZX8GnrjOExRrx6F06
         9vn5jAbvr1ciIXqBCfxu7Eltl13EBzQwFIxwJAZ3xXdHcvJw9qxlj2dOYGJccZ2BtbnN
         81vA==
X-Gm-Message-State: AOJu0YxnRJP1UhxdxG0ATMbWcd6/Zebfo2JD+Q9aL3mq8LLCkyQ86mUC
	69SNI8mOTrUyoesmGhugbltc4S/QiH42qbB92IFf0MCgObHApyDwhcMd
X-Gm-Gg: AfdE7cnAAArWDn5jSo9yKaB9MI95Au9qjumwnRPnShdFlo4bj9HRGxfOX1mkXbxyF92
	3h1dpZOjPDoGZcf3nQwgkWdchOUC5welDxnAobZV+R5skjdV1W1kj5uRmByh2SLIKlPk4yUT7dT
	fx3b7S3FaT23Yc2ax5weZ5Agmon/GQiFZWdoLA47nO2H9vJ/Pq5OZNtiozP+ntBtldVCj46VIVz
	zer81CMwsjMHxdTwUNsUOnKMm1WC5O3OaUiu031C9fGEVcJW+DsFh9Po4A+OjGajcGNkKpAMsyH
	0ppRk7UqUtnDMukNURJQCLr4H0O31lyGYFeOdStRQRrXh7uuJ07zV47JtWYki0Lr287KpZmC/eY
	xQvXHh3PfTAtMAdXG+7MSNfiq5WHrSZBh+H8X2Zy+Cx+eY3ZyO+OcViP5nxnEjgYdjZZv9v5WGs
	wx6SqGdQBpWl9O4A==
X-Received: by 2002:a05:600c:5487:b0:493:f534:3e73 with SMTP id 5b1f17b1804b1-493f87e6c80mr68785845e9.9.1783883505167;
        Sun, 12 Jul 2026 12:11:45 -0700 (PDT)
Received: from user ([197.197.151.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm234468265e9.0.2026.07.12.12.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:11:44 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH 3/3] hp-wmi: move from kmalloc to kzalloc
Date: Sun, 12 Jul 2026 22:11:30 +0300
Message-ID: <20260712191130.41183-4-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com>
References: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

hp_wmi_query_perform() currently uses kmalloc to allocate memory for the
bios's response, though this creates a security hole pointed out by
sashiko that when using kmalloc, it won't zero out the memory space, thus
leaving information like passwords and other important data.

Reported-by: sashiko-bot@kernel.org
Link: https://sashiko.dev/#/message/20260706143855.35002-1-yahia.a.abdrabou%40gmail.com
Fixes: 4b4967cbd268 ("platform/x86: hp-wmi: Changing bios_args.data to be dynamically allocated")
Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 3235ade2fa98..f120900f536d 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -593,7 +593,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 
 	actual_insize = max(insize, 128);
 	bios_args_size = struct_size(args, data, actual_insize);
-	args = kmalloc(bios_args_size, GFP_KERNEL);
+	args = kzalloc(bios_args_size, GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
 
-- 
2.55.0


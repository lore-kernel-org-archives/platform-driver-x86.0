Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414E3B52E7
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 04:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015530; cv=none; b=j3vTaFwprOMwo5g7kTE24Q8mCpyP4zT4qGcN0xdE+HIOIV7+ShLiwJwVqn7rso6QoAs2F8FT7URPh/7AgkbE2P2bKw4zA57xMOQlTsxf/NeZFksRl/Avx1InNlxD886nqgdDk1ICYJX8ZgFu+LH4wKQ57mBgTXkBnaIIntASRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015530; c=relaxed/simple;
	bh=GguvofblmlkGFhRXYjlruXMPkjm38VI8GEfkm6dGqZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvB4+B7RbfrGKp5H8MjcSsjw/1u648xQTC6u5Q9EySbkrSj7Jk2MtSOxvBhHbihOgRnAPCajoZGTzNwIRyXWjlte+iLAt4iveSIG0SKEYU1hdig+eoNj/4XtnmjAEr/FtBPq8SDW0VL3TcKqvVFOdj+BMAER/ym23xXM5yr0/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBrk3plc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBrk3plc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db18e5cb56so66726955ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015529; x=1789620329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ky5nCya7YcZhP45fNV0+AfxkIQRsXMatVpL+WCCtou4=;
        b=nBrk3plcodQHk+9ueyEXGye1aF/s1J9ln3SXgjjOObmk20aT4rG5rmMBrplFE/0zFE
         KLg5rjXlGotLnAZmYvBN69o1/6j8yZ3RKQnJaXyR3HDqFvciJRRZxHAKKLBPhkm6Yc7S
         clDj2A89zSYGgrNeEDaW9w3YwsQu8W4wYeDTXTOgWSp4kb84VwbkR2ft8yd9nQGqNq3S
         jO6tcAawxCzyKWVwO3ax3SPrgEjFz+vfsjG1KO3tWtlsizz9Q6GuetpqcldDD/VZJquI
         wETcjams7Gr+mcIsXqnbZLi/+WNFqpqC0c92NMqDF5hLQ/oOxxcpHW3SBbshurq3YU6p
         zFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015529; x=1789620329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ky5nCya7YcZhP45fNV0+AfxkIQRsXMatVpL+WCCtou4=;
        b=AUjRhObWJ8UcPACae2/hAjs7IfxcAt6Fj7d61MHvh2rb6uHV++xNyuUC/fOp8DDngi
         2WLbrINoqSsMmiFQ4eiZaGwtJXyYxVJbN/fiO5tH/mIPCOqlB/TCN8A8acFsPMZP7Bti
         0hh0pnlYQEIfr5Cc/aLNVIgUoBukRQU7LjK2NM6ebB4nW/XzW0sNOSgu0eRUjYgju7xt
         HJ1eF9joBVY1gv1f/z25eCDdgtL++QkQdjP94Ay/7Re9gs4BfycqrzAU9OTOguM6ewqc
         wExjyWwdNYBqqYsfD+rT00yCtBlruXeZ/ZqaMGVtV4nlVGqtdyCN0iTc3y5XIOwja1uF
         HucQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV8eacqpdO18K6njfDWD5hVkJkrDhxHrkhLwhHb+3LCw8Qo2wmdHy9AIk16oHvL4FD6IdLokIGySmq9GfgrK7rMvl6@vger.kernel.org
X-Gm-Message-State: AFuF++nw6kYJF5l5BO4Xdq9lOnVBuFG3ntnkw4qagYq5xT1iHocX4H3I
	fQtMxH5w+qlzCMEG5zwGtvC3X9142BeqLXVldNAvsX5ZI1JO7LmlbHaB
X-Gm-Gg: AYBFou0FFjiRR3A5TyKTu8xyu6drPAos4R26b0KRUq3HkLiMFENspMZvlgvEU+r06tz
	sOFed6JmvbceuJKTBDHGKvnYoEF87Wo4dGOgR52X1Q1vyVjc6HlueJy/j8/qTLvIqa/+Rhi6Srf
	RqmVl++t5U66GBfTRTn9fMUECRwfy1oXjO3jPa02ErGx6WRbK+FUthJR01vfBs0THdzaaimY2VV
	os6UKd8ljbyDp+DavFUAyB4tToGkV9POWK5583JgLIevF7Zy5E8J46b5UfkkJnnZxkg3duHhjeL
	oaHoKSoqdU5/tzKz/KM2LE3xdXUXbztEeGIhLeSMKOyGp1wCUzHiGgpa2BMgwnx5T+iRbYIDNpA
	RsSSEtfjC+nXVoePRFCUJ9s/d5/Je30gu0cOCtVrSDWyHuDhuJVK9S/+IP5yQQq74QeGkJQhXAB
	NLBVUGBwYXnblKtmT97xGS/XCircAZFYXaAhXpPQTkpL3X0pgnTozIEmC1OD6G5mbx/JoXdReO+
	XQybaeqnisyecYuRWIqFALUHA==
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr58913576a91.5.1789015528936;
        Wed, 09 Sep 2026 21:45:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] platform/x86: uniwill-laptop: Fix typo in the kbd LED brightness comment
Date: Thu, 10 Sep 2026 10:14:43 +0530
Message-ID: <5899c28bcbdc04c0c07ae3f1bf8501e928e7d4dd.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "device-specfic" to "device-specific" in the comment on
restoring the default RGB value.  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c96..eeead0159828 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1705,7 +1705,7 @@ static int uniwill_kbd_led_mc_brightness_set(struct led_classdev *led_cdev,
 
 	/*
 	 * The EC interprets a RGB value of 0x000000 as a command to restore
-	 * the device-specfic default RGB value. Work around this by writing
+	 * the device-specific default RGB value. Work around this by writing
 	 * a RGB value of 0x010101 (faint white) instead.
 	 */
 	if (data->kbd_led_mc_subled_info[0].intensity == 0 &&
-- 
2.48.1


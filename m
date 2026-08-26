Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159E4248A9
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 13:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750567; cv=none; b=O8btsvjnftxa2P9GLPABDgqd0goW1KJOhsIzlYQpOFF0Lo6YjBA1dyxwftryC3uvNdj/JnnBzOUGXnA83z0dcDHpYBUtWjn87fFOGTq/17ug0y4DuKSqHM8BDMEpA3w3YY7nEUJxq1NPdqbe5Ws22z1+4YXTgqrTFnkONWTuVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750567; c=relaxed/simple;
	bh=WkboM0OdZqhPqQ9UIgFR9YMbWDHiDEJ6qs2otdpsS4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNBOnCH2BJc0phqjI+pwqMRyP+yi3+rOxqZiGZWKF8MVoOjjiJwTy9IfVFgyHDUiPkEIxYJzKuXdgaSMhiwvDTxChpGcP30BvynRq7yLrr76DoQ0L+GGWYWLM5b1QjfzRjwxfYD75t7VfyI5MsI6bneMsmTVh7ppRf//qvS+ZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMir70hB; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMir70hB"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a5ded53570so1565266a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750564; x=1788355364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/WQNlcdBHJ1/5iDWRui/aJJ+/iUtUbCd7WBlOaLV4Y=;
        b=MMir70hBGKtnjxlh51BO9cvasLh4CAD0bonFcqNGGVOBPOM6MDIwho6g9FZ6HAizyS
         N5cNNJVh8JG0/Rsg/tyjKWa/HjsggT2O5RYOP59aM3XcOBPboXcNflaWmOrXIPbCVf8C
         /KfptAq5VoQvrMtqm0WZgkAch8u13JU9Mf4GK6uKcD+tz9L9TnGKbDjGMXmFSa/UxH/0
         z+j1/dzkC6ku+yn/kUy7G75Qq5SPovgjmk+F2CjbevEK/t87NNmyO9vKtScc4cy0Zn9L
         +TEdxCwozwBPr8P2S6rHr0whljslIjn+QmjxUG4U+NOexAZN3DUsEX5Ge27+cryBm9Wv
         nhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750564; x=1788355364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/WQNlcdBHJ1/5iDWRui/aJJ+/iUtUbCd7WBlOaLV4Y=;
        b=BDXeaTLA5s7GEnxVgN3Ewv8tTMLgdCrU/afO7otwolO4SV3C2EOJ2AUEJIvdw7LP8Z
         vnTNAYN64xyNvo3jcZIXsSS9x+J/hw3lAb0Rj55frv2aAus8ZuSg4Q+HgVYum/y87ZAJ
         HLJeuldKTKxs3c5qbt1Vg+8gS8NqwLYg2Y/XufuMg2rf0IRmxOlBKshEzZfklhMGigXx
         T6l4prD7U/a1EaDR3bSD6SbGNPZcDjN6+00BMJ7zYKjnd3UhlQtTogxT+ClB9SOkqcm1
         hrlsy9P3HGZ65kinBUub1Mp6tRF8xfp3syfGG/YHDU2vg8XQ4gFKVxFpi4/sHzvgenmA
         yMhw==
X-Forwarded-Encrypted: i=1; AHgh+RqPSQM+iUp/M+CVgyTzjdq1EJXPSuy7o7gPvY7FIgpIh513trmaPdBtN2RMDL7aVFURiI/AqZOr8h4TmvPCQKofUh8D@vger.kernel.org
X-Gm-Message-State: AFuF++nqiqlde3pycE1NQRZph0SZvPVjT/ucVZh9pSg+WLwj2PxowaZ8
	/O5nYKn9TG7h89VQoGcO1lRMBE4zXTTeEGkiApxlc+f6o8xXJwYpsK0G
X-Gm-Gg: AR+sD10ps/p7JsLcfTFP3T6VLLkw/y0+FH3tDJQ/bf8sTnKv+kq4n5sfRcQ0ifMXeWm
	4Yg7OvmU+aclfvNXeFzi/A9XDaNfy1wNTpvZ68KsRsQpcfwinw5nN810mBDMY1gM6A0NdWM6j4s
	IK1ahtspxvSKXRyEzDxU7DsMlkHLdsWQZ7lu7sJpqvCAkedXrec+6zBv/j7bXvIMURG4ikdpDsW
	UJyq+yVy2SL8ly5B2mTRHODqZVPhcdgdzufOxI20pU5CA/1fYBcZXNM3rDIrY+KRxVXZgny7zaG
	t0AXRtxVU0Qw4qdV30AvKPCLoVwqC03pv5gPx+cWloeiW4H4/JLVz/wAPTz58ROtYOddImNv4Fq
	FmPlQj9X84s4HalxnUWuF76xR1NOOIBmTGPpRdFoIc7kTOEn5xUdjDr40QGjOHswDvdJzAtSrwM
	qoh0nkUsBv6JX8bijIYsv1zwq57mRcuL2TsDunfiL0YodsZDRpTwlMpPdwhQC7N6gWksEaoVX3H
	FUUdCMzL2416pbmzcXv84PtLk2+IOsn137xz7F3uDQ=
X-Received: by 2002:a05:6402:4025:b0:6a0:9c84:ce0e with SMTP id 4fb4d7f45d1cf-6a5df663cbfmr9972362a12.14.1787750564433;
        Wed, 26 Aug 2026 06:22:44 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5edef3c26sm1689857a12.17.2026.08.26.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:22:44 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 3/3] platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs
Date: Wed, 26 Aug 2026 15:22:33 +0200
Message-ID: <20260826132233.3342481-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L uses two GPIOs provided by the RT5677 codec
itself. GPIO2 enables the second speaker amplifier and GPIO4 enables the
headphone path, but ACPI does not map either signal.

Add lookup entries for the codec device so the Yoga Book ASoC machine
driver can request both controls by function name. Register and remove
the table with the tablet description lifetime.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 36c9424c0afe..c4401b59fd1d 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -316,6 +316,16 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+static struct gpiod_lookup_table lenovo_yb1_x91_rt5677_gpios = {
+	.dev_id = "i2c-10EC5677:00",
+	.table = {
+		/* GPIO2 drives the second speaker amp; GPIO4 drives headphones. */
+		GPIO_LOOKUP("rt5677", 2, "speaker-enable2", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("rt5677", 4, "headphone-enable", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 #define YB1_X91_DRV2604_0_DEVICE "i2c-DRV2604:00"
 #define YB1_X91_DRV2604_1_DEVICE "i2c-DRV2604:01"
 
@@ -363,6 +373,8 @@ static void lenovo_yb1_x91_remove_haptics_props(int index)
 
 static int __init lenovo_yb1_x91_init(struct device *dev)
 {
+	gpiod_add_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
+
 	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
 	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
 
@@ -373,6 +385,7 @@ static void lenovo_yb1_x91_exit(void)
 {
 	lenovo_yb1_x91_remove_haptics_props(1);
 	lenovo_yb1_x91_remove_haptics_props(0);
+	gpiod_remove_lookup_table(&lenovo_yb1_x91_rt5677_gpios);
 }
 
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
-- 
2.53.0


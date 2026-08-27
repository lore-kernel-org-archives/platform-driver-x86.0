Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522DC366566
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 20:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861795; cv=none; b=b+tJkXw8W2RKIVR98UhfbN0dqAilKlYFc33ZxaqtJBzU1/6xsSfeQ6PXdAo0hXMNj6BorBnLfoPXntpYSnL5daPBk+FZasIaHayUTgg1L/08jgtxruJdxilQjqgulS1pGD2T1PFyrqHx/61mCXotiwoZLnI6Km35l++T/CSduJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861795; c=relaxed/simple;
	bh=av/RqU4IhFO21IwA44CfzNfwbz1VFP6HnDY1tUunHXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGFTTUQvGWjEU7ttKOTgpBJfOsVUO8yoaroUEHHJkdOUV2cRktsouYZmXdmJ/18wr/MaGlvb1b+kDijSXeEkDTT1Rta8mv0jkPpUqqZ/I16cDg5eTyMRGy5LxZ207Zn8hkWrS6hn3q9HVDmKUuMMGZd24FAi+xPC+QweV0HOFQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNdabwCQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNdabwCQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so1354065e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 13:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861783; x=1788466583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5qf5AyR14QicTi51SyKC35gs+EjRCOBvh+lO2Jaq7c=;
        b=dNdabwCQs7dSM4BQL6a+tjdEAxd3W1nT5yT5K/t/F54qmLtIXbn2dPTo1oL8lxSNMJ
         SOzpqQfEDmj+5RTzE+SYMM3SoNqo+yLUltAKfd4snqmWTii/G1ck3qLo9ahQnOsh852A
         qBggPWd/h4m+XBZNLYzfGUlXb+eRrgpUC34AI9SAIvT21myiPkDabdAE9k2oitkFqKds
         jTm5dXGT1/wcFryGt9EgXjRW43/OU0yOKg4JN5dCE5zsDeq+0IRi3g41kfFUZi76Vjzz
         kL7IpAYk656c8mp3ReKOOgfoqtcWFJzvXYhv7PHRE595mwapk+JwlHW52/0GpUANMe5l
         Ry8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861783; x=1788466583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5qf5AyR14QicTi51SyKC35gs+EjRCOBvh+lO2Jaq7c=;
        b=Co8jLu/ooasW5vUR/dvK3iy2L+4te2I90VNvYX5HXyAVnza0A8eprEJSzrBjFnrLTL
         lnuYPoKQFSsrKc6qyXWCWiszLNI1pW52ez1XmXLOAJl6hCWcEVEpw9HBByVkTQrZWakL
         l0caZf4a5cCBnM2dVkIQNPkqUrWzYScrDgD3GukoZ3VYQnqz6JQQydqAveO8HJE1s6V0
         PpJ0zvo3v1hPxaeqjMw4XXasus6lugfeNzGzO3ys8ckNa/eiEV29uddS6sKixC0gaWzO
         RNEQ95ZJiz173DmyUN2LZ+91obelrEbgsUJa8W0GGv3B6wgxf3jhfDCMM4cXMtWMCjms
         5+Sg==
X-Forwarded-Encrypted: i=1; AHgh+RotG29UToWxZPsYLf0B3MQK2muRgw6++QIcYTcuwkYJnmWqOSmehWIsSpChni8Ihq5Hac/FIrq4avPN8g9I36RSIk3J@vger.kernel.org
X-Gm-Message-State: AFuF++kIrQH1JOC3879iN5v12GTXcErOJE9C7tOjCygri34jZXFeYn+7
	YgsIZg8TVoOTT5uZ2DAtQF60RnP97x08ri6FYw7WmToQSqpFhmUZORDU
X-Gm-Gg: AR+sD11DY2CQhbSfz+N/qMuVbiTBOIYmAJPKfP7P+0NnrMZnhVpMW61Wes8Ck2dpR3E
	g+XUi6biCk1g9aHGZ9+wn/w5cpTVH9Gt8XaxPxlIeC6RzyMTW24iBp1A4RuYpOoq2248wV4MHAz
	cwruqlnVUt5F0lcmV4XoVNPeJ1fz0C4gvjHhjs+MNF1mxLG869mnjvyy0/UndsITzYvcthS+Z0n
	dczOO2nRoCJoAWLQNb6R7byIMw90lH+nHeFygVp+fPiN6P6Nt8MMrsEnYtOSepMqe2byBbPDpeK
	ZO5aaug6rSOWVqjCxBZzUvCuRX1dqCazMu7CwtuasOiOAsxn3xrJRnJWsVeFJNSom30l/VsFF7v
	cAfKDQ6EuGS5gDZ1kdeFGYevtUAw6cNQgIOnvvw0p+qxghP1lh6CvgOBUHczUc00CXaN6zgDIFo
	DDLkbp3fNqNMIVYyuVa5BATbLlSbwCVKx63Hr+VvUAqeFDH2YhlBEfnqgz
X-Received: by 2002:a05:600c:1c26:b0:499:a79a:694d with SMTP id 5b1f17b1804b1-49b91c265fdmr24699285e9.4.1787861782563;
        Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:22 -0700 (PDT)
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
	Thierry Chatard <tchatard@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v9 2/6] platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop counters
Date: Thu, 27 Aug 2026 22:16:07 +0200
Message-ID: <20260827201611.99825-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
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

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/platform/x86/intel/int3472/tps68470.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/platform/x86/intel/int3472/tps68470.c
index a496075c0..5baed848a 100644
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
@@ -233,7 +233,7 @@ static int skl_int3472_tps68470_probe(struct i2c_client *client)
 static void skl_int3472_tps68470_remove(struct i2c_client *client)
 {
 	const struct int3472_tps68470_board_data *board_data;
-	int i;
+	unsigned int i;
 
 	board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
 	if (board_data) {
-- 
2.53.0


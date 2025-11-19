Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804E41DDC28;
	Wed, 19 Nov 2025 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513203; cv=none; b=hufaKoM9o53klD0iSlzTsZ7/KL7Bn/5ZJMGK6TLhQdK56G1R/KSbFKIqz7GAfb/rQwrR+2f/sgPOt7mk/FMW/KBA4qO7+WLHyA1hnhhZrEWk6+a5XanWJ+r6wLH+AdqWkKQTTLqVKBO2AadnE94/U50aXT8zQeDxTCuD5CAGtLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513203; c=relaxed/simple;
	bh=6RL3DFgYa1zE5JYJikCX4EhrWPzdetIm01PuBAcEWNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJObAaec0lDG3+GvoWxUxpHP5QkPs0dOCA+39NObHSN9ZcEm7bZ+wglFaF2IAf6jI8BOuLgKYE32a2yg9+6xuZt6QQccIoy31QNbUc4yX2E9u921nqNWlR0R9bBEz7uNokkTDh+q5zapsqMA9bFNAhNR8pkwKYF/8vkq31PsbkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SO2higL2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SO2higL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94237C4AF0B;
	Wed, 19 Nov 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763513202;
	bh=6RL3DFgYa1zE5JYJikCX4EhrWPzdetIm01PuBAcEWNo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SO2higL2ZMDH0L1/3qwg+kmVSj4dXQidAUqg+JGNkx1bb9bl8X3RNayCR8gO7FMOr
	 zKsZNIMEIkyA0/ZPoXENuevIc3enEE3OQssvqHmczSi6oQOh1lEPBG2qZ2dBjeArQ5
	 wmxtXmenuPNrv0CtZQVZGkfmGkLwWvdk1RjTH9DXzpYSNUmXm//wqJZt7TJSfEwoyw
	 e5Y86vcqfFDkxh3bMfly5psYAgIg9NPYVc4nEy1Or94bwXvfbABH4yLouuAP0CafJ/
	 16OZeshKEJhV52PhvmvzC2COrH8ruh8xXXfCzvXD9ad4yJe6o0cgcMHTdQoyUYSy3q
	 6aX93uKzV9sCg==
Received: by venus (Postfix, from userid 1000)
	id 8FC38180083; Wed, 19 Nov 2025 01:46:38 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 19 Nov 2025 01:41:40 +0100
Subject: [PATCH v2 1/4] platform: arm64: thinkpad-t14s-ec: fix IRQ race
 condition
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-thinkpad-t14s-ec-improvements-v2-1-441219857c02@kernel.org>
References: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
In-Reply-To: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=sre@kernel.org;
 h=from:subject:message-id; bh=6RL3DFgYa1zE5JYJikCX4EhrWPzdetIm01PuBAcEWNo=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBpHRNtOS5NxoxDYRM/Twv5A5bfjO9kx8bxPpujM
 k3NBMBiiyuJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaR0TbQAKCRDY7tfzyDv6
 mpqRD/9eCou6eJplz1XmgLChMTkqmFQToDEYB4KTd0tcuOFSz4bzA0oPnwI5ZuvlcKo5RJ8FkL9
 uU2nXr3BSNkAGeTxaoYrbd9whVHBvpDqRcS0DkPLosNANE+ZyeMWnrYDwcua242f1S1iL6Tt23Y
 TL0NB7Makdlpw3Px2Mmej0ghi4zwHZc6TFcYZkGZctZG8GH1A9l0TIKsvrSd7IuhuPG63hcLlHL
 tv1S6tEWudyDcWxQphf6n5fhZF/HZ75UnKejrY3o11WnaypV7Ct8hiYKMGx2mxNJNXoDPP/kXU8
 PfokpclKf0ToKQX9OFEBozhwGw6he6KKsIZAYZz3LXZDLG0yEe/7Ebutg2e35eeIPZgFwVmXGp2
 Z7tnm7s0Uor6Y+TM/qY6mC302prfVCPYTcQvcIkl4u6HtAlNNyQ3S11Nsort6ry3lijCtjOPos1
 BZr7Kd8hs6PuS99YINkbWnHX2dq9SidISjhsJfnNIxN0y+evF82DAb2n3tLN0c9+3rp8uuv7y3R
 qXQImuV1R613SALON4+BL5/3dKfjB0OZfYR+41wr3nm93PIYV35Y4RhsNiFbjr+9lLmM6G53I5V
 3Vw2TDb2+yA3Wp6LAw+Du1ED/79XqA8smIRamqGeVh6KDdyM5QampwAqN0PQMXUSPgWhKKXahIA
 6nESmHlbenkxqMQ==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Fix a race condition, that an input key related interrupt might be
triggered before the input handler has been registered, which results
in a NULL pointer dereference. This can happen if the user enables
the keyboard backlight shortly before the driver is being probed.

This fixes the following backtrace visible in dmesg:

Unable to handle kernel NULL pointer dereference at virtual address 00000000000000e0
...
Call trace:
 sparse_keymap_report_event+0x2c/0x978 [sparse_keymap] (P)
 t14s_ec_irq_handler+0x190/0x3e8 [lenovo_thinkpad_t14s]
 irq_thread_fn+0x30/0xb8
 irq_thread+0x18c/0x3b0
 kthread+0x148/0x228
 ret_from_fork+0x10/0x20

Fixes: 60b7ab6ce030 ("platform: arm64: thinkpad-t14s-ec: new driver")
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 1d5d11adaf32..c1c01b977f2b 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -557,12 +557,6 @@ static int t14s_ec_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(ec->regmap),
 				     "Failed to init regmap\n");
 
-	ret = devm_request_threaded_irq(dev, client->irq, NULL,
-					t14s_ec_irq_handler,
-					IRQF_ONESHOT, dev_name(dev), ec);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
-
 	ret = t14s_leds_probe(ec);
 	if (ret < 0)
 		return ret;
@@ -579,6 +573,12 @@ static int t14s_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					t14s_ec_irq_handler,
+					IRQF_ONESHOT, dev_name(dev), ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
+
 	/*
 	 * Disable wakeup support by default, because the driver currently does
 	 * not support masking any events and the laptop should not wake up when

-- 
2.51.0


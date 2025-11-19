Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584C31C5D7D;
	Wed, 19 Nov 2025 00:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513203; cv=none; b=SAwcE6DdJZaQx4R6WlOS4wFYm3EFI/kPbmMLt4jMjNSCgVjB6M3rRLKJYZ5ZldpjeWNvvfo7rCJV8jSNg0BhY6DezV7MHfhxMmdFsCn0eiDK4fzx5qrBpfz6ZjXeY/3rf6KNp0ApDxtMGsLyRp8VVBQR+xp5lFJkHRsPkLU8mnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513203; c=relaxed/simple;
	bh=AegkBlTWPLHplrOMY76sYBaHhKq8AoJxhlaNcb0ph3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeqEwFatppb94ajtoeo1Ko++hp2jI1VKP7Ip4fEsKnt0qyPAYs0deMs0bkIaebZhADN6hrXocz9lQNM8yUaGnEs8NqhHb0vYjitPz5SlvYxsE0nCj6tvCuzPxFYZUf5tlj57kJePb77RLpRQgyTXe9HOKDyZ6weDRqBvDFgdW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw9L7m8R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw9L7m8R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946C9C4AF10;
	Wed, 19 Nov 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763513202;
	bh=AegkBlTWPLHplrOMY76sYBaHhKq8AoJxhlaNcb0ph3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nw9L7m8RIb8IVGdbo8FRB9mWLIpod+mnctgtNJ9RMHqwr5umCSyjqAjVkrRU9kOhL
	 3qgqfSq3vP1GFrBlUlMwCypJKM8nPGylyeBNURfjye1VQiDQ6P70qYtRWG+1cgsS6f
	 7LWkRimZJRtYqIT/XBL4TjRs/Q1wuxSP5/PUfOI4Hz+wzkPEdgERvEoPkhAn6TA41i
	 z7dO9kukx4hvTx6AEm5rTG6Ov1Tc3vtfOLq3Cnf3Eo6iN5bAOw4cAdK05F84LPv5cA
	 miebxS13VjBZcWfzv3pAji0wBzngBYmGHFSVXSZqmznLTEgk4kWPEcpaB/BzYZAu8b
	 E96xvmxKrwoGA==
Received: by venus (Postfix, from userid 1000)
	id 9160518121B; Wed, 19 Nov 2025 01:46:38 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 19 Nov 2025 01:41:41 +0100
Subject: [PATCH v2 2/4] platform: arm64: thinkpad-t14s-ec: sleep after EC
 access
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-thinkpad-t14s-ec-improvements-v2-2-441219857c02@kernel.org>
References: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
In-Reply-To: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=sre@kernel.org;
 h=from:subject:message-id; bh=AegkBlTWPLHplrOMY76sYBaHhKq8AoJxhlaNcb0ph3s=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBpHRNtIhX/UZ3eeocKJXHDaWvSrHBuWEbdOjVtS
 /tuOVunCmSJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaR0TbQAKCRDY7tfzyDv6
 mnWyD/9ZVfV76e6jQzhXo85J4zb8YIqjRGL9bo51/97RYZiphkrlGaU21wsaDhlm6JIa7vpsCcV
 IvgdYmhcljtASb1m5YDPniH5jigp+zKy+iHq5BSnTd3r7VftTI7yDG/U7mgMzjU783QQuOmu98m
 2m6pMB7BTOZoRnm+aUyNAZsQCc5Pf1QCdPkiNnwgLtyoI4HkmnPYqSKZj5436mGejsWOOUvswXb
 Qt2W4rWRFlWySe8PjHxig+BB4iemFV88KqPuDUEt7AiKT5o18IyOM14FWBHucjYM9H3VVW8OQHd
 FYgAyqhIorszEkh0k7Xifyfu5SBq+ItlumgSAiBFy2FRcTcSQ3zcFKVFFt09OzIkNrial0DT1Ml
 me94hmuCC4HEpHLa1WWIE385dSwVpkwhwZoqpnoOk660jkaNmXiG14KKyw89zfx2ySGu5dgNPIv
 Ufp14uZLXV54atVKwstkb4h3h8VT07xdRYsc08nKHSUMoJznMovsKIdUz6OIk9hJPJqwYtLJJnh
 bwyalKRDICieOoJW1QSRPrHSyJTTizBC4BEEvGNhCUs6+e52P+WYLu46eNWE9noVi4wYqkQ5JEg
 /tBJcVB2fQyJFWpTwmjTwLKmi9ybSodU34IyavNxYw63hmT6avZGgPWgMzqfi5i+SZjeMW2UEPs
 9WJ85oKFFdlISlg==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The ACPI ECRD and ECWR functions have a 10ms sleep at the end. It turns
out, that this is sometimes needed to avoid I2C transmission failures,
especially for functions doing regmap_update_bits (and thus read + write
shortly after each other). This fixes problems like the following
appearing in the kernel log:

leds platform::micmute: Setting an LED's brightness failed (-6)
leds platform::kbd_backlight: Setting an LED's brightness failed (-6)

The ACPI QEVT function used to read the interrupt status register also
has a 10ms sleep at the end. Without that there are problems with
reading multiple events following directly after each other resulting
in the following error message being logged:

thinkpad-t14s-ec 4-0028: Failed to read event

Fixes: 60b7ab6ce030 ("platform: arm64: thinkpad-t14s-ec: new driver")
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index c1c01b977f2b..cf6a1d3b2617 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -120,6 +120,7 @@ static int t14s_ec_write(void *context, unsigned int reg,
 	if (ret < 0)
 		return ret;
 
+	fsleep(10000);
 	return 0;
 }
 
@@ -157,6 +158,7 @@ static int t14s_ec_read(void *context, unsigned int reg,
 
 out:
 	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+	fsleep(10000);
 	return ret;
 }
 
@@ -191,6 +193,8 @@ static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
 	if (ret < 0)
 		goto out;
 
+	fsleep(10000);
+
 	ret = 0;
 
 out:

-- 
2.51.0


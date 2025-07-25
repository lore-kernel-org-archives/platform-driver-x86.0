Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F7F21C9E3
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 14:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753454697; cv=none; b=rTEXi1pckxpsl8IISM7JlPehNTq5J8MO0CAXos3r2JsOU8inSb5H/0KWxojhlZR/6JtruRSRU7CnJcsq0RdB7Y4TKFBvTvEpypNgr0a00MU2pGz+0SPQ2b/pCnoZXNuc140eWrSOEVC15VCIznm73jqVuc7eg7J0Ejm09JzhjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753454697; c=relaxed/simple;
	bh=wXwrTH4sA52dYUVgK7xb8g130FAgJkcQSmDAfr/hcPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRDImSbE93LKXalyS8BiN8BLyl083/ClbCSrVKofXcDEgxdY0cvIrmEAkuQrMH7LbZTgJz5eRewrk5L395sli/L6CjLbnmuEUjFWjJMACQ4OSAI8tDCj+8FYE2VnNHHzbLpC0g1tvewYDUjG+RSHPfFKwKLUbC8gdzzkYjKwNIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsClP1E1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsClP1E1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08563C4CEE7;
	Fri, 25 Jul 2025 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753454696;
	bh=wXwrTH4sA52dYUVgK7xb8g130FAgJkcQSmDAfr/hcPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nsClP1E1KJqjFLnc0d7i6ireJahGz7rcHIgGFZxJIi7b0hF4gPTG2LmGQ6n+lcrpz
	 j4UOxUxdEKM78CqVI3NId6j+81t45YUjAX6kQL5/DCa5crdRbEgaDDifiOBemaycF3
	 v0nKWG3HipOhYXeJSkFYFNzoN8yIpYRFbSVmNiElvBYw9Cn3ua5sgoOX2TePUjCsPr
	 ZThTm268ymzZIr1TMG3zao2pN8J1HnOZTyUxnmol7zATQaSX4lqy9PDjqnGsSFuWJj
	 Ofsk9KmPCJNuvhdicaNeZiyUim4hCeZhlH0woRqTGxObraAR5c7NNCsy1GVAy23yjf
	 VmxaZu93N3ThQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 2/2] platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms
Date: Fri, 25 Jul 2025 16:44:44 +0200
Message-ID: <20250725144444.210043-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725144444.210043-1-hansg@kernel.org>
References: <20250725144444.210043-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On HP laptops with an ov08x40 sensor the 25 ms delay coming from Intel's
out of tree drivers is not enough. Testing has confirmed that 45 ms does
work.

Add a quirk to the int3472_gpio_map[] to increase the delay to 45 ms to fix
probing of the ov08x40 sensor failing on these laptops.

Note this only impacts laptops which actually use an ov08x40 sensor with
a handshake GPIO.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2333331
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/intel/int3472/discrete.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index bc442944be7f..e7ca1d83f45a 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -149,6 +149,12 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 	  false, "vdd", GPIO_REGULATOR_ENABLE_TIME },
 	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
 	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
+	/*
+	 * ov08x40 sensor with a handshake pin needs a 45 ms delay on some HP laptops
+	 * https://bugzilla.redhat.com/show_bug.cgi?id=2333331
+	 */
+	{ "OVTI08F4", INT3472_GPIO_TYPE_HANDSHAKE, INT3472_GPIO_TYPE_HANDSHAKE,
+	  false, "dvdd", 45 * USEC_PER_MSEC },
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
-- 
2.49.0


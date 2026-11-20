Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184976;
	b=oI+m/hYIHr89z4LzzTDBhZ3Nyh+ePJm5k4zlfORbKFPVX4VfjxhENC7XWgiNecGnAKC2
	 Ta10uHghnhpzihYLRU+MEkOCL4L3kV/HXFHSJAtL9GfaK3FMMPn9gt7Sp1LhUq7pVAiVh
	 7IgCZ1lgaTlypDaxxnuP7PThkyteLRyJlDw4ZAgOQiNS6jo9GcBwYQwLIIXU/+RpFlin0
	 iDnyLNxOtb+xKwv8pooPYVXOGXZ0nZNS8uCzuOAmSU/eI9IqC5YojVMniX8iUym4aoKuu
	 SIYe++ENWCrWuKIbPbgJmcr2uALpwT28fLw3zXSOkzmNGBJ+TjUdgpPFWQcTrAo4AQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184976;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=aQZN15peoA5Fz9jcxN3vIBxMkDjR6rQvZZJ+FO4NolE=;
	b=BHXpsAo7h03B4Ufg2/0kOIBGwkrQ9+SQojx8C1CRrdShL1aubB5cz7HZSr33+nL65HFK
	 Uq/6zP5K8YOYpuRG7DG0rQ+WJUdwkBGLtlRF9s4EtCTF4Mkts+8ffScieBmd8BUqt5czy
	 R5QFVhbNWzC4UHkYvBuY6eu4F+3oAolly2gsRTi2k3A7TSgdjq8GvAHn9oJSSqVxNpd6H
	 +pmpkjmBnw7FSumRTvgfq3zS01U2d++EuZGheuODVgJbt0xdND0TpIMV6QhowbFwrzNk4
	 cyaTj1VJaETweBhVg+DzKC9oi67qm0sPzcqsUI7m5KQkz+4zcRl3upg+IHvABPyU0EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Src4bWc0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C594606A325
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Src4bWc0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688371F000D1;
	Fri, 20 Nov 2026 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184975;
	bh=aQZN15peoA5Fz9jcxN3vIBxMkDjR6rQvZZJ+FO4NolE=;
	h=From:To:Cc:Subject:Date;
	b=Src4bWc0H5K/GKdms0k+2+KNvS9gkFC6zLOCXJ3VGegafQ5fM0WRAe+b06EBhlb4w
	 8VuFc13J+xPp/G7n+Svst2ddmE6iGusIP/eR4J5EgzdSHV+Sm4OP96HVuGGrd8RVV6
	 M4T/jsuIjcJwyBd/Ghg2p7GFNjKs2VP1qYQDiFMBjq8mMrvjgO+a5hzNpXBlODK6Oc
	 C15HKcmC/4lsa3oUpJV2FZblha5vS8T3cfk4Ejg3kHseTWQMG0OKkUAnigrCTArAWl
	 6OZAxmxYlCf3L0KQ/SguaUUjEK7WKis94/kvvvOTG+QDRRCDkomBgoQGHpC6Ub0ziZ
	 gHdsVb8BPi7KA==
From: Thorsten Blum <blum@kernel.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Seth Forshee <sforshee@kernel.org>,
	Matthew Garrett <mjg@redhat.com>
Cc: Thorsten Blum <blum@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: apple-gmux: Fix max_brightness limit check in gmux_probe()
Date: Fri, 20 Nov 2026 15:29:15 +0100
Message-ID: <20261120142914.825047-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=blum@kernel.org; h=from:subject; bh=/Brw/b0ve/urBCA9AOWebCY9/9I5ymIrwF/1h0NF2uc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDNkMkVYiBcrMLJm2lltK+US/+bDaXlvM8PVyUsYJ2cybN xdmvb/XUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABORWc/wT/953bUjbb7zvoq9 LFp76l6TcJ72gTNNbU8ytIJaY10qohgZNu27lKsv3srPVmzsYFb3c+Mk37ivNxm6LyybUhz+1au FBwA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

gmux_read32() returns a u32, but the maximum brightness is stored in the
signed ->max_brightness field. Large values can thus become negative and
bypass the GMUX_MAX_BRIGHTNESS check.

Cast props.max_brightness to u32 for the check so that these values also
trigger the warning and are capped at GMUX_MAX_BRIGHTNESS.

Fixes: 917ee75a5916 ("platform/x86: Add driver for Apple gmux device")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
Found by code inspection; not reproduced on hardware.

 drivers/platform/x86/apple-gmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 9c728ac4e045..4d3a6d2393f7 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -881,7 +881,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		 * brightness at this value, but print a warning if the hardware
 		 * reports something higher so that it can be fixed.
 		 */
-		if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
+		if (WARN_ON((u32)props.max_brightness > GMUX_MAX_BRIGHTNESS))
 			props.max_brightness = GMUX_MAX_BRIGHTNESS;
 
 		bdev = backlight_device_register("gmux_backlight", &pnp->dev,

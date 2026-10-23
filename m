Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783714;
	b=eSl4FBHxF4Oe7UnVVdGp9XkEmKI60BiRx10AdXNxPEU9XhJLZk/OIps1rFlHnkdQRxU+
	 21jIJxgtl5UubCjWGz+tmPHnrZ0/1LJOhDGu0Arcb45m95vDkilcHXXzzX+iL7l8G4Cak
	 plxJZ1Iqx0nqlM6u69KhF6yaH4ET05mPcXs03rdrn3hMLyZp5RAcjNFJFF0aNYnNuy1FK
	 1/2ItwjSZO1RSBTXP0HniZY2hbJECR93XgE9uJQ51NBha7dH43T4K+w3byT1vFdf4ad3/
	 kKfN6JLe4fZm3eyXzfmSOxzdoj2IPbpX6Z8Y4k1RVjV5NSmKrccsRFA0oxIBAVHbjCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=mvLuezFNA2hipcALnx9bbQiyX8P1aULpovhSslzsanA=;
	b=ehewFkTPLG3s32egjfjd/7HL4nKgL4VZfE3/QRj+kOilg0rjWdt1pS3fnTxaqXqWzpZl
	 yBk8J+w+feo3ErCQVUbaYZl0B/wgtI+qa4NxwFqQcMyZj8G1Hu6oIHT1NAnKKtLSQ5F1C
	 1nqVGJTpt4qMKpLlQiEjyU9LX7m6AqJ5zfsH2/yTMiBcoH395J88DeivUNfDCBtqFmqaL
	 ipqnsVZ4ytfctoWzIXC+7bzXAh8HvoX++4beVvS1y9l3naVYgvEMqd2ZjQd486bAPEQsl
	 IDmFkjjS1oL33eoCgB873PzycHMXmCuYUP0XU4EmT56XeCcb+tC4QMU+PhD2i2zrydQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=byHclBwL;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198F2606A31B
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 19:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=byHclBwL
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1afdf5196so535850eaf.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 12:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1792783713; x=1793388513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvLuezFNA2hipcALnx9bbQiyX8P1aULpovhSslzsanA=;
        b=byHclBwLKiY0fHtowiegSkdlP+U1/x1sqXBcUIJ+AcGA/U/RGJT+N8n7QfkPzoGWxi
         1kbwrFV4LYPY/4izifW+M8kMGJW4ao2G2OEF4H45XdYRSTXHQrsW3+JqUVj79THYyyRo
         /YTJ4cz3zpxZE87Gpxjdp8vSV5WEFVZkxAtbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783713; x=1793388513;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvLuezFNA2hipcALnx9bbQiyX8P1aULpovhSslzsanA=;
        b=AdJGK8RNUlT1bwm2gRkwVfN9vQMcB+6qjUbT35uGdEJMnpMheey+sHQNHRYLCygedd
         kK8ufOEc1tv5r3DlVlzLSLtFd/0bQKxF2PogtcrQOBbai39Tko6YI5vagt75WwXSrlMg
         h3jgNwZiTC3g6awbclI6yztQ/dWUnf1CM6vBTegLzBFrY7sDmtsgGKYBkFKqoywi+zgW
         iZlI6E9O/H2gGt4N3x6UheXTDjMU5H0vDpbNq15GNyCmzdh2bflrQB2XgqJENkusxwRl
         157xnq+GcXIgwtJnzT70t545VoyXdS8GnnIqM6arFjOLE/kNSHkfW6LdNQGX/QdJ9WyR
         DLeg==
X-Forwarded-Encrypted: i=1; AKwUvBx++B1/dc2zw0Qc5bKfl+jdqpcZg/ENRcFcrvAYXDyo+ngXJQfyBJRq+Mdrg4H0sOiqWq05o38puYSc/cPVAKaTnNu7@vger.kernel.org
X-Gm-Message-State: AFq9FYKCEAnnNyHQwRcJeXz+9n1s6s0C5QGBpuyQaoZWSfVUO9VfQ71C
	7t++KAcHywXDo5w3OgXZW95aCYUG/xhb8lx9CtWU8BTOIk6swRUKVJSSPpzTAU3sfQ==
X-Gm-Gg: AYBFou0wf4/cTSE/0p5bcdsyH28ceg0hHbUcVJQgDiSilp1Vi/jxAhlhvfP2CKdqF3e
	UhRJ399Lyq5FgypdSWEovTFiPZPaQoK1Wh2yimBpl3NglaVugij/+tHN1voc48+JaX7tQGhEJ6I
	9AFt1hWTrDL+waYhZjKIfBWsgF52fmfCG7SJwkYSKPJ7IQzotE/WtrYJBI/oHddj/212P59/Ikr
	1/+bZU7G8UHiFwMQIFW7vsOgP3UizjUmIPafTecuQWq3MJttOiEF1b8bhScb+oq7VXKPFSJig4Z
	kHRUmrSv9edKN6x1cftRgWKWxlttp6bZFbuuUeqifNEGotEI+ABCxLLmDHJ+Rgj3M1jV0mvHLRt
	hKP6DSlHsIaaKOp5XlHs66ILAR2nw/ygJHw+hjLbflUlalPabFizAQgjRbHb5EzeQEncKl+N8n0
	jnUPwLIk7D7UFl00fQDgCJgs0xJtnOD+bbtKlmHRBe1X1GOLfLVZGPLYrkLYt8xhmkQ29Vmlt6l
	BeBVejZthSvhJ0jV8TDBLExb8N8ZNExd8SU/jBn1cYgG6V49etYwPZ9h8dccKGBf0LMQHI7Kv82
	zyHWm08H0uJfIBCzVyqdaeKUeDpSFoYyhnLtRuWNi3zwEqFq5X5H/rt08t2B0Ylw6V/xYoTYJ6r
	ALVvDJuOWqH6n9seRyuT80JgQAMJdNnpmUATLQWaxhhwWDHN9RNMbEuvEYW8dPpXogt3P4YBRYD
	0GDILpRMES62cdJal61+QAjaixujKYz3o=
X-Received: by 2002:a05:6820:418d:b0:6e0:edfa:9b4d with SMTP id 006d021491bc7-70b88abcdc1mr1678638eaf.82.1792783712765;
        Fri, 23 Oct 2026 12:28:32 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.251.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e0417cesm124968eaf.6.2026.10.23.12.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:28:32 -0700 (PDT)
Message-ID: <d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net>
Date: Fri, 23 Oct 2026 13:28:30 -0600
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chris Simpson <chris@nilk.net>
Subject: Re: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
To: ilpo.jarvinen@linux.intel.com
Cc: janussss@163.com, luzmaximilian@gmail.com,
 platform-driver-x86@vger.kernel.org
References: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com>
Content-Language: en-US
In-Reply-To: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Same failure here on a Surface Pro 9 (Tiger Lake, INTC1055 driven by
pinctrl_tigerlake as a module): whenever surface_aggregator is loaded from
the initramfs about 30 ms after /init, before udev has bound the GPIO
controller, probe ends with

  surface_serial_hub serial0-0: error -EINVAL: failed to setup IRQ

and is never retried, so Type Cover, battery and tablet-mode switch are
gone until a manual rebind. linux-surface has several reports of this
since v6.12 (linux-surface/linux-surface#2219, #1645, #2064, #2039), and
it is a regression from b27622f13172 ("platform/surface: Add OF support"),
which used to propagate the gpiod_get() error.

Janus, are you planning a v2? If not, below is a variant that follows
Ilpo's comment by using gpiod_get_optional(): only "no GPIO described"
falls back to fwnode_irq_get(), every other error including
-EPROBE_DEFER is passed on. I'm happy to send it properly (Fixes:
b27622f13172, Cc: stable, your patch credited), or to test your v2 on
the Pro 9 instead, whichever you prefer.

I've tested it on the Pro 9 (Fedora 43, 7.2.12 with the linux-surface
patches), with surface_aggregator forced into the initramfs. Unpatched,
the probe fails with the -EINVAL above and the Type Cover, battery and
tablet-mode switch are missing. Patched, the probe defers three times
and completes about 0.2 s later, with all of them present and the
device no longer listed in devices_deferred. Suspend/resume behaves as
on an unpatched kernel. The analysis and the diff were produced with an
AI coding assistant (Claude Code), and reviewed and tested by me.

Chris Simpson

--- a/drivers/platform/surface/aggregator/controller.c
+++ b/drivers/platform/surface/aggregator/controller.c
@@ -2753,12 +2753,20 @@
 	 */
 	const int irqf = IRQF_ONESHOT | IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN;
 
-	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
-	if (IS_ERR(gpiod)) {
-		irq = fwnode_irq_get(dev_fwnode(dev), 0);
-	} else {
+	/*
+	 * Only fall back to the fwnode IRQ if no wakeup GPIO is described
+	 * at all. Any other error, in particular -EPROBE_DEFER while the
+	 * GPIO controller has not been registered yet, must reach the probe.
+	 */
+	gpiod = gpiod_get_optional(dev, "ssam_wakeup-int", GPIOD_ASIS);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	if (gpiod) {
 		irq = gpiod_to_irq(gpiod);
 		gpiod_put(gpiod);
+	} else {
+		irq = fwnode_irq_get(dev_fwnode(dev), 0);
 	}
 
 	if (irq < 0)

Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D433EBF04;
	Wed, 28 Jan 2026 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594156; cv=none; b=KgQ0E8FyBPrQWRE/b8eeKImtS10rfPsDbIYuLEhm+emK/yFSgeT1bSljf6klQXhS9xKGGEgwwbsaHlxlHlMq95vZ3zzz6F417rcq1W7ej9/GSwUv14kOJymboOsYDSGqt3JeNwgm6YbuwkOufGL44DwlkPf9oQ+xvqguN2dqNiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594156; c=relaxed/simple;
	bh=rgEPlC4N64Mp2mf5hrKOg4yrH302rYcfEu69I4Y7gOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=drYSIvO44+M19BoncDzghhgFgwYblndA9BO06UGFFOnjUQW0Nu778HCoDJbUHgX35bgS48VAIIb/UJwqN7S3cqgZJq58aWc97sPkhU6HJXdm4SMJV7IdmCj7DPOETMyvBV240ttrp0E0c1Q+quLNDoQMML6JmBA9Hg722yJpE9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kFaPK/Hj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oNwoLif/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kFaPK/Hj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oNwoLif/"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1769594153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZEjcjI/p3xt64Ub6+8ChPpxBCTDkLiKdD7lfuW8y9Y=;
	b=kFaPK/Hj3ycuMtyPfB9TXmrN/sRo3N2rFNCzL0zL3m/f7/Ur6x9wA/XQeMe62sBDIeDnwZ
	lsiNoK7zA2nR9EKQSf2xqQYhp0/8BatTaqh6Bc5n3isyfYev3F0+jfexnr7/nCCwPh7/e0
	/78QbHT10Cn5egnaN1l57maan7HO5ArwzJNqBzyYcOhl5+JYgbqqECz3vSUM8CPJWsvb6i
	uW7dESjQmnkH9N+ngiUxVAKXS/HRgtpV2XQWiYd/BwZCWfyW65HHjJIF+knNNksGArPijt
	IcuCUbhPh5boX2PArJl2U6BlHbg17olAZ8fa3ZmPxsO6sSfv5Eiv1L7x8kChnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1769594153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZEjcjI/p3xt64Ub6+8ChPpxBCTDkLiKdD7lfuW8y9Y=;
	b=oNwoLif/FZ7Iyetq7wKvwCh2IkIkUFUw+ELa30HXXv5Y5QCc/7Lwjx1wItDRzjZqU7hQYE
	QxUxV7G4CTlFJLCA==
To: linux-kernel@vger.kernel.org
Cc: "Thomas Gleixner" <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 02/20] platform/x86: int0002: Remove IRQF_ONESHOT from request_irq()
Date: Wed, 28 Jan 2026 10:55:22 +0100
Message-ID: <20260128095540.863589-3-bigeasy@linutronix.de>
In-Reply-To: <20260128095540.863589-1-bigeasy@linutronix.de>
References: <20260128095540.863589-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Passing IRQF_ONESHOT ensures that the interrupt source is masked until
the secondary (threaded) handler is done. If only a primary handler is
used then the flag makes no sense because the interrupt can not fire
(again) while its handler is running.
The flag also disallows force-threading of the primary handler and the
irq-core will warn about this.

The flag was added to match the flag on the shared handler which uses a
threaded handler and therefore IRQF_ONESHOT. This is no longer needed
because devm_request_irq() now passes IRQF_COND_ONESHOT for this case.

Revert adding IRQF_ONESHOT to irqflags.

Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/all/555f1c56-0f74-41bf-8bd2-6217e0aab0c6@in=
tel.com
Fixes: 8f812373d1958 ("platform/x86: intel: int0002_vgpio: Pass IRQF_ONESHO=
T to request_irq()")
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/intel/int0002_vgpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/=
x86/intel/int0002_vgpio.c
index 6f5629dc3f8db..562e880256436 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -206,8 +206,8 @@ static int int0002_probe(struct platform_device *pdev)
 	 * FIXME: augment this if we managed to pull handling of shared
 	 * IRQs into gpiolib.
 	 */
-	ret =3D devm_request_irq(dev, irq, int0002_irq,
-			       IRQF_ONESHOT | IRQF_SHARED, "INT0002", chip);
+	ret =3D devm_request_irq(dev, irq, int0002_irq, IRQF_SHARED, "INT0002",
+			       chip);
 	if (ret) {
 		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
 		return ret;
--=20
2.51.0


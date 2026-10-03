Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35621C84D7
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 Oct 2026 04:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002945; cv=none; b=YJMTq/CsvDAhPOu6hbdUwZLYb6NHUsn/hhI7vLo9TjnTDeN3ZloGiXLLJM0YeBrTVEBk28EQ38kuXA8rr/ZrohkviCXYK7pYKfFcLRn/JxmnqZtVc03i/KQmAQpYs6XTcMwZI6e+cjzKdqek9cUCCdOydNyZmXb0Eu6j1NQhGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002945; c=relaxed/simple;
	bh=lB8KhxMgsELwnm3TSPZscDLGlqsXzaZaC/5AE9WUy48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhZpFRqkx6DvI824ZWyHNVDUsulpdNhDaa55gRIrJr3yEwbXLDtpWx3RhSBV0qoKy7x0dbEIJcB1MmmxnDi/aSs+KoZ5o+mA9WKI1uG9tS6qXBQ+rLzKit/jcFLojKa4r6ATsiabj1OxwqTSQ/BKOYr9amkVB6nBprzGTnU0i4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lUDfakc+; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lUDfakc+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZQ
	7kqpRDJCXM0H+gYvbzkiRtHh3kFFr1dh8YGauPuo8=; b=lUDfakc+xygEOnzbYA
	PS1vKtwxmhcxrWNkuuOgN2/sbmYs+t8xVrrFAe01YH9x5pFm5xbfkKxZWp6vLAZl
	2r+WMXFXwTdMWKxczKVwKMpq1dOF2QfHfeor+vlDDixj+Gr27J9BFnVdE9tRpmn8
	7ukWVinHtnS3cyp0EmHAfVwXk=
Received: from surface (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDXvywuicBqlkVtCA--.34755S2;
	Sat, 03 Oct 2026 12:48:57 +0800 (CST)
From: Janus <janussss@163.com>
To: luzmaximilian@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	janus <janussss@163.com>
Subject: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from ssam_irq_setup()
Date: Sat,  3 Oct 2026 12:48:44 +0800
Message-ID: <20261003044844.63157-1-janussss@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXvywuicBqlkVtCA--.34755S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr15CFyrZF1fGF13XF15CFg_yoW8Gw4rpF
	48WFWxXFn5ArWfGa1vgwn7CFWfXrnrCr4YgF4kCwnrZr9xXrWfZryUta4fCasxZrW8ZF1Y
	yF4rJay8XFWDJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUkfQ_UUUUU=
X-CM-SenderInfo: 5mdq32xvvvqiywtou0bp/xtbC3hk7pGrAiTnwwAAA3y

From: janus <janussss@163.com>

gpiod_get() can fail with -EPROBE_DEFER when the GPIO controller
providing the "ssam_wakeup-int" GPIO has not been probed yet. The
current error path falls back to fwnode_irq_get(), which returns
-EINVAL because this device only declares GPIO resources. The probe
then fails hard and is never retried.

This leaves the SSAM controller down on devices like the Surface Pro 6
when probe ordering is unfavorable: dependent ACPI devices, e.g. the
battery with its _DEP on the SAN node, are never enumerated and battery
status is missing.

Return -EPROBE_DEFER directly so that the probe is deferred until the
GPIO controller becomes available

Signed-off-by: janus <janussss@163.com>
---
 drivers/platform/surface/aggregator/controller.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
index 6a8430cb9..4f9f4595d 100644
--- a/drivers/platform/surface/aggregator/controller.c
+++ b/drivers/platform/surface/aggregator/controller.c
@@ -2755,6 +2755,8 @@ int ssam_irq_setup(struct ssam_controller *ctrl)
 
 	gpiod = gpiod_get(dev, "ssam_wakeup-int", GPIOD_ASIS);
 	if (IS_ERR(gpiod)) {
+		if (PTR_ERR(gpiod) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		irq = fwnode_irq_get(dev_fwnode(dev), 0);
 	} else {
 		irq = gpiod_to_irq(gpiod);
-- 
2.55.0


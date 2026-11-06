Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951025;
	b=r9ryzjKDUUmPZ57+0l/Q5opIiahep26nd2N1eWyFP49nhvsIwLfZaYfNfoe6ogBgt+OO
	 tv6r+D71q13QLg7QnAqxRb7U2TeoKSSXxMetDUk5HTwPYS5Rl7McP9vc0uClNRXwcV5rd
	 U+CRNBn9D7fcMRTjLyd8mWQbWNB4BgSb7Ng5j24oMK5DjBRHdzu8yeKMbv5L/5w63OTe+
	 Ox/C0lvjyQaWunzYOhzTGnefRPSWbVrai7dQc5WHlZ9YwMbsmFpdrO5M8PCndkOsG/4Lg
	 JKWKMEO6ZWy31z8nGMnCChAf5gfeoyH+3osMAzkwC7o7QjlDBgaiLr1ZJtmNNaMfSUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4QV/HckYTY8WA/p+F3tZMrd4nGfNRUxAQURS9GMmjJQ=;
	b=xApKzuZorg2tSpjDsDofdb+iwJOoPzAKYFCOe0xM2Zz9QBV9V2EQ7TbJJQ2Yb8fXPdJ4
	 SmZapTIB5y/3pe19ZNsLJX8uE2cASjkcI/h9R9NcfLQfcptCl/XjlT47dF5nE7Cp9yAsq
	 azWRKDG9rGciazG28LgYnn0ZK6a6hA6hHwmxEfSCMRFIyRPXjTjzDuXaXu7QS7j0QSOoF
	 oVDTcWb3OGgzHAE5dqXjFd9slMgBqPeRzvwSfQnSLp2A8knIjfT7dfvjCY0/rZqkDs3Li
	 mnOJ9UVwb1zMHLqsx8acE34VTMJ5uqm4oW9RUnc8tZn3dph7yFHjzcfWKUQ7G3jq0BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMAvBa1Z;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EC0606A326
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57EC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMAvBa1Z
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ed2b4348fcso1232725ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 23:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793951025; x=1794555825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QV/HckYTY8WA/p+F3tZMrd4nGfNRUxAQURS9GMmjJQ=;
        b=CMAvBa1Z9BX0Fz5X2LFHevegry6gM9EBOL3Qep47/FzzBEkDLCVCoelSoxnt2ZfEVt
         LFJwgBr98ZyNlfjWXensubeCU8uxKDhyIdcChQRzPKh+EUc/eM1NTaAwrrxpCsU7TW61
         5rx1xfmyjO64tEJLYbn78KgqPYErHisHkht8aR8nkCU37cEGz1bn+0EP7lh1oFAzBFeE
         wwZlx31clATkBG+Lmn0dQZ6OX2bfWqSv8LMFDOwbSp4v3XK/YHW4smNs0r1Ws/wNvL8M
         P2IPuZ8DeOSTkcsX8SLm0/nKBm7Vyg6uWtfxDgY2EFNRJ4E2WzxfF2B3s1h5oLj/PrXS
         kxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951025; x=1794555825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QV/HckYTY8WA/p+F3tZMrd4nGfNRUxAQURS9GMmjJQ=;
        b=xfnOG2kJZVpr7xitWYpHeXpraWHc/moELcldWGMJ/PMJJkBJ6M2kDhfzZ0SQQjTC1P
         3KCQW0ZCOGQD9yX7yaImwQX5z1F00rrojrWXCUZ4F03ASwFdAu+LpQCG97ShoQTUjtuZ
         Xq0ZGJIIyFbMkPrwBjXaTKH3wUo1CeI7xtEu31pMtnDHRA2MzRQrVggRifk86rM4ree1
         9zI4Sl+73SL/J92smAP1KJR2grwNhWwAHqhLu7oToiLs8jcVMa94WhyajOd8PFlj2O1n
         rszvuYI0rz7BquHkS1dRO0m0PjIQlhgY/2vyiVq/BNUY/UrxwovdsMPaxopNI8bmSvwi
         moiQ==
X-Forwarded-Encrypted: i=1; AL+hErFGmxKfDEZPvRKR6cQheR2ir+uDDizvKLeiLD80fvVKrG9m+9ZE09+Hz1ltWczh6xnnJM/bJyC5JjcjeGrl0iG6Kb8E@vger.kernel.org
X-Gm-Message-State: APuU4Z/jW5uKQsBWnV0E+qHSjurXGmPCc5NcP3raR50qEUCBjOPCAMA6
	xyWydU/BBA84X9qcVFlN8xOmcq76bQN+Z2+PMxTb+qOE9et17rl+nTJR
X-Gm-Gg: AYBFou3jX35pBD2QFoz0QvKTzRFNpMNligX72T76WmjfaRCC1a4j8lANl6tNMmhFrh4
	KCx/XQ9FyrXSWR/e0gf6Ip+QzSKsZWzStA7d9MEqsY1ZWRn/cSB9pdVXFhj+B+KjrSfi1vcXXa4
	Cdih4uiTBNTlmXyD545NuoVjvBt0eIM/rs25qVJvVoQteqR4fSB3G06F+Wl+DhPoUzyY/+GWnC4
	aoqN6wqGLfEucfM/an4UR3sR9CP4l3sNh4QYr7CqGKdJEXPRNUrXLvuJywYqa+2ddkll2qUCSLH
	Ou03pctg8pPhqpKfJTZBveZ8lb8GdxW0B2F7k2A5i6IdrwOulWc4lzDGzmDDJ1XhKiB9pTx5aP/
	Fer5R2H4IMkT2jxUancUWPyPpUPIsDmd4wT0AiaGp2QvMpvKCJFhyx78oqXLljPQSdRZndqga8n
	cIDti6Gs6Qv9RbiHpmQrV7wJFognsM9kH5DVvizCyzXHlqlz/vHvzyWnzdW7oupztFxpETSR4w+
	3hEnagh7G5Dez6hj6qVVtl5n4ekZzIw6HlbAc8Fu6tsm30L7mJBNshfSxB4qeBKDKl0Wf6f/sBW
	ETavJc0XYo1Xxmdp1V6MtgL/1IY/+e+7lxsHRah9CsHg6sZD
X-Received: by 2002:a17:902:e802:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2ed40ad4bc6mr24848505ad.9.1793951024568;
        Thu, 05 Nov 2026 23:43:44 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47528e52sm2641035ad.1.2026.11.05.23.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:43:44 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>
Cc: Hyunjung Ko <hj351016@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: cancel work on teardown
Date: Fri,  6 Nov 2026 16:43:06 +0900
Message-ID: <20261106074316.2204392-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106043621.1903211-1-hj351016@gmail.com>
References: <20261106043621.1903211-1-hj351016@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

fc->work is scheduled from the extcon notifier callback
yt2_1380_fc_extcon_evt() (and once from probe), but it is never cancelled.
The containing struct yt2_1380_fc and the extcon notifier are both
device-managed on the serdev device, and the serdev driver has no
->remove callback, so teardown happens entirely via devres unwinding
when yt2_1380_fc_pdev_remove() calls serdev_device_remove().

devm_extcon_register_notifier_all() unregistering on teardown only stops
future notifications; it does not drain a work item that the notifier has
already queued. A fast-charger extcon event that races device unbind can
therefore queue fc->work just before teardown; the work then runs after
devres has torn the device down. yt2_1380_fc_worker() dereferences not
only fc itself but also fc->pinctrl (pinctrl_select_state()) and the
serdev (serdev_device_write_buf()), so it must be drained before those
device-managed resources are released, not merely before fc is freed.

Cancel the work via devm_add_action_or_reset(), registered after the
serdev is opened and pinctrl is acquired but before
devm_extcon_register_notifier_all(). Because devres runs cleanup in
reverse order, teardown then unregisters the notifier first (so it can no
longer queue the work), next cancels the work while fc->pinctrl and the
serdev are still valid, and only then closes the serdev, releases pinctrl
and frees fc. This closes both the re-arm window and the use-after-free
of fc and of its sub-resources in the worker.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger).

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Move the devm_add_action_or_reset(cancel_work) registration from right
   after INIT_WORK to after devm_serdev_device_open()/devm_pinctrl_get()
   and before devm_extcon_register_notifier_all(). The v1 placement
   registered the cancel action first, so devres (LIFO) drained the work
   last - after the serdev was closed and pinctrl released - leaving the
   worker's fc->pinctrl / serdev dereferences racing freed resources.
   The new placement drains the work while those resources are still live.

 drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -148,6 +148,11 @@
 	.write_wakeup = serdev_device_write_wakeup,
 };

+static void yt2_1380_fc_cancel_work(void *data)
+{
+	cancel_work_sync(data);
+}
+
 static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 {
 	struct device *dev = &serdev->dev;
@@ -209,6 +214,18 @@
 	serdev_device_set_baudrate(serdev, 600);
 	serdev_device_set_flow_control(serdev, false);

+	/*
+	 * Register work cancellation after the serdev is opened and pinctrl
+	 * is acquired, but before the extcon notifier.  devres unwinds in
+	 * reverse, so teardown unregisters the notifier first (no new work
+	 * can be queued), then cancels the work while fc->pinctrl and the
+	 * serdev are still valid, and only then closes the serdev and
+	 * releases pinctrl.
+	 */
+	ret = devm_add_action_or_reset(dev, yt2_1380_fc_cancel_work, &fc->work);
+	if (ret)
+		return ret;
+
 	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
 	if (ret)
 		return dev_err_probe(dev, ret, "registering extcon notifier\n");

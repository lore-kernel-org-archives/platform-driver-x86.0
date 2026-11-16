Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831617;
	b=4D4jLNHcWrJR/dIN4aX3ifKbv195I2jGNtlx4wagpLVgJJ3mzE30inabmm4L7sXCFUG2
	 pq8FFEBvy/IAr6T9VOw4jOo0AkNCMzQsHWZrnFUY8Y4zrgaxmQwOwMlO1rtv9a7+NsHfe
	 Uy7MjsBOyh4qXMTK2Z/RVqIfoCoRlokm0h9G8KbAdBmJpHEIu0S5XMAWSYIxtKHVLubcc
	 Xhx7oSHerkJAvlnRPqnQuL9g547B6bUkN921nOmvuUlQIHAKt00k7XlwINTWh2Kp3VnlO
	 f6XKityu6z5m3zNEnfyB9hAVp3e128PtZ6aJorXXacadixtmVz+P9sRG43WHdFkmtJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9l8aY4duwod5oh83bsEItxoT9PT8GG4ui0y9GtWOeCM=;
	b=k4ah0LsY4uMrfj8OYB8BKWmQwvQ4t2PwnL3k5g4s07ZJDsl1guYBmPQYzJzJP6/NEQMV
	 zf3NlTOzgSXzTUnG9NOhWgJFvPnwbj+8XIvB92cZu5RA1BsfLGOHZ22kVONLUw1oOkTrJ
	 27Lx9jQsw5yCfIvplcpBEmFIDYDw/ZybBYV7HuPy6+By/Da3YtYMfKLMQmS7Z/zbRiVkm
	 wOZIrWhjZnecjuFlmfXeXHiTodKM8kc8+E0UPZPamfPpgLr3d03TQS9Dq2uXsYl77EU8r
	 Ogf2sDlPWBDdgtJy6pgPgGq1eTIrn38PmoQhjRmLgsreZNlavZqgCEWr82iFTiO/cTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lneGMFV+;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A80606A329
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27A80606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lneGMFV+
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1409573a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 04:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831615; x=1795436415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l8aY4duwod5oh83bsEItxoT9PT8GG4ui0y9GtWOeCM=;
        b=lneGMFV+wKAhDHuklL7r7rmuDU1G+ohCB4sjR4HTq97HsrFQKSL142I0WnDGcBQ5Jz
         94EuFbYp2+s4LFmZACzhLbPYf+qukzpoCka8VjJgJt8m8HC2jnpWNEpO/X0GkgA6nSzM
         MyFWQKlhyLyJqaOlVooBax+FFG/fDHiwrfSESdWtwE6LbEZGRwHcBfep6TSro8LNuq/S
         hhK1t8VTuafpoaG/SDyUysnkeqF3hMhKckXdh3PczdZwskyhB4IYd7gyiMJV4UL481lC
         rPoOfeIRm9aj5jqgfambREQeMskvrfeHLlYf4g5yEhLuZZkJz1cuX27JSji/MJwyHQ/+
         a3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831615; x=1795436415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l8aY4duwod5oh83bsEItxoT9PT8GG4ui0y9GtWOeCM=;
        b=yvm4MQpKNhU/ymGpqu6IXiQR+NV3TDCo6FWaHBJfCss1Oio7WykDlPf/9XcyxTcPQi
         dBZJ7BtTn1guBrKCgP268SSkqRMOFSyxYPQloa7io2tQYI+DoCG8d/2FnMCN3w8JYuGW
         wu9mkC+3FsoRArMKuEpbAYNI3rXS1jaqURJC6fJyMVAPQTz0wdii36syWHcLlPfT9wSz
         l4+cykwbdt75OusUSwFBpXGpvkVGTz5k7NpqEoLIxfUrcW5bBloYaBA1MX7i4T2d6Q/g
         eEXz2fDIHyc0tftB+aMNrC55FQgbHelDtV/14jIb+UR2Ow2H6Eh3WDi5JwxyGj4HDFsZ
         atJA==
X-Gm-Message-State: APuU4Z+OR0shk08Axc7adSGWfuYY+cjvljd6GPViGXDkHE4M+/YL4YZt
	ca9Etkx/TPfEAfJake1vWXWwN1WzuUYpQpwoXSoEbTDkGCFZx7HCKnXKjzX32Q==
X-Gm-Gg: AZFdTZfopwGGyQElbQlZRjx5MAqk2aJEHWS1bqSfhBW+sCDXHnVsiyTrDPdzFlqkfI5
	H5GvdtDESuNpPMbtsp+7syTJ0Mel+Wex0aPhzpTZl+I+IzT29ES0lnixA4ysMaOkQhxY7bZ/HAO
	XkJD0RQRes+MWe4vQXxdqfyzhgQQLv9HG0hjp7Vvl1uzSFddDOrm3kANqPgy53g33W6T4IKm1DE
	Yo5RBncTA2DZoFuzH08nQmFm4fO6NKG4/lnC60BQvVCBC58Empze4D0OI41J5Rs38lAeJCHs1Kx
	HfoCGaVJhyOUcjYW9ZNwJwGZPnHSo7lDWCU4AkUmS9jxrvhcd/F2kGdNT8fOApZYxRoEiAQH+gm
	ODrSfDfqaob+0eHOdNKHfj8db1lpWGVPulGhbRaSNugsQdeFNUV5DRJhusuaeT3lmF/exzvmcT+
	mLwyMepvOH3r1dXUMyOTZL1J/11auXyWZfhKwaYu1DXhhSrb2m531OYdKAZ8UQXQRAIf7Yk3tfe
	A0yPree+OgtuZNRrQckIfuaxJo1hY5OYDdE1AbKc9zv8PvVAL6H8CR/DFvOXHn34hJsiSw1gnMi
	BywDChfMgFEhsvMtomwnqCEw9vB0YIpiyxs1IlFfGzIg5dr1
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr9314366a91.42.1794831615263;
        Mon, 16 Nov 2026 04:20:15 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm21783990a91.16.2026.11.16.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:20:14 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v3] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: cancel work on teardown
Date: Mon, 16 Nov 2026 21:20:01 +0900
Message-ID: <20261116122001.3096223-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Initialize the work with devm_work_autocancel(), placed after the serdev
is opened and pinctrl is acquired but before
devm_extcon_register_notifier_all(). Because devres runs cleanup in
reverse order, teardown then unregisters the notifier first (so it can no
longer queue the work), next cancels the work while fc->pinctrl and the
serdev are still valid, and only then closes the serdev, releases pinctrl
and frees fc. This closes both the re-arm window and the use-after-free
of fc and of its sub-resources in the worker.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger).

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v3:
 - Use devm_work_autocancel() instead of a hand-rolled
   devm_add_action_or_reset(cancel_work_sync) (suggested by Ilpo Jarvinen).
   It is placed at the same point in probe (after devm_serdev_device_open()/
   devm_pinctrl_get(), before devm_extcon_register_notifier_all()) so the
   reverse-order devres teardown still drains the work after the notifier is
   unregistered but while fc->pinctrl and the serdev are still live. Moving
   INIT_WORK() down into devm_work_autocancel() is safe: fc->work is only
   scheduled from the extcon notifier and from the probe-tail schedule_work(),
   both after this point.
 - Add Cc: stable (this is a use-after-free fix).
v2:
 - Move the work-cancel registration from right after INIT_WORK to after
   devm_serdev_device_open()/devm_pinctrl_get() and before the extcon
   notifier, so devres (LIFO) drains the work while fc->pinctrl / serdev are
   still valid rather than after they are released.
 .../x86/lenovo/yoga-tab2-pro-1380-fastcharger.c    | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
index 8551ab4d2c7d..c2fe919a3ce9 100644
--- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
+++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/extcon.h>
@@ -160,7 +161,6 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 
 	fc->dev = dev;
 	fc->nb.notifier_call = yt2_1380_fc_extcon_evt;
-	INIT_WORK(&fc->work, yt2_1380_fc_worker);
 
 	/*
 	 * Do this first since it may return -EPROBE_DEFER.
@@ -209,6 +209,18 @@ static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
 	serdev_device_set_baudrate(serdev, 600);
 	serdev_device_set_flow_control(serdev, false);
 
+	/*
+	 * Initialize fc->work with automatic cancellation on teardown.  This is
+	 * registered after the serdev is opened and pinctrl is acquired, but
+	 * before the extcon notifier: devres unwinds in reverse, so teardown
+	 * unregisters the notifier first (no new work can be queued), then
+	 * cancels the work while fc->pinctrl and the serdev are still valid, and
+	 * only then closes the serdev and releases pinctrl.
+	 */
+	ret = devm_work_autocancel(dev, &fc->work, yt2_1380_fc_worker);
+	if (ret)
+		return ret;
+
 	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
 	if (ret)
 		return dev_err_probe(dev, ret, "registering extcon notifier\n");
-- 
2.43.0


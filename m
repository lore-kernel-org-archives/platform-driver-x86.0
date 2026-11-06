Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939792;
	b=zF451Ymdl0sBT3tbnImQsA/0z5/pHGtAfzoRSHbBxFRZQdQ03Hp4fBIR2Nx7uNOYFmZA
	 1YFp3jn1Pm+qSE+JwHZXFANqzocRKrO/9FfTsOsSVs1ffY19fIdBcqoWPl8FYo2vMlxbO
	 FN4fnoz5cXuDVQ4qSUc6PsTYjz0DfORmvqGDV43PTKnNQWNGINMoFMgyycBTtvakpRZ8Q
	 FWS3uAxDbpT7UMjyhqruGPkC/7bN7SFcu2hInk58tCPLwnFIuaPJk7k/nfK3zemT1v5EI
	 kJo3gmq16ua+STF+DYIkEnq/N6yQ0gY+w/Cjcov5KDBQzdCtCbAnC0cSGDTH83wsL2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8rVnROm4nPnB2HY3REYHzMtEx5AA1ReooCxXqhoYhRU=;
	b=wXylPdRzYsA7K//L9iDLxS47F13omkiN8YFCyC8bL9EPsa6PROAtIsn45HfC7sFexW41
	 F9fWMET751ERvQ0NTQTRsF6CHhkb5LVlODZWbjf1WUTrVQMLQLbZUyUXFsBcxBm2+NY0i
	 z+yO5hFrOrirwZavGANq40ddSob/Fi9fCHEdV+b/m2kq6xH8JPkdCaO99GyfdM+Wm1M56
	 +W0B4F8kNQbNZM6AdLcMrJwxebPip3AWrAquIjzrYNp6QhqSM4XAuzj7NadZfe296DJQt
	 lNMqvgu0UbS/qP/F9DCUpbrZ0hA6F5sQJ+vTtM7VmE9GjpZcnJ4vtLvcKCVj8Nu2KhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxfJBlUX;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB39F606A31B
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 04:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB39F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LxfJBlUX
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b23182e5b5so182519b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 20:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793939791; x=1794544591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rVnROm4nPnB2HY3REYHzMtEx5AA1ReooCxXqhoYhRU=;
        b=LxfJBlUX+6nYXj2YfTCYYOBD55j8LefzmrzAmtXLQMhUPex744/2WQQE6uxIQEK/63
         Y33Ep2TfTkkC/DUQx1DKcdxEolX4jkE0HvsnwPahx1zVToYLdA71+UvIIr3XKsMqY66Q
         /cA/00e95bDjdnsWHoUsknGOf5PBzQdOizxCP9nUDP5W9Im3znhHaTexRDK2AW1Ys3Ph
         WuK50FhqgFdlj8fyAOrQKhFs4C/FNy5wSWUNDtnUN6CHTCAENgTpXMueznNm07YXK6pg
         VIANed/VXZodfiq33kNaX52ssChzAdnjujq1Q0W8IbDC5CemW3YjnOO8efdoV9V1aSsm
         ZP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939791; x=1794544591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rVnROm4nPnB2HY3REYHzMtEx5AA1ReooCxXqhoYhRU=;
        b=Gbds0T5G684Q+KFArvycGpUJCgd8aco04dRQdIrtnRXOmO13XRCGryf/w2SSXoQOEi
         IMMQ5C64s2VDWBi7LeCe24lEL76KtB9ho9e2SEdzH7ihg8ni2WdkwJ3teZwXJporN34f
         AX8SiZPNfRWwU8gOVpUcyVnmZN7JtZd2T4J4N3aFXsGjt8zI4AaVL9g3OT/mqLPSa0nN
         zQDJwS4ejUDVcrGBisHYdXPIGeN1jZAJ4DQ4LDhER1rm2b3yPUvW7/2+ZlcyQh7Nms3p
         jn/7Hb7A3fgjyV8JNP3FIprDv8vcSR6Ss4gOcFhQVevGnv8gqjESRzyK8pr7WiLY7b+h
         3KOA==
X-Gm-Message-State: APuU4Z9kWwgJtROge4tbmuY7ovRlMz+auS/bjhY63jXh4JdYuqVgT/0r
	ikupE4K/NvgPtU35vEwL7Nm2o715Ex6I1EmCvCBW1d70APWGfey5M9/v
X-Gm-Gg: AYBFou1gHlAta3QUJR5J5RLQLGb0AkkJIq6yLXvk5mLkfvfDpZG7vNFdEmITEFEQ4qP
	djHfHTY+45ev6DktsQhEHxJSWSuyLUZe+Z+lCH6uu28Mcmlgk9ZqsXm7ZFlKksVbPqWRGD3zEtV
	IbUseQrTpG4+Yon8uVoD2yQDBUHWpHN7nUOQzrhy0KwthB0JqltBiwCsMM2qpl6CWVXWYrkD2Nv
	P2q7N6gQ9Xs+2Z37jBsjihbdaMnJIFSfcq7My0uNzwENl0zDNWtMFUtYH3RvUcxxENog9+QYJXi
	RquntSHNQZeo6vknWwX8EUR0VWOtaxQalebD94deDlIW4YfkyFVzi1glQygkANo7WPmm2L9eG46
	ZzCTLxKbHzb6UXsHWgB3CJOc2GWNoYxU0FEkYUAgYkROD/M0vC4j+R0EMWhNT30ML7sLMZe2yE6
	V20UZwkUexXcClf93JykmIgcqP0ZMq8uVJ3/cBLhEuzh1M6m9gEjYFifG+StxqsmSQQ50K+Jf9x
	LzKZYNt2W3ZWTtn+Rs1x/OW7FyxB+VnY+Yo/swPTdF45gbDfsFD9Eb3rfsGGA/bS2JsMYCKG38j
	Qt/jIHIxXGU58ajjOrABw2cw9ii1lbrxFfpqnnSjeolGavz7Da/ssv1IxVaYbnE2gsJEFg==
X-Received: by 2002:a05:6a00:18a0:b0:881:750f:b142 with SMTP id d2e1a72fcca58-8b37dacbe3amr1414853b3a.55.1793939791041;
        Thu, 05 Nov 2026 20:36:31 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b356c287a8sm250728b3a.3.2026.11.05.20.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:36:30 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: cancel work on teardown
Date: Fri,  6 Nov 2026 13:36:21 +0900
Message-ID: <20261106043621.1903211-1-hj351016@gmail.com>
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
devres has freed fc, dereferencing freed memory (fc->extcon, fc->dev and
the serdev device) in yt2_1380_fc_worker() -> use-after-free.

Cancel the work via devm_add_action_or_reset(), registered before
devm_extcon_register_notifier_all(). Because devres runs cleanup in
reverse order, the notifier is unregistered first (so it can no longer
queue the work), and only then is the work cancelled, before fc is freed.
This mirrors the teardown-ordering fix used in the axp288 charger driver.

Found by static analysis / code review; compile-tested only, not
reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger).

Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
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
@@ -163,6 +168,15 @@
 	INIT_WORK(&fc->work, yt2_1380_fc_worker);
 
 	/*
+	 * Register the work cancellation before the extcon notifier, so that
+	 * devm's reverse-order teardown unregisters the notifier (which may
+	 * queue the work) before the work is cancelled and fc is freed.
+	 */
+	ret = devm_add_action_or_reset(dev, yt2_1380_fc_cancel_work, &fc->work);
+	if (ret)
+		return ret;
+
+	/*
 	 * Do this first since it may return -EPROBE_DEFER.
 	 * There is no extcon_put(), so there is no need to free this.
 	 */
-- 
2.43.0

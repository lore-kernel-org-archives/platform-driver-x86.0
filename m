Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC931B108
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925748; cv=none; b=CLkyQBEoNB+Nwn2r8uVkTl3sxvha2ZhaalcRDyUwXQ/QfdH9rgVur7Mz+HkXcWTSq5R/2rNU/PnTpUzQMyGhfnGbF2MSW746i6u5cTyll6QXGs0UmR8q+g0stwmSbetBHBcHP5SIYYai+bRv8jhSrLrBVnIm0Vq0jG7RBRSKbNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925748; c=relaxed/simple;
	bh=5kTMiO6eaOPZeg5Pbd1orb2vNf9F+bXf7bqsj1xJcjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7egpTMrULox4i9tl/6VcXlo9h/BZvA+o8aTbWvZ3BVqY3lvHAlowf0uWHx13yR1GaRNr8kRGHoFfiYbllJslkqfSepJNNM9/+ARj/GHEPD0pDPrmTRiVYNYqg33yb29pZFS+IAXqoe+ZDBLSI1cN/iU4OwzqX3y/+PUzu7krRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSj4J1E+; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSj4J1E+"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5013c912f9fso64205241cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 08:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768925745; x=1769530545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNqt/8fppsGYGnj2Tu2jRn4PRrvPiuvQkA3GokzXAvA=;
        b=gSj4J1E+auFB4beeNL4uHTeVIfq7Vv27v87e2zS13W+XLIih8FgN9sielqp17pG3ei
         QMyqhUdZ2RH/SyNSmShdlCkwdVqC72WKEijUD03sBGszrhPKdO2z3dESuKfaKlmS0OeN
         1U+kDKcQcVnozIYAX1Bd6avGfqixMcqN6JkvgC03pgPIb6ztljy32aCiUqsYZ1y2d02l
         LtrRWf+JPyq24g6LqiAPocY29G2vraWi6wzBdCJ4gHJMWAsqYgBd75KuDpp2wJQASIS/
         HvlJ6851RuM00YZF/2nVs7O/+PREVTubzPaWRqzZ66KwQfyFIbxhO6ftLqelwPedWCkY
         iWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768925745; x=1769530545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNqt/8fppsGYGnj2Tu2jRn4PRrvPiuvQkA3GokzXAvA=;
        b=DA51TJmFcc7tlHUT0DS+b5kc5/rcaSPE2sx+7tLKBAZCdSoOs4rF1nniJ7DZx0gaVe
         9yBWQrwdo6rfSxbEV2FIahcpg1zXxNwYmZeJfEpDbbx+UWS9DOtuVK+HhfPkywvlxryQ
         JF4hscjrTRIzcf6YJf5wqP04fMeWe1L98COSXjsfQSQHrpMBWffekmrihIZpmTBr2UVC
         7V8G5+MoGihOWSmdJpURBGUYeoYCpSRgx3DFW47J3nlLtnECq/a6XaGiqHbPmLy42tvP
         Ae6qwaYfv1D49BpftKVEePmDpTJGxc9MWvOEc7VDonYorAcNDnryPK3wgzTuijWytbsT
         +x3A==
X-Gm-Message-State: AOJu0Yw9dxvZpp87N88mmZCuGzW/pz1jxLMqQyr6MinmtsZNtH78ZQi3
	Mo1YRxrJ8mbaWPcbUpDqYPVNt6/x3PfyNsygoegjdD1V7NoF/1ZaWS5AfQVU3A==
X-Gm-Gg: AY/fxX71BKFcoMK8t5u/cpCSlEI8MxBQ16pljEmdpx+6uG2F6aJLJ+UfkGnvqAEMyHu
	Occ6O2jdp3XxEda1RYyzLpudms/tENYmCNpiB72Yy+AdV444/SMM/PLgwM802fY/JC+mZuV0HWJ
	euHVJGvxn5xznfm2Yy+B/l/iugPhFX4acGCSkhnzc7uO5vAdajifu+mf6BqgP9mXlWhHtyWy2t4
	Owqp9aV1MMl9HYIhK0fX4R6Fo0CPo+Hcox1mIPNkQa+g6VFlhgKBnQMXnzd+dACGT1W3eZPY2Yj
	sJpBRS5uryXqK00llDKuOvBVkcRnHo2CIwuHWF2NbOuHSHGqgjekLXl1eTFc4rQOiuytpy1BliJ
	sx+3uVp5mv6p1fxdS1BgUIRa6U024iDWCT1Bq8NtlvfTVgPK/ObTZ8P4PYSq71IRddAbcbPo3a+
	DCBFCCYLY8fvaM7SETVdowsmg/UN3qcr0utDKu23o9FykCMtDq0mUCAY4ECwCXN5xe4wbDm5P3t
	ZOeHwMxV0X7SfyeNW5ohXwopkAFjQ==
X-Received: by 2002:a05:622a:38b:b0:4ef:c4de:2ac9 with SMTP id d75a77b69052e-502a1dbcb2bmr168551171cf.17.1768925745314;
        Tue, 20 Jan 2026 08:15:45 -0800 (PST)
Received: from office-nix.home (hlfxns018gw-134-41-57-104.dhcp-dynamic.fibreop.ns.bellaliant.net. [134.41.57.104])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ef8b4fsm96091311cf.27.2026.01.20.08.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 08:15:44 -0800 (PST)
From: David McFarland <corngood@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: David McFarland <corngood@gmail.com>
Subject: [PATCH v2] platform/x86/intel: disable wakeup_mode during hibernation
Date: Tue, 20 Jan 2026 12:10:54 -0400
Message-ID: <20260120161100.29342-2-corngood@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120141758.3496-1-corngood@gmail.com>
References: <20260120141758.3496-1-corngood@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without this change I get the problem described in the linked bug:

> Wakeup event detected during hibernation, rolling back

The docs for the 'freeze' event say:

> Analogous to @suspend(), but it should not enable the device to signal wakeup
> events or change its power state.

I've been running with this change for several months on my Dell
Precision 3680.  I haven't tested on any other systems.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218634
---
v1 -> v2: fixed bugzilla link

 drivers/platform/x86/intel/hid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 560cc063198e..3a9561665b9b 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -419,6 +419,14 @@ static int intel_hid_pl_suspend_handler(struct device *device)
 	return 0;
 }
 
+static int intel_hid_pl_freeze_handler(struct device *device)
+{
+	struct intel_hid_priv *priv = dev_get_drvdata(device);
+
+	priv->wakeup_mode = false;
+	return intel_hid_pl_suspend_handler(device);
+}
+
 static int intel_hid_pl_resume_handler(struct device *device)
 {
 	intel_hid_pm_complete(device);
@@ -433,7 +441,7 @@ static int intel_hid_pl_resume_handler(struct device *device)
 static const struct dev_pm_ops intel_hid_pl_pm_ops = {
 	.prepare = intel_hid_pm_prepare,
 	.complete = intel_hid_pm_complete,
-	.freeze  = intel_hid_pl_suspend_handler,
+	.freeze  = intel_hid_pl_freeze_handler,
 	.thaw  = intel_hid_pl_resume_handler,
 	.restore  = intel_hid_pl_resume_handler,
 	.suspend  = intel_hid_pl_suspend_handler,
-- 
2.52.0


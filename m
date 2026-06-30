Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE83F39D0
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816652; cv=none; b=YnGdFPMwTh2s2psSBJQCwY3RQz51BYFJ8w/f1npYSNZFP1LAebhJD0pwpMII/ddf/0P0FPS4wpvxVZ9d2hsDGjdYGqWTXks22frPVIlA+HVsWanhEeu9/vx1oaDUSvJjM5igz7jJpJIttA0+REuY35tQJrswRiBvFY3DqCgQH94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816652; c=relaxed/simple;
	bh=JXWm8cPallOUrZBAAumtOBuCZZmD3WVwKyaijIbKTj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcSEWkPzxnTObCnKhSHd2r3MfmCiK3MNQbHC4XQgxvMGB8J556ZEPKi404Gu24gH91rkA9qe+RRMcb3OV5I9mufwcz1BSLpbjWkGDlyaampc6jY43H/uF9b45eDnyo+tOi1Vq7+Ft8xSpakhPHD57e1Wgx5iQZ5s6fP541WFWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9CqwO/8; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9CqwO/8"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-804e46366d7so35657667b3.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816646; x=1783421446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qeV2YpaisUEbHUoB+xezAM4vG3ItfsDn3MWCwvfDv1A=;
        b=c9CqwO/8yfubEWwHEZrc5Qypl/4hpRTJEXacRnXTPAgTcXRo1HUsGBSGN9y+3nrLE1
         QaHyz6hfGN2tntbMhCSF+fM5CVq3Kq4HWxne3SXoZ2rxqfumJsV7SCdPRjCJok5UnVGJ
         6t1yTPlA/9giogQADPXq2f6KNGnxORbtzYA0IGP5JQOOSsDnh5MtD+GkFKha00P+W+FD
         mxKaZ7Vi7GTB/Pbdf4WnBI25RFvanwJbav3Y58wH6vjiKMnQ+srWlBj1wDzOux8SXjKM
         N9juYNAgm3a4B+D7UHBwVb93KN7F8wvaA5g8R5bGgL8QJNlf2HMzCuhjxnwMCoW0ZJhJ
         K+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816646; x=1783421446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeV2YpaisUEbHUoB+xezAM4vG3ItfsDn3MWCwvfDv1A=;
        b=JVw9kzabTjbe5CWdgoWTirLaen/QrNLolQpJmpzvX25yrLj8/I+mY+d/KvBZgLaEfA
         dzdpyocAOwPXBGE4nO7GHHBki0fFP9/tXqPi5KBmnjmudAsfSrJw1RMEoTiq/j2OqdwH
         Iqn8dCv4nMU1VogJIXeV+9a3G4KjDWeFiHXyFuUdI5ROx2CX+x43x/tfA3fkk4DoPkUi
         HkKYUJi7aCKY/3evDNYBC8prasxt6GOuXjmBfqcwPtQSh3LtkgRSrg9x/ijtR6gE3gUE
         2m1L8144NiraAEFq/OxeC3JIWokAp+Q0/bcDrI6Rn+nGtXxzGYjNEsTeVA29QCw2okU8
         2CIg==
X-Forwarded-Encrypted: i=1; AHgh+RqE5oy7ixQwPsEirdcXGg7UZoq4UUxIfmGZxu+nw4rhuG9SJ3wt4EFq3Q+iNgCdUhdOudtTQ8N1EeCFN1Kq0lxJn/61@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/bF+C5Gs2MRaRlpCAFYU3Dt9i0nrIDho//TrEyoCj+KqeClGg
	ruEW0O6hPFKM55QF2RKxRxReLE1HkXq8SZzba9khu9ak/WJbpbQvEZrlIolEUawH3z8=
X-Gm-Gg: AfdE7clKrbEyaKUaHtaQLA4NlVHmXVSBSTTMo+16IvZcSXzF0P6IeAVf9KaExJK+nRa
	8ewH97jNZmkgt7PbkdSJxeZvkAkan9zEmQnkcj6zkitcv+NDjzRcn0hmqBTOrUljXQnv+vGGe4t
	YZAjffSS6E0qDMNjBpcf7pqXubiW9aS9kYOnerN9uuxDekiPy3Ql62ZjCPiywgEF8W1yM9k/PRt
	DSOq+SHWB0nB+F7/C0cYIIDO8rc+R35bN0FFF2/+1T/aQuQEp3XAEdY1RI0sTmgg6oBf3at0Jwx
	1W6sNJxpvg6ld58jwiNvDgp7DGcx7q9Ubze5UTyRUrzkjk5SSoil7je5rk02mB6N9lcoAGUB8h7
	S2g3sz5gNUH2rM3XRGKXbD9jOKJbcUwTBLvLOTpAJb8ZzvyIyMv5823LKSK1t0laE4DwU9ZbJh+
	jqB4KxaqNOtVkM1Ns5845KLaaDDA==
X-Received: by 2002:a05:690c:e373:b0:810:78ce:a003 with SMTP id 00721157ae682-810da315372mr35196737b3.55.1782816646110;
        Tue, 30 Jun 2026 03:50:46 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-810e7288a71sm9278217b3.8.2026.06.30.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:50:45 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: "Lee, Chun-Yi" <jlee@suse.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] platform/x86: acer-wmi: reject missing gaming WMI results
Date: Tue, 30 Jun 2026 12:50:33 +0200
Message-ID: <20260630105033.53967-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WMI_gaming_execute_u32_u64() returns success when firmware supplies
no output object, leaving the caller output untouched.  Gaming getters
then inspect an uninitialized result value.

Return -ENOMSG for a missing object and -EINVAL for a missing output
pointer, matching the existing malformed-result handling.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb13d0..81d354c80cd2 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -1581,7 +1581,11 @@ static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
 		return -EIO;
 
 	obj = result.pointer;
-	if (obj && out) {
+	if (!obj) {
+		ret = -ENOMSG;
+	} else if (!out) {
+		ret = -EINVAL;
+	} else {
 		switch (obj->type) {
 		case ACPI_TYPE_INTEGER:
 			*out = obj->integer.value;
-- 
2.54.0


Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2A1CA45
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 00:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782086581; cv=none; b=laBT4irTfaFXVKR48umc64Yjo+5F6InFPlCcFXcdRu7N9Ydj+LKWSgY8A+xcQK2njw9vIZNx5CRmxyuD186IRDLpL2V5XyhnaioOF+7ORnWnDPPtki0b5yJz7uKbUhFDd3rL7UgyiBHcgQGXn96lwH52pq/ytcBs9JjW7XbWYWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782086581; c=relaxed/simple;
	bh=vpifS3qEEvwq2pMRImRPNb2WaiLOsD7Qfy8ZnKJWyQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FGb1KVZGnW+8Dwy59i64Dr/C580SLk8e918LoQdg/kMX24sv2qDJohypuRPzGXlJbcGzg+NNDdhZuNCdS7uyLHoiBRXVNwjVbF3umdi2r/zW4OWVOEcDhc01iSmqFu6h8JSeu2jmgE2jUG/OVLlinXtIQPuj3Kf+M0rmX+lZLAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evpVm+jF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evpVm+jF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629d80fa08so3665362f8f.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 17:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782086578; x=1782691378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idLGngy4EJ9FPBvOW6cDJ7qwnwSjyLk7Zjw6tlhJ00s=;
        b=evpVm+jFb/eFzS2mOrmuNXhlCdsRuFsO1JZPnxrFu7s1z64xOHE6Na4W+pDqiFsXyu
         GVw/MjpsNu0PSrewwJcWdkOqRAQHXcv5QYwTQCNV+PbO5ZX6b94/RmzYPE1O/SSdL9KO
         u5TLyz62VvcS/fgeBklw/iS+ZWxsnj8+nNTmd2HgPAo3ZNBaFc9S75Ep7D6E4rJL16jJ
         Ztxrk7n70Yy3hkcc+7J/1lBcnAEHJDP/ze0OIv9TZYY+7rbmUcHm5fa2In2ba4UK0cA6
         yw5HIMVAw+UtmoTnvPO/WED9RA86pVFn2lzpfgj0WMQK40g20PHtXQzUrLJVLsDy+bZp
         tn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782086578; x=1782691378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idLGngy4EJ9FPBvOW6cDJ7qwnwSjyLk7Zjw6tlhJ00s=;
        b=F5zh3eo+jigkLfyVBVLfPyg9wUu9doVwCXWbUuZRIjHEvGJGukSewj/nttWJ4TROxI
         E/Dv+dmyLmc6umqGTj/wk1zj7ORCUO9Iwi7uo4vSeqiw3yhDq8iJKgrC1++Iw9Vb98aq
         +cR8m5COTxsHegwR8c7S7wdGpGijJfnagypwc6+VNUHmqiriS+Y754aRtkeBA8LiWUJP
         zZZOHs/AIIdxfTIdlCAEOIa/eK5/robPPnCSynH4iV4p1cxRtQM5jMR8yxDiVEMLOyFh
         tp/berweC5LWwMBOyW5RA5k5m3abWGx/QJfSpr9nHzv8znjn1Nco+wJeuLSSqko1B4zP
         gIuw==
X-Gm-Message-State: AOJu0YyUdzLGUHjVJdNxVZzI6HmkL2Dr9YpvUghc9YOw4BfDxSTUmBYN
	TkTlOiNNC9hoqcjWKACQx0phTOF6G4DaDfFQXeGHdK5fRG9by7yPPITU5eflut68tYs=
X-Gm-Gg: AfdE7cnqDO7v6MrUHorCg3mKkbJv6Q0EWMXY7wh232p9qoJ8bBHHdVaRTUjseD01v7y
	cw/QTaMdqCbCn1B87ri2ACn7DeK9Ua9icg3KBE9wxVlYofOxOfyDpSCZesYhHV7uYvha7jkQb5M
	cU4lKnIAbHYPjupEIVRjojVLvmZCxDMrD6UpN3GBcFsPNWKB5VdB77dg6j3BKS9sPJZiq7xR5tx
	+OLmwWWWfb+RWi9JIjiVCU61tURFQhjYrpZAEv6PeOCG+9bAzJqCvoaQXTcbO3coLuhadID7Xzd
	0GtWwvYYix1y7K25F32r2Kq9LTiuhZmHNyjJhktKi9AUwQfhCxf+7ax3fgScTv6Y9fOqcOx9b72
	Uzy0OnMTf/h4ur5wnISrtwCNNjNNbkiC9X3ZxQm1IgMQreoFIft9QFKl5sLRjGz03tNkvysec1a
	aNwh7+2NLHDN28KojC0qrr8A==
X-Received: by 2002:adf:e44c:0:b0:45e:d3d4:c230 with SMTP id ffacd0b85a97d-465090c5701mr15498971f8f.38.1782086578196;
        Sun, 21 Jun 2026 17:02:58 -0700 (PDT)
Received: from user ([104.28.155.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5ddbsm22090260f8f.12.2026.06.21.17.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 17:02:57 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH] wmi/core Fix use-after-free in parse_wdg()
Date: Mon, 22 Jun 2026 03:02:53 +0300
Message-ID: <20260622000253.210491-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Fix use-after-free in parse_wdg() function by
setting wblock to null to prevent referencing 
freed memory, if wblock is freed in the if 
(retval) path and address a minor typo.

Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
---
 drivers/platform/wmi/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 5a2ffcbab6af..9b5bd9ef5ba2 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1328,6 +1328,7 @@ static int parse_wdg(struct device *wmi_bus_dev, struct platform_device *pdev)
 		retval = wmi_create_device(wmi_bus_dev, wblock, device);
 		if (retval) {
 			kfree(wblock);
+			wblock = NULL; /* Set wblock to NULL to prevent a use after free */
 			continue;
 		}
 
@@ -1418,7 +1419,7 @@ static int wmi_notify_device(struct device *dev, void *data)
 		return 0;
 
 	/* The ACPI WMI specification says that _WED should be
-	 * evaluated every time an notification is received, even
+	 * evaluated every time a notification is received, even
 	 * if no consumers are present.
 	 *
 	 * Some firmware implementations actually depend on this
-- 
2.54.0


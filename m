Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76AF37C90A
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 17:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831115; cv=none; b=i/ZPtR1tjCnQkVXQCsX2Ps2j3jWjCl4ifA7jo35+pz7QKpOWRRm6WO6c81k5PTlX617o1l9dugkIMo+0p2L6LVp2CClSCzgiQYE+vFO30RP2WxbmA7uflJWCWjxZp1tIfXw3g2ha3lplrHFxlQzY02a/Z2MRy8jHM3u91aO/n9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831115; c=relaxed/simple;
	bh=IL+2A8kfmAKVQpbk+4ZmH6tICgNWPqzE3bDMaFOhjgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mMgdOi0eEKshJDeW/OXH/ixyN2kO6AfLoQrWDMmEwXMGo+2H8wzHjAC4oZtcYt+8qO09OMoQ2csnTp/5V22hxsb5VWOc6tAYDxuWL1h9e4iRHb/I0ilfSRghE2h59N0ZJYDOqtwSAnF7UBSFt28eezM49xLXh2RsQI7aIbc3wZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zx/WlC9c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zx/WlC9c"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so36656995e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 May 2026 10:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777831113; x=1778435913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGhbjnE1Sz1ILvY98eVHC7edMNuU7HHlQssLZuY1da4=;
        b=Zx/WlC9cwepdkzh1M/9hcVC0L6QerrOe2Eh9Gl8GnowulsxwsjmikzZlGPjgC39XUm
         OJeyvM9DUkpZNSTcMgFMBWgSiLMQvODHYP2DmtpeAhEsfK+ZHteGnmow8oBq7wE9ArO2
         gRtdWJmQVYskV+fXmdZrU8L2bmiUlp2w44hZ8v+oQYSoJQ/FjhTnBnFVISTYzVM3Fy4v
         clLD9qG9ho5o+haPCO0yPJ7BEBNPF5IP7wrVN8mNYcXCfE9wnCyBtGfVFcCzyfUw2x22
         bl+Q4yDTt+bcaUxFl4yBmaeS4KenV2Ld44rKEdXrPqyT5kx2GVTMipBd9ky4d+huxd+a
         bQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777831113; x=1778435913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGhbjnE1Sz1ILvY98eVHC7edMNuU7HHlQssLZuY1da4=;
        b=JLwtwWHviGgh2HrkjMEEhnKpfpYLlj1pqitRk+p6ABZwSPMPZE9va/+qo9w3LzCmbM
         g9ZUcCVhJH2m9m6XJd5XkAypHcJr+QC+3E1cWG5SJfv6LJGQlWbl3ZimSYYfqTb4qY69
         IGY9HiPnJZsdz2/2QFX7GxTmFRP0vkVMEf8kPvpyfMx/9q45bH+5p85bI9Xbc5g53HFd
         PcjtfgL50MF5Pgmx9e6//l3ma0PF+bDzYO7gFsxu6K0Gj6PE4I4zrqKo0DD8I4GpDU58
         OLlVv8WRXnxtIvN05/qpOfbOZXNTf11DvtFo0ms69rwxHuRNXxSWPOwW2bQYP3CVeA7M
         Q9Ig==
X-Forwarded-Encrypted: i=1; AFNElJ/7FB6fflTJPSvoikmHcvCAvGo/D2VocpMhLlb2s5CCUTDy9Qeer/qFYPhqfXP/JPYeaQxnGz5oNd8ZxKOaXCRVmP+k@vger.kernel.org
X-Gm-Message-State: AOJu0Yzva/2FwJ/9DwAxyXEI0ystDCeukiyiTQdwLit9ZjDjc5JhwcYh
	mHJWIToFBPkP1NRJiMcNynX/xKiNnK+ZSkBWPh+3HkSd/CnXObMU5POU
X-Gm-Gg: AeBDievmlh3rgbf06/ShfsdP9Nm2KC1DFz3ZLM8k8HhJJu9fHM1pezDzqVjVQmiZMjI
	hK3i004tLEJtfq6PQRnekmOOWwWC8OIPKYzisv4ilB+YPSKvkitM0jzxM1L8eorqgeXxVo9qj6q
	Hs/1+4VFFxYb8O3R6YtuXzXGxCFJz8EGKNOWTfCD0TcT7hlzUwo+9dZZ5FmyW/mZcefI23MdcLc
	agJsBJtmVUGdqLau4+j6Ts75ERDp9MItJwsv5cvFmqGN8LW9pjDyEYynriaOmPR8ZbFA04mV15c
	UaAuOUHpFP49THkCndY0OOjhJGHjGpza3eXVS6TGCmXC2GXTLGco8ZGy3MbTTRUmwhZQ15VcaDO
	3kuD8RXxZ159jfOIRY2cuhjXPbanWGcBD/Ik+O8GEcObjE9ba1yeyZiKECTFMxtVctTpAVUjBvA
	Qj/uIZLjkK/aQbkVhvn15DJG16D22Lq6kn
X-Received: by 2002:a05:600c:c089:b0:48a:7772:c26b with SMTP id 5b1f17b1804b1-48a98676597mr94096445e9.26.1777831112907;
        Sun, 03 May 2026 10:58:32 -0700 (PDT)
Received: from xyz-asus ([2a01:e11:29:8040:722:5fad:62cf:2b5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee4d60sm60375065e9.19.2026.05.03.10.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:58:32 -0700 (PDT)
From: Armandas Kvietkus <armundunelis@gmail.com>
To: luke@ljones.dev,
	denis.benato@linux.dev
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armandas Kvietkus <armundunelis@gmail.com>,
	fxzxaxon@outlook.com
Subject: [PATCH] platform/x86: asus-armoury: downgrade missing power limits warning to debug
Date: Sun,  3 May 2026 19:57:34 +0200
Message-ID: <20260503175734.27795-1-armundunelis@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a system is not found in the power_limits DMI table,
init_rog_tunables() emits a pr_warn() and returns. This is
expected behaviour for hardware that does not support ROG
power limit tunables, not an error condition.

Downgrade to pr_debug() to avoid spurious boot noise on
unsupported systems while preserving the message for debugging.

Reported-by: fxzxaxon@outlook.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
Signed-off-by: Armandas Kvietkus <armundunelis@gmail.com>
---
 drivers/platform/x86/asus-armoury.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 5b0987ccc..c8e9ff89f 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -991,7 +991,7 @@ static void init_rog_tunables(void)
 	/* Match the system against the power_limits table */
 	dmi_id = dmi_first_match(power_limits);
 	if (!dmi_id) {
-		pr_warn("No matching power limits found for this system\n");
+		pr_debug("No matching power limits found for this system\n");
 		return;
 	}
 
-- 
2.54.0


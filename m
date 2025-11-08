Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1981D95A3
	for <platform-driver-x86@vger.kernel.org>; Sat,  8 Nov 2025 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762602499; cv=none; b=HL88F4SaVuvgfW5Bd4wqE5TsVqx1/bQhIyAmPzMR8cGUku9+MrPXScNyJ6niEIGi8dx5mAAwrDqM2N+x4z3IBpSc679JDZii4cdyg9fn6iMpeUpkegLtzVNSNQSu8O6k9/hb4vDu+eyzEO6HJ3K/7vvTHs9FX93ZNoUBDf0CGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762602499; c=relaxed/simple;
	bh=5cdTnkkVED9/2W3bxFBK7nQFcUSBpM8zbejc4QhIme4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiN42S9h1boel8tqFUiJQB6gQqSRf7MlNUMd2mOdDTl7v5Q9D9Jyjw3SkFhIjSZpQXUexd9+y+ugOw4oqWgo5o3ZTPN7IRvlCnh8Vf50t+E8rC7DabCugfh0Bd6g5YxJPK8drTvrGCS/6v8bPE+Wc6c2ZNl0iU75hTRQk8xXzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9VmHVR7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9VmHVR7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47774d3536dso2277195e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Nov 2025 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762602496; x=1763207296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWQxduQP/C2sgZ0tZge6y0YoRp0qJh93EXdH14IqjbM=;
        b=D9VmHVR7/4RGo1PqM68bkpT3d+lBJegKTUNIEpOGPf8AyAYKlziy1hfkrR3TE2Cu9i
         l1zf6PoHhtUGKPbhELbJ7A30QeK6ZV9u0RnFGNnlSLnCodNhiFxuFooW7AAqIhmueKTQ
         HVxQ0phI0z/n5zPVGw9HN9XHZzxal6GrhugvV9bl1u3yb2mIEqpabFdZb44fLfh9Rr8/
         OhIMqGsw3J+01TWsTw1R32Sr/90xy3P2ULRm3oma5gDLAPpfjljDvj7+zp1lPouwqx5G
         BgBj8Vb8M2hBVCWqYPASlr7Hpmdh854PdFVutxSJ51whJPAhI93dbzzmDCtcOQXsfO9Z
         y4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762602496; x=1763207296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWQxduQP/C2sgZ0tZge6y0YoRp0qJh93EXdH14IqjbM=;
        b=A23MvpisuUnifp8f15OP3L3lxLODkXfXGLCW/mti6XiiXtFRPsw8SuxlMaRRf59UFF
         qrvT6O3TUa4TM/FPM1UtndOHq2rPneniIvdKiq7QS50kLyej2vP7paczmgDE9iY1dI9r
         RDPhAW6x8nf97MVn9ZWiXszDdzZ3nmdXBTYbbV4U5vvVOmf1mI14G/m8O5WAGRyovL8v
         itECYNYvLYbkjkX5+F30kEN168pg7rLiYc7AixduvcPMd0QL4N5HR6SNj9hVenQxW2x2
         J4pU2ze6sFPZbMsDeFbABeK9UV9ajiVKB5+VQfNJolZiAEzSbXAK5tTDeSfWGnGM03bN
         e+kQ==
X-Gm-Message-State: AOJu0YwLiaUmXUPe+e2miOt8ps17IXevIbV+Ag6ba2rxvrGqWpFdnPfP
	Y8bKWw4cxm2zWJeFPJwHM3l7p0u7iKvfi34lTR9aZ1udNis/2EfzXZKl
X-Gm-Gg: ASbGncs/MRnlDBQuDjO6V03I2n/lqvgbRhncZJIgH9MrClMOgb+gznUsy2ZyYsKn1bX
	6k6WIOOLnICKEnDEYMBGR/0cv1WuTAO7fKJeOyW6K8FThZrfbH4bP43IYh5ASdGw40eGR5Aj7Fn
	7Qh8/khAwNqkR7epj7EdOR1Xm1AKY/Qk7UC4pOoObhkHG1s2Zf87Hlf1pH4LpY/QXqWSJT8hyur
	YFJQWs/yGly6Qdmsjv9bGdczHcl9yDrkaAMtXoo/+0TNYz5JZVCg5DxTaGrG9yb2pcUDyyTD7FP
	TaG3hMZaYvBdcM2qpMKoqehjd20+G/p/6qs17jhtYN81ZEJ9Cel9p5nCTtbFLjfDp/dqD1th3vA
	Kn8tuGW9Vc6Uv5gcEJyAdj7xsY1osjmTnXJy/Ln9NwaMGMCWwAm4wPMo82B3hv+c15SdsccQNoK
	MQ6Z+v+TqOkMn2rCV3rSugwAzJklERxHMK0xQZZKQ3XK9alfU0
X-Google-Smtp-Source: AGHT+IHgxO1mIr8DQpSXmsqzg3ZZ+VysGIJ7PpFEGvZJqatwD9Nv+m3blSWxKLvi/w/mZvDvXnK+2g==
X-Received: by 2002:a05:600c:6b06:b0:477:14ba:28da with SMTP id 5b1f17b1804b1-4776dc5daa2mr33610405e9.5.1762602495708;
        Sat, 08 Nov 2025 03:48:15 -0800 (PST)
Received: from cachyos-x8664 (202.red-80-28-106.staticip.rima-tde.net. [80.28.106.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcd521fsm123410945e9.6.2025.11.08.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 03:48:15 -0800 (PST)
From: Marcos Vega <marcosmola2@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcos Vega <marcosmola2@gmail.com>
Subject: [PATCH v4] platform/x86: hp-wmi: Moved Omen MAX 16-ah0xx board name
Date: Sat,  8 Nov 2025 12:47:41 +0100
Message-ID: <20251108114739.9255-3-marcosmola2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <63905a5b-1dc5-e0d1-6c8d-e590c7e7c7f5@linux.intel.com>
References: <63905a5b-1dc5-e0d1-6c8d-e590c7e7c7f5@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed placement of board 8D41 so its categorized adequately in victus_s_thermal_profile_boards.

Signed-off-by: Marcos Vega <marcosmola2@gmail.com>
---
Thank you for all the tips on proper kernel writing, I'll try to do it properly and learn for my next patch.

v4:
- Added trailing comma


 drivers/platform/x86/hp/hp-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index e10c75d91f24..ad9d9f97960f 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -96,6 +96,7 @@ static const char * const victus_thermal_profile_boards[] = {
 static const char * const victus_s_thermal_profile_boards[] = {
 	"8BBE", "8BD4", "8BD5",
 	"8C78", "8C99", "8C9C",
+	"8D41",
 };
 
 enum hp_wmi_radio {
-- 
2.51.2


Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1F619F128;
	Sun, 29 Dec 2024 19:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735501651; cv=none; b=JZ/RRiBMoQZdnKroRBC2hFzhQWy9yZdbZ2grYu+nEOdc0yT1K1rRogaNOL7Z1/wysrSc2gb/cGJT4H+dwZCCn/0fEEvjHwrc5F2L3xxKH9yO59YgBkHzokfEhitC1/eyAX/zuSnMMRg002ugmNCkic679sPaVFyzXCqJym/kCHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735501651; c=relaxed/simple;
	bh=gs3uRmNNhDg+gom3qBYm5eDMcpi0sYKqEyaPYfgbx6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWuP29PKCnEDdRNyM3jcStiMyxN+wcf2s7QBPa3jQoI//sOqP4kVbQoo51zxV2C+2jI1YYj/GArJjlIZ/TTJkVXFwdfwq+eVUs5V435wRHhcwt3y5lS7Yniz+zWwZVh+lwioUqKpxqR5YsISb26jhbnbI24GXoYjCYnymHjTDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+4oBPuW; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+4oBPuW"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51882748165so2848504e0c.3;
        Sun, 29 Dec 2024 11:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735501648; x=1736106448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNFvJ3UKrXcroCkRZ1MUjweZC2rJBHE/2U7k9KVQxGs=;
        b=g+4oBPuWTu8QTu4lefqXSRSxS1gKl7xDp4Rdte1cfpN/hB1D6QAcP4T2ZLGKxYqAUV
         yovhy1J06RwCyO8zH36YkXoftvYRn7kkD/pIc/lEXvIh7A3mywfX/gS6cDCXK37qSFkJ
         IrvXHfhI+khdby7VdKKJtmjd11dTTUgNOyb/Q0e/2qXB+xpHISiPkMW6L6QkZOG+Xx1X
         g7A9I/jQLTUOc21tsgoJk9BGiWWHgigdjQGafb403//YRgU1Ai+3e/S+sRCWnnvvINdY
         Nrlz06QRGaniNmzJ0u/hoMg81bDuwziQW1QhVnnCspAETWqmmrbbSAAcBH3EWy274pfX
         24kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735501648; x=1736106448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNFvJ3UKrXcroCkRZ1MUjweZC2rJBHE/2U7k9KVQxGs=;
        b=tLS/Vz+k2gDcGyO1VkBP4qq/BRUAaDODevc4bB+MkN6NBiHah21QUYVwfhTfO6Nilj
         jraV5BqMwfsHmfJ8nn+xppgRBZ4jSw02I0rZxTVz88naglCSjR1sLiIZhqlBxSi+8vHk
         BErcF7yMOxU57ueqF/folamyOnUmLsVJy9oMsMcl3aGOf5y3N56A1ngypTUA9jC1h4zi
         QzUXu1/DhgDqe9E9vafVmKV7ivnr3tfHbal4svfqqY7/xnEVxjPUq1gvPbkWFGwliQAb
         hdHqVZLRsNC3JpTXGt+O2bKzeNgfahHQfCV6U0+V/Ov+N3O4+txPqzq+XOwb6igZvcux
         qVyg==
X-Forwarded-Encrypted: i=1; AJvYcCVp59BOamLikUnnFCnKZMaXFIYn4ULAy+/lje/6VsaAeSRscZDIouLuI7Pf5vPHYlZdhwoFAEf8HUQgN40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSM5K+RLy+Vji6DAP0j85iiYEMbUajAGFHECJuYCezscenWeTk
	10XwDU31Y2mnw6PcanE7mcbviDa9NoM/g4rznjwXRXYRyT4Ou8DaxxbmnQ==
X-Gm-Gg: ASbGncvKvgxtUnOEq10YZBqd/YlW5sznobAZZrG0PBlW9EZrgQETV6GkfHSIX5jpVdB
	pleMCnmsVnnE5QWNO+nXvyD42zeXwaU/xDOXMmWpTOvjIaPlXyHkAKlGBaHHe8UPKqy2zCaAnIW
	5WRP99MxHmY836cv9s9M6jFIhKp3hyPgm69Lz0jPOXAmDIgWdGf8ajIJbKv0lKAmfMLFCvZy7sn
	hCrrmVh1rhAw8YSr9WT9r/16e4vroxxAj3oen+CpCuwvB7OiMrsbKPiZsd/M+3Z
X-Google-Smtp-Source: AGHT+IFJG8oTiDtVjcoYMdVjEnohOEoLd6CQpLFpKKyKk8ictJRgOqKT7qQB5IR9+Wkw67vSutwU2w==
X-Received: by 2002:a05:6102:c8c:b0:4b2:5d65:6f0 with SMTP id ada2fe7eead31-4b2cc45f831mr23175583137.19.1735501648215;
        Sun, 29 Dec 2024 11:47:28 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf98ce0fsm3753555137.3.2024.12.29.11.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 11:47:27 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	Kurt Borja <kuurtb@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v2 14/20] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Sun, 29 Dec 2024 14:45:01 -0500
Message-ID: <20241229194506.8268-16-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
References: <20241229194506.8268-2-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell has been inactive in its maintainership role of this driver since
around 2021. Due to this, add myself as a maintainer and update path
to support upcoming changes.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3809931b9240..596c6a46478c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -784,10 +784,12 @@ F:	Documentation/admin-guide/perf/alibaba_pmu.rst
 F:	drivers/perf/alibaba_uncore_drw_pmu.c
 
 ALIENWARE WMI DRIVER
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
 F:	Documentation/wmi/devices/alienware-wmi.rst
-F:	drivers/platform/x86/dell/alienware-wmi.c
+F:	drivers/platform/x86/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
-- 
2.47.1


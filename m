Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F5257851
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 14:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775400315; cv=none; b=fynT5OyWowZ0KUVKJ6P/3aO5Hw0l6OKEClvk/0jWurShir37fzp6RG2tBgxkzMuKEYL4DrleGzU2rO3ul1b7Rv5u2xuUR4yFk5GmE/Lv5j/FYT+qGs6me//MNE5/F29vqjP1E6YVyU7qoohHLD+rmvaNbyWiokPgcwcZQ0BA9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775400315; c=relaxed/simple;
	bh=tkrvEtZ4WQSCiFhqWBbNgBH8eVKjWLUk1kGkERCJHwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYrnB+Vj49UeoinuRU4+hTEq0zfhq8pK/rgx8u9Ovc7Im25/iDkBQD9OqgJgL3t5w+PY1jO/QGXv7bZiAzA+e+3nbKnf7j5Apvo8dTQxphTaTfC0zLF1FCOlFZcdz5TZPydtFrytczyq1hTMwmwuczgqwhwoegLUT/7NAZXz0j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smsNkoB7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smsNkoB7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d0292ae5aso173806f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775400312; x=1776005112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTRvg62YHKKbl2RSllukQcxTo3F/ts65IHiRDno4Nls=;
        b=smsNkoB76KMX/iPa+KWzVzD34wtDQNKok137vR8rZkpv1Q3RnSld2tQwtxjTZ51KZO
         Rml6lNTY1M7B6Q+ZuJFEWNWrZWegCQkmgprE/P6gEhg88iDOR5wbORT+xD6+wRRVYOn+
         hR5I86lE99sOI9hUVHVaDlr7yCMx5suxqTibRo6u6EJfeBKbw+1k56P4JVKSQINitAP1
         qwe7cazUYM5Brm76rK+3sty4UZbyzKWaijlQoKyWA0VLJCgXK8cXWpg3EA5fmMnWML5Z
         TKT5lMj+4rEb9Oup7ed7qP3f4RBmkkSrkpHCQmMlEHY+f7eexMis3OlNnRlboaoYKmJR
         XO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400312; x=1776005112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTRvg62YHKKbl2RSllukQcxTo3F/ts65IHiRDno4Nls=;
        b=aOXZzCQt0jQeKq2xUUGnf+PLw3t+MIS3gd/gzZvodyl5yRZ/W0PA98vBPRnRosksqs
         9UL1pA7rHcNS/TEOXVgnYD/pRdrJjGN7wStzQ59MmEAdEnthS42hsS+B5nIxblWMaPed
         RofY9/41Aaa+oFCyv0D/SmL9tNjjbfxPCzoxFIPKz6m8LKKUAQ9cQE4PnCHTqXoQH/Fs
         s/t1T9TG3twNJYrYWoJ4V3PQaY8ovprBOAz7XGpSMfXiikQT5G02/ZFm2atB4gYNirlK
         zEZoYZmkC4ocf2q2GvU/df6f2Z4lzV93VaxrJo3gQ3QNzYTlghGfaP/lxFHW3OUqmW1W
         6Jcg==
X-Gm-Message-State: AOJu0YwWNBxaULvAsmVO5vjb27sXS09yIAZyO1Dkb3BXLBmr7Qnywcw5
	eUv0GWwp0EQf6ax3XzlyGU49DR3FT/uNrlk7lfII5mQ6KqGh9dzAkA1kddA5RjevVbJPCg==
X-Gm-Gg: AeBDietnRMwIsmBjVzWRbV0G1DX5hpO5QIaWtV8tCYezReU+YWcgf6B8AaxnIl+505g
	7Xo+IQyLYMkUfUgWpuUPiI3fjEr2jZlb+i5uUphhPqAsYiDyNIax6LrMrODJTQdfO3SNGq1XlxY
	uX/eLs3Ohw16fZoDdys1nLMvdyOJLCFHLoEW9V2q4NYi3poXhrOs+JH8dNi8f7Hf8MCva7lCrck
	wz50q9CG8IMt7kGTE94xi7mrxYO1ZrV9kBWWlu2d+u8pst+eQzDxQLvXud+G2KU0C+JopnmnkJu
	zxRTe9C/x+gaPmprCtbVCd373j78sr08W1QUmMER/pnTM+X5JMzgu15YQE01kMB4KaG1ScuaB2Q
	BjHASs1zlwbKWkLfGw4QdZlz6SBJGuZk5EfZOx3RyA9HWA3SDul36QOOCdJ8Mfxa3kjPrml0qeT
	zA9EGtXfxbDQoCV06r4t0yFyccIOIfXRbYk4b2zqZLRLBweL73gqWIJtihtho=
X-Received: by 2002:a05:600c:354d:b0:487:575:5e3 with SMTP id 5b1f17b1804b1-488997a5edamr70650735e9.5.1775400312355;
        Sun, 05 Apr 2026 07:45:12 -0700 (PDT)
Received: from fridge.local ([2a00:1d35:c836:5700:77d9:f36f:3748:d642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm35698799f8f.32.2026.04.05.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:45:12 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v3 0/5] platform/x86: hp-wmi: Victus S fan control fixes
Date: Sun,  5 Apr 2026 17:44:55 +0300
Message-ID: <20260405144502.24944-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bug fixes for the Victus S manual fan control:
- Propagate fan_count_userdefine_trigger() errors
- Fix cancel_delayed_work_sync() deadlock from work handler
- Use mod_delayed_work() for efficient keep-alive timer resets
- Fix u8 underflow in gpu_delta calculation
- Add mutex for concurrent hwmon state access

Changes in v2:
- Patch 4: Store gpu_delta as 'int' to handle negative deltas correctly.

Changes in v3:
- Add Fixes: tags to all patches.
- Patch 4: Remove unnecessary casting.

Emre Cecanpunar (5):
  platform/x86: hp-wmi: fix ignored return values in fan settings
  platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
  platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
  platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
  platform/x86: hp-wmi: add locking for concurrent hwmon access

 drivers/platform/x86/hp/hp-wmi.c | 55 +++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 18 deletions(-)

--
2.53.0

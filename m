Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553FC3A5450
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571938; cv=none; b=tPoQhPf5cGvBmlAplyyMpVXD9HVdcnEALidNLzdrnqKWDJDP0/j65P4hA0TCOZmm4MgpkiK1MvBhtHUsyxIL6n1SbDk9oHXQi65d5I2uxiwLiEXyqzDYXXzrncJSR4GF4bS7901E3D18CajRqIn5h43yJilrrr17Vm2ifDXQUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571938; c=relaxed/simple;
	bh=C1b8DhnjoTPYFNF8FR44nLSeIWMA8FOIiyAWwWCQPM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nb918wQUbsqxeK4CzBeA4MvJQR6zOE1Jqi3UK9shoZR3AMDpQf5WP9SUKeCX2Si96H9u61o+CtPZu+Z1WxOUKjzhlhrO+6n+E13iPG1LGjbxIH9BhZAYJDBj1fqLZoPxSUbOq47nKRgIIkLp+lIRGcN+y/LOV49BjpPZEsJpYs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYRBNGLE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYRBNGLE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488965a9ca1so2652615e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 07:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775571935; x=1776176735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ovmrV+8r3ndatY7ScOMAKozR76LjhLaaFKO4szSCWIA=;
        b=nYRBNGLEglBY0lxIakARtadIJUQMycb42lARkY09o3xrifkS2ixEo6KTzAISq2nfu/
         Ms58PaXcGEido0yromR/fz8ZMJq6LPh6CCWB4ksqhr/Pii5Yx8b9rwRiMDxMxBZaZh5j
         Sagg44QzB/nJlVQGTFaZLBQLzmto9J00ag1p7Axsy5OdHvzU6wy4sisse05xs2jn/Chx
         l6cxHKewidNFgFj4LoGpsEzn3O3vPzRF2VVbycYdlfo4xfcP9CUz8MFa5dJO9/m2H0Ux
         Y2kzT+FJBzZZPCApZrP1prPzIe0VzRzL4TmUx+Yc0GpWtgNMNwVJh8AZj+yYiHAu9PWP
         jprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571935; x=1776176735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovmrV+8r3ndatY7ScOMAKozR76LjhLaaFKO4szSCWIA=;
        b=XRgUFWAed7eKMdv5VAsc7Uj2TPHE+vmHzHO671T2hXpc6S76t5CAfyRAq7TmPIL+ua
         AeD+vTUEj4pcXLwsXG9D8siAz1/tJXxIX/1UvJLCoE5O9/GrK+BcSiBW5XflfURoROXH
         4xPEi9sC9nhzsEtJgGw+oVM19ses+JH7H0u+R+zk4hHy54F/vGeh8LMCC3JkuSuEvX5R
         gQ46jc1/XcVplftr425rTl5fdgewubkjss7krAb8vvFnNqWdUDxbycMbhxiiypIHa9xK
         pHjEPxnpjwqA+uXApgt70JVOFm3yo+3/97uL0JsIV0gY7VfxFzHqQ+tGvQtkZHkNYQZm
         m6vA==
X-Gm-Message-State: AOJu0YzQKXhMhbs0vY92vQX8uyZhSymU0aiYBMt3uOOOl6dWV+ZkEwYL
	RE3QDnvDlxfbZuW18aq2ejyXV5kKxgjW+sAGlbozHvMScncfgbZTGdTXKGpfLwJ4+DRzbw==
X-Gm-Gg: AeBDieveCqJ2crHOCqI55xGRTyPtARHed6JjN72flDxhHGDF9osmcnx/wlkKyJGgUGz
	vleHXK6CaMLbXuR+s0VREe3ityCTR+dEB8fRZqYzwDXqWlN3ya1w6zR7XHL1Tpgegiz+mL8Q5n+
	wIBol6p1zQhBYg++GL6iZxRQDjHl3glEJkqa7JJaEnqCF4bbM0OnkHPW4BZasOsVG0WgnGItwVk
	tCqxbaoCqa45W2egRqH4dy9gwyaB82xERECDq7F34NHmfNMhmjImZorPMS8DOnYCCBYPdoRtJ/g
	+BCccH1nNylNZdH/iG3QBugPbkmuQDLXxgZLiLkwONYDBXpz5pVvVS1vkilRxLL+cjlHpxz3rVJ
	hNRgUIe/neXhhHLBsI+PWPxL91kw3JsPG2tvIAKoQEiEm+Ei+IsUD2neeg0hE0l7IOgpqbL/CQv
	oBleacgiOvlPvNjENk/jdVWdZulY+twobTQR84kPrykgtxHgEiqScP8dBh/RsZjw==
X-Received: by 2002:a05:600c:354d:b0:487:17d:d0bf with SMTP id 5b1f17b1804b1-488997a00a2mr123016845e9.6.1775571935438;
        Tue, 07 Apr 2026 07:25:35 -0700 (PDT)
Received: from localhost.localdomain ([31.7.38.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm53489990f8f.32.2026.04.07.07.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:25:35 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v4 0/5] platform/x86: hp-wmi: Victus S fan control fixes
Date: Tue,  7 Apr 2026 17:25:09 +0300
Message-ID: <20260407142515.20683-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bug fixes for the Victus S manual fan control:
- Propagate fan_count_userdefine_trigger() errors
- Fix cancel_delayed_work_sync() deadlock from work handler
- Use mod_delayed_work() for efficient keep-alive timer resets
- Fix u8 underflow in gpu_delta calculation
- Add mutex for concurrent hwmon state access

Changes in v4:
- Patch 4: Prevent line wrap in gpu_delta assignment.
- Patch 5: Use devm_mutex_init() and handle init errors.

Changes in v3:
- Add Fixes: tags to all patches.
- Patch 4: Remove unnecessary casting.

Changes in v2:
- Patch 4: Store gpu_delta as 'int' to handle negative deltas correctly.

Emre Cecanpunar (5):
  platform/x86: hp-wmi: fix ignored return values in fan settings
  platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
  platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
  platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
  platform/x86: hp-wmi: add locking for concurrent hwmon access

 drivers/platform/x86/hp/hp-wmi.c | 54 ++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 17 deletions(-)

-- 
2.53.0


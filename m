Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B43F65FC
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050885; cv=none; b=tlrTYjJAz63Dak8Z7SXZrM54xr7pFVE8HkThCjUAog45V9qxrwlfOaSCYHmCun2D/ks1TWGj6SqyWFUNEaeM40H/tGsp+u7y9meuCGHosWGlMZ6LgNnikSBpBqgYE787Mo2JRa5fSS5qsSKpSBkIcARzKNroqO3qvP0ZWjXU+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050885; c=relaxed/simple;
	bh=4Qv0ASzBZ/GHMP/cF0uuMSr/kHt3nxx/rYtASmNluvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQpESnbE55aQKRN8Dp9LOliffJUZgEeT5QYI+txm4HPpSA4s1cFzjmevGEFad953xUtVK3+fPBvMGqtu9mrKyW0F3eN2VgfpiZDPl4oWjBxagu0/oWwXKZcG2X5bSsnDoqXfj764zh3TI75gJA5O+dEuSi6579QMNDpuQSQpojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjqGrruv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjqGrruv"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483ad568d68so3619375e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774050879; x=1774655679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5s66dB2mGXA70emn3wqJCYnvCXFNfAd0Dr6Dg6TLwxg=;
        b=EjqGrruvohtYMjfKPqKLRoxS4tc4Rn8Y7FxQu4/zuIyGMYrL4VDV73gf0tqYXl8Arv
         xzRYRfDrzWKNSBJMvLGfrLdcy5htDwMivoixIxNR/Cp4EQmrEja5dk1ivpukixlWwCdk
         9Rg815Z+U23RLtK7dOCObQDI1rqbVlBrmDlyRk/yNvhG3v5/JzP7Q2ZklLQQ+utUoHww
         l6P3L59IDlqQru30K/iDHc10LJWvK8GStoyDrGJLiV3kPgjnAZA2qV1D/vLr1PCD2+hi
         JIWiyy0ObJl5jqbrUgOBqYZfHNvmHEaCXByvhAEZhGc2iBCyzMzrCxNyVuXXmijcvr7H
         x6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774050879; x=1774655679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s66dB2mGXA70emn3wqJCYnvCXFNfAd0Dr6Dg6TLwxg=;
        b=M1SWIjASiGlMDwZcy2aT698Fy4xyctiYRe8C+Dp6zQtf17NWlPEIVlyq0IYKZgYnn8
         DKjUiygdzQkmrv/MDoIfmnf7F6DHesSPSRiDgHFMHcypsEuE/+Hp5SrAwC8I19w/UT9y
         UVgpIo27Q2p5/pew5FoTg4PnKo1qS1J1HxgMV4d0aCyQvrS9czLJ/J8LvZpa9XBOWrzS
         58FgB9dE2V79/otytPWr/q3xJA0btJ/po4Cn0Fati9ToVyngQNnI8r/MOENS0cqggh0S
         Q3tjK/enuHVQOveATB+LHuiH0yeFEfwVdV/quOxwCOHFKzt3NsCvsSadUzewre174VJi
         R2cQ==
X-Gm-Message-State: AOJu0YwCe3UGV0mKF/3JqoaxJZowwWLFClSWYRY4O9ViaSZ7SjPbONIg
	N7Cm3U7sZUOjfKjONxYAZ0/i+CFTnRsVWfW+bd//UNxCJUO83wclThsbJp6NFbbQfsU=
X-Gm-Gg: ATEYQzwETddvc3REprTPyHcrOuWC7C8RAptRWNe2FMeVHqX0ouJSWzCk6BGqNZ0nTSU
	CdNyaZuYJF+pqBTU2SjeokSesFJPtmesuqyd4F2Oz+/uiCCs2CeJUxHRS9snsOPc7vaUGx2Wvuc
	wUlmQR24PpbWt9F8o8MP7HHHXa48SnE786msNb+A5y94xrFNxg4n+uGPDRqRwh7voMuyGcQs5wf
	S1W91/MNTwUXSUe5FAF9Rprl0xlWc5/F/5g0PDazAlyuuqYoHZZULD98BNSVDCE+CjAIwi2M4Jw
	sNWdag0nl/CCsWlxPcA384VgZ/mtnh6coFggxUv3iLSvZXXuK8h+S0//U4AvLDpHCf4Ccq9GvXo
	X8Ya20y2m3q5lbJqemczfmGLYl/b9YlH7nLOo07hBOJbbjSmc//wvyDLiXYbNjxV0lLJKY+ZRxn
	bAGzwpVOerZCltCQ4UHYetEx/K/fIeuFIxhb1G45RVb08R9w==
X-Received: by 2002:a05:600c:a43:b0:486:fdc0:4504 with SMTP id 5b1f17b1804b1-486fee0b930mr40519965e9.4.1774050878549;
        Fri, 20 Mar 2026 16:54:38 -0700 (PDT)
Received: from fridge ([195.174.58.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7ea44bsm95104805e9.8.2026.03.20.16.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:54:38 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 0/5] platform/x86: hp-wmi: fix bugs in Victus S fan control
Date: Sat, 21 Mar 2026 02:54:27 +0300
Message-ID: <20260320235432.55580-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes five bugs in the hwmon fan control code added for
HP Victus S laptops:

- Return values from WMI calls were silently discarded in two paths
  of hp_wmi_apply_fan_settings(), and the function's own return value
  was ignored by both of its callers.
- cancel_delayed_work_sync() was called from inside the work handler
  it was trying to cancel, causing a potential deadlock.
- schedule_delayed_work() does not reset a pending timer, so rapid
  back-to-back fan updates did not extend the keep-alive window.
- u8 arithmetic was used to compute a signed delta, producing silent
  unsigned wrap-around on malformed firmware fan tables.
- mode and pwm fields in hp_wmi_hwmon_priv were accessed from both
  sysfs and workqueue context without any synchronisation.

Patches are ordered so that each one applies cleanly on top of the
previous. Patches 1-4 are independent fixes; patch 5 (locking) builds
on patch 2 (cancel_delayed_work) to avoid a lock-ordering issue.

Emre Cecanpunar (5):
  platform/x86: hp-wmi: fix ignored return values in fan settings
  platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
  platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
  platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
  platform/x86: hp-wmi: add locking for concurrent hwmon access

 drivers/platform/x86/hp/hp-wmi.c | 59 ++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 18 deletions(-)

-- 
2.53.0


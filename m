Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F041FC0
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 02:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789957116; cv=none; b=jtj2BzXL4hFLL+BUNQq4kZLLgfmDbaf2rmnifBpwRvt9wHhoWvheZ45QvI8jmfD89YjbOVAePzB5OXos3+2jUk3iRn6urLn9a4p+7wqmxpuqnMaVOziV7xDBQRzcnVnpEL6eWeLUgkDkpboE55zJeHDBPg+neEFX8nE3kYz2L3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789957116; c=relaxed/simple;
	bh=kB6y9EOcBHzorCVkirXWvKe4pTZ7To89vLC0KK45g1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7+QlpS2tMaM7ra5T1XqtBPQGkZAwIg17dIMHqG4Di+QetF2YFDcNQ6zruF5GPuYyzfzNrsc4WCzxzzCj3pZboniUBfR8WreexmhOKaHJfl2E/GDlV6+TGpsPY5di7CuzEigzA0LfUXnY5OA0z/t3XjTWu21D2JFrJmayiiznXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOoJGRDr; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOoJGRDr"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-9120eda2195so33666486d6.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 19:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789957114; x=1790561914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cgFIK8N+wIj6Y6BlLHg+qsRFyIfDWQy8KPcErUZxRVY=;
        b=FOoJGRDrL5uyGoEDYf9w5UF8OY9RuhDZ7pFoyc6+o4JxA4kmUrVuuTTzHGq6YKWgVk
         Vrkn/oKvhwlnQ3Mw4pMx/7LmbB9lBsI8YeNv5nyBVhh9P/kA8hfv/Vg4xLttozY11/nK
         Hwe+6D1Hcj48GW9cGyGUCMnvW62ZLX4vn2lgWl/qyp3T6jIK/keA10MUvgLA17uvyQix
         lkqnuBa7aG4NPFmLQBcSrCn+1wt2Wi0sBvtFvYD2nH1mBn+4XAQTulxc0Jmoi+XtD9ha
         ic8plIvcr1WPhhn0h+pJfj3UJJrGI3pyao2+n1RbnN+51ubcvEgo/E7hYpbbDXyWWgc5
         p3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789957114; x=1790561914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgFIK8N+wIj6Y6BlLHg+qsRFyIfDWQy8KPcErUZxRVY=;
        b=FqxDORvnvOkYw90vTJyojBHBij9FBmJO+YX43hTs6ESvLqBpkIgQJITR2UEntyMWAD
         d3OAwflVgFDCQAd7BCDXU1KxgPhVSkW6FUSXVY+GQ6S4IjYQs894aDFbfxQi6VbvehCg
         xQee9AHST+uMUh6fkGx0NtV6AXK6+FdkTl+zi4ZRugUiCNSO4dooRl287ybOymeJ8SUo
         BxoMyu8wDWY5yt9LAlYY9r36H8uUvlQzve8zB5qABCIqw/qI3+FcPkhertDG34/I3GGR
         m4uTgosDePbqcb2QtOcUDzPl62xGeIzYYsVkj4PfRNgBvr2kKxn0CoTZQZb7Tav7Cxmm
         OHCg==
X-Forwarded-Encrypted: i=1; AKwUvBwyyhHXDJ5UwKiNfmOSeVx1qxdv9UqfgxEzVLi9HF3txJTvaa/knXreKv8Ob5uSBrZK7ybj42GTRjCug9XMSWqowGT8@vger.kernel.org
X-Gm-Message-State: AFuF++kfKPQMC0WrPNuVJgrzeHQ3Vr7dT88gnuyiaRU37bZCpR1ZDwCB
	mWavhEtZnw0aaUt2fovUGL8uv9+Ix7BSdBbRp3Dt8DjUWDCJ4y7O11M=
X-Gm-Gg: AYBFou0PDtgoSyJOl3nIBfITcDVVbfdf7cBYk69QVRboq9+FU3E2KAMnOnBoRGvFYJ3
	RgzbJSvNOQdh6Wr31eo2NS2ooUQMzrqS2hLsHnpBAoWtCdYDGxbjw/f0esh3GTB3uY7xnaykxbr
	i8KyHaLFbUIhGw4mj3FTSNcEeqSE9uqDXoIxjcOr9EBJJ7wqM7UFOKxKhyLVoPL+2hRslUdEJ5u
	dbm0cJdmkscF9iKsKk/dEVfIPH0auwKwxUoZXl9zqjf9XHt4FKJsSR0ko1rXnR9nGxOXRHTGgHW
	g09bBb08y2BzBzsIwftN0clAFAd+MmL7+G25UeXPP8gTmfZrOeVCNGFxxIpcL3Qmzokfji+/Jsi
	jokZ1LJGPSFdP+3GLJ8I18pW0tpwSxBAk3iZF9xI0erNl82gPDxQNRwGjsLeEH/Z1SK7gDyGTgB
	279d8iWKNJWOD2pyFnh0hppa3aGX2JhVfCUYhMnDLY1gcb5pXChean7ygTjZCbP+GYd7CH08501
	iJNy4qlwzcQS4AJsDnEOZdoejDiV6JtaJvVzTWP/7raW1gT8/SWaMIqbK5003tx6e5RpwV8hzrL
	/82lYQBVytJkYPYkNkP7drq3kRWv3hDZM3Jyc2c=
X-Received: by 2002:ad4:5949:0:b0:912:ec8:f82e with SMTP id 6a1803df08f44-912a8005f65mr88008686d6.17.1789957113572;
        Sun, 20 Sep 2026 19:18:33 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260aa15cdsm56221876d6.41.2026.09.20.19.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:18:33 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	jlee@suse.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev
Cc: W_Armin@gmx.de,
	krishna.chomal108@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: Remove unused platform_profile_support variables
Date: Sun, 20 Sep 2026 22:17:17 -0400
Message-ID: <20260921021720.5976-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acer-wmi, asus-wmi and hp-wmi each set a platform_profile_support flag
once their platform profile handler is registered, but none of them ever
reads it. Remove all three, one patch per driver.

Compile tested only, as these are pure dead-code removals.

v2:
 - Extend to asus-wmi and hp-wmi, one patch per driver, as requested
   by Ilpo.
 - Rebase onto review-ilpo-next.
v1: https://lore.kernel.org/r/20260902193039.21725-1-justinyvar@gmail.com

These patches were prepared with AI assistance (see the Assisted-by
trailers). I compile tested them and take responsibility for them as
signed off.

Justin Vargas (3):
  platform/x86: acer-wmi: Remove unused platform_profile_support
    variable
  platform/x86: asus-wmi: Remove unused platform_profile_support member
  platform/x86: hp-wmi: Remove unused platform_profile_support variable

 drivers/platform/x86/acer-wmi.c  | 3 ---
 drivers/platform/x86/asus-wmi.c  | 2 --
 drivers/platform/x86/hp/hp-wmi.c | 2 --
 3 files changed, 7 deletions(-)


base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.47.3


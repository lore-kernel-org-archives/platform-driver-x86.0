Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5D231B80E;
	Tue, 23 Jun 2026 16:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782233183; cv=none; b=VCEUFd/jcam4EhIeFcJ019/uqxvEEcouMLp98XxLoSSY2qlCifJrkpCp+GRbTIMgvHXFB/3wFiUkyEnbb8Eb0Xrsh7AVrBhnD6Iv3Yg1XX9fZkUWZDViewxOmOyz0C9Z56paq8YOAtLL+KB8dOSyYNpZKJr4g6GvW7XN2ZO7LYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782233183; c=relaxed/simple;
	bh=Iq1Xy5zhrByKgXeLCPYDIbR4D0AQZisD43M+Um1godo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xy0TUHlWgMXw1/eihV9iLNZB11QxCInUSyVs46XTdvkBiJHjqY7igpqGqJvqrMgzqEAgJOOvq3aC5+/z5BrqJD4MvnWYKSKweSdl4Ye88V+aIo+hWQUotUO2Vn0fJekI7PCl7sND2ZLPBzyZ569/eqWpQ7fBxXyeUKAZxn3vvK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=k1uQOAbK; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="k1uQOAbK"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 9E01626E0A;
	Tue, 23 Jun 2026 18:46:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjt5_hF3ZfkW; Tue, 23 Jun 2026 18:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1782233178; bh=Iq1Xy5zhrByKgXeLCPYDIbR4D0AQZisD43M+Um1godo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k1uQOAbKfe4QXLsoc2EgzHdyz7TYh/FuDZFEmqfxBdwqRNpeBo6AUeiHtFZk2q/dd
	 ITYindb7kXNjW3L9tWmaKqsd1004bvdjVE5IqBdHKsGLxBRA6E/loVfRzUmy++KOEt
	 vd2S6LahNgdH+8shFF8CBfpWlAx2DC3TD1iKlFbckaerkmb0S9DEo3CGGjXr0SVYUp
	 8pTsO5AJWWSIzyNjZfL06guYqaSC+fruCc8EUudnYBQwC4A1UuUXZYGx0vMxhhQIG5
	 yEoqr86ZUfIQE+shkBG7QXNVq352jb+MSQFVlLrLH6FUb55cOuXIlKk24cqM4T+pbK
	 N+w7WwdTEwvcA==
From: Marco Scardovi <scardracs@disroot.org>
To: krishna.chomal108@gmail.com
Cc: eliadevito@gmail.com,
	emreleno@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	moravec@ukf.sk,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	regressions@leemhuis.info,
	regressions@lists.linux,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v2 0/1] platform/x86: hp-wmi: fix platform profile issues on generic HP laptops
Date: Tue, 23 Jun 2026 18:45:17 +0200
Message-ID: <20260623164603.10322-1-scardracs@disroot.org>
In-Reply-To: <ajqgkq_elUlMC0Ep@archlinux>
References: <ajqgkq_elUlMC0Ep@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Krishna,

Thank you for your review :) Your points were indeed correct so I came
up with another way to fix it.

Here is v2 of the patch to fix platform_profile support on generic HP
laptops. To answer your question the patch has been tested by Milan,
who reported bug 221569. For 220008 I had not any response from TuralTo
unfortunately but the underlying problem was the same AFAICS.

@milan please test this out and let me know like you did before.

Changes in v2:
- Drop active_platform_profile fallback/caching and mutex logic for
  generic HP laptops. Propagate WMI query errors directly to userspace
  instead of silencing them, as suggested.
- Restructure the probe function to explicitly set platform profile
  choices in each path rather than relying on a confusing combination
  of early returns and fall-throughs.

The driver was blindly registering all 4 profiles (quiet, cool,
balanced, performance) without checking which ones were actually
supported by the BIOS. This patch fixes a platform_profile regression on
generic (non-Omen/non-Victus) HP laptops, where switching or querying
power profiles fails with the error:
"platform_profile: Failed to get profile for handler hp-wmi"

We resolve this by dynamically probing supported thermal profiles at
boot time by temporarily setting each profile and checking the return
code, then restoring the original profile.

Marco Scardovi (1):
  platform/x86: hp-wmi: fix platform profile issues on generic HP
    laptops

 drivers/platform/x86/hp/hp-wmi.c | 37 ++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.54.0


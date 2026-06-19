Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1693335BDB;
	Fri, 19 Jun 2026 22:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781906977; cv=none; b=X0TFAjoSfajAnMr3uyB6cFJN90png/ACGgqdCPi8rbIliUfj36BU7AHru4+/kQlwp4rc+jiQj6LDZPbmzDgZ/8uN2g9q2wwgYhg9nU0s/S8wKn+LaHxGmJHqlBZvHN9CaizgdjVH3cy96a7mKBI+G8OILW6CcMsHddhFo1T77I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781906977; c=relaxed/simple;
	bh=RuXlxPg4NxhAiT+Nu9wwff1XeYBEnqYou+6laIk8Y+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTDBSc03HRKD5E0AyT0jo1XvBSjuKRHVDfH/Cx6SS5vL40oCMOWW1hHKDO71+9l60GXB7yYxERfVrS2CbaG6wCQm+GNOr7qF48oWNVgDIsQpqmVKB1WhhoHgFb8RW5LvRnocL4i/nAAwz0hk8+dZH0q/bj3ctlmez3xsLcSrqoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IErGkZr3; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IErGkZr3"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 392B827075;
	Sat, 20 Jun 2026 00:09:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAekTgjLfO0I; Sat, 20 Jun 2026 00:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781906967; bh=RuXlxPg4NxhAiT+Nu9wwff1XeYBEnqYou+6laIk8Y+I=;
	h=From:To:Cc:Subject:Date;
	b=IErGkZr3JzFZ5nUA+a3lAZMxXuTR6ejQBQbvixqiKvAZYz/MKRtI2/6w6aYJHJqw+
	 p7hmC4rZ2AD3+zzEo+zyLtBrdxERhJjFphOhZbLclP3u8Uiua6zDUEjkkVZicsIy8T
	 I3Xw5BokLHcwJotRcOdmqatwpbJn3fKpWffVdk9lka3ZKwFU2/+w2Aft7JRgwqrqZS
	 38Djq/e8rrEVpz7YQapmNqB3t9tS1AhqiWh1wo3wSfPFmHzn3dCED2UvUj6YEOuZKo
	 5+eOHBrXhgH7UIpyO3RKuxZC8Egxz4XxTNxGgToZs9SZdXcwd47OMASk3WDvWOad2e
	 NC09i2Nsx+Ftg==
From: Marco Scardovi <scardracs@disroot.org>
To: moravec@ukf.sk
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	eliadevito@gmail.com,
	emreleno@gmail.com,
	rafael@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 0/1] platform/x86: hp-wmi: fix platform profile issues on generic HP laptops
Date: Sat, 20 Jun 2026 00:09:10 +0200
Message-ID: <20260619220911.7542-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

I was looking for [1] and come with a quick fix for it. Please review it
and let me know if you have any questions/suggestions.

TL;DR: The driver was blindly registering all 4 profiles (quiet, cool,
balanced, performance) without checking which ones were actually supported
by the BIOS.

This patch fixes a platform_profile regression on generic (non-Omen/non-Victus)
HP laptops, where switching or querying power profiles fails with the error:
"platform_profile: Failed to get profile for handler hp-wmi"

We resolve this by:
1. Dynamically probing supported thermal profiles at boot time.
2. Initializing and updating a cached active_platform_profile.
3. Falling back to the cached profile if the BIOS query fails or returns an
   unmapped value.

This has been verified to build cleanly and resolves the reported Bugzilla issues
221569 and 220008.

[1] https://lore.kernel.org/platform-driver-x86/a3b137df-1b21-4460-b003-58c5ca2d59d4@ukf.sk/

Marco Scardovi (1):
  platform/x86: hp-wmi: fix platform profile issues on generic HP laptops

 drivers/platform/x86/hp/hp-wmi.c | 53 +++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

-- 
2.54.0


Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC2611CBA
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 03:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777607172; cv=none; b=ZZrd6uAIpkHFEVasxRalA7mrVvFS6wtoShz2IKJmcgmvYdNLzu8fuKD+/WxSxs/WyUZZlj4MUX9qJnI8KWxx8KrNlElAZw2Hv6goslNs7S/DEUFK2kGkp6WYO4LqMGhHHsX47uJDbVwDzfRH0b1OuqpjVLUMCRgZVL/bfxSYG3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777607172; c=relaxed/simple;
	bh=wGWytSVkh9qN1pTTgMGDRkwSkCIZ3zeaKgsuL4yZBuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u45YdFePtzyYSNTAU1vOnyS/U4n1hRJ0uiu3BOB232Yp6ejUwgaqB4uaLCiPgOYyGf51YHGrTD4HA6Cek/sQeRaWyyunmDuPG4InGrtb4H+iOS051oABRKrv4ZdDB9X9GfqRDHzLK5tYl7Ee+y7f87/EX04Hx62m/PIuC4xk5ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=PFFg8Ei2; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="PFFg8Ei2"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g6GgP2wMfzHsP
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 05:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1777606033;
	bh=9CKdKSrtjgxIbqvCl2f4pyONCbZh8XFfD7sEx1/ZNeo=;
	h=From:To:Cc:Subject:Date:From;
	b=PFFg8Ei2Ngzx58pdBjGkOF/JSWLHARe+2WJW5ipH6SKGB71Xi6snxIjj8m1StUiRA
	 fUo+nBCq+K4QAzdskD4c4HrE14bzDcqAzzFRFd3HyKduKVFeoasfuF8ARHUf3sFlBh
	 IwxoWedzFxuKBJbfOuUe68b3R1Grhvc4G3+dwje3yxh8PrM2L9EG3BSqPuBBqJ0iHD
	 y+Eejn5NvBTJbFZoUV2/hzyO2UYjj3ij09VaXkybX+wWeT8UBGptFq6mIo0wB5PTRw
	 jdQNoc8/eIcItvYtO6MxT0y0tYRv2bWW7TzQtIn365BlwdarR4sZDhLIskoUg484YZ
	 5Dx5amid0RobA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4g6GgN6fKMzdDS
	for <platform-driver-x86@vger.kernel.org>; Fri,  1 May 2026 05:27:12 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Fri, 01 May 2026 05:27:12 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mario Limonciello <superm1@kernel.org>,
	Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH 0/2] amd_pmc: Delay s2idle suspend for some devices
Date: Fri,  1 May 2026 05:26:53 +0200
Message-ID: <20260501032655.283789-1-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On some AMD Zen3 and Zen3+-based Lenovo IdeaPad laptops the keyboard and
the lid switch stop working after the first suspend, until rebooted.

More specifically, they stop sending events when pressing a key or
closing the lid - it's still possible to toggle the capslock- and
numlock-LEDs with an external keyboard or read the lid state at
/proc/acpi/button/lid/LID/state.

See also https://bugzilla.kernel.org/show_bug.cgi?id=221383

It appears that suspending and/or resuming gets the EC into a broken
state. This problem doesn't happen on Windows and Mario Limonciello
mentioned that the Windows kernel gives hardware and software some time
before actually suspending (before activating HW DRIPS), while Linux
(or the amd_pmc module) does that immediately, so it may be worth trying
if calling msleep() in amd_pmc_s2idle_check() helps.

It turned out that sleeping for 2.5 seconds at that point indeed makes
the problems disappear. Sleeping for 1.5 seconds wasn't enough.

Luckily there was already a quirk that does exactly that under other
circumstances, so I could build on that:
https://lore.kernel.org/platform-driver-x86/20250414162446.3853194-1-superm1@kernel.org/

I enable this quirk for two lines of Lenovo Laptops that are known to
have this problem and for which the patch has been successfully tested.

I found several reports of these or similar issues on the web, for
different devices, so in a second commit I added a parameter to the
kernel module that allows enabling or disabling this, which will make
it easy for people whose devices aren't matched yet to test this quirk.

Thanks to Mario Limonciello for his support and to Sindre Henriksen
for testing my patch!

Daniel Gibson (2):
  platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
  platform/x86/amd/pmc: Add delay_suspend module argument

 drivers/platform/x86/amd/pmc/pmc-quirks.c | 36 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c        | 18 +++++++++++-
 drivers/platform/x86/amd/pmc/pmc.h        |  1 +
 3 files changed, 54 insertions(+), 1 deletion(-)

-- 
2.48.1


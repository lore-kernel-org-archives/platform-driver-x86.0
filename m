Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AF617BB21
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721288; cv=none; b=Bk69vvHWlYquZws/z+14zLqc1gc4ddb8ADqGGPOM8iZNXN0xA/Y5MRu6/W8F1UyT7aKeu7dtgchQCO/iP4Vy5kVSYlKrdjR0VgZKUq2cY3MyIT8dLM0wjQJuEKZT3pXIRIVr3gbxSTSth4dAL8HeQLkQj00459L5AmRU7JK8lEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721288; c=relaxed/simple;
	bh=2SNCamfvhP+2i4Ie0v1WhaX6rjVOSAs9/H7iHkMV1w4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bLKOjkLK3Z2pTJyt9rMGBblVlhbToV0mgLdL2ykgeCSSf1qjGFjww+vPsen2hHDI2zpPn2CRcJNnW3Gn7wfimGisPsCDqyoPbuASpy6Oagw/I8eeDm/GXIHR+LHkazmIorFhhzxgRweExxaSLDcCWn5t/C09QV9w9v4vewAKC1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=m2NJ+cVk; arc=none smtp.client-ip=83.166.143.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="m2NJ+cVk"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gXQm21jdJzXSN
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 06:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1780721282;
	bh=KNdtDsqwCb+GCsxtj8KWYkInOxcOU+ZYMoqIdTjRaQw=;
	h=From:To:Cc:Subject:Date:From;
	b=m2NJ+cVkUHMpZAnLJdinWY+pcercTwt3IquAZS+X5Vq4HXDYqYHXWP/YMzKwbJmU+
	 +Yio6gQBV0CLo8hAk7Np+OyoEMia06GfnjGHeegmP6YV1kih3UmU5XjdNWiD3J9/YU
	 T84dLnz+jPVqpStB2N0fegHm7UGxUTPxs9RoW0elkDQnpFznPejN/g4HUY1FNv6yhO
	 zq8YOEfb9ciF9wz2n3QVMmsm12knpUIILwwvSVgqP8VGIi2VG6OgVJF2hM4TPu/5zo
	 TYQkRH9fFB0nG+iJgKD+754HSxKZ9OaBwwyzBYnvR8LIjprezVnzUP142KsC+jIusA
	 w4/Ds29rOeDRQ==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gXQm15801zwvx
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 06:48:01 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Sat, 06 Jun 2026 06:48:00 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v4 0/3] amd_pmc: Delay s2idle suspend for some devices
Date: Sat,  6 Jun 2026 06:47:55 +0200
Message-ID: <20260606044758.2213401-1-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
the problems mostly disappear. Sleeping for 1.5 seconds wasn't enough.

"Mostly" because it turned out that they still occur (on some but not
all devices needing this patch) when using a wakeup timer (wakealarm).

I could build on an existing quirk[1] that also sleeps for 2.5 seconds
under other circumstances; my first commit refactors that a bit so I
can integrate my further changes in a cleaner way.

I found several reports of these or similar issues on the web, for
different devices, so in a second commit I added a parameter to the
kernel module that allows enabling or disabling this, which will make
it easy for people whose devices aren't matched yet to test this quirk.

Thanks to Mario Limonciello for his support and to Sindre Henriksen
for testing my patch and to Ilpo Järvinen for reviewing!

[1] https://lore.kernel.org/platform-driver-x86/20250414162446.3853194-1-superm1@kernel.org/

Changes in v4:
- Don't log during intermediate wakes, which happen a lot when charging
  those IdeaPads while they're suspended, so dmesg isn't spammed
- Removed the documentation commits to make merging this less painful
  (one of them referred to commits added here, so the IDs would have to
   be fixed up while merging). I'll submit them separately.

Changes in v3 (https://lore.kernel.org/platform-driver-x86/20260512202645.1549111-1-daniel@gibson.sh/T/#u
    and https://lore.kernel.org/platform-driver-x86/20260603031110.345815-1-daniel@gibson.sh/T/#u):
- Rewrote commit messages of patch 1, 4 and 5 as requested in the review
- Adjusted formatting of the other commit messages
- Added another confirmed device (83MM) to the quirks list and mention
  it in the commit message

Changes in v2 (https://lore.kernel.org/platform-driver-x86/20260509013105.816339-1-daniel@gibson.sh/t/#u):
- Documented this in Documentation/arch/x86/amd-debugging.rst
- Added example for reset register kernel message in same file
- In amd_pmc_quirk_need_suspend_delay(), avoid dereferencing a NULL
  pointer of devices not detected for any quirk - oops!
- Mention that timed resumes may still cause those keyboard/lid issues
- Various code changes requested or suggested in reviews of v1:
  - Some formatting changes (commas behind non-terminating entries)
  - Moved check for existing quirk (that OVP thing) into its own function
    amd_pmc_intermediate_wakeup_need_delay() in pmc.c, so the checks of
    the different quirks are separated more clearly.
  - Added function amd_pmc_want_suspend_delay() in pmc.c handling
    amd_pmc_quirk_need_suspend_delay() together with disable_workarounds
    and delay_suspend and also logging about the reason for the delay,
    also for cleaner separation.
  - If delay_suspend=1 is used to force-enable the fix on hardware that
    is not automatically detected as needing this fix, log message
    encouraging the user to report their device, including the most
    relevant DMI values that could be used for matching

v1: https://lore.kernel.org/platform-driver-x86/20260501032655.283789-1-daniel@gibson.sh/t/#u

Daniel Gibson (3):
  platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
  platform/x86/amd/pmc: Add delay_suspend module parameter
  platform/x86/amd/pmc: Don't log during intermediate wakeups

 drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c        | 68 ++++++++++++++++++++++-
 drivers/platform/x86/amd/pmc/pmc.h        |  2 +
 3 files changed, 108 insertions(+), 1 deletion(-)

-- 
2.48.1


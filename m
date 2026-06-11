Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E12329BDB5
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190278; cv=none; b=kuh+1eyh0L+LXE7i2TCwZEezBPET18Qo+XwaOokRjA/4M9bAF5zFvqSPtnBgt5L4FfMLdbityrpv+N5fDFafKCB2YuWIMvYkhO5p66VGYYJC5GnFJxc5LzkilCWnmq3fywslHnxcxG3YbFLddm4HdMrTBi+MB9RIj/7K1w0V39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190278; c=relaxed/simple;
	bh=ECswjgFDQS3vv+IHSaBzJ0p0KFp4sMg5N3FHpLdeeXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SqxAwyGvKB3yQVViX4KVvWlSc9fdkxshEOrGF7Bh9TaYZQks5sGsEhrHj4xKFWik8R9OB7UOYoDmpkau5OAe1+eC1xNBwcGChm6PzCZqUcAJXj1K0SkLFaMuHrCC1LO2fbrA3L3Z6oGAMFTnn2db1p2tUBbIb3IiyrJ3JJ582gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=JvuC9LZR; arc=none smtp.client-ip=45.157.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="JvuC9LZR"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gbmC11ByRztZW
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1781190269;
	bh=d+fstxCCI3QoD6afArrN9zUvhkldeiOPVOxPLXCYXsM=;
	h=From:To:Cc:Subject:Date:From;
	b=JvuC9LZRg3TuxLD/OzftbrEX6QwLqJw8w+RY/Z/5EpSmMoDTZ/Cu6m71cm3u47EPc
	 Q0AjDFNvXFyJpKos727K6PuxXN+QbuFSptFmnc0MwLfPXHqtlUNhMXEDNMB2pcNvUK
	 /HRYSTpTVDLAw01niO3CnKO/vT7SXlYgkAbyE+JKNc629l79hoIpyOdzgBKMXT6adZ
	 n+YvNw2teFvBp5iI3f8hojYzTIKstQ9KAkUoCvRJe0NWo2FbcHRdlqXALNpwrs5Pul
	 L8v8xh8Z3S1cLGSOXnW+CRpEn0h7IAzy2XJVfu9r6rcEb+G4ZBbC7V0bwzyopaQDxP
	 Q+9M1t7fg3nuA==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gbmC04QdYzvSf
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:04:28 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Thu, 11 Jun 2026 17:04:28 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v6 0/4] amd_pmc: Delay s2idle suspend for some devices
Date: Thu, 11 Jun 2026 17:04:22 +0200
Message-ID: <20260611150426.3683372-1-daniel@gibson.sh>
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

Thanks to Mario Limonciello for his support and to Sindre Henriksen for
testing my patch and to Ilpo Järvinen and Hans de Goede for reviewing!

[1] https://lore.kernel.org/platform-driver-x86/20250414162446.3853194-1-superm1@kernel.org/

Changes in v6:
- Rebased to review-ilpo-next branch (commit 2565a28cdcdc "platform/x86: ISST: Restore SST-PP control to all domains")

Changes in v5 (https://lore.kernel.org/platform-driver-x86/20260609105756.2813669-1-daniel@gibson.sh/T/#u):
- Re-add missing first commit ("Check for intermediate wakeup in function")
  (sorry!)
- Add Reviewed-By tags for Hans de Goede's review

Changes in v4 (https://lore.kernel.org/platform-driver-x86/20260606044758.2213401-1-daniel@gibson.sh/T/#u):
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


Daniel Gibson (4):
  platform/x86/amd/pmc: Check for intermediate wakeup in function
  platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
  platform/x86/amd/pmc: Add delay_suspend module parameter
  platform/x86/amd/pmc: Don't log during intermediate wakeups

 drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++
 drivers/platform/x86/amd/pmc/pmc.c        | 83 ++++++++++++++++++++++-
 drivers/platform/x86/amd/pmc/pmc.h        |  2 +
 3 files changed, 121 insertions(+), 3 deletions(-)

-- 
2.48.1


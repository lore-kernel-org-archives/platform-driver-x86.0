Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08053DC878
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456291; cv=none; b=XVgkp6eTcQNl0TQlVjpAUyNUbUVNxBet0ZPThAV/b+NS7SXCKX0VU9lP+IexnQZH80+0utH2otObaN3QMpWyuvgTLTX0Swrqk7weTLb95NJEu3HSvAAVxXEQbC/7XU8GMnkjz9PdoG8H8y+VRfcMCcCaAQG0luX51sRKAAyuJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456291; c=relaxed/simple;
	bh=dqmVPkuuCqEikPbWzr60t9r2f3WZ/48k53ecR65Iy7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oZD78Ji1ElEJ2No2N+T5PCa1cal8CCX13LxbYVSJsZrRB/2rnOzCY4fFGp2tCW92EFQaXPcJ/3trdv6fDqgaZeU7s5Ssjp7rQdc5P/GXSlETtW38DRRXPStON6VPEmDQmScjuosu5hnbv8ETZ8xUJjGR7gtObb6FmYKP3mt67ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=AUYdu/hd; arc=none smtp.client-ip=83.166.143.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="AUYdu/hd"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gVXlr5nmNzDkB
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1780456280;
	bh=yY9YP6fxjQ4c17/xuOJwKdv58eFitOLHWH3qovkKjWk=;
	h=From:To:Cc:Subject:Date:From;
	b=AUYdu/hdvtRQpxgdTHBZ3Gk24u+O/wSqFWbSk0zlxxuHwW1dqvZsuwPL0KDUDUPwv
	 8zkUOAtOdn3SBhPWzuErhU+qXM4MJG65POBl4btkKtLVosW8ofvI75wcpAmhZnx+N/
	 GnTSYrFTrTkNDu4GAlp3i+SBQ2FXenwySd682qgflrz0K8Uh981HeqzQabpS6FLZuS
	 doX3IA/qldMYY9RaMdpvXymNzGKYYN6AF9dzLW/ChtiqkSnFM2I5txCo9XdOmw9iEq
	 YL7PBHrWiaBOKssRmcC8Uv7nIHcxXHtdPs7IG/3HGJh7Tl2QWAwhGcl+jyfJelWDmN
	 X9dGnrVOl5AbA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gVXlr2PkGzvYP
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:20 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Wed, 03 Jun 2026 05:11:19 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v3 RESEND 0/5] amd_pmc: Delay s2idle suspend for some devices
Date: Wed,  3 Jun 2026 05:11:05 +0200
Message-ID: <20260603031110.345815-1-daniel@gibson.sh>
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

Changes in v3:
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

Daniel Gibson (5):
  platform/x86/amd/pmc: Check for intermediate wakeup in function
  platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
  platform/x86/amd/pmc: Add delay_suspend module parameter
  Documentation/arch/x86/amd-debugging: Add example for reset register
  Documentation/arch/x86/amd-debugging: Add section about delay_suspend

 Documentation/arch/x86/amd-debugging.rst  | 30 ++++++++++++
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c        | 60 +++++++++++++++++++++--
 drivers/platform/x86/amd/pmc/pmc.h        |  1 +
 4 files changed, 127 insertions(+), 3 deletions(-)

-- 
2.48.1


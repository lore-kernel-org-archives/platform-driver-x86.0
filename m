Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75954BC02C;
	Thu, 11 Jun 2026 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198883; cv=none; b=occjzdqF16DGoucJS+NWPMBIt5Tw1hRYDeD1nzzb8BjwkjAcqBZJXGnAufqnTHydasBcy3c2x6ticqKwPCod4s/STuEGSeZJaKXS5maJ4PHvRoo9T7Ueap0DLbjhtFagPWYTs0bMQtFKf/HNO4PSMagGdjhQ+z/UFFo9xLQcqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198883; c=relaxed/simple;
	bh=1JVSpXT2RLRytyttx0rG4Ql9z6lpig7Dv1AD/a6oxBE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oOEbLsgWayxGIDk5H81kfPKrwm8WNgP3prlI3dh9e5BGX75c8Lb+uA/uWIBuctgxSX6riAjXo8id93xttcwCq0HKdkcbCM5qqVk0arj3ldjQpz/l/vUmuACl8I+Jqxp0By0qedw+piSzuhVxe04mHXpR6vmiMJd//Nnucf1JP8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ygik2zIE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ygik2zIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781198880; x=1812734880;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1JVSpXT2RLRytyttx0rG4Ql9z6lpig7Dv1AD/a6oxBE=;
  b=Ygik2zIE080ekbNvwSQDgBzwzv4YCxtz4vI1hOK6/dIifpFJsXnYMaS3
   mP0IGmboy5eTcvwl/jztnJwK13g7h762baCX6bb4WivxG2gQUbl5drdQa
   5IBKm+qkFUOhLcPlnmEc6eChB6hGjh8X3EdxcEMbsxpOOhzTqLcI41GzA
   8dh4hmzApQ/y0NUgxI9OVHypFHu9udb3IovZ3zXUmUqHWlvByRHfIcPSb
   6wVph2CxKXZFiYjbpGITjcOC5rkUcc/RcUeh+2PsxHvF1vEgn1bsNcU4Q
   uIQJ6eR7b1A1VAVjRMgdDWyFdsgWnhFQtv+w+fvUIlAkdgsZjqdKJ8uIp
   g==;
X-CSE-ConnectionGUID: gZ5Ub8LCRmqyFRGQ3ZPJWA==
X-CSE-MsgGUID: zOROsYwTQKajKqrgILKDlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82004277"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82004277"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:27:59 -0700
X-CSE-ConnectionGUID: Rm4uEscJRz+OEVTWYzJzVA==
X-CSE-MsgGUID: EShOTgPcScuzIW3MJXQP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="242165735"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:27:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jun 2026 20:27:53 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH v6 0/4] amd_pmc: Delay s2idle suspend for some devices
In-Reply-To: <20260611150426.3683372-1-daniel@gibson.sh>
Message-ID: <b19be216-8481-1330-a986-4f20fadb6368@linux.intel.com>
References: <20260611150426.3683372-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1636413989-1781198873=:1126"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1636413989-1781198873=:1126
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Jun 2026, Daniel Gibson wrote:

> On some AMD Zen3 and Zen3+-based Lenovo IdeaPad laptops the keyboard and
> the lid switch stop working after the first suspend, until rebooted.
>=20
> More specifically, they stop sending events when pressing a key or
> closing the lid - it's still possible to toggle the capslock- and
> numlock-LEDs with an external keyboard or read the lid state at
> /proc/acpi/button/lid/LID/state.
>=20
> See also https://bugzilla.kernel.org/show_bug.cgi?id=3D221383
>=20
> It appears that suspending and/or resuming gets the EC into a broken
> state. This problem doesn't happen on Windows and Mario Limonciello
> mentioned that the Windows kernel gives hardware and software some time
> before actually suspending (before activating HW DRIPS), while Linux
> (or the amd_pmc module) does that immediately, so it may be worth trying
> if calling msleep() in amd_pmc_s2idle_check() helps.
>=20
> It turned out that sleeping for 2.5 seconds at that point indeed makes
> the problems mostly disappear. Sleeping for 1.5 seconds wasn't enough.
>=20
> "Mostly" because it turned out that they still occur (on some but not
> all devices needing this patch) when using a wakeup timer (wakealarm).
>=20
> I could build on an existing quirk[1] that also sleeps for 2.5 seconds
> under other circumstances; my first commit refactors that a bit so I
> can integrate my further changes in a cleaner way.
>=20
> I found several reports of these or similar issues on the web, for
> different devices, so in a second commit I added a parameter to the
> kernel module that allows enabling or disabling this, which will make
> it easy for people whose devices aren't matched yet to test this quirk.
>=20
> Thanks to Mario Limonciello for his support and to Sindre Henriksen for
> testing my patch and to Ilpo J=C3=A4rvinen and Hans de Goede for reviewin=
g!
>=20
> [1] https://lore.kernel.org/platform-driver-x86/20250414162446.3853194-1-=
superm1@kernel.org/
>=20
> Changes in v6:
> - Rebased to review-ilpo-next branch (commit 2565a28cdcdc "platform/x86: =
ISST: Restore SST-PP control to all domains")

Thanks, this one applied cleanly to the review-ilpo-next branch.

--
 i.

>=20
> Changes in v5 (https://lore.kernel.org/platform-driver-x86/20260609105756=
=2E2813669-1-daniel@gibson.sh/T/#u):
> - Re-add missing first commit ("Check for intermediate wakeup in function=
")
>   (sorry!)
> - Add Reviewed-By tags for Hans de Goede's review
>=20
> Changes in v4 (https://lore.kernel.org/platform-driver-x86/20260606044758=
=2E2213401-1-daniel@gibson.sh/T/#u):
> - Don't log during intermediate wakes, which happen a lot when charging
>   those IdeaPads while they're suspended, so dmesg isn't spammed
> - Removed the documentation commits to make merging this less painful
>   (one of them referred to commits added here, so the IDs would have to
>    be fixed up while merging). I'll submit them separately.
>=20
> Changes in v3 (https://lore.kernel.org/platform-driver-x86/20260512202645=
=2E1549111-1-daniel@gibson.sh/T/#u
>     and https://lore.kernel.org/platform-driver-x86/20260603031110.345815=
-1-daniel@gibson.sh/T/#u):
> - Rewrote commit messages of patch 1, 4 and 5 as requested in the review
> - Adjusted formatting of the other commit messages
> - Added another confirmed device (83MM) to the quirks list and mention
>   it in the commit message
>=20
> Changes in v2 (https://lore.kernel.org/platform-driver-x86/20260509013105=
=2E816339-1-daniel@gibson.sh/t/#u):
> - Documented this in Documentation/arch/x86/amd-debugging.rst
> - Added example for reset register kernel message in same file
> - In amd_pmc_quirk_need_suspend_delay(), avoid dereferencing a NULL
>   pointer of devices not detected for any quirk - oops!
> - Mention that timed resumes may still cause those keyboard/lid issues
> - Various code changes requested or suggested in reviews of v1:
>   - Some formatting changes (commas behind non-terminating entries)
>   - Moved check for existing quirk (that OVP thing) into its own function
>     amd_pmc_intermediate_wakeup_need_delay() in pmc.c, so the checks of
>     the different quirks are separated more clearly.
>   - Added function amd_pmc_want_suspend_delay() in pmc.c handling
>     amd_pmc_quirk_need_suspend_delay() together with disable_workarounds
>     and delay_suspend and also logging about the reason for the delay,
>     also for cleaner separation.
>   - If delay_suspend=3D1 is used to force-enable the fix on hardware that
>     is not automatically detected as needing this fix, log message
>     encouraging the user to report their device, including the most
>     relevant DMI values that could be used for matching
>=20
> v1: https://lore.kernel.org/platform-driver-x86/20260501032655.283789-1-d=
aniel@gibson.sh/t/#u
>=20
>=20
> Daniel Gibson (4):
>   platform/x86/amd/pmc: Check for intermediate wakeup in function
>   platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
>   platform/x86/amd/pmc: Add delay_suspend module parameter
>   platform/x86/amd/pmc: Don't log during intermediate wakeups
>=20
>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c        | 83 ++++++++++++++++++++++-
>  drivers/platform/x86/amd/pmc/pmc.h        |  2 +
>  3 files changed, 121 insertions(+), 3 deletions(-)
>=20
>=20

--=20
 i.

--8323328-1636413989-1781198873=:1126--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307D1E5714
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 20:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976171; cv=none; b=ZgpxkB+6tSTvCrSe34Hcq/Hl796evJRE2rmOAgNGJGx79mhRGmPSAO3NfjqrIpU7zuT8LD+fPu9TaHMwU3nCxok24Hi+61MdbiKZ7aLlctjiMi9Xa4y6muPA0cEti0gio10K7r+C4kOubII6Chs9DCWp7eJ36AhB1bHDUJLdiig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976171; c=relaxed/simple;
	bh=YTOuQS/LEnyhYWKAXgqD5M8yS2YmTsQZowODT3tuSYI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=axtq7M4VqLi0J8wLiTRXdm1lhPq15rj2OXaaTYRnHA21954kQmPJo9eAP92n3kmSP7+DxFJdBu7OHtHFVLEEwx7eyXQGRTCFf3FIYv8HwrJaEN9tRwRjJaeVIqvw8PV4CmM+h8qBgbQKo/2IxinsX/4mFApfA1T4mB4svJGvwDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gh5muJpa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gh5muJpa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB910C2BCFB
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 20:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783976170;
	bh=YTOuQS/LEnyhYWKAXgqD5M8yS2YmTsQZowODT3tuSYI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gh5muJpaVHshNH1mUCHl//GTYrgPouy68ASNY+klC4LLzIaKng+ROnPnUmAo4f0mm
	 /3DHuKxzb8rbPho9leg3WSt+znj0Si0nj3sz5mmEtN4sMriSBTKaxn09BErqeY7CmF
	 jnFLUE/wYurvtKZEk0lAluLE3h9WcFUC2lRnhKWGlnfQiNvqGZ1kiiRXr+NJDFDpNJ
	 SIFab+Y3/c7HisOjeSjkJHT1+cDxA2RcOv7wT5yiZasXafMVnj+cymk62qJr1WNpbh
	 C1jgqEzEnNfyr3Jl4kuDEV4XrQGVEPe+8xEn0cCkwLPWs/KQlKIxmNcq8T6roWGvz3
	 7eLp8EV0dK7WA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B46EC41612; Mon, 13 Jul 2026 20:56:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 13 Jul 2026 20:56:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: pepegnu@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-GWa6diHdCd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #157 from pepegnu@gmail.com ---
Frequency stuck at ~500 MHz after suspend->charge->unplug AC->resume on:

* HP EliteBook 6 G1ah 14 inch Notebook PC
* AMD Ryzen 5 220 w/ Radeon 740M Graphics
* Platform Firmware Information
        Vendor: HP
        Version: X77 Ver. 01.04.06
        Release Date: 05/12/2026
* uname -a
Linux xe 7.1.3-arch1-2 #1 SMP PREEMPT_DYNAMIC Thu, 09 Jul 2026 x86_64 GNU/L=
inux

How to reproduce:

1) Start charging the laptop with lid closed
2) Detach laptop with lid *closed* from AC power
3) Open the lid. Then frequenccies on most cores remain stuck *low*:

# >> Cat files in /sys/devices/system/cpu/cpu*/cpufreq | sort-ed | uniq-ued:

  /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver: amd-pstate-epp
  /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor: powersave
  /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference:
balance_power

# grep cpu.MHz /proc/cpuinfo | cut -d: -f2| nl -v 0
     0   544.363
     1   544.358
     2   520.431
     3   519.626
     4   520.400
     5   1117.810
     6   520.059
     7   520.041
     8   544.355
     9   1117.810
    10   520.488
    11   1117.810

4) Attach AC-power for 5 sec when the lid is *open*
5) Detach AC-power leaving the *lid open*. The cpu-frequencies 'wake up':
# >> Cat files in /sys/devices/system/cpu/cpu*/cpufreq | sort-ed | uniq-ued:

  /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver: amd-pstate-epp
  /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor: powersave
  /sys/devices/system/cpu/cpu0/cpufreq/energy_performance_preference:
balance_power

# grep cpu.MHz /proc/cpuinfo | cut -d: -f2| nl -v 0
     0   1365.791
     1   1367.646
     2   2278.527
     3   1117.810
     4   2278.704
     5   1117.810
     6   1364.481
     7   1366.707
     8   2152.118
     9   1437.688
    10   2275.372
    11   2277.464

6) Further repeated flipping the lid and re-opening when run on BAT0 retain=
 the
normal frequencies.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

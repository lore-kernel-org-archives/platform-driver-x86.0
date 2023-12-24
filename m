Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAE810F8
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qb5gQKZq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12F8DC433C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703402509;
	bh=TC0HPyioRulSzTeXibgv7DfdM9K58I8XgGhA9IZmaW4=;
	h=From:To:Subject:Date:From;
	b=Qb5gQKZq2ZVWj5X6qnk/SXQEwP2UtiEncIW3PpqKyK8YXoE+dRvbRT4JSO9d0Pfoh
	 zBLHLRGfr5HPjL+MlhhT8OgXKM4JMLAZHbMuJpHhIJUFY6mW6wq1bOkElRnIbO2XkS
	 EIp9Fo80EgCaUlsDEosSCwHU5TMYKSCgeA1QIanPjwgGrkOVZUpXAospkclP7atvAR
	 Vyh3nkoz+4sjRFHtvGx5qwbGkqeTy3qRFNLlC46oVqxceq/TNc1tnwqwDZelHwgb5H
	 ejTLBDWF7ZimW+xs/YKv7Wr0kReleERn2ZGwpMn+bdhZk1TssPBadxdBIRdyXHV7mO
	 TOj+4X7VnVv6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ED9F9C4332E; Sun, 24 Dec 2023 07:21:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] New: Ryzen 7 7840HS gets stuck at 544MHz frequency
 after a random number of suspend/resume cycles
Date: Sun, 24 Dec 2023 07:21:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218305-215701@https.bugzilla.kernel.org/>
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

            Bug ID: 218305
           Summary: Ryzen 7 7840HS gets stuck at 544MHz frequency after a
                    random number of suspend/resume cycles
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: aros@gmx.com
        Regression: No

I'm almost sure it's a bug in the firmware but since I cannot make HP fix i=
t,
I'll try to report it here.

The CPU gets stuck at this extremely low frequency after N number of
suspend/resume cycles where N can be 1, 2, 3, 4 but at most 5.

The laptop is plugged in at all times.

This is happening with both acpi-cpufreq and amd-pstate-epp.

# cpupower frequency-info
analyzing CPU 10:
  driver: amd-pstate-epp
  CPUs which run at the same hardware frequency: 10
  CPUs which need to have their frequency coordinated by software: 10
  maximum transition latency:  Cannot determine or is not supported.
  hardware limits: 400 MHz - 6.08 GHz
  available cpufreq governors: performance powersave
  current policy: frequency should be within 400 MHz and 6.08 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 544 MHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes
    AMD PSTATE Highest Performance: 232. Maximum Frequency: 6.08 GHz.
    AMD PSTATE Nominal Performance: 145. Nominal Frequency: 3.80 GHz.
    AMD PSTATE Lowest Non-linear Performance: 42. Lowest Non-linear Frequen=
cy:
1.10 GHz.
    AMD PSTATE Lowest Performance: 16. Lowest Frequency: 400 MHz.

Some CPU parameters look completely wrong after it happens:

# ryzenadj -i
|        Name         |   Value   |     Parameter      |
|---------------------|-----------|--------------------|
| STAPM LIMIT         |    30.000 | stapm-limit        |
| STAPM VALUE         |     4.181 |                    |
| PPT LIMIT FAST      |    30.000 | fast-limit         |
| PPT VALUE FAST      |     5.347 |                    |
| PPT LIMIT SLOW      |    20.000 | slow-limit         |
| PPT VALUE SLOW      |     3.747 |                    |
| StapmTimeConst      |       nan | stapm-time         |
| SlowPPTTimeConst    |       nan | slow-time          |
| PPT LIMIT APU       |       nan | apu-slow-limit     |
| PPT VALUE APU       |       nan |                    |
| TDC LIMIT VDD       |       nan | vrm-current        |
| TDC VALUE VDD       |       nan |                    |
| TDC LIMIT SOC       |       nan | vrmsoc-current     |
| TDC VALUE SOC       |       nan |                    |
| EDC LIMIT VDD       |       nan | vrmmax-current     |
| EDC VALUE VDD       |       nan |                    |
| EDC LIMIT SOC       |       nan | vrmsocmax-current  |
| EDC VALUE SOC       |       nan |                    |
| THM LIMIT CORE      |       nan | tctl-temp          |
| THM VALUE CORE      |       nan |                    |
| STT LIMIT APU       |       nan | apu-skin-temp      |
| STT VALUE APU       |       nan |                    |
| STT LIMIT dGPU      |       nan | dgpu-skin-temp     |
| STT VALUE dGPU      |       nan |                    |
| CCLK Boost SETPOINT |       nan | power-saving /     |
| CCLK BUSY VALUE     |       nan | max-performance    |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

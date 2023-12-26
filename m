Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C34CB4D
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 15:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVBEVcKR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC08CC433C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703603902;
	bh=XXL3bWRqwRilhFwULFS+0RquApL5jzAzmVLVb3kHMA8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qVBEVcKRmUD9EYj2Nf2WdSQIHdNXnIMP8xa1LLfPgbIVVc2AFgmON7tm0unTtr8SU
	 9ntUNfRrbLEmlJ+jiaozYfY2aFB92hTYswmN96Ulj1Kh4mwlu52pI0umk4PEPgoNPh
	 PdKOmapHxiSswopGTKA9qfXxlhoUEw+dvL2EMqZRpEqfuhGcw6YveV0Y9Q4e1Jwtwd
	 41f4u/5UM1Cp8suAfJg9WU+io/QI2EOOF43tWzmxRn3jBzdfv6A8UX8Axr5t4V65D4
	 sPV8iPmMD94HFT/eb9JVpLFYgguXRMHgOZoI6QuD+HTwmXsw+sLv9M8oNWFYgGwG9V
	 8Kx3qrZWxwxUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C3FF0C4332E; Tue, 26 Dec 2023 15:18:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Tue, 26 Dec 2023 15:18:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-cGJe32bRaD@https.bugzilla.kernel.org/>
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

--- Comment #10 from Artem S. Tashkinov (aros@gmx.com) ---
This is reproducible without the amd-pmf module:

[root@hp policy0]# lsmod | grep pmf
[root@hp policy0]# cpupower frequency-info
analyzing CPU 13:
  driver: amd-pstate-epp
  CPUs which run at the same hardware frequency: 13
  CPUs which need to have their frequency coordinated by software: 13
  maximum transition latency:  Cannot determine or is not supported.
  hardware limits: 400 MHz - 5.76 GHz
  available cpufreq governors: performance powersave
  current policy: frequency should be within 400 MHz and 5.76 GHz.
                  The governor "powersave" may decide which speed to use
                  within this range.
  current CPU frequency: Unable to call hardware
  current CPU frequency: 542 MHz (asserted by call to kernel)
  boost state support:
    Supported: yes
    Active: yes
    AMD PSTATE Highest Performance: 220. Maximum Frequency: 5.76 GHz.
    AMD PSTATE Nominal Performance: 145. Nominal Frequency: 3.80 GHz.
    AMD PSTATE Lowest Non-linear Performance: 42. Lowest Non-linear Frequen=
cy:
1.10 GHz.
    AMD PSTATE Lowest Performance: 16. Lowest Frequency: 400 MHz.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

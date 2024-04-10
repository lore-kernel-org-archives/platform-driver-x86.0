Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5012E5E
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712726398; cv=none; b=kiNrQUssHdG+j3TbrvWQuPVjl4QKpGJSJtu/nCOdoMJPFUiUErGmMvgFeREVSpQE7muGfs34px3ERi9uHKGXfow5Kx4PiUwqhXMHwLaDiuZ4wZZHe7HHrRcR21uOs//f3ATNSPZfU3A5tE+ARYQVWHDOUU/S5Bez5wWBdYy8oX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712726398; c=relaxed/simple;
	bh=7tpfcDAlIcPG3Vc3Xx5K2sOiP3fsZsMCmOpNrPgarG8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U2VCi//UledMj086GkxLLoWGsSvTvmNPmaQ0jgem8uA5aV6EiEi/bwREU3QNu5owJclk5HbPwOEMpHfCoT1NZdngEdGrsTaCFgTZbiUqgkZ/RW9SWaUzJru5pOMAZfCWd0b1oDBHenSLd2V2RS1eBUwgzzdnONqHn/MSuXhgn+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcIbWlhp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcIbWlhp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C9F0C43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 05:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712726397;
	bh=7tpfcDAlIcPG3Vc3Xx5K2sOiP3fsZsMCmOpNrPgarG8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PcIbWlhpEBe/98/6qjv4pVO4OPjcmbfPlvyL+dkHpGN0vDYj4aNKR3hnhkZeCOfzw
	 D7Im06kswUaSmO4dF4ZktzbsMxaxk4UY3GY0H8S4qPNQApCuBZ2EdBek1jGpxR/snr
	 3nXjY4xlcY2BBtWJlmDv7ypgQMKEjbhQ0G68pDMlWTimWzePTZLrz3WxreDocDb4tn
	 v8I47p0fZxKCx4KgG9sTl0UeOeOuHfpbw5XzxIX3IO6Ptzpl01oKPN5UXODwkxww4G
	 QiurfPb+aU73od7vkW6k5WEhZcXTw1PgmDicG6Nets8fyfG5CYB1laLqDV1/78SZqR
	 5Du4QJWaGF6OQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81BBAC4332E; Wed, 10 Apr 2024 05:19:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 05:19:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-Q4W3cYebuD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #15 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
No; not that.  I'm talking about things like sPPT and fPPT.
Try reading /sys/kernel/debug/amd_pmf/current_power_limits and then changing
the platform profile to power saver or performance.
See if any of those limits change.

For reference; this is what I see on a Framework 13 AMD:

(in balanced):
spl:35000 fppt:35000 sppt:33000 sppt_apu_only:41000 stt_min:28000 stt[APU]:0
stt[HS2]: 0

(in power saver):
spl:15000 fppt:15000 sppt:15000 sppt_apu_only:41000 stt_min:15000 stt[APU]:0
stt[HS2]: 0

(in performance):
spl:30000 fppt:30000 sppt:30000 sppt_apu_only:41000 stt_min:30000 stt[APU]:=
128
stt[HS2]: 0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

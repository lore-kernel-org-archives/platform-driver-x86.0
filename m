Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41B11DC993
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 04:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737087558; cv=none; b=BwQn3fGUcFGU84bDAuzg9ocTjEP8InsUMutbtZ9G6GwGwyi4nyJd1NxLTty5cejC/oITlVFYL50QsAGjR+XJO32XE/nGP3po6M4nK4NP1H94GoastmR9MZFPXDqVEiVaVVKxlpRnltJ0QGau+r4ytIXjNjS5h8GJP3mAdJFWODs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737087558; c=relaxed/simple;
	bh=hMPf7EhLdCD3FPi1nrRVQnFC2jp5+CUq1x+Lup0NGKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RP9i1Dm/PnguyCsI2CEtRthjjYDEwRKigZax4VRUJO8mRfKQQs8iw+o+q6Uz7QThkUMRsK+o2CP97n0yztzmnF5SN86RQat8IPXFPhFqsuAOrMPfxRyMomVIT9XuSFjW2oTn/lvwy3gdkIeTKmogsJI5gEpbExcJl5dkWs/p55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/f7I8/v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/f7I8/v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59E42C4CEE0
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jan 2025 04:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737087555;
	bh=hMPf7EhLdCD3FPi1nrRVQnFC2jp5+CUq1x+Lup0NGKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c/f7I8/vTK9RnUClt1nqn0Hf5QQHBc6V/DpmvHzv5d/lCcj8SsGSQa5cqbHoixXBX
	 jvZjVoQP8qX8EVCYAuzT6a1hjMJQuW+UdlxOR7VNraqvrO1iPHDeiiaG/QOOAHWqfw
	 URWuEyXpBN/j1SRgM5HvFzenBapWgL93fAj76CyeOGQTbe8bsGbrfL6FC/enTUjjtm
	 fQBntQCT2BCvsJcWAB2XNa+XOduQdSdELapA80PpLfWfbA+HykxYXkO8e/yjvRHTmF
	 SauIpXrjMBKkshljfFQf05+g4qS/SQiS8Hez7rSUE27pYToKbUaK5+gRguKGl0kk/U
	 fCQ89xovDT1/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D804C41612; Fri, 17 Jan 2025 04:19:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 17 Jan 2025 04:19:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-HS7KzkRNWB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #71 from andy.liang@hpe.com ---
The TPM issue is fixed with the kernel-default-6.4.0-150600.1.1.g2cf6431. T=
he
test machine is DL380Gen11 which is different than before. I've attached the
logs. Please let me know if there is anything missing. Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600CA3A960A
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935123; cv=none; b=IIg7HAF2t/2LDsaY3sMmhIJjlgICB4Kp1vzPda7RBV+ZkQX8V0G49QRJpu7Kia7jS9BdgGN4RIyNTealyEqyRHZqXoP+RKqch6Tdi/hkX2rHcQSDc3ZxzDe4Xm4+MdHCE+5fNpWfQkuomvyvKmuTpab71voCoXknCOXgKb4mLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935123; c=relaxed/simple;
	bh=NDHGXu4/crhHhf8f1+k5t3yB0zbq5kPedmZy00Mz4D4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qdQaNbV98gutel0LWfB9QuqXgbJdG6rZSBm62ykcMC4RdBiIUJ3AYQuycjySDclbjyP6yA7iHm1BtaoTZFcLAbc6qVXusekCc3nR6+yJDXgu6LYE+WQnHsQ0hQm0TcB6yFLExuI2J4QjealH+iHT81Vc1OSSXylJCufnk+FiVdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zc+NHdoI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zc+NHdoI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFD0CC2BCFB
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783935123;
	bh=NDHGXu4/crhHhf8f1+k5t3yB0zbq5kPedmZy00Mz4D4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zc+NHdoIlThBIM1Rez49lS3FzO1nnOJoSqqqlwYcik4y08ss7IsHImVZ8qdDtIVh7
	 S53LmflW3iKX1hETpWn0YFhPwDNWopw8leFSjIZTe27eBJDulHdCcFvNGNkeoiiFHC
	 ZYveoQLIkTqIwVRZuxcG5Z5JNJTAOykPMSUy0bBEy0bCc2hbAScIbJNqihw7spN96k
	 vexibu1/YCF3CUMnqqVBvQGijFAVMUVy01LRuoccLpxnKppGDU5ZXYQDNlVEPQd+7i
	 2yrboPW8wvAEQTL4oQRlhaDICTUV5+t9pbNhHI7FZC4NMTlS8F4hJIp3f//Fu8lmF6
	 nsNwDzb+6fhXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E00F0C53BBF; Mon, 13 Jul 2026 09:32:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 13 Jul 2026 09:32:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-isSF7ovt8h@https.bugzilla.kernel.org/>
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

--- Comment #153 from Artem S. Tashkinov (aros@gmx.com) ---
Mario, someone used Claude to dig into the issue and here's what it has to =
say:


---------------------------------------------------------------

**Why it works on Windows:** AMD's Windows drivers explicitly re-initialize=
 the
SMU CPPC handshake
in their resume path. The Linux `amd_pmc` and `amd-pstate` drivers do not.

---

## How an upstream provider can fix this

### Kernel fix (correct layer =E2=80=94 `amd-pstate` / `amd_pmc`)

`drivers/cpufreq/amd-pstate.c` =E2=80=94 The driver needs a `.resume()` cal=
lback (or a
`syscore_ops.resume` hook) that re-writes the CPPC `desired_perf` register =
for
every online CPU.
In active mode this means re-issuing the CPPC performance request that was =
in
effect before
suspend, forcing the SMU to re-accept OS-side CPPC control.

`drivers/platform/x86/amd/pmc/pmc.c` =E2=80=94 The `amd_pmc` driver orchest=
rates the
s2idle handshake.
On the exit path (`amd_pmc_resume_handler`) it could call a notifier that l=
ets
`amd-pstate`
re-initialize CPPC, ensuring the SMU is back under kernel control before us=
er
processes resume.

---------------------------------------------------------------

Is this doable/plausible?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

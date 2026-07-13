Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35C142DA29
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 13:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948879; cv=none; b=FwI/FN6TYX75AsB6UPL5r9aTxgE0rl70qZbpZ3eeENPr8/8PVs61XFOyOH0p3w85lZb0vwNU770yAdjd9h7FYyGjtoO92Ob4IDdo8MFfSnXuH4o6RUC8xNfE6ictF7bvHc5j/HwGpemKgxopmPz4yTIV9aKfH4XyEEsEaR/F5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948879; c=relaxed/simple;
	bh=dM97r2DAtquMCvmLZtsDsBKkHUNiVhehgmeIfxDPoSs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tQEV25+x6k3kwYcswqJ3DlUzK9U6EtcJlZOj99i0eNq65Lu0R+cTQca3RPUgXTsPgkJfelWb/bl6Gn+TkFv6SUL7ofEe0Cgkp/kjfnEzVzhqbwfHfi7p4jr3zaE+LSLyZL18okyqZVchbJ0udBOWZCFk1trbocKBcbSzgvdXrmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jp3BE6Uq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jp3BE6Uq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DE85C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783948879;
	bh=dM97r2DAtquMCvmLZtsDsBKkHUNiVhehgmeIfxDPoSs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jp3BE6UqYkBBskxX+D72Yjoli5S4J+Z/JoB/8e7m4U3wdSzQhql9oqph44kZgdrPh
	 +WP6vbcXZ8kLarvJLkQnejm/aVakZmRk8PIjD7YhPY9O73ume11C0+FW3tXuiJSB5z
	 g8G+ubCzP+AW8nMc5/a6qcpGBlc9H8bmooiTxiUQzDg6+MOonAKmy3k+x5MaMzUd1q
	 lcQlf+U8Bcug0va1f4kIoCgKrTzIpu7Qugd3Twp7zlqSj1sfygSSkvJui9Q3h2jHt1
	 4cIlNBTqvKAR0vEkQTmYyZjrYps5NH9wbpjVWkqj8Woh/MUdszHep5TD3NVvuoWsGr
	 fbwleWsZ6czLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E7DAC433E1; Mon, 13 Jul 2026 13:21:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 13 Jul 2026 13:21:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-S7drBPz1ad@https.bugzilla.kernel.org/>
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

--- Comment #154 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
> Is this doable/plausible?

Unfortunately; that is filled with hallucinations.  Let me tear it apart.

> **Why it works on Windows:** AMD's Windows drivers explicitly re-initiali=
ze
> the SMU CPPC handshake

AMD doesn't have a CPPC driver for Windows, it uses infrastructure built-in=
to
the OS.

> ## How an upstream provider can fix this

If you have Claude code and you think this is viable, use Claude code to ma=
ke a
patch?

> `drivers/cpufreq/amd-pstate.c` =E2=80=94 The driver needs a `.resume()` c=
allback (or
> a
`syscore_ops.resume` hook) that re-writes the CPPC `desired_perf` register =
for
every online CPU.

There is already a resume hook, please see amd_pstate_resume() that updates=
 the
correct register (MSR_AMD_CPPC_REQ).

> In active mode this means re-issuing the CPPC performance request that wa=
s in
> effect before suspend, forcing the SMU to re-accept OS-side CPPC control.

You mean like the code already does?

https://github.com/torvalds/linux/blob/v7.2-rc3/drivers/cpufreq/amd-pstate.=
c#L2108

> `drivers/platform/x86/amd/pmc/pmc.c` =E2=80=94 The `amd_pmc` driver orche=
strates the
> s2idle handshake.
> On the exit path (`amd_pmc_resume_handler`) it could call a notifier that
> lets `amd-pstate`
> re-initialize CPPC, ensuring the SMU is back under kernel control before =
user
> processes resume.

That's not how s2idle resume works.  amd_pmc suspend is unrolled through
acpi_s2idle_restore_early_lps0() -> lps0_s2idle_devops_head.

Then acpi_s2idle_restore() is called and all devices resumed.  amd-pstate
already happens in the latter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

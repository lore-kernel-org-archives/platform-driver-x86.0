Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8E737BE8F
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877567; cv=none; b=DsbvkfO+MFFI7m1l9rlEnCNus2kqaSmYfIY0XTLirVOUMEZxsba95WC1hMnto4rhYreWuQ0aJ/UBNs4MLjFGHLvJTbAdNj8kMPecVKJQOpbd2Dkl2xQ1CsS/TQ2ATZlzPyiSg1xIy34iNh5Cl6zTC8KgKQpmsyq/AIj+jYntZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877567; c=relaxed/simple;
	bh=m75Xj/WTYr2yzvoA5MaDwRDCxmC0CIt60osM/o5Bnk8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=snhRK56m1EI4XrOJSQFbQbpJEvs7azNG+2Y7Sv7ZG96wq5N5g7RGx4fRbeSjYhetTT8+BbMMJQvhnGrBlmoNySDAh9XSN1piVaLqgUd7oGA4t+3J/j7gDqTTqEW5CHliZqLObE69eODUFacnAcfoaaOyKnCRB3PPn/Wuqh0nd3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OERQDaaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OERQDaaD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67DB8C2BC86
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 13:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767877567;
	bh=m75Xj/WTYr2yzvoA5MaDwRDCxmC0CIt60osM/o5Bnk8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OERQDaaDet5ZZY/xUmLw2WSb87yD6uPSm2lQt7Zyi88awoERyiIWoEtN2yWKes+W3
	 hslsaHxDK7seTuKYCWk8x5tTVde4jRJw07xd6AcffeNcGUoTrrZ+bquUO44ZmY+UK8
	 qQq3mhFg5Z6XY2MCk/x6L2zIm8gL69fSRzRWc7K2iyPUvf9saZfZPiSmbt7UdcSiCJ
	 /8Yke5CaEkvYbMyfaLpptYP/vHM9Yr3aeCYfzCVWMXvOjUhzzrjAvA6FSa8Rs7QjPI
	 GwAcZM9Uo7jwLPkWhjndOasLQR6DbXtzt88F/73RCJjpq05GuyGkcoqZGzgBd5IiGT
	 noWwqI6vFm4Qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 63A5AC4160E; Thu,  8 Jan 2026 13:06:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 08 Jan 2026 13:06:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: soyer@irl.hu
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-lgO2iiuFv9@https.bugzilla.kernel.org/>
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

--- Comment #148 from Gergo K (soyer@irl.hu) ---
Thank you guys!

> Note that CPU was *not* throttled while I took this dump, it was running
> normally.

This is not a problem, it does not contain any running state, it would retu=
rn
the same.

> The previous one (worked perfectly): 01.10.00 Rev.A, dated Aug 18, 2025

If you ever revert to the old BIOS version, please send us an acpidump so we
can get closer to a solution.

What I noticed is that they are implementing both AMD and Microsoft's LPS0 =
DSM.

The code would be prepared to use only one of them, but I think a bug was a=
dded
with a change that makes it use both. And maybe the laptop isn't prepared f=
or
this.

/drivers/acpi/x86/s2idle.c:462:
} else if (lps0_dsm_func_mask_microsoft > 0 && rev_id) {
        lps0_dsm_func_mask_microsoft =3D -EINVAL;
        acpi_handle_debug(adev->handle, "_DSM Using AMD method\n");
}
but the rev_id is always 0 here, so both lps0_dsm_func_mask,
lps0_dsm_func_mask_microsoft will be active.

Would removing " && rev_id" from the if solve the problem?

Mario what do you think?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

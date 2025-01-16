Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7D19883C
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026158; cv=none; b=UM/JTK0guPpaSGCdfCIsG4HvAauMwMArmrvSTShygEYaND6wh2rgPK93TwI1htDidtEAwpjfUIbHPNpCRq7bizgUkWjwgDIkGU2wN+dglPC8L0Lmg8oM/XSKyhs0a+xUCfGBTrWVU1RWfXyaLbcUL9BAujh3W8Di25P8pjbHNKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026158; c=relaxed/simple;
	bh=HZTgPsujQmhCQk+kDBLyV4EY41NWZjugtQvk9yIxZo4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cBDwgi2WHn7WWVb1I4kL31yVcgxlcwZugWbeZn5z+ZKDmQ/W40Z+K97vJsRMg4j8IDyJE0mINM5kjLDfn4tbyu9Z+BBsuiammIx5unwIIjkjaazQm42X44AQoS7OQUUyvsLO7R5ZyDIiIzFesziyq5Mg5Op9n4Vf4g6xyTMN6do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hl+iZfVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hl+iZfVm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8EFCC4CEE2
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 11:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737026157;
	bh=HZTgPsujQmhCQk+kDBLyV4EY41NWZjugtQvk9yIxZo4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hl+iZfVmH12I6I1skxd0U64Hkm0PUOTXbLY4sNHmWzqvp05X2oUM0cBq6epPL2oTO
	 /AHcl/U2DChCjj+Afm9Fmgg6Um6nXaNVpecEV1/whjMr2G5EpNh2zqNzdUqNTswBiD
	 GxSsd2B09T4e+DWbVrWlzB8kgfGRZK19m0gaQf8iv/Stft1lSlx0Du3MQCG4STeYvH
	 craWZjMgvSIeyWEqKTase+oUSxfszU/bxSV0CF/UC+tQFY/QRYjFOqnlP+EvL3c4Vx
	 3mu/s/lPXmnf9gNogJ0AVDzJzPT+9wKJdgrbdYeoMAnRYYKowOfhpbbDYjUdzDXEQi
	 PxkfkANbJKoDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99CA3C41612; Thu, 16 Jan 2025 11:15:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 16 Jan 2025 11:15:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-5roUc4IWCi@https.bugzilla.kernel.org/>
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

--- Comment #67 from jarkko@kernel.org ---
(In reply to andy.liang from comment #65)
> (In reply to jarkko from comment #63)
> > (In reply to jarkko from comment #62)
> > > (In reply to jarkko from comment #61)
> > > > (In reply to andy.liang from comment #59)
> > > > > The binary dump and kernel log for v2 and v3 patches are uploaded.
> > Thank
> > > > you.
> > > >=20
> > > > Awesome I'll check them later on thanks.
> > >=20
> > > So, v3 log looks great.
> > >=20
> > > Have you tried to copy /sys/kernel/security/tpm0/binary_measurements?
> >=20
> > Oops! Sorry it was there. It looks great too.
> >=20
> > Mind if I add Tested-by from you to the patch?
>=20
> No problems at all. Thank you for your help.

Sorry but can you check one more time the final fix, I'll then append the
commit with your tested-by? This is now the agreed solution by all parties =
so
as long as it works for you I can put it to the 6.14 PR.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

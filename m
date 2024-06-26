Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A0D27A
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2024 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409442; cv=none; b=fO1mZLKpmIldwsF9KiTzBRUePCY9Z8Q26LynhUwy8RVm37zPNmRqYZFUpkPwl54BUSj1orkSvRhbhAM9oWIl/F08sirfD4dMCHB+9d30DhOkJgx8saHEQjjDDxg8FsqIq1l0N3/e/Ve3I+xK6t4eW6cgNxV3MREyezKxOtihULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409442; c=relaxed/simple;
	bh=KG9B/dJaKSuPf90ea1KeWfSGwd/mOc6gXix5bkqXJsU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bY6LsobYgUMoW+JQvc/gYW5cly6ki0mfed2uykruOAW0cFv9n6x5o6eTFZZCkLHusvawpssOCgZIlgJX15Fx3pbQtsKBS28iL2DFDZN4isv8E9gz32WMyWubR/hKEnaQErKdHi4D8rPMti0Vc7URJeGjPzp7oR2aj7yPRrM4UoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACp5FL7Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACp5FL7Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 598FBC2BD10
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2024 13:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719409442;
	bh=KG9B/dJaKSuPf90ea1KeWfSGwd/mOc6gXix5bkqXJsU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ACp5FL7ZhDNMvXdmjp3UVUlpN5bGTDamaI/8y9ehnJoJEky2vuDnHZTrGuGdFLKdU
	 WQyPPej6FQq7elt7VgngkuC1FYHibPlSvdVrbIrJlMNfLiyNr7FLr8CjUUlIY/wODW
	 rvpmtLGlOb+rU++SJZUZgNtREZBMg5L/2f3Hc4V1g04/0meCQa89/ZgwpBl2AyyOUP
	 FOzSJ4hjCkoLGkobZVAj9BEoGegs5eanRqwD6E5LuXK9DtpuII/paEDRi4il4HSfJe
	 fvmA64bIz5y5UUNgRNm5/0eKZMHRiXOeIE1nDOh6VhOEfJMn9xneUNWCLVrvDrtjJ+
	 +DfLkYkVobUgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A45DC53B73; Wed, 26 Jun 2024 13:44:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Wed, 26 Jun 2024 13:44:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pawel.radziszewski@pw.edu.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218771-215701-kszrgnIWFl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

--- Comment #7 from pawel.radziszewski@pw.edu.pl ---
(In reply to Mario Limonciello (AMD) from comment #6)
> > Modern Standby + si03x -> Modern Standby + si02x
>=20
> This option will prevent the system from entering a deep enough sleep sta=
te.
> I don't generally suggest it.
>=20
>=20
> With mainline kernel 6.9, can this issue still be reproduced when the BIOS
> is configured to "Modern Standby + s0i3"?
>=20
> If so; can you please append a report from
> https://gitlab.freedesktop.org/drm/amd/-/blob/master/scripts/amd_s2idle.p=
y=20

Just to explain: I did not check it yet because no update to 6.9 has been m=
ade
in the stable Mageia up to now. I would like to omit "messing" the system w=
ith
"external" kernels. I will check it after kernel will be updated to 6.9 or
later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

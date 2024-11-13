Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3257970835
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 18:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731521276; cv=none; b=EqVB+YntZumAriqWS3YcqykHppJlv8rZ9K4ioYIHqP/YxLzQWLcD9NTijVQ+SBHI/y7QzS6vpGqOX2PvZHlM11SrTnE4/LSK77BriaXGYsSBkIYmj1gyELE6nTzc0XCQ5D/ssXa9i3BwbBpye/FFqsIBuGhyV3DNO9bmwMEAMto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731521276; c=relaxed/simple;
	bh=rVt2UYceCMW4vi1shS6DWsTRy1ab4/phN3sPgF4AxxU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S5DB0r3OxIUKCOMTtA9b38xGT142PDDaL/dO817f5wzeki649pvM+w72cAkuKUCXJm4KM323sepzJ8SynDXkxOEPNzqAsn84Mp7cVLZPiXFVObyz4G+qem0wWUWu+hjGl/oTS5KmGChnJXQ546Y1jbzSr0+a0mZouEb+WsL7IUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjYBKkSE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjYBKkSE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2834C4CED0
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 18:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731521275;
	bh=rVt2UYceCMW4vi1shS6DWsTRy1ab4/phN3sPgF4AxxU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZjYBKkSEBFii6vRfFrRas4CzYP2prXCTUbJIcTmbWJCGWIUmZjO3nDaj/GNaxocBk
	 /wbwe5wEM+nO7HyaVAFyGXc/TDkwqwPXm4RlSy3nE7B2DgVhW/YRM666gT6vgAULj1
	 LbCXR6QgwvZKSShqXyDpNmFT32maHMxoJJ177blVsagmRZfFiM99VOFJyl90Xw5pSv
	 VGmb/32zOk68vWY10Z581F+2VKwLYq1zIpnCi+xdCtw/nNc6dVj9o0/ANgjzKZWrIM
	 +V1mSHZggH46ydK+ts2nSb+jOo5Ze12h/xJe7hotD34ZaYH+6U8dJr4Nm7vIB2gQ/z
	 u6E49w0STP/UQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9A908C53BC5; Wed, 13 Nov 2024 18:07:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 18:07:55 +0000
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
Message-ID: <bug-219495-215701-hn5UMTf3cb@https.bugzilla.kernel.org/>
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

--- Comment #8 from jarkko@kernel.org ---
(In reply to Stefan Berger from comment #7)
> The attached parsed contents (comment 1 attachment) of
> /sys/kernel/security/tpm0/binary_bios_measurements are 476kb. I cannot say
> how much this file would be in its binary version but I would think it wo=
uld
> only be like 10% of it, so like 45kb since the parsed contents also displ=
ay
> whole certificate chains. I don't see why 45kb should be an issue.
>=20
> Can you attach the plain binary file?
>=20
> > When the TPM2 ACPI table sets the Minimum Log Length size more then 4MB=
, a
> > call trace occurs during the boot time. The reason is the kmalloc limits
> the
> > maximum size to 4MB for x86 arch.
>=20
> 4MB would be excessive and I think would hint at a buggy BIOS. We should
> never allocate that much memory for the BIOS log.

Yeah, possibly! I'll look at the data collected so far with time as soon as=
 I
get answer to my question-triplet :-) Just don't want to play assumptions,
that's all.

So here the interesting part is still that apparently it could be still par=
sed
(see my question #2).

Thanks for taking a note on this bug!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

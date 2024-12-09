Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785E233157
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 14:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753432; cv=none; b=M2EH52HmjMMiv7zny5o2EO0gYJCBaT5qTWxjo0FEJgkDCcJ2+IbP48Wprhi9rsNTW1u743BdAL1CbozVMtXNxf/VdDpN1D+me9UMdHJ0kGvEHawOdf8Ey0LowCNg34beMyuie1/76onf0d03y1a3YYekJ2nscHtcBWYZ1eFKp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753432; c=relaxed/simple;
	bh=iy0X3tfhSRidcZdjbqpU/5PA/jm+aoMufjF+oRpK498=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNvMeV+iAfh6CycovvYinX2HlACytiW3aCoDbuwqmqzkUlTqBNWI6Oen6WnyOxHxjG5EcTP0PYXfVHmLDi8kNg8uuf4eILKSSyGegySkFFRo1vrZF5theWJ/UErhJEbNCW/0E9OY2mYv49A36LivSkTszab9D+N0vHdP+AAEOcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFr1w4eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFr1w4eq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2629C4CEDE
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733753430;
	bh=iy0X3tfhSRidcZdjbqpU/5PA/jm+aoMufjF+oRpK498=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oFr1w4eq/K42FgvcuTlcypKZnwhs965bKzl1zF2H9vNRbWOsCOJyOvvah962zUuEW
	 xDvzhDLmib0WopN5vpqKvsgXCGHsvXDstMzhAT3OdAx8VfGln3kjdBSOApgHEZX8Bh
	 G+mLpKeIyoKuXtObhk7IZLa6F7W0GZtyyvIopLm80qFfvHFHJWSmaEHc7Zy20s1HGe
	 41rBi9oP3XwYHTo7ZOyVyGpBR+unX80Fp27mg3L+mWxV0BmqLLrAvWr+ugp7eXu1da
	 esMC8BpArotjxONbgPDU1DAXfJZdZspVpyjz2Z2VnZVJQe6mhQfLe7xzNHlHzLoSUv
	 /11mEDwc4ChLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8C1D4C41606; Mon,  9 Dec 2024 14:10:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 09 Dec 2024 14:10:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-6MzhAPKMsT@https.bugzilla.kernel.org/>
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

--- Comment #19 from Takashi Iwai (tiwai@suse.de) ---
(In reply to jarkko from comment #18)
> (In reply to Takashi Iwai from comment #15)
> > Jarkko, any progress on this?
> > As Stefan suggested, just capping the max size to 96kB would work?
>=20
> So, you should:
>=20
> 1. Create a patch.
> 2. Add relevant snippet of the dmesg to the commit message.
> 3. Explain why the size needs to be upgraded.


Please don't shoot the messenger.  Neither of the original report and I
understand / manage the relevant code better than you subsystem maintainers.

If you can give a patch for testing, I can build a test kernel and ask the
original reporter, of course.  Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

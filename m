Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819FB17AE1D
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Dec 2024 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734071492; cv=none; b=CiCMCwEMxuQgcZC5d5liqZpd83ikIveRKNEx5S9I+RmmcwmLX24VvDi7/z3MIfCg3MF3uaP6qeLZrDZcnNrj1vfVOKzqQbEAtKGrosmIyKSEnfYZc0esD4F2XStmIZcj8hzPPGEzbghgKvpkYbAysahM9Ghy/Z/zLcbgovho4VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734071492; c=relaxed/simple;
	bh=mU+bx6gthckPgKSUi5qeBNJeAYxEsp23VxcZNanuwG4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mB0K/H4ZqG1ahUemjlO8TA/AS7cq896/6i4Y958V1ddTB36dnpxCx7i71AwIFHvzdeQY/FLNux52q23YhAp4sSsh5rzEP+tagCso0TQkmI7rQM+TRZnhd+Y3ywwY62ILbXp76vXzrGYGDb2iPfAgDoejmF5O5ZruVXLwp90oT68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBw/q/Ag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBw/q/Ag"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AD84C4CED2
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Dec 2024 06:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734071492;
	bh=mU+bx6gthckPgKSUi5qeBNJeAYxEsp23VxcZNanuwG4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lBw/q/Ag/Q2P/eVqpPDhcNdxkRyBiWZDeeZUGhhYT6N0p+ubwp/ftwqDeXQG6093P
	 phMHhBuX5SzFQ39S7iHOB1+E+kBrfXxkgM81jYPrxsubPgqwlmdmyyj1OwtT6Y0dAu
	 OBi3YS8i9L//c5DaNhnou3k1rUVQ6qWV1G4mfgDhug0RJcRhc6ypk90DrtnVMCwSlB
	 NvMOYEnbtTJCZtuiUOyoZ3EmMijz0Qi9+5F2BLOQxitI/N2r6Pn8SaW+YMhNQbmgmk
	 JJ7Dr+YdUyej0euvF2LN4q0thAkPbmARqk6J6WgTezA+yM7AVIWY0IH8XtbphEF4qE
	 Gvcg1u9odFiCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19D3AC41612; Fri, 13 Dec 2024 06:31:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 13 Dec 2024 06:31:31 +0000
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
Message-ID: <bug-219495-215701-asIH6jCYkd@https.bugzilla.kernel.org/>
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

--- Comment #25 from andy.liang@hpe.com ---
(In reply to Stefan Berger from comment #23)
> I suppose the binary and ascii dumps of the log are still as before.

The TPM2 DUMP still shows the TPM event log size as 8MB. Thank you.

--- Comment #26 from andy.liang@hpe.com ---
(In reply to Stefan Berger from comment #23)
> I suppose the binary and ascii dumps of the log are still as before.

The TPM2 DUMP still shows the TPM event log size as 8MB. Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

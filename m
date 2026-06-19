Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABCF3537C7
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jun 2026 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781907586; cv=none; b=diVbgww7kA9y+eFEn6tXYeKop1GpJTlNx6Z4ynlnTRfx3gS5bd0HLemJdFMUJpLrzMOAIKMjCuka65t6Z1spCy35qcbluSxy8zOnKr8k4yjIk2hHFP6YQM25rh+g+Vc3Pf3qcXPrvyZIoQLS+dp4BPhf9L7b7TI6hMB6dbuav54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781907586; c=relaxed/simple;
	bh=q2+njNieEyz4JnqrpohO2pE7d62rh7s35XeHe+B/HUY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QiV+0uGLGcGgvAli/7zDjwdXlgmgLAFqgNlE+v6m+VPYNisVouU8yxICPO4cR+m8sR0cTglNI9uu2NRJno0FO7KRWyQgOq5X3oicmSOU67ldyauAreGSjKXJ5m3Pc+KfqdXXS8OnaXd3/X3gf+0Qx8KbOESZjan7LiGoVbQgKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqD75kD3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqD75kD3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFD9FC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jun 2026 22:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781907586;
	bh=q2+njNieEyz4JnqrpohO2pE7d62rh7s35XeHe+B/HUY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SqD75kD3CPT8lhz2/qgwLs8xjuqwxErZM37jArXyyRQIieTXBE7vvuCmZHN8cgMtH
	 vi6Kt1XutNXSGa0O1TmPLAollXMewIUR1JPnmLZ8DwFbU33emUmExItocuV1RCyVA+
	 Ljzxaq4dKnq9Sl5dLtCpDEiJc3LuxSLCUI4yHrU062tzBBFVSUQRpk2n0MB3HQBci/
	 Ssh389jUQXo9vzsgMWKOO8A7N8hKrSGxTeHn/JySLT15+A70Ctfe5VdIacTSXT8976
	 6NQbea6kCIyt1PubB0OWjZc6jo2qOzAFylCpa/efaA9rNCWKooK2d/ZSfnCORkBk6x
	 SnacxTYU3YKeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D679FC3279F; Fri, 19 Jun 2026 22:19:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Fri, 19 Jun 2026 22:19:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221569-215701-k4MrkziNNb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

Marco Scardovi (scardracs@disroot.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |scardracs@disroot.org

--- Comment #22 from Marco Scardovi (scardracs@disroot.org) ---
I know I'm late to the party but take a look at my patch
https://lore.kernel.org/platform-driver-x86/20260619220911.7542-1-scardracs=
@disroot.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

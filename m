Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB143921EC
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341447; cv=none; b=PFspRrVx7+EEm2FT/dR8uE+ytn+l0645D3pnDAVP2maqKRR2253y4n2ztIGDMIam3jJ1gCsVZSSml/QX2Req4J3pYvKOF48aSk6WXHMD79m4QLyw+AlGrrB0C+tTNw9tajkJOdFMT5KWrvk3pXzvPmDdYxBkH4hBxmf/LXvqhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341447; c=relaxed/simple;
	bh=lXsQxM930VWiqRHNby2lo7w7+aQNkMHZlUIQmcEOGmo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HOQvqGJSHCv0UR/n/yjG8gMK3u5SXz80yrjj+8VFNLlEUzfi936hpgGu0Xmc/tQMskMUBT0gKt/zT2FZWWGFCE77jVmwmtH4sRiTc3samG+PP3+kI9rdUXJLDrnHAranA6jsu+Np9zlM6z5W1/g2hUKGxnB0uxxT9ZQaqEdMHVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAabpdc+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAabpdc+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45ED9C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787341447;
	bh=lXsQxM930VWiqRHNby2lo7w7+aQNkMHZlUIQmcEOGmo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aAabpdc+jC4q9iwUuWCqpD7XHHOeQXC882XcMyuvgO2KNKv4R9jCEkzE/nJ8WyhUR
	 ojl05DfBkzs2/afjPHUcrcU2AOMmA/bf4jNiCAMf0lnnIaUyMvH3uCgRXGA76I7dIc
	 NxY23qplJIE2Yi1TQwNW9N3OqFjupWqQ8DUyD4678YVyVeDI71vHPDz0IafFeGseEq
	 YHfFnAE/pWFjqijz3tk+XMRoXi2nDbNi0WJHt7Z/6gP5NFQ2D1hldcRjFOCV7hvS45
	 1j8XdcAXw15FrW8riKxjg2GGWR9EByDUw3JdtzvaUD7+NmpZK3QSEHC2TgNCnlRk07
	 qehOpsUOAC4Gg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1FD1AC41612; Fri, 21 Aug 2026 19:44:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221905] [REGRESSION] apple-properties: device path parse error
 -19 at 0x14 on iMac14,3
Date: Fri, 21 Aug 2026 19:44:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lukas@wunner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221905-215701-Vm61IoeBjO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221905-215701@https.bugzilla.kernel.org/>
References: <bug-221905-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221905

Lukas Wunner (lukas@wunner.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lukas@wunner.de

--- Comment #2 from Lukas Wunner (lukas@wunner.de) ---
The EFI firmware has passed device properties for an integrated (Intel) GPU=
 at
0000:00:02.0, however that device is not visible to the operating system as=
 the
EFI firmware has switched it off in favor of the discrete AMD GPU.

The EFI firmware shouldn't have passed device properties for the invisble i=
GPU,
but we have no leverage to make Apple change that.

So the error message is harmless and can be ignored. We could probably demo=
te
it to KERN_INFO severity if it is perceived as annoying.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

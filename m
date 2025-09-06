Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FAB1F4C92
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Sep 2025 02:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757124889; cv=none; b=pMDxwu+6u1y5+ojnUV2YWX2UgUNAB4m2bOFlsLa11pzy6GftCDfPcvwMiJo+xEhoQlBCUU6FkGMXc36pJrL3dV2c7gUVfaQC8Nxar2BKYjUZrKESjylKaIDUx19dFcHgHIGXzImUB0kyvO/ginW2Sp/4IQY6f7ZvXAmbA5Mm/5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757124889; c=relaxed/simple;
	bh=/XOE2lSV730ViL6XJlMxBGwxs8lgKdiMsR8P2s0wCwk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=icB1YRs5jl1FLb3ZRpH3AqCgUjESFwI6fYEvFFI0HY63lP77WEJsMJALbIIn20CRfNFq3og/ZL3mWuYH1HoNT5csHiC+KKqKyFJGFQ0bsYqRRNUiX17wTUJ1jLuUSLRyb47SVxFtNnc5ZC8DvasuO4xBNCnjXQCJZP+NYwFFAnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ef/dzeeV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ef/dzeeV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A304C4CEF9
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Sep 2025 02:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124889;
	bh=/XOE2lSV730ViL6XJlMxBGwxs8lgKdiMsR8P2s0wCwk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ef/dzeeVzVfYKUPJ4adOgLFAirDCM8e524YIEA4sZ4LzOmJVhOqkgsNqXdLLKQfNE
	 ANczRv2vL8IXCC1EXS8vizsHI+uNgrt4PJrKAimGPP8Xso3jCTv1+RfjDQQ6AkmybD
	 9vCnJm6z4y2pN2TJYfoXHXKNB0dGmuIRmHLf8leAHYRovfVTjIKeilVsdisXtiKrWK
	 O+FTdYhx/4vqUjsmokLEPNCsyNSdTfxaSZ9W8JTb7/z7wUE3MfgztDtahkFayXhHv1
	 AVxY/fSbyEyo3yXIXhFunVdj0s0gItdQMrCDuCpL6sy6Go2Nq6BQVe065CHUgHD5zc
	 llYrCZoFlVUjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 39F9EC53BBF; Sat,  6 Sep 2025 02:14:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220473] Linux 6.16 doesn't let me to shutdown the system and
 sometimes to boot it (lib/list_debug.c:35)
Date: Sat, 06 Sep 2025 02:14:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220473-215701-WVqhTepdsk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220473-215701@https.bugzilla.kernel.org/>
References: <bug-220473-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220473

--- Comment #9 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
This commit should probably help.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/platform/x86?id=3D5549202b9c02c2ecbc8634768a3da8d9e82d548d

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

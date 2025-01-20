Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D7336D
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 04:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737347240; cv=none; b=pEGltQRaB6eaDXHrbMyDLFZ1PVwcY5YBeurNP9xTnH56uR0wnGV8+c21FKqL9u208LIpz24YdzK0YzDzT/m7ws+AtBtOORsHGODl+7kgCNMH/tNn3Z27/1qx0rgNGVOgGNIXFFPB/ro8YJNqkHq8CPcst5R+uKZ00cpPcpHr5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737347240; c=relaxed/simple;
	bh=bGM5jBMfOVt97SjoOzpBuoJlC6bylSXgYS5DNhn0Xf8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mVrgmANbdZJ8BezGo3OAhqA/ZexIhJN2F7YTba16NmoVyOMo0JZ7h32CHMsZ4+s5FvehiOGMRFKe51g3OPaxqglqRgnw3oJV8avdFEHHQkZ0np/U48arSLj1U//OVNzyc7K6Hzw3CwEUZ0ACRepmEvtnfPBq9LsyossjnV5SsCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJEOlLED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJEOlLED"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA682C4CEE3
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jan 2025 04:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737347239;
	bh=bGM5jBMfOVt97SjoOzpBuoJlC6bylSXgYS5DNhn0Xf8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uJEOlLEDVlyD+b2PU59PP9OWuMuNoVVdn0BtHr+nCGS2aHMWhHDocfZqqf3YRJgkE
	 ozuRRvhEBGJBL3nGx0SavHGTzCjOXIBevoNA3N7NRmZCCQMnRsKqzZK+bp3lMzdL+O
	 2bsxNbZvOFTJwXYPIpoWRwwY1+3BSZvgKbZsOxl1wasitbnKbwexco6EMjDlhMo6oW
	 SldvX3mk550fUj9tbDiwpy4ZoKg7+BzfRYZ3AbZTDF7BxrsJDJpE8OjJNFvUXEnhZ5
	 P2nHp+r9WBYSTvfTzxLomb6VX19PkHqMfaRi/r3aJJZNUX4IKvg+mGLl6iEYE22aTw
	 YWLikWT/ZQiRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 311DAC41606; Mon, 20 Jan 2025 04:27:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 20 Jan 2025 04:27:04 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-ExVj4uQZx5@https.bugzilla.kernel.org/>
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

--- Comment #74 from andy.liang@hpe.com ---
Created attachment 307508
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307508&action=3Dedit
v10-patch-kernel-default-6.12.9-lp155.1.1.gdfade19.log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114947EF09
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734939104; cv=none; b=a2mRvchBMZ/w9IZFgyJVLUwv2SA+l0GHB0qXZo/7RVRseKDlGLOQq9L0aXRfbL8dB4911n4A7gssC/gsYSooeS9i1UzK7iCkOMsUNHxJipFtzrSdQK2Pdmu6s/925yUFDxcEU/FbjKiqPrYNBzSBBGos5srFKO/vIeTB7FwiUaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734939104; c=relaxed/simple;
	bh=eQ3Wqby0JloPYztt9o42K2UQupadMAqTjR7S2BMlT+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IhZnKbJAQvkyjt068+1q3gc7R2oMwvlgL8Wm0awGP2sBJOm5xUcQhWDdMvi9nbx29Y7pocAc+7VAOB98fzsQakfZhw+4Attj9Di+p7sKdBhondMSlcqGQIBlY6UtA/sDYi1+OjsTObEp+OyZP3axzqOSbbyWe783Owu7piLfrNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svMsyaxQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svMsyaxQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96CE5C4CED4
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734939103;
	bh=eQ3Wqby0JloPYztt9o42K2UQupadMAqTjR7S2BMlT+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=svMsyaxQDOwmYoFZrngXMxPwFEYWd1JvjxMx06MJhKR4LucjBJSvGl4uzfVsjOn4h
	 YSDkKYOqdZIxyEfTlUys+Kl8bEcxRhTYroGn4hYST3RUtzBif8flJLop3umnbS6R9i
	 eHfQO/bC/AUdzbTwjSg6OYZd6hJYZsMBd11BPSYYGExE4Y2UzFwMiliegD1M1s6+tp
	 jRegW2T8va7zVmLHfiSpaOhVu+tF+cB3aRvVBAtl97B3ekLLnC7G/5YXsexSG9e7ui
	 SoQlyDfI8y6OIkY0SxquUI/5WX03rJkRZ35/4wJextuqebtCAsYmWsU+n8UVkQHzKS
	 nF/IsSu22eLBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 895EBC41606; Mon, 23 Dec 2024 07:31:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 07:31:43 +0000
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
Message-ID: <bug-219495-215701-S77aDwzn88@https.bugzilla.kernel.org/>
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

--- Comment #52 from Takashi Iwai (tiwai@suse.de) ---
OK, the test kernels for (open)SUSE with v3 patch are being built in OBS
home:tiwai:bsc1232421-v3 repo instead.  Give it a try later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

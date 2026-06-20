Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105EE33D511
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781947491; cv=none; b=G5/kUx6EfwGdYU5FxiQnq06vYVfFirw86ryjBV+pbWYqFZN83QgDmPxCM/kq22eaCpcEHOV/GIsPy+aTu3ySWcKHl5eMyUU+lUG6exlUBbVVFt8gKQGWKawmYrOMS0I0dKuVMAKM5eqk+kkPBJCNuZklQjv4vFNhr1eyXieEa4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781947491; c=relaxed/simple;
	bh=cQ56S+/8Y1e1wezWz4NYm4dXLMifuTzzZP3Or0KoUXg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZvX7q6XjetHI4aaS81ZDfWTXxw0O7aNoIqiG+f1n4S2bjxvq4bjGC25DyxJaIEQtWlh4QCBSATOsWJrepRrHE/zXAmW0CCOUtQgVvYXvYGMpUfe4DA+Y54e9XdT96xEcKFSMesmU6ufDKitV4hT/3SJomNPPrW1XE06FjFyY+so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qS3dUUqo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qS3dUUqo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96D08C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781947490;
	bh=cQ56S+/8Y1e1wezWz4NYm4dXLMifuTzzZP3Or0KoUXg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qS3dUUqoUr+sqZ2SpQ3jh0XViVXtsgz+N5QKwip1nSh6CTOMqpIMlBy20bi1rgZKS
	 yWZjGI5LtEGwWyR5vzcLzDeAY56nIW1fJt5EqzqgokDKf48yyhJYK2DL8PGKheOBqd
	 wkgjGRbRwj1xGJdo9x08L6FqKvqIh4txZjlNc8sPSM+nKhk0ehwE3nD9YganKkrLin
	 k5LT2YijtbjOmSIx9mAipOLPqDBOo8jQREJPY2rn3gaoZIg8zYG4+4bCo9FSTrh3mm
	 rBl9hlleLQ6QjTjRlNU7N5AhblyiUzElL7g7sxmHn2lxaOvJAHoW0KVhO09FStOt1Y
	 wL/voDQA4D8rQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 769A6C41612; Sat, 20 Jun 2026 09:24:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 09:24:50 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-85p9ib7Qij@https.bugzilla.kernel.org/>
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

--- Comment #30 from Marco Scardovi (scardracs@disroot.org) ---
Regarding the message: hp_wmi: Unknown event_id - 131073 - 0x0

This event ID (131073 is 0x20001 in hex) is a standard notification sent by=
 the
HP ACPI firmware during power state transitions (such as waking up from
suspend/hibernation or plugging/unplugging a USB-C charger). Since the hp-w=
mi
driver doesn't have a specific handler for this event, it falls back to
printing this diagnostic message. It is harmless log noise and can be safely
ignored.

As for the GPU hangs (amdgpu), they are unrelated to this WMI event. As said
before WMI events are handled entirely within the platform driver space,
whereas the GPU hangs are driver/firmware issues inside the amdgpu stack (o=
ften
related to power management or dynamic power states on newer AMD platforms).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

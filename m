Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7E31739
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4lox9Il"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC21DC433C8
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 19:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701114259;
	bh=mLQP3/9Xgj1SjxfYNS1lvo7g+/U5mrEc/FHUqHWEYJU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E4lox9IlxXEfy9mSzvzaguBg4fzPAUvOYzRbfIa0qG5Tw6cS0HrAsnJEDnQFYwRxe
	 5UCSSvn+p/BT/6eyGX4MgFNsgNfU6wCXOSNDo8Ioy21NOywy1Ie/2tcZ64am0sC+if
	 EcA20DTZI+pjPYZNVc/pPD0zznP+W4eh83GYrdbc0pZJ2bfATgt33weUcLYS9SQVQ+
	 Pc5BK9LgroAgleSUaGvIWsmCyWGZUPaIxYVu4eL/ZpAa0t3EcndMYCBcyDHGsr3SSJ
	 QeL6RKLko7GBPStea6LOvO7KWJDIcPabJwT7mMkKaDRbFyZrj4YrkHAq6acaGXZnD3
	 NLFiXkspcik8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99662C4332E; Mon, 27 Nov 2023 19:44:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Mon, 27 Nov 2023 19:44:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-nBJRJ9Jij4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218188-215701@https.bugzilla.kernel.org/>
References: <bug-218188-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218188

--- Comment #18 from Alexis Belmonte (alexbelm48@gmail.com) ---
I also want to point out that I still have the
/sys/firmware/acpi/platform_profile bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

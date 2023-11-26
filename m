Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EA212E49
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 19:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjeHTqAt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE4C0C433C8
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 19:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701028466;
	bh=PS3+HgO5D89o0DePDc87J7Upoo1Zicc1yEBW5N/HyOs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FjeHTqAtzApEzUtXO/Yn/OUI3/qxIoqji9cU3NivlRbV5/f0XIxAtTFjW+IL+10kF
	 ie4Nur9L8sNTvao4xNP3rwa/0U7kgoD1QpfcYFiRS65KX7ssPArK8aVfdW+mppzUaU
	 oqzYGiAOt/VD20ORnv+4ceAnheOgGp48IyfNo2++VwzOFqWRLZXXMHxgC2JamGNLDU
	 7AjhJQ/uXkWZ51LLArOPQjX9A/3CgpDrAzulI6/S74XFCQ7Hzt8zNrYkyD1l9L9uT7
	 ZeZ17wWdF+1bz01pNiQPX/kxhyVuOPkhVh3WJep78R+Q4iFdHJJFJPqFq0JbtqUMHQ
	 UazvtXBDJklQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B05CCC4332E; Sun, 26 Nov 2023 19:54:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sun, 26 Nov 2023 19:54:26 +0000
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
Message-ID: <bug-218188-215701-tDm8jS2Wcz@https.bugzilla.kernel.org/>
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

--- Comment #14 from Alexis Belmonte (alexbelm48@gmail.com) ---
So this is definitely a problem in my local workspace and not an issue from
mainline.. I have no clue why but this isn't the focus of this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894F31739
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRUp5imO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6F57C433CA
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701114167;
	bh=fQsRMP27Fia8VX6f8xk+S0ibEy3yBJVkXHsa9eUvyNs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jRUp5imOBDM86Sc4yir2Ks4o6L5nLpPH/FV5PLctHJ6niLQUVgLHzwRUqNKyqAbZe
	 ChS6G8VN7hajoGlNj88WnmuIAKF8K0Cwr4el5DPiKlaK7S7e9kdQuyJrPPFA5m8kzB
	 Z4jWHk6E2RjELS/prd/oaOkV6u55MdWTNwQdc2p3YBpGX+R1oObxP/dtL+jSSrRtgu
	 W7brMH2CzJkeVMzMnXcLH/UMAjURpqwojOB5ITNdgzo+xd5YJXb/RHiqedmvk6vbQt
	 LBWV/3yS2SnMsBaa5EVciDSorFv8TWAVGDIbvlXWBM2pwxOW5d7uBYrCSveBisrzRc
	 g5rS9wmEMvI8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 977C8C4332E; Mon, 27 Nov 2023 19:42:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Mon, 27 Nov 2023 19:42:47 +0000
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
Message-ID: <bug-218188-215701-nGbq5R0lon@https.bugzilla.kernel.org/>
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

--- Comment #17 from Alexis Belmonte (alexbelm48@gmail.com) ---
That didn't help, but I noticed that I put acpi_osi=3D"Linuw"... and althou=
gh
there's no _OSI branches in my SSDT/DSDT tables, I just want to make sure t=
hat
this has a correct value.

I also noticed the PINCTRL_INTEL_PLATFORM .config option set to 'n' instead=
 of
'y', I'll also try that next and tell you if this helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

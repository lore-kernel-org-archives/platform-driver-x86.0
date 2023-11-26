Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57163EC2
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCjb3rHh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7242C433C8
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701015381;
	bh=NXs/iW8Q+VQ6iCzN81Kyhw4G3/KrIN5McZyiUuH5oa8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vCjb3rHh4Vwxw+t0XrxyH3hk8UfLd5Hvtf3SiMhI86ZD0MODdDMOSfLyQ8jSlWbLz
	 xe5Jaqgh9rWPaTMvFhu+OuOvfUo+aeNDinBkVJuGEmWedraMqYxVzHGfDijy3vbwdP
	 enknOtnY6xskQF5GADFWKTuJRAGgTycSQoHTkyHBs5iD3DlcGwUA0VYKWXg6C1QKe3
	 d0s/yGxykXDaPS9wiBVeN65NtdIg2th3TpfeLj4Jf4RmRQVY7W418lVvMO+G0TAk6E
	 oahueaz9Hl63K1Emx06j/cZBOFTtfBV0YWSIhSS2i88nXZJOktY3f+dC5PqpFu/I/Z
	 V9UmLY4LYBTqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C21AC4332E; Sun, 26 Nov 2023 16:16:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sun, 26 Nov 2023 16:16:21 +0000
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
Message-ID: <bug-218188-215701-P4OXMXa5aR@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alexis Belmonte (alexbelm48@gmail.com) ---
I also wanted to add that the /sys/firmware/acpi/platform_profile bug is not
reproducible on the mainline kernel without my hp-wmi patch, so there's
definitely something that needs to be done here as well.. :=C2=A7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

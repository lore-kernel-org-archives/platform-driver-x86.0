Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FAEE540
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Nov 2023 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdqMDcKx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B36A9C433C8
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Nov 2023 07:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701155834;
	bh=6ROZubIbMstj4IxzPKVO6GKNxlbUVNr9mkvRPtchRTw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EdqMDcKxuCqJOau0UHygSN+E1mK0CKKlewa8T5g74gcNypC9gKlVjAi8LE3Yh/+sD
	 FA1wI9rFY4CgMsuhhTRW1x9zjvGWwhDadpR+sIFxOI/BSOUvgZcx5PSgTFxXBAet1I
	 mh4Wa0jQHSNHUiNHNppAfRBKy26ykSlS59me7+JE6q8tvJ+fnXVg4sUPG54v7DJK8m
	 ELYmD9tvXZDk9TKwBWkBvVhck2ET8O8kQs1MxcElRGFxUsZKaLT1fjWGp6e0F5nnlS
	 l409VIQbGN12hgh/eUZcxodXR0lU7z6sPbYrDvh0OPQBLrCdTHqxy7F3E6/lnBVs35
	 sf6tQxTJmDmiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97221C4332E; Tue, 28 Nov 2023 07:17:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Tue, 28 Nov 2023 07:17:14 +0000
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
Message-ID: <bug-218188-215701-1v3jDq6BPJ@https.bugzilla.kernel.org/>
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

--- Comment #20 from Alexis Belmonte (alexbelm48@gmail.com) ---
Removing the acpi_osi parameter didn't help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

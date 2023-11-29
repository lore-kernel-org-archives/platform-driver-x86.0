Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E7134C1
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2023 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J3CuV8wI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E53AC433C8
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2023 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701250845;
	bh=Gc0N8oRBRlf7utvDwCXx6Wf/XT1dpm2ue0Hm6tE545Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=J3CuV8wIoT0Oundzs4yIzukk8uZhwcF8fzq+e7UDhsXEyN6O57NHHDzl2MHkfsBGs
	 KoWVXrVVIab9AWtu7NahCrzIy0gpsmAWgiUfr3KK87gt/yrZlQUeGo4wvCPRekjWg5
	 4FLJgQZ82dlX/oMmDAz6Vy9LgIWgGnhtOi6zc8rs7wzR2AfcwzyaxNafhw9otySjus
	 UouVbWCqsmzmNWzwkla0fDuSxHJZAuMq1VyQaymxDAX/WYi22r4RtBk4ljGwoy461J
	 uE+SFvhV5tnjeRwmh9vgcDoB8I75O2DBibLjOxTTrSmRczV+i5iEYICgQyRJAwdzIS
	 Vz2YuoEjGnaGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7BEEFC4332E; Wed, 29 Nov 2023 09:40:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Wed, 29 Nov 2023 09:40:45 +0000
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
Message-ID: <bug-218188-215701-EV1jyOfdj1@https.bugzilla.kernel.org/>
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

--- Comment #23 from Alexis Belmonte (alexbelm48@gmail.com) ---
I'll also integrate yours as well just in case, of course.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

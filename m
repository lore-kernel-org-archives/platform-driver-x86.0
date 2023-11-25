Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C862C86E
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 18:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fijp0MZq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2DACC433C9
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 18:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700936590;
	bh=lJkSSs4mn5v+naNRJ7OT+g2H93QygCfDZuFqpodIVvA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fijp0MZqvszbJldZih13wfPZe5LeM1C4cgf36utzwAlEYjpV22EuwHXztEFt8sRVT
	 2igASCMyMfFNYsayFTJ4Qc7d1ubUZgoxwqp3khGOjcNXK3gmYh1rVedwApJwSqRbhe
	 RBahC0KQc7VTf6+mWtr29DrnnwB06zZ7OSjbNBzGjkOvWRccTbpI3ZYJuSCZSCVaPf
	 y+2PsotGfhTvHQkcUQt8jjc1deOTl06RchVh62U939oOyBFNFO0LmiFlkqxfSZGN1E
	 x+0nhjPWMfRNwZl0+fS7yhYYEOw2Vz6FJrsWjBg1G6m7+2HUS1xzl5xzqzzeMRLWTy
	 tCsR74NZzzqfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A37FC53BCD; Sat, 25 Nov 2023 18:23:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 18:23:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-6MLSzMOFOd@https.bugzilla.kernel.org/>
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

--- Comment #5 from Armin Wolf (W_Armin@gmx.de) ---
Oops, i messed up the patch, one moment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

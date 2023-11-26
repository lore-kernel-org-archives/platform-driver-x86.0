Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538EE12E6F
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGqiL9HV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A207EC433C7
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Nov 2023 22:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701038971;
	bh=9au2skWaoqSJPgwZAp+OubCgF4epxQ7Vr4tean9EQLo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BGqiL9HVeXWf/8ev3tdJ7W5YlmPP2GND6dAX0S81xQMC0r9aE6NMMaLgZ1hLnZ2sr
	 LuN5N4AD1sUQydBYU0yir6y/ky0VXY6lmE79+NoXmTX+7UCb+4t8HR3QPNKzFmg9zb
	 9hd00br63KzkxXkG9jNe/jPWi1lFkRw6DRZKU8LqN+nHLkp253aMCqcLmcNJ7/uYYX
	 jmy/3YHgRA5C1xZecW3CCWByQ1wKwdnSFiI3TCBVTkQUL+r1MfQ6au0os+Y4mfFeh+
	 F5+st4vG0uOT4XknbHGXDlKVL1qo1+YP+b2KNTbwf0PxPyBGl+DYUl1sFLecAHd/gf
	 U6Uv2yFHkcr1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88F73C4332E; Sun, 26 Nov 2023 22:49:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sun, 26 Nov 2023 22:49:31 +0000
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
Message-ID: <bug-218188-215701-8MzNxGrt2N@https.bugzilla.kernel.org/>
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

--- Comment #16 from Alexis Belmonte (alexbelm48@gmail.com) ---
I don't think so, I've removed the WMI patch and I still observe the same i=
ssue
with my touchpad. I'll try to pull to a newer linux-next version with our
patches & recompile my kernel tomorrow and I'll tell you if this helps or n=
ot.

As for the driver freezing, this was caused by a hardware problem -- a bit =
of
cleaning, dusting and RAM reseating helped a lot. :]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

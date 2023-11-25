Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E6B9442
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 21:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJe3Krco"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4272C433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 21:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700948734;
	bh=lXKPcXyiLp5RZLLuvnc38cLdwIe24qhPE6YFOUB019s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tJe3KrcoUegx/e5CNMom7+riY3OP+WtpMEetTrJfK4i0jryypMgfa4OXKBH1XxCj9
	 TPKWWgvyp8DUQtSOQ0l9Frx/rRW7APba9ArXENsTbBcm1a1PaKE16DJJBf0UGKGxvx
	 KdIHnqojAPtJRpwlSqiQsMjs4EvZCy7AjMq4PF3AMgclByktacbAJRsQE6KChKemwS
	 aPpCq4vZKBlEGPWGhRi/yEjW6XUv8uYQ0dBG7ut6GjuKJXmW4RSy9e0o2o/HYx1bh6
	 a+rEqngQ/VgNGn+CQjc20/+ogBRbnJI9VHkQCijXHJHqI5Eu2c2LDr0A5By5q46D7k
	 5ZeVtueCrcZPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CD671C53BD0; Sat, 25 Nov 2023 21:45:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 21:45:34 +0000
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
Message-ID: <bug-218188-215701-eqKYJhGasN@https.bugzilla.kernel.org/>
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

--- Comment #9 from Armin Wolf (W_Armin@gmx.de) ---
What modules are currently loaded (output of lsmod)?
Since the WMI patch solves some of your problems, i will submit it upstream,
ok?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

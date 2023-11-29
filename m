Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387437D12
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2023 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkfYbbib"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ACC7C433CA
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Nov 2023 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701271363;
	bh=zWPr5e6d/Llj1CliVSkkG/rRImFbtlYheOb5gK5wRpo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IkfYbbibTJywQpLZ8vUeJscceUEv6jRu4nNZ0u4hFupobVOXbYZAmwUUGXiNubCXP
	 NUtFnBpwxwNw7Vl1qGVzFwSGW2USaaEIq6xNGcWzBS4TpJ+ymnVMIS5T3CmQvD2Xaw
	 +PE/+DEgoi9lD9AZ1GW253IcCRmxod0plPryTxIB7TqjYhiMWt3I43GqiEPEPUEtRQ
	 vAo6o1n66tljIp7FA8rBetUXblpn+jPXN5vcI5WzdncKxS/jtAzyaEkK2a6+BxZYOB
	 p2x2P30mO7W+CuhH1R7EMFBf3d/mEtVIbzt2NY1tulhYzmQZBiCYBhTZ7nIyLWm+FH
	 Tr7dALmMLlokw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DE998C4332E; Wed, 29 Nov 2023 15:22:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Wed, 29 Nov 2023 15:22:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218188-215701-PNfbUH8qGe@https.bugzilla.kernel.org/>
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

Alexis Belmonte (alexbelm48@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #24 from Alexis Belmonte (alexbelm48@gmail.com) ---
Seems to work fine with our patches on mainline, so I guess I'll stay on th=
is
for now. As there's no more errors regarding this module, I'll close this b=
ug
report;

Thanks for your help and your time, I appreciate it!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

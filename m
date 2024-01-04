Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2D62CCAD
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 22:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvWGv6n8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A53DCC433C7
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jan 2024 22:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704408507;
	bh=N3nbCjndzbezTDoc13CKayJmFvHWbr3WbEV9ap4pA2g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EvWGv6n8KQ2Eq590vMfX9vX7vAeH+IpP/3y9B2q5mACFhNENHpQK4HzRhetzxHykM
	 jy2YV/7GoDOdEJP4ehy4wtyrZ2VRURiwVHpdwoKgUcKPpKwVH7/440kQBrWk2LdbEf
	 taTCmQkf6tjFfAyvbYjA1HazGLwwaV+LcHujuleMHYl2ixADjw2mO9tci1hccPIgxq
	 36Xv/b1uHlFrHQNS71YirVBlh5C2xR+j88LpiT+IYberviSYy5s7ZXZKMmydcbEVTS
	 Ph8CD6LO8fn4pjE7LtwMeLQfvxbc4OOtgONNCgPfatEJsP17tWFe+B79sG8qBZE/MS
	 T6bZAziGpaXWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95B9BC53BD2; Thu,  4 Jan 2024 22:48:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Thu, 04 Jan 2024 22:48:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: zemerdon@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-uucuhI7X1F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

zemerdon@hotmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zemerdon@hotmail.com

--- Comment #333 from zemerdon@hotmail.com ---
Created attachment 305675
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305675&action=3Dedit
no T_SENSOR for ASUS WS X299 SAGE/10 DSDT.dsl

       Product Name: WS X299 SAGE/10G
        Version: Rev 1.xx

Good morning,

I have a single thermistor attached to the T_SENSOR on the motherboard which
shows up in the BIOS no problem.  Is there a way to get this to show up in
lm-sensors or possibly provide information to help development to add this
sensor ?

I have also added "GRUB_CMDLINE_LINUX=3D"acpi_enforce_resources=3Dlax" with=
 no
changes.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

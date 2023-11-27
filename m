Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F78B31739
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hveh10aq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BE07C433C7
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 19:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701114287;
	bh=OpLD+FQHGm2YwJWmnBCX+bQpPPVA5l9aQhWQMu9H4PE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hveh10aqg1XZonGPwvKjj0IaOttWXLzLAVCJrxOE/glMel5BYagOmikHc+/5xl0Wl
	 4YQdfG2cU2D6j20fWmDNn/A0oZYHATo3WCQWDidJgGG044pfR/cU3tiF9v563j+tgL
	 /O4356WcOjcmF7TKMIswd5Ky9Knm8BvK6nZJZ93ZThYOrouajvGiguRSpjzXBdl4bC
	 vkDXuhMru26FghRYwwbInmHl9H/gNujAVBmHnXpJ5pWOdDw1/SClBqJpaTQdvPBqJs
	 y0fpg9OBfX0TCX3a3KwtPdycdGYjP/KcuFPlbUQWpguXg+NjYoqn0+Eo/zENzQ3r07
	 WUlETItlyJuRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6994AC4332E; Mon, 27 Nov 2023 19:44:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Mon, 27 Nov 2023 19:44:47 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218188-215701-bpDMapVodF@https.bugzilla.kernel.org/>
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
     Kernel Version|6.6.2-arch1-1               |6.7.0-rc2-next-20231127-008
                   |                            |86-g24ce78c0188c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

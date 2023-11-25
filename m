Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E54B2EB00
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 19:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FShEQ6r8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F132C433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700941871;
	bh=l4zV68+ZXm2nS9xJ+DcMgXBPGBdDhdGPqO4dHZEJLiI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FShEQ6r8Ckcy5bSHcupBo8Z+lDodZcGNBx+hLx9+SzpCX+TEEe6obycYT9A74YUuW
	 IURE+KWK78DXNq1S9jB9QcbW5poF6EzPwSimMyLx2vmBKi0VWNtqWzEJ4/5hiRBpFr
	 X4tHCbwXLvry6JWWtITuD81ndeUMHHaUN8TKFrapCf3kDCWPhHiHZKGKCOaM2TUTAD
	 fHG2ROMRlsCR+7Q1k/l8ur9EIhbRJlh0nmF7/xoHzQt5vC5YYKHEORB7FegkYOZaZR
	 ksaXIQ4Yb4dN2ixIfRtZaVgBi0PJoJRuTVtZTEhdO10Y9gtuYlZkvDKt7BN3uhQHpS
	 rEnZFB5GNnorQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F3151C4332E; Sat, 25 Nov 2023 19:51:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 19:51:10 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218188-215701-6iE3qNXiUA@https.bugzilla.kernel.org/>
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

--- Comment #8 from Alexis Belmonte (alexbelm48@gmail.com) ---
Created attachment 305472
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305472&action=3Dedit
dmesg logs after wmi fix

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

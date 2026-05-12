Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AF135B644
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617369; cv=none; b=pYeBf3SChDiWyv1njHn65Fq3QocmfryvQ1zPxVPdKItNddzjWJaXN++nyxlamS5fmfPRwmVugOsTXTwtG9ljAKjl3tAqDD+jzeF3HyQn4Y4SzcjYvXEfFNGwvOGQ8h5wNDNKhtZ+eYei5PBXFDh8P4vnA8OSof47GCAyhQO4vyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617369; c=relaxed/simple;
	bh=np0mbylZCNigHYNlVKeEHVMig6gIlWNd52ilxq2x8ZQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vy6YmOpHqDyPRgHzQ82gSGQyEyydIr82gg/JcpBa7cuL3TmfOXEKQQlCAivBTuuIDHSXejYOxgy1CSax3W+Z8J5Ga2OLqK5zc7HuCYeftlkXk87JauN995HzekX765CHpSbuKPY7r/dktKOxJ7CPHpSAmhumwfJ+r96xiD2O42Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qP7y3vWR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qP7y3vWR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CF75C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617369;
	bh=np0mbylZCNigHYNlVKeEHVMig6gIlWNd52ilxq2x8ZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qP7y3vWRHEypaFocwGdYESmr1a+ruj0oDqL4f6pqTRIPtoP7p4+9qCgnuEnN2Y/7m
	 rDZzhpoPyyK0q88e/3AYUyAjbfKiN7sNI3IxLKyEdxdZv8edATTFAWEpR7whR1+qcZ
	 1Xk4j74zkIY7FAk//vfaTQIZwRj234UAyvI1Jq1d87Ithe8fKkBn5i61eTJQ/CIKbC
	 yCa4OCU12xqVUFQ5auGxxV1vAytM2RW2WtL63TApwzgMrEwNlyLGT42Zu7XTKmu7z+
	 hVdKLBVo7I+ipf4CjmbdjpFOFRq2Wml+WOCK7JmvC6uQaJjNrAtngIxlMeVOrUErFE
	 JiCSao0aTf/FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 57C45C3279F; Tue, 12 May 2026 20:22:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 12 May 2026 20:22:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221430-215701-I8isIQvesr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #9 from floquimaurice@gmail.com ---
Hi Hans,

To answer your question: The BIOS is set to Hybrid Graphics (Optimus). The =
eDP
panel is driven directly by the Intel GPU.

You are right about the anomalous 192000 max_brightness on intel_backlight.=
 I
have gathered the full dmesg (drm.debug=3D0xe) and the i915_vbt dump.

I will open a bug report with the Intel DRM team on GitLab and link this th=
read
there.

Thanks for your help and for pointing me in the right direction!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A543613BC0B
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712677875; cv=none; b=aA+6UhtV5bXWxhBZOEy5CCETh1IdE4VxIhONDvyKDsiuk0aiFh6lCyfSnYTGgsHWqRJh7vCG/U27Wz3n4AxG2S824zaSeKiJ6FRJTzwNxOv29KW/LiY2FvGYJfY0//a5kBTgepo8yPIVj5d8kwHcv5dPY7Yc4mXAukuUyryPKDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712677875; c=relaxed/simple;
	bh=KYlQmiTnjUuHDdFslC7sh+vzVuDWpH6YGxVPRgGIWRc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GENuCZyZh8vJVcdmNi83+5laCavw7j0mc3WKXrtUWQBd/gXjHb/hR3St7A+1q2XW4N42G2CT1JLAhSh0yk9r8gFkH77u35r5bBE8AxfrACMgR3vsy6wutnb7K1T8yh3R/SKgdpIkczz6IMV6VVat/3tBCg7kZUPjzcw6/KYiTVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh7M+bqo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh7M+bqo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44590C433F1
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712677875;
	bh=KYlQmiTnjUuHDdFslC7sh+vzVuDWpH6YGxVPRgGIWRc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Mh7M+bqoqYpLEWr4Rd9kTkkPWE6vvJIJfoK3xaumeuEs9ry3LApReDkvnKMhwX6B0
	 SDzj2EOMBllcibdXjFrPReZ27pjJyXXZipii0cBJkTel/MsI4BtnLD2/2+/92So7GT
	 BgcTETuEMo1xe9LS/PmA19NV6NqcPu3QErUTR3H3PtyVboEtNNakgxW9G/LgPvhli1
	 sIy7uWT3U7r/iIxj+wBkx1rXu3atkpNGNjnaW3si7m9tNzMRAHqq9hQgApVcjNrJt6
	 IZDGEtLNuAYLSY9mlYwmtKJ3ka/H9e0z68DERDTO/BbYfhdNV2A9FlKoks0ak0Yz5W
	 5y5X9c41mfp3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3CCF4C4332E; Tue,  9 Apr 2024 15:51:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Tue, 09 Apr 2024 15:51:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-9Uld88Wtmb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #9 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you please share a log with dynamic debug turned on for amd-pmf?  You c=
an
rmmod/modprobe it if you want rather than a full boot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

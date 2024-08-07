Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604391D1743
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723023410; cv=none; b=HbnmsMdF/4Ivzuzp4Sqyr27s6lD3I6NRiBfYapCmIHE+XlwxLZJjZ1XB2Etu+HfddDCAHjlX4l8FOIAwz+YeE+mebZKqK4M/eY6kaf2SKtLZ6UJKhS8FG5eUKndFRVryRqMdGeVMrcVGySDjSwgmkBEt+ehcGyNf2fTk7OBcDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723023410; c=relaxed/simple;
	bh=Rfv3qepVnRqn4tmv15T29U6KDoT3FG1Lo4eNj6Mm7JQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jeaEhzO/9pv0lMgGVZnfAlVjU7hXZ51tzDFzFq1wYrRiITssVn5ixTHyvnpljX7lV3L054NtOFgKvzUl49/la/notao5QnMicT6KzKYsj65G8r7hE9YMkzoradSqMZI/wm9nh1FXllUCsmxmkH4YW9sNBkINElR3PIvv1txXfzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rHXKlc7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rHXKlc7E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C8D6C32782
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723023410;
	bh=Rfv3qepVnRqn4tmv15T29U6KDoT3FG1Lo4eNj6Mm7JQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rHXKlc7ERIeUAZeIUU0anRJ9o3JyIsK5JAr1Nyx6PMVP8vEBXsgJ2J35dhVW/se2R
	 l+3kD+oKI1lgCitkA60IPEqkMhGWD3u/N4q//3i1KJ2+2GCS122twoUjjwltFJ6WCF
	 spMakCftLbGkzehYF0wYktmVb5N4aBKeeuOZpHC+L20w/ZwR+5Hp3e4oCW0eAr2mUh
	 HQWWfqEfj/N9cBmwvOZWi68MHr6nnnptuTXzmL+48hPFRXJ6Nvk/VGm23FfL3Zz1Ba
	 pfc8bhbBO6/aOLjVxkxVUW+eaevSHqBgSNkXAWVPb5IN4i62+o7daYPNtBfB7dExR6
	 z647yCMaFNRtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 05027C53B73; Wed,  7 Aug 2024 09:36:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Wed, 07 Aug 2024 09:36:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: blunted.tip@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218863-215701-UmBnKFrZXu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

blunted.tip@proton.me changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |blunted.tip@proton.me

--- Comment #27 from blunted.tip@proton.me ---
I have encountered the same bug:
- HP Elitebook 845 G10 7840U
- Linux version 6.10.2-061002-generic (ubuntu upstream kernel build)


Here are relevant amd-pmf logs:
kernel: amd-pmf AMDI0102:00: Policy Binary size: 6672 bytes
kernel: amd-pmf AMDI0102:00: ta invoke cmd init failed err: 60005
kernel: amd-pmf AMDI0102:00: registered PMF device successfully
kernel: amd-pmf AMDI0102:00: Sending heartbeat to SBIOS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

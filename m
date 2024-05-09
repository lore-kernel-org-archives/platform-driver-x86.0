Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E3614884B
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 May 2024 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715240952; cv=none; b=tEGPx564u2QIdBgHSCbQW0frueNd0sgfATtQRqMIeHEVU+W5gDdtkubGswBUGl57zDF7LA1RnFDrB7OmIkvbfFkOjpsFS/R8HXO3n3Ot/5LdEqDTiZe+H3D5rR8p0IYpuMF8HzHTzqlwRoqf9DqYu7bzhk/EvzqhhQwN2IHHmdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715240952; c=relaxed/simple;
	bh=tdG5wEZayd8yBbR6l6np0CcdKvDYEbHzxKwxRWTThhs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ncKb6/ElX16XFMd9xHj2leSbx+78ddiit+ciO672YTzVd9IsF8PMUKHvt+QSRKD4/j3jwNcWI3sEuvGg9Kg9huEGC5m+8jePx4mFSWDs+AU721fqXy7AbjmwxniVdMMOBVDgdhYXEVsRFLiROeIXmUMVRJixY7whte5dWxjGzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riLXbFAo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riLXbFAo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47CB6C3277B
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 May 2024 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715240952;
	bh=tdG5wEZayd8yBbR6l6np0CcdKvDYEbHzxKwxRWTThhs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=riLXbFAomDbjGABdHtX66O4uIbsRNrgf8pvfUhmVMFXXQRVr4Jh3I6io6q+0UmRPM
	 n3J7QNlqmv4xN6PMG/uMPTo7reTTq5rM9OfVZeqjj/oLw5QNO8+zd8pefKtmZjLzPN
	 KV27RID25VV+IQuNZmAdxXXwxK8LUIINTN5ynZwKjtTSbnUcg5jSr8vj/uraoaHpZQ
	 7W//PlJOR+96NoccOg8UWADd5t+JCLRVz34MLbhuENdq41yeHJWWNU16UoHeWQO79d
	 3e1md1CyV3LunY7gPsgGLe83Sd0sjKhJYJpX93Lg2pGZijkxqhOrrCRL1ODaRt9kXa
	 D9Lpb0u8CfFkg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 391BBC53B70; Thu,  9 May 2024 07:49:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 09 May 2024 07:49:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: darkbasic@linuxsystems.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-yS8Yb7R8Ly@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #66 from darkbasic (darkbasic@linuxsystems.it) ---
> Especially paired with the fact that different adapters don't trigger it I
> stand by this being an EC issue as the EC controls the throttling behavio=
r.

What does EC stand for?

Might this
(https://h30434.www3.hp.com/t5/Business-Notebooks/HP-Elitebook-865-G10-w-AM=
D-Ryzen-9-PRO-7940HS-cannot-sustain/m-p/9061799)
be related?

What's weird is that it only happens when I'm using the external monitors
plugged into the dock, but I don't have any problem if I'm just using the
dock's ethernet adapter or USB hub.

> I suggest you guys raise with HP and point them at this issue.

Easier said that done: they don't care about Linux via the official support
channels.
I'm sure there is someone who cares because they distribute updates via LVFS
and they even sold Linux laptops like the HP Dev One but I have no idea how=
 to
reach whoever could be interested to fix this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

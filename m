Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F3949F121
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275377; cv=none; b=m46DSZc5QmPYl50ngm+hukhHuGXhxUxP4V1uQsQ6dveu3hpK8elhGYXMTMX37Rl6jFkUf2Z2hlXIILKdDyrJQV2LFMU30x5kJvZ8QDkjNfwBDhD1AnbzrizMV7yhmUFW/QafcCSviuOlee79gBRdARzVV51vcRTKJF/bCrdz5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275377; c=relaxed/simple;
	bh=bTqZLhRmKvBZGS2+D7kaJF+/agwS2Xk1OPXkJF6vSIA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CgZu96uW8GXSgp4Sfc+BhJ7FViUuTRGCb5qfN+bDcaPOvzSBnL2E5/BA2yuDI9gE9ShK35ibnzP8iHigLEidIjreJ8VjplOc2IyuNoGchHRz48Tb+ORbgrNpprHAiGaz0WWuU4/sU3WAHCgAR728ci1WzT0NUcYb/896pNxIZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBSAvs/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBSAvs/s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26D6FC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790275376;
	bh=bTqZLhRmKvBZGS2+D7kaJF+/agwS2Xk1OPXkJF6vSIA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gBSAvs/sQPbwqebjSORogF+S10MYBuQqLwGRO2L7TuwOkyv7FXhfFamcBfvZ5DiAZ
	 zUO2neUnDl/onIYoqXXfbI+mKpp2oUi+YSoFK8MCPTQR6CAP0+fMOIoIizK3niUQDr
	 xDpz9nCVg3UendhO2kJRVP2rhjIGwK2lh7z6TFYuolmnQt+VqzWS1/2DMSxkRnyX7t
	 mDM+hasGDBCYo8rO1gwZUJSzUpXrHAY8QNGKBcXUgbGfvzzWcu6DjTnnce0Z5+mkAY
	 Ef17sZ0p5/DqLqL+r0+k8Jnm5KgE5+JUmApMeEeZJlui8g4QVH+gGMrLBEyFK72Lgc
	 +XLVdAPa+a4HA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14B1FC41612; Thu, 24 Sep 2026 18:42:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Thu, 24 Sep 2026 18:42:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-M7z4J9lLPf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #1 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi,

hp-wmi does not handle LED behaviour on these devices, as far as I know, the
mute/mic-mute LEDs are generally handled by the sound drivers instead.

In any case, I've CC'd Zhang Heng, who may be able to confirm whether this =
can
be handled by the sound drivers.

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

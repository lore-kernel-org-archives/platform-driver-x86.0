Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F341DA2A
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 01:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705888404; cv=none; b=XnHGkvxAGecu6M18A7gTvHFE66rhmfnySl/idGkviyGPGphHt0Q4GgW41wYYiyr9/jAoHno3MNinoeljlh9EhCSO5kNSSsAau0vx+BdaXiI3afZx7hkh89x/FYyr4gc66clFt+DLYaqpzxK2sB8SQqxUdLnCi7VgRTeb5YjZLyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705888404; c=relaxed/simple;
	bh=nQT1J71GcEF2a9xpeTdzRTbl4SIMUoIb/siO9uuWN5Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VAwXlo3AzqZ5rh93t3pYl6oZS0Cvdit9yTn+qr0lbUAPwoYEUUd0Hdh0vOEoxMToMyKVad0Y824BRk5CWrN3K1N21J8Qir9ouJz2Rm2K512IUugSIw7VfXAftXxzF1Zwd9Y+OwdudbxTcQjcqbu8jdosQdI4hZ5HWX99Hg+mt1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBLmS20J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBLmS20J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65468C43390
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 01:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705888403;
	bh=nQT1J71GcEF2a9xpeTdzRTbl4SIMUoIb/siO9uuWN5Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DBLmS20JG7rtKcdR1DLjpMwpR0LJFXavbxHTmZOeAuZXzE+aOFVt+1hJKOmar+MtH
	 NlyJvz2Ug6OKCKfiUowFAqXetVycDRaOMAfXRMRl+HS8Rsbv+9x+NY2wMvVlYrDcis
	 btih1I5CQrf4d27w+zEPLpha1fgjkpoMtI7Uajht9vy48RPN6YnUwQk96QgmtkiwqR
	 geO3lUZHX4zaPtgS8aPZVdn3xVeJoXQh77MPglH58r82fh39CKTP5Fm+GuVLMaGL3M
	 2dr9YQBP3dCFuOiTOYbThyubu1ip09X58eDfGtBx1JSbRoNPli5o5x2lDnOtP2aJ7j
	 HBoAk92im7f2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49430C4332E; Mon, 22 Jan 2024 01:53:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Mon, 22 Jan 2024 01:53:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: dan.martins@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-v5jwX1guqD@https.bugzilla.kernel.org/>
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

--- Comment #23 from Dan Martins (dan.martins@zoho.com) ---
(In reply to Dan Martins from comment #21)
> (In reply to Mario Limonciello (AMD) from comment #19)
> > Can you please dump teh values from all of these MSR's from userspace w=
hile
> > in a reproduced state?

> In reproduced state, where all cores are stuck at ~544MHz, MSR_AMD_CPPC_R=
EQ
> values appear to have wrapped around?

Ignore comment about values wrapping around, it appears the upper byte is s=
et
when I adjust PPD from performance (0x00) to balanced (0x80) and powersave
(0xFF). I must have adjusted this between reboots.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

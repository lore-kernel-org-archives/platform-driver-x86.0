Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A10435ABD
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 13:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950817; cv=none; b=Y44ZgSd2evhEoA3xny/ovdy+1+5xTAV3o0CqgGip9Rpca+NG56fEl/+z6b8m3SADz4G0apGup2uV7YA27gLNscbdCV1X8MrcFBeKlVl8Eihuctj1ieIpgLzXqpL5vz7HjKUtAcNaO/MjXLHJN0N43j8jOYLGWee4VF6chkRjKiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950817; c=relaxed/simple;
	bh=tJ2xogKAT5wdSaND1pBKvKxZEaLUqgDa4zAQzvyrEQU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nP2zCzXwWobQHSr79wVvs0rgdAi7yRPtaIknXDd9HIz4Tba2rOfF3GZkIwVAatjgkT2LoLprxt7SAepLMjoZ71sACJL+X2z9DT9pFvx1Yn0H0gyGcsHrJJ1g3AI1pA0Z0FXVjcd84ABK3lbOR+v93TT/Ijuxk9iEZiaSlConPAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJPAfG4/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJPAfG4/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70604C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783950817;
	bh=tJ2xogKAT5wdSaND1pBKvKxZEaLUqgDa4zAQzvyrEQU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EJPAfG4/YJI2yExQTSD5m1dnoYPO9tmuuCysNqARj1ipryrJDD0SZnsEzkisMjFHV
	 XNXqF1HF1EiR2Jgk1ZidnxncE/clrsXwUDva8GcxVepb5Lx7hpMdtiMZaDRLgX4F9g
	 vAlNk+CO7mhu5AvAL5O8RjLvLFiVPkmkRikJR83Uu5T+aQgPrSO5bWl6y28+uT+48p
	 Rf7knRoR3iC/UNU6lavoIe1ChcJwZ0eTX1PY+A0jzAMjZMrESvJrcHcMAuxMWvNRG3
	 eBvhRt8ZYNcX1wjJMxFU76oTjvCMcFrE1exOEi4YbQzSr/EW5VIbOw3kckHAUp89AA
	 6u9DT54oE5piA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 61220C53BBF; Mon, 13 Jul 2026 13:53:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 13 Jul 2026 13:53:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-aID8dOmPCZ@https.bugzilla.kernel.org/>
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

--- Comment #155 from Artem S. Tashkinov (aros@gmx.com) ---
Don't kill the messenger please :-)

It wasn't even me who had run Claude on this issue.

Thank you for your swift reply!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

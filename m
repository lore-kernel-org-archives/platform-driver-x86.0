Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2653826056C
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519561; cv=none; b=cfB2Ze8p82qAzAIVP29Tl7i4LHHwD+QPk8yUfHXro0WGWl4y0visikludrYJMRweioj9BJDJnEK8lESwUs3/AFLgNNUZ/PmeqYULh6KEQoL4RJuMkd50SRF8TIpqLTHj1yHBjF5BQujZQEOZt2s9vFL0UN+uZ+ZdWeY/JA3NEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519561; c=relaxed/simple;
	bh=51AljdtsNh+DRhf92pOjEv0FnYAcjDnFJUWhkSzl+xI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A1kjPTFBBBxWzqsEBdvhrMjuCO07INN9hhfZ+Cb+3EKVw1MDcozzUHEcl8Yf9UA04FE5t4y1KG4+9gfkjNUJ5X8aT8Ln6AhMaBauCDkZ+sDozhylS8aD2AbQfZVfyGAe9L5YzWD7xgHMhEMqMDJzY18iVBKQ5/9R1itjvSyJlJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdiUopNJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdiUopNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF221C19424
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776519560;
	bh=51AljdtsNh+DRhf92pOjEv0FnYAcjDnFJUWhkSzl+xI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gdiUopNJii9GfG3WMAluwG6aRfhGYUeNNitVhqqilFxow3cQ8Y2Zk7O2Q7n3YhOqG
	 5/mn7NOTHPwFtF0ctTsoOtJZBzjhGbfjLQw2d8ZAJ761Pcnb/j2G37b8PxlUDqLlPj
	 fRFZqxVp/GOd7/6YtoNCcn5N/1MP1Z1pYkAxuuuxOi3L2cvjwqpJcErLKRddn7PBUy
	 tZzgatFgn3Iis1casc59YWaedhskIxJLzouLfGdM61Wzp1v5AR/Fn2G5+wPPxEGlQY
	 Sojgc+f2pexFoFhBGya+QN9aI7ikyMasiWKyp8MsRaE2ClSo9nHulQjvsAyuEYtlQB
	 ZtJkk0mH7Uucg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9FE2C433E1; Sat, 18 Apr 2026 13:39:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 18 Apr 2026 13:39:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-d2vHtcYRtW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #1 from sindrehenriksen93@gmail.com ---
Created attachment 309896
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309896&action=3Dedit
dmesg spanning broken (post-resume) state

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

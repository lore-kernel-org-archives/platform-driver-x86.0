Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313D29B77E
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685246; cv=none; b=qI8wwWVOW6gboOK01G/Ax32fDPElzWnirjnEwcgc1XqjaEMuXZXu02ThKLt3wFbxN2jH8O3cpDNR/hBTdvd1Jkeyd5JjbAgXW847sfiHynS/84qOejXrhlPTYyVtKpKyEcTRLTomV7hWrUjY022+Vf4AmzaHQarrajXoGdPpq8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685246; c=relaxed/simple;
	bh=kS08GOCm/0f+tUnU3oqjaghpO51ll/Prc/8egcDd3Iw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sVP+blpogsf8EZngliUHijhKR3EHZDsQxyiBboPs7GTDSQqAjwU4fKD8XzqDIApz3/OOPK12mjuCW2/D1Ptu0B5SCPU66v048BQvM+Jh92RgJAb6vYcgmTDX2oqWVs9/zEAZBTA+kArvC3jOemw9EwzJKM31CqQnUMtKBSIn45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNooafQE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNooafQE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B44C8C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780685245;
	bh=kS08GOCm/0f+tUnU3oqjaghpO51ll/Prc/8egcDd3Iw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gNooafQEZrgI/tm7yUBasvyADB2VEN0XdUsEWyOb3AMzkFTN5PJCR4yQg8M8vdbSq
	 yVu3YKlQ3pnRj/yksoUdXhJyFS7wZ9e1XA1AbH27bbhTj7N/hq/+8wsKDZQzHkRNz2
	 aGvCDUvFFoMVQX2NT66+iJPwx/KRTC1xs5Okrxt2erJPfXbAJD9Tf5b7cs6ZL8nrJ7
	 CNCrqN75F9/Y9yvMRVsH700oqu3HT/19fUxjhHo+aqPdkoIr8VMLLY1k5j4iQV3jai
	 jB1DdJ4PMIall+/OGiJiQfjvMihhbNX74WKX9yJaYYwqR7/TK4fgBvmEenZ1zkpUb8
	 x7zdX2RNzW2ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 975CDC3279F; Fri,  5 Jun 2026 18:47:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 18:47:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-kSE13nLtST@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #23 from Rong Zhang (i@rong.moe) ---
(In reply to George from comment #22)
> Thank you for the explanation and for your patience. I have attached
> (dump_off.txt,dump_low.txt,dump_high.txt and dmesg_ec.txt) I hope i did it
> correctly.

Thanks. It did seem that 0x2A controlled the keyboard backlight brightness.

> I did try the unmodified patch and from what i can see the GNOME Quick
> Settings panel correctly displays all three states (Off, Low, High) but
> dotes not change the brightness of they keyboard.

Given that neither my patch nor manually writing to 0x2A worked, I guess th=
e EC
needs an additional synchronization mechanism to really trigger a brightness
change from register writing.

> Pressing Fn + Space
> correctly triggers the OSD notification. i could upload a video if that's
> possible to show you what I can see. (is it possible to upload mp4?)

You don't need to upload a video. For now, I need the previous version of t=
he
DSDT code where "Off and Low worked physically and the OSD appeared" to fig=
ure
out what triggers the brightness change.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0AA3CE0BB
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469351; cv=none; b=Pqp8/Nc+VpffbEHLuAQJul8vPBUyyw7y3H1aPwKeYlGhdPdDXylBmHJ33k8NPlZY8QmzAo0VSelqW7PylixklN2NWtOE0gcVGCzbQHtvTOrFJFPEgu1AaqUa1A4R2uJdTjBpuVn+mVvqGDZ7CUSqG1QMAfuJHsUAHnh18QmEuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469351; c=relaxed/simple;
	bh=m+3upV+yCbhbpvW7kobxzDFSBVy189Zaz0mIu9sq+Xk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fqY4oSVA3nakrnTzqInACdEFt9oCf59ApxC7/PYJ1XkNSa8XWtSzIayHMNkZMss9rzl+MFQgSyBDJEEuMN6oryiEP6jvYir3N5zzVXjAMaAr1qSRIirkv7DB+MYFep00DJNdGIzO5/pZNxsQQkmH/kKkvXVXk6x1k6pmFdcwv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4Say7aP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4Say7aP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 963C8C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789469350;
	bh=m+3upV+yCbhbpvW7kobxzDFSBVy189Zaz0mIu9sq+Xk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d4Say7aP+YV/z9Cx5P7YtUsorW02ERYgyQuEAO9gNKgaleH5AuR5P29P0a556CiEE
	 JP9ZsfjGherufYMuO3lTHSX1ismYxWQ+9IMa0V2+fx1zBCxUY5v/CeG06D5V+P2VC6
	 f81JUJuG3VzUpTb+NEWXBbOsRHlQ0SfK0Sormk/QQBUhjZa5a2B9c9q6cNW06IRQw7
	 jrxuAZYwbr0Cz9+kY6cvBvZBh24t1Vg7X894a/NevjVqwIK0IGspcc3YlI1Faf6zxa
	 ThBOPEk5A1r3AS1BnNTvGlvN0ODphi1Vsd/31ITNcjgbkX6qglPkvsx3vzZPkUJel4
	 pLG/EZz99wGlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70057C3279F; Tue, 15 Sep 2026 10:49:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222002] [BUG] alienware-wmi: Missing support for Alienware 16
 Area-51 (AA16250) lighting controller (AW-ELC 187c:0551)
Date: Tue, 15 Sep 2026 10:49:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: adrienpantovich@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222002-215701-63ZS4zLyKW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222002-215701@https.bugzilla.kernel.org/>
References: <bug-222002-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222002

--- Comment #2 from adrienpantovich@gmail.com (adrienpantovich@gmail.com) -=
--
(In reply to Armin Wolf from comment #1)
> The alienware-wmi driver does not handle the HID device responsible for t=
he
> RGB effects. Can you check if your device is compatible with Windows Dyna=
mic
> Lighting? If yes then you can control the RGB lighting using the LampArray
> HID interface.

I am not running windows on my laptop at all, but I figured out a way to ch=
ange
all the RGB on it except for the keyboard which I'm still hung up on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

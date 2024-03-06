Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A50135A5B
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747185; cv=none; b=S7LviFUnU4c6pYJHvWrtlNEfhAsSYz4x08YIHnVknpxkzXO6tbQKBbz6Shk/jaeFNXjxg5LFvcaFTtxuHLdisMubUU4omy+iWpg08tlV53GlsV+QeQcOqvt9slmF5+kJ6ayhMfWOd3MA7nhNkd1AyWXCzS0ebTvCdFFS4y23Fy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747185; c=relaxed/simple;
	bh=VrFD2PqUkuEGtq7wWbt9QYYc4G6okjHhcSqZLJpiSKQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TC1nt4O44nViwRhOiOLkrXitM9SuPuii+xfdNvJ70joCFIKCI4PAPLW4u20X+/bGDKYBmGKhePrd9rmQhi5SdE9R4ZJ4bPk5C1hzUDW8ZzjfAwuLGh60EIlW+agseF9zDBCFbWIC20iWZLGGB61GIwlbPU3p1oate4ZlUD2oA4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRyhKaIx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRyhKaIx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A5D6C43390
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709747185;
	bh=VrFD2PqUkuEGtq7wWbt9QYYc4G6okjHhcSqZLJpiSKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kRyhKaIxMvq9QKL59ftQjcpJdaX74kTj83DPickrlYolHOj42oyX/szTuu21EiYpD
	 9ZPMyUM2fu4Rm5kMvqZX4XKTgNWetM8Kq9zRf4uhTBjew8Eu5WCui1Ty8EXgkBBmNT
	 3Rzftdu3f4Zetxs4ohzSsOUS3EJ5wMOXfbxg67FxlrZtKPqsEMZMNrmsPFKkol+Jph
	 3FwrkOV/iHv9bA+jxb2YUhugEsSI/Z3IFdNssSIGmHjQf9JJn/8lWhDJzrJt5ip3ty
	 WJlA6Egy0+HwF9IUYAVbtwVTHmmJNvNhP1p+suwEy9fh1fzCS9CprwldMlYSfn9Mtw
	 L7KWQz7sYQ+qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0180C4332E; Wed,  6 Mar 2024 17:46:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 17:46:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-Hlz4fV2dtu@https.bugzilla.kernel.org/>
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

--- Comment #32 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> cat current_power_limits

It looks like those don't change.

> While we have been discussing this, I've just found out that when this bug
> occurs, all I need to do is to unplug and that fixes everything.

Presumably you mean unplug OR replug (IE opposite of what you did in suspen=
d)
right?

> It's actually such a simple workaround, I will leave it up to you whether
> anything needs to be done to address it.

It's good you have that workaround.  I'd like to know if powerprofilesctl/a=
cpi
platform profile can also recover it.

If so; we might want to add an explicit code in the suspend/resume callback=
s to
rewrite the state if power adapter changed over suspend.  I think this woul=
d be
a safe solution for everyone.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

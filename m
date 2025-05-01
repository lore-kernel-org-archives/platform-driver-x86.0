Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0E40BF5
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086982; cv=none; b=dqUpXywMekdyr9Oaw/LVUjCZx1blbIV67EeqGYslUXUvLmW/PxItG0516VPmqgbjkvyxRvrwuDWL8slZ+ivQY/Pyzkk6VdiLOAj6eZGv2MhCqTgHcLi/FwWumlVItZRhw+DluTeFKRcGX8UkRaG0Bz5kPoN8bw4PwFmCxA/Uvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086982; c=relaxed/simple;
	bh=SerD5oBPTwJ/ft0asHLpr+9FHDZGGDyi9ClzE8ydXoY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z0T6W/0lHtUEXDRwgizibrVx7YYMuaSoV+7n9xvV0iTuteSLYr+CLOyHb/wjoQhK8CMYykEIvl7gt6rrYDXWsxQ+oTsmoKsNfBKxcU8U2XXMBoPA2eyCdDIA4i3dUOsJLKxXuKJzNAJ7qWDcFVnS3H3IMjJ5WxHuibTUg3mFwI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shkftrld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shkftrld"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A726C4CEE9
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 08:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746086980;
	bh=SerD5oBPTwJ/ft0asHLpr+9FHDZGGDyi9ClzE8ydXoY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=shkftrldM3RyCNqhG7tULgY2IHj+Ybd3cjR1Sq66QgtnL71JNfGJnNZ8HVGP9GtE0
	 CT6QW7NitRr6nAFAHi1tR+fhLDSwiJ4ZCwzMJgtomGDX4NhUoO5yYpuFeCA5fLcsvr
	 UFWt4B7WX+P1BPu2fgHvAg7OchTYYiKD1XrsxJt/r7EH18q8APrnjjt6VhHrZun6Kg
	 TrQ1Csy+fCcJTt0ejY2fr6IbfK6VYo2RPnD/mkVnO47KmrcFOhis+D7EzTwxpKoJQt
	 ampDGK1gxtQVbppD6UCLwCzT+o90TfAPMFhsYOdq/6ZZCzTuELjL20euULf+Jp+vN6
	 sGkzDcAKmvN2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 488ABC3279F; Thu,  1 May 2025 08:09:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 08:09:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bp@alien8.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc assigned_to
Message-ID: <bug-219786-215701-C6FhnJvHou@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

Borislav Petkov (bp@alien8.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bp@alien8.de
           Assignee|platform_x86_64@kernel-bugs |drivers_platform_x86@kernel
                   |.osdl.org                   |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

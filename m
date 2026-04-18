Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EB26056C
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519582; cv=none; b=LX6kAAf2az/hB8d/8J5kKSseoRaR9ur1MqHxw4MSu8mcqAeuQvOuosZgbj6nHyeF8wqIYe/M9K1YseVt/t124gikg/25dUDYy2LZbrfxjAQyewz9PC+qTupi9U9M9Slqu9ZAuF6CFd+pVe+Onxrd9tfd+jPU9vFphgrtWPezwMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519582; c=relaxed/simple;
	bh=WDzGXkzq0jec01UlQ2czM27Gs7Ve7M5RPOwzWNY7Gok=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lUIsI056+V9EXjnsPIpUt1SK9XvcI8PDGX67H1aqU6h/jxfOiuPKkfbMaY4Uiz6I0r3R/+/w/YnHccoctpBZsDCYpzizQukKaUwd/8BG4wtVMXQOR6QiUBztpdP12R31jS/NdifbXzHcqomEjTWY5QXW40ADwGwbNQmhYgSYBqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mR0XE0GD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mR0XE0GD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B62CC19424
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776519582;
	bh=WDzGXkzq0jec01UlQ2czM27Gs7Ve7M5RPOwzWNY7Gok=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mR0XE0GD4BG1jVWDjmYq2lJmtj4C1FIHlVRVYKz/gD0jKqJ6tU41H4ymbLldJhEOW
	 q2OrrGug7m5DD4FkqYGLMIJ8PxId7t88YWxJSLt2a3Dp/zG7aSGolVd0abemK9T4kb
	 Irrv2K7Nvz2xP92tGuJz1z8n9tvCPjsZUCGOZNv9Hhv56o0FvqeaQcM1z+B9bZBNGg
	 4koH7gPyhs83D+w3wJE3M9hWH1RTP3g9paqdwxK35jXlnNaQWwvsaygj4dICJbbSvT
	 lLZ6k1LfkUVckDJdBn7LckDmuVYym/fKDJIEzi6sI/F2TItgqHDb/pEO8KSk0fRSyq
	 p74QIFKZX5M8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45E66C3279F; Sat, 18 Apr 2026 13:39:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 18 Apr 2026 13:39:42 +0000
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
Message-ID: <bug-221383-215701-Tn13xItcMu@https.bugzilla.kernel.org/>
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

--- Comment #2 from sindrehenriksen93@gmail.com ---
Created attachment 309897
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309897&action=3Dedit
fn_lock sysfs value in working state

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

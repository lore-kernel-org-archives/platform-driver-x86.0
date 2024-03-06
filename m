Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECDB13BAF9
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709747449; cv=none; b=mw5ureZIcGmpmY2FtCgIxwaBZS1FCevzeVVuKsX6TnZuyQC/HquZsmCUwi9jp+TqB+mmd7QcinWEw4k0X4vCaM+kjMZKExKp3lmPfZC8eqEWs5gYEDXkSD2lA3xN8GI6lqlkRWqWV8QjrIpTxJ7Qt/bnkBhmYrZwr1Od7zuzFCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709747449; c=relaxed/simple;
	bh=oT651yDLwEaf8WLWIrCLiwfAs5gbiacO4ZMfJYtK7jo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BW+/kQN2DZgNTjwS5sfcDc3ugynDXvHarwFP4nCgoR9WnEloDC6boqygg0cPv2HH35Fovl6Qly3017kepKl61EVka6bKgUksliAc8zwpThfgxoQQesGlPo3JGSWr1emt4HzCiWQLExq5Sy69UwVN+8JQzRjzK5HnBBNqWVXDuDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcZ0ChjV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcZ0ChjV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BFD4C43390
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709747449;
	bh=oT651yDLwEaf8WLWIrCLiwfAs5gbiacO4ZMfJYtK7jo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lcZ0ChjVlBgaayn9AcWpJs20tPeVNO7PqgfkgK+NYiUDod1UKhb+yOsItwUWAF5q4
	 ODsG2vnwlfBeqpBVJ48Y16BroPhp9QFIrh7xpLxthXj8cZS+xzbVqj4ziqWgZliOak
	 uadpgiAi3ZQyHnTkcDFfBvuN/FNPlo752P9ZZ+crc7QLYI/ieZFhzLf/wTt1d/snyW
	 wSsB8cKDM6Mq2GK3D4OgBCXyQQ/TR79YLqfDZzaZlmAE8BTyj0HT8WPJyrEmq+XCJ7
	 HJ4oq0S7IbC7WjqHbYFLHoxuQgViYV3+77e0I1/xOw0MwV91Fi3o21skCaSUdr+z5L
	 +9InttEZKlhhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9C10C4332E; Wed,  6 Mar 2024 17:50:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 17:50:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-lm0vMepFp4@https.bugzilla.kernel.org/>
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

--- Comment #33 from Artem S. Tashkinov (aros@gmx.com) ---
> Presumably you mean unplug OR replug (IE opposite of what you did in susp=
end)
> right?

After unplugging it's already fixed. I do of course replug not to waste bat=
tery
power.

> If so; we might want to add an explicit code in the suspend/resume callba=
cks
> to rewrite the state if power adapter changed over suspend.  I think this
> would be a safe solution for everyone.

If only it doesn't break other systems. That sounds a tad scary to me. So f=
ar I
seem to have been the only affected person (not that many people seem to be
using HP business laptops with Linux).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

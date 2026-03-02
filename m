Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78748325727
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772437019; cv=none; b=GlhpYgmmPqrqGhzsn9Of5cqnQnqMpEeZFbe8V5F2+DZa+SR7W4cMjUHFtTnFhYtnHLQ2l6j1IzSls20dTBSTGEOCpHThyfmDK3boMwbGBAxSLrXY7jXEiw4XQYw7SlTPsA/cF73C99pynXFx6NENwuLLKmvNVLmp37Q7NsFIxMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772437019; c=relaxed/simple;
	bh=kdUgkvlHp/4WIKFj7rAINT7RgQLQjY+w7GA76tHDwDg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qn2LTVnY6sEIPwmZk/IPGZIlU1UFOOL6rRzQqy/g77crU5JOFc2YGr68ggZdYeA/ds3Ca/mwEJBUOAemWfzpWZsEROv+X2usjnjS4z6nSqkWLQz1shdDLp2dgonCgzJ6IQkxtt9NQnTrZxeFTQ0JhygtjGMp8psWThvAp4Pimos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdGWpvG4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdGWpvG4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24C22C19423
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 07:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772437019;
	bh=kdUgkvlHp/4WIKFj7rAINT7RgQLQjY+w7GA76tHDwDg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pdGWpvG4PCrc28AVlVA6M2s43ywoMqBTu86mI5+jU83qQf/iisViqxVwhtrwTcUCE
	 VCsPAfBUzqmQA9scX63hU3JvqCgLEnxELBWRY6fopU9hrEjWjwkcUh527A6UHFFwDS
	 awd174KKh8pcIh/791WPrqkQXoBYBSkyAOJTvrH7/hgDJut2vYj71wlCMgIUBTWeTt
	 SpVvJzOHjEg02Gvi6UtPBYYHxnZqUSIM0+v5Moa9lL1wa8i6ayABt4dKAoY97CD16D
	 Rl+baHIXu9G66334r5vU0SSgDm+ssF5V8BmmbkwxQ8e5m0mgY1UwRPiQHqQCLCjEjc
	 L//rQT9Kh74Bw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15B97C4160E; Mon,  2 Mar 2026 07:36:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Mon, 02 Mar 2026 07:36:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221150-215701-dnM2db2Oy8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

--- Comment #8 from Krishna Chomal (krishna.chomal108@gmail.com) ---
I have submitted the patch to the maintainers. You can track its progress a=
nd
the mailing list discussion here:
https://lore.kernel.org/platform-driver-x86/20260302073525.71037-1-krishna.=
chomal108@gmail.com/

Thank you for your help :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

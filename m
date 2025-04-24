Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912651F4174
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482366; cv=none; b=CxjEjxzXz2ndOGAA/QABsCIni8u/MweNY8OD9grrjW+XreRbuEdNC6q1knr+SYAYMK9LI4Ro2XJL7mFvOAa6dh7tAisvlKMRM++9eACwWcA1ucAwYhc1YTnI+H5rddpHDa6vdM9fi7n8Cakt+WnPwKCQsxeT6s4XJGcyXs4mMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482366; c=relaxed/simple;
	bh=ctbw+xooNjA0kXGe0Qfp1clX2QXIGdaZkvSgIYVBY0I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZCPEj2lq3c5opdE8o3xR3J/WaxfkkgEwRHQ1gM73wYulYFHC5jSeFwnz0qxpla6aJTDaDP9qhx4iQQ82IETVDkJtcxZQY8+Iwy33QnJ6qM9wsogwaEHASy0stM9EJ6dCpA+HuP2/w7R5nhLlEjCbjq/jTcaPhpC3uwhWrsZqS+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrMbA2I/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrMbA2I/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FC8DC4CEEC
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745482364;
	bh=ctbw+xooNjA0kXGe0Qfp1clX2QXIGdaZkvSgIYVBY0I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WrMbA2I/HEwQe6a0cCyMkQGwklYDpknqMaK2cNITQdi9o2thVTQDhAOR4Da6fv3Ha
	 WxROlz0BH6FYA1AuTikTHcv8bFsjaR7S6MSBQugiMI7dv7SqjRiThk8Th7GK8L2aiU
	 lvUjKHyHMFt0tqatT77Gj2tUwsVkEfvKIw02ljpgBMYdcd1Qs84E5P3+gWvhpotc/c
	 ynyUS0lWvKUVq82zkzHfDxc4qOJoGutm0yljuV+so9clXJm6pg4BOb1PTPMyZwojpB
	 vYLUNi+oZiGwCEd9D8a2agzq7jZs2FrQR2MRpOAo4QGbNBjrvkK+/mdBeWyrlqd5G3
	 Ucjn7NB7CuIhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F354EC41613; Thu, 24 Apr 2025 08:12:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 24 Apr 2025 08:12:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jameshogge@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-Cfa2rpWpjF@https.bugzilla.kernel.org/>
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

--- Comment #93 from James Hogge (jameshogge@gmail.com) ---
I've applied this patch to my kernel (v6.8.0) and it seems to have fixed the
issue on my Thinkpad also! Only been using it for a day but I can no longer
replicate the 400MHz and I haven't seen any negative side effects yet.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CE6198E99
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 07:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726732649; cv=none; b=BxQks0/9+A49eUvNsCej9bPVSAdExmHTe+D2M4ZVT3sDwKX9KLZgj8mIiX62JUgpoDglTrcSIX/fdBUwePY99McnTWqykF+dc7KTQ/7ZZrm6zMb00AHSB5JvF0fr3mIfscN+dEU/nT43OV9ffR767mn9olGo64aF0p1mPJV+Ns0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726732649; c=relaxed/simple;
	bh=L7ymQzBkoad4rlt6hoWU4Sv68Trx26MHyynC3hyaGb0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XL+AVytd+jTmKWfEZpKoLlJ6YtDK0NlJX6dhBlIJc5PONLphV+PCMOYU5PhJSK1zWt7KZKLHW8+/fdZHJx4KiGbvrUoP5SgVwNMFsfCXGAqwwewzv4jxK5QUg7kV2Bp6O/9T35KmOVw6vB/5m4dVrJ87U5WB/lf1B4x3X6A//oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FleGU5oZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FleGU5oZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78C87C4CED3
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726732649;
	bh=L7ymQzBkoad4rlt6hoWU4Sv68Trx26MHyynC3hyaGb0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FleGU5oZX4c/CJ8hmRSNNnut7WrLL1J5wvLzE1CYt6nO2t3p4JVksLgf3WNox4Cj8
	 ZyVPzs4fuvlRAVyaTQZuJ/VLjV2NMf72zCWeIsAX+Mcz6RgQ/I+3R1XC/u+KysQQZy
	 mKXYAULc3lkWDAv9LuPq4o0hd8xk0wRHfHgZgweg3JZCbj59+UTf1fhRh1tsI3hIU1
	 gYomStOjYFVxh+SjIcC2d6uLzWzSlPJ3y7JKRJQErMTn1cucYsvIEUqmxtYSXFHgSp
	 T4aqoneaKjvUf6m4EcGqeYO5SG4IMwwsyF4Wcsm+Tv87IjiUBbus97Tn7lUWcO6bNK
	 7jU4d62ztfb9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70FA9C53BB8; Thu, 19 Sep 2024 07:57:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 19 Sep 2024 07:57:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: vanoverloopdaan@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-IN2wk04kIA@https.bugzilla.kernel.org/>
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

--- Comment #74 from Daan Vanoverloop (vanoverloopdaan@gmail.com) ---
The issue seems to be resolved for me when running kernel 6.10.5 and firmwa=
re
(01.05.11 Rev.A), which can be installed from LVFS using fwupdmgr (or one of
the wrapper GUIs like GNOME Software).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

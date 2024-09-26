Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64371AB6CA
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Sep 2024 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347153; cv=none; b=Guhe7hj0J7j5vzmp0c//9YPpNnEE1mSZrD1yfIMK8WlP2R/jNL55cD6XXIKN/xI2X5iORq7WAJmZbn+9nUB1nN8wKnddeeRgV7PhwdvxynUl1KfbUbQDsqlZr1Pj9pQxHxvt2/yX/VD6TU5d+dBU5orVAdzMPSAyPjLWtZnyOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347153; c=relaxed/simple;
	bh=yh6R6DZeezcq6l4ZpGbk6mf55ol04jW9IqiUYpQ6PAQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uapm/Y1ixf5LJ1GrhTwT5YHvd/uwvscLa0T/3YNN7wQQ7jaKs50BFtHsarKTiEyIiO+NKyuxoLVxAweoeYXgPRsus/dH9eyDmMurqltvHuijd4c+6aaWdWkHJMIz9u5p9YiBnQxdnx1FnyyeABcFAUwEwAZiSpgbfja6y2DPDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7dO2mR/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7dO2mR/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62FEEC4CEC5
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Sep 2024 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727347152;
	bh=yh6R6DZeezcq6l4ZpGbk6mf55ol04jW9IqiUYpQ6PAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t7dO2mR/yfFKBNAm7zy0aC3fb9SK+MYQO8EeX8B/GVZSjgqdAq/ci16xcwz0EJ7pW
	 JUhn/ffwSIS5xqPRFFtl9bmTnkKdiD+NVHP21WinuHJ4Fz7G6SAQ6MhKSlaFKOcoeA
	 3HnJ1G7rXqe0CDw/HgPtmCzFTr9X76seZFh+PDMUXbNAWwSLpLa1KD6HQrsWYzTJct
	 xaAX/ZimGutyE0Xj82BOmjwz2keYNhM8tSDxS0xTDCuxR0UxWt1lKFpUlxRr7Mt5+k
	 rm8r+qe4LtrS5FbUnVbhZ8h69cEmN8wXN5P08IUbYDlF4LWaHTYZKuw2kF7pyNjhRz
	 awvoShRXFdp7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 574B5C53BC1; Thu, 26 Sep 2024 10:39:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Thu, 26 Sep 2024 10:39:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: shyam-sundar.s-k@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-MA2MpKalIp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #34 from Shyam Sundar S K (AMD) (shyam-sundar.s-k@amd.com) ---
I did attempt on multiple HP systems and could not reproduce this issue
in-house. After having a closer look at a policy binary, it is missing the
metadata required for ASP to process it and hence you see this error.

I am planning to push a newer TA Firmware next week. You can give it a try =
to
see if that addresses your problem. Else, you may have to file a ticket wit=
h HP
to get this sorted out.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

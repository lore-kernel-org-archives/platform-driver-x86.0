Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA122D8775
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749811214; cv=none; b=oN6qbjVn88iJEJRYo+1T9O1IQHM5iNcphJbi7oHxDMSWvMr/DPNvPA+7hS43dyoCpOiyr99Vt95G2ZmvhfTXaeQrUjm3sjEK+CEr6oZm7DYFCmje5EmY10aaHFW/uOeVnJVtfBKKd0woYuogVJpakiJyr8Zn4Qj0NKXvYUV18eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749811214; c=relaxed/simple;
	bh=rpqwhVydMrPStcidCMWu6FCitPz5meTjLgmFeHCYnRM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SYKcxq8TV07nAdd+7q9KjK7Kia6YaOnejYmK7B2kp4DMCW3du8cNLE3GzoWm6gG5Htx2+xjsrsb6VWZkze1+QQYh6nko11Zsst+sdTY9hjpyx3U2sSWPtu2v6sfD63fzYrWcK2xQaOaefyYMVeFONP42mVEDdH9tG+VE+8MAHik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOMyGwew; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOMyGwew"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BAA7C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749811214;
	bh=rpqwhVydMrPStcidCMWu6FCitPz5meTjLgmFeHCYnRM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gOMyGwew3aEk2eoj2YG6xXkdC3jNgc+NCCZKTlGMiLyrgFMiXxedUpDIYCTbJniJN
	 5pn7joWpbYg96QlujSEpi88vPY59a6wnSlzHAEgEJW9E0KLQymvJ93+JQRzBigAyOs
	 QM9woHUxHWsxv+P/6v6arBefSfwHehVWgJTJ3v95o1zlL2M2GXsY2OaEH3v5n1rpfs
	 DjeAKnVFXg0OcLAWqevD1mrV+sVqjfWWezVUrxHuIKTJpO4e4wRBdsM0sU1+x70fl5
	 RgQ6puutCbnCTv4w5wytpBnXTP+yxrICARxpk+Fy9v6PaQn24WIwR3wkZE0jVf9UB1
	 xSfNBzChE+nUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30FCFC41612; Fri, 13 Jun 2025 10:40:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 10:40:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-NIwUBaLYAm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #7 from g.molinaro@linuxmail.org ---
I haven't compiled the kernel from source since Slackware 14, so I may need=
 to
refresh my memory, but I'll try to get through those commits as soon as I c=
an.

I don't know what you mean for a "more complete dmesg", the file I attached=
 was
made using `sudo dmesg > dmesg.txt`, if you need something different, please
ask and I'll be happy to comply asap.

I'll fetch the output of `journactl -k -b-1` and the contents of pstore, as
well as any other info, after work. This is my only machine and I need it f=
or
my hob, so testing may take some time, sorry.

Thank you for the timely response.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

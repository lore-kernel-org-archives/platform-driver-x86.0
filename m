Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A7338382
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 May 2025 20:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303213; cv=none; b=NzS2ckdAzwWID46VlxSAxLO6kAAYEQdNck1WJ2IZrjQ6i2TnbFEVjOBDGQ/Yh3qDdesbMJidl+6XW2FsoKxL3ujKJ9QUOaZKWwEp9F6q79k7jACqjopUHGGE4mGiecdva4NPvrI/SOoa2rsRNU1dZ6TYAkC+3IpIOWxEatfgzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303213; c=relaxed/simple;
	bh=1q4JdqE6EON1bNyjpOIhKq7tv7WWCwemk09if9v2BQY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OJIf743L/AgryV3Eky36TNsaBMYQ2nE0//eohHK8nQnt4cdhBYwltiWvdax9EllJIgriOVC00DyxD2O44eL3I9JJYbrk8IJzXzQoLuTt8ECLklZuEH0ebfAqnMnyRR/pdI+8jdCjK3cf+8sXB47Sz1H8zUgP6BxX/Jj/iEsPKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3spDrUw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3spDrUw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96C75C4CEE3
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 May 2025 20:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746303212;
	bh=1q4JdqE6EON1bNyjpOIhKq7tv7WWCwemk09if9v2BQY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m3spDrUwW/lNrOT7mzs14zD9CNivxnwede5rYZB3T0NsG2QHVqK0FAmFw1za//hp9
	 idzjV8fDqY3WqUBlhIS6ZRURTAjlp0eNWRZ7qI3YFyz1qBOC/r2h1WLqOxvZnjNVb9
	 fJxNeNMLC8ZB8XNlQBA5C1lmC4OYO2LgHALWQ0lKKvIPt+NePNaWjtSAmCpOtPs2tw
	 XnnIhC5xyd88asMyxykMM/9ImtcrQq4xEzc9OFR2Z0XKCEE5oUd8ZK/FiJcEaUQKBH
	 8jTU3+p4cwQcWNfPRcPwrExyGeJNsQnrEFeGvjK2syY48gfOwRnPs0nI49u80kRjQA
	 mvmcqA2yAHW6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B817C41614; Sat,  3 May 2025 20:13:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Sat, 03 May 2025 20:13:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thisisianemail@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219786-215701-VZHuOgJDMP@https.bugzilla.kernel.org/>
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

Ian Su (thisisianemail@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |thisisianemail@gmail.com

--- Comment #17 from Ian Su (thisisianemail@gmail.com) ---
Tested on fedora 42, everything works beautifully. Thank you soooo much! By=
 the
way I didn't experience the toggle wifi bug on gnome, everything function
normally.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

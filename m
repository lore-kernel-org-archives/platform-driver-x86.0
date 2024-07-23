Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81555158A29
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721752401; cv=none; b=am37nIOVv2jbAkWaMlwszm4HXeXGv72zt9xjrCKiwk7wEiU9TetHwKtGGsdZjyP509hFg6f9xd2hMrtb5CN0RPRmn+3yZt40yShlxnQONtBTQ8P+lbN4JJYkFNQsqrLqqJnccu6YfUHZNWX3Zd0qW//aZ/0uCKHXnWT3xlBRhgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721752401; c=relaxed/simple;
	bh=rRohEIDCi+p1sqodYrzm9pIkRRwfgdqeut9noESa0QY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J2/Us6pIoBnHriiszzG6Ei0tiXNpeBss9pjB2Zs+/UwaKu4HKj6rm+LVyZEYZOSB0GBcSR7edo9qWb3QAr3KDFC2K0wFWW9jQjuEEchCBhxFRB2XSuWre8HDborIFFa//NfX4ihdcI8GwKRwv9eF0oazbPIGmq0C1JRhDWFF5xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaNATXCD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaNATXCD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 153CAC4AF09
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721752401;
	bh=rRohEIDCi+p1sqodYrzm9pIkRRwfgdqeut9noESa0QY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JaNATXCDG8yLcNbz87Dyk9/SwqDgustF1GTaLua9h2PAHJlWh76LQiVoE0yHmA/9k
	 1T043Q4OYd0FcRXr6pv5KwOpJnkLXOd6xk4DutH80U2Tv3zhbHILgD1ZH5fBnqvv6+
	 brwGhC8UMiH+TevjQdsE6cUHkAVdQQneeUPQo6kkrdPlM4/kSwuNZX38NRzvgr97iP
	 nPuCXiQgMoCGPVyfOKXaUH45UbRrkxm6wuIpKx3+6FAUHh9zcZFgI4yAEHri1bl8Pb
	 uPLoGJRXqNuChjU6SOF3vhfEgA3HVRPyAib8pKfttFQyjg01UrsDPpkfcSpJ7mjvXi
	 AezRRrm08w4rQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01532C53B50; Tue, 23 Jul 2024 16:33:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] amd-pmf AMDI0102:00: ta invoke cmd init failed err:
 60005
Date: Tue, 23 Jul 2024 16:33:20 +0000
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
Message-ID: <bug-218863-215701-CiEiL4Zsnz@https.bugzilla.kernel.org/>
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

--- Comment #26 from Shyam Sundar S K (AMD) (shyam-sundar.s-k@amd.com) ---
I don't think Windows PMF driver offers a way to dump the policy binary. You
will have to build a kernel to get to this point.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

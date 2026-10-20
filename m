Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792540182;
	b=b4uNj2EOS7P8p6Y/Qj371QqHq2jVdyLmD9T34JePUmfWGJ3fk2FtrN87lGnH9yqTo+Rf
	 vROODR0SdfZfgHczoXgtpMf4lcwEugylrA+PZrr9Zm6ajKAPxJMoBPKhS70rEfqyiiAI/
	 9PTBKkYsrmHrgmQ/OiL4RoJW+ZCx5qh9UId0ShmKS0LG6zZg0Bl98U4aNcgpDDcJEAcbS
	 9I9TVMFitPtJpbtUVjc6DahIcWMLxgz0He8A3/nrPwd5/Ylhy/jJy4y7O1EZaL/zqIUbL
	 oO3uDg0YPujZZ2tJBZCOP7y7TxQzoITJUWxr1js/vGTHPAqrw8aWJ87iUbYTstmE7TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540182;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=IDvziefrP0zds4E6K774QsqqrTGxrFHXzW20f9EWnis=;
	b=YwF2BGMj6/TZyH1Xw+pleOIGiJtNufKFXQlcCxDv6YKXcpkINRI0FpApbggnPefXmb97
	 diNU0YJ7zoVgVi66zC1xLcC0r+ACtyo2F4KmzrHMWvnO4U0Y5AxitUgdjUK3La36qx+JK
	 SY5yMc5m4yXVoB8JXjYUJpb5V9pmB0Fr4oRTFb56oEhiFINxWTe/viX+gcJ446Z+zt/vs
	 ZD+dZqQ/xZi7TM9VIuSq0Obfp1v4AfECZ/YqRCmTp2W9UaDu9i7RHfr7eTanuC9HXhgaZ
	 6berYZHua/VFOpbH1E/wuyW366vBB0XvJ++ugS1eM84E4OSCJkZ75ncxjJ906eVfqJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b="QMTb/4gD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126E8606A319
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue, 20 Oct 2026 23:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QMTb/4gD
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF6625771
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792540182; cv=none; b=hj9CcGv+pRU0620dpeU7RB0808mlQvT9eyN8wlyd3bc3qzGH1s3ct3tWPxjil5B4HXwPJozF/fkIxNHTWy1Xbbn7opTjpkqF9FGaiK2nc7oE4KWVRhfXBqcZoqa7jD1RtjIX2/VjZLGmtwkl4nICdbxH+Ikp+0DCqlAicDc+KUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792540182; c=relaxed/simple;
	bh=IDvziefrP0zds4E6K774QsqqrTGxrFHXzW20f9EWnis=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JNYCZiAYHqj2TBblJnIfN9M9oXNFpNsXzl3pMZFHIrK5IooGPFUFoazpk03mhHhlAPA2Hw6/iO2bQ4fc27X54BNKIvETOe3Qq2ljLOqC5GeererdYjRbNlBicceQhni5R/zO8V9cpcVPLrZ1WrjKYax+AgNzD4zANSycmso1FFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMTb/4gD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BFF3C2BCFA
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792540181;
	bh=IDvziefrP0zds4E6K774QsqqrTGxrFHXzW20f9EWnis=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QMTb/4gDBWnECPOfxSi+K9GL58puO6qQv1hiPsyVty/pzPmQtTQD2Ui9lAAN2Blep
	 0L1KGSR9eAco2U0ltaVn/yKiXjUNoy6sj8DVxzmsxPrlzG1nG6OVOBzwa4NRB4GLaV
	 pEzmzc6qqZufA7xC7VsThu9dOvT/uqxm0q7j+otUJEHY8pwkrEtVVzmS18zxunTRO7
	 UylW1lAjKNxqfD6gG9riMakMB0eNtZCbEij3ucc57332vGxCw+sQQ9CddMwR2QLLpl
	 ieYSOt5HKD2XQj9v+tu9t2+WIWrODV4oQBYVUt7jfrVhDadxYIvX69EBn5/b00bnAy
	 3wGFXZvSYsv3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0FC5BC3279F; Tue, 20 Oct 2026 23:49:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 20 Oct 2026 23:49:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-Y67YxlvZRs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #5 from Armin Wolf (W_Armin@gmx.de) ---
I think the second report of KEY_LEFTMETA with the value 2 is the root cause
for your issues. I am quite sure that the keyboard controller should not se=
nd
such a key event

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

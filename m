Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793565231;
	b=O87MYWUIoMN7mzIzWDHz7aJrtQ/qIDMFwgYAt7X9gfMAAXAD1J6KO6kCvER7jgw1+ung
	 edV7WLgByG6YOefcmAQJ6YEZ4GZNhOh0UOJoD8GFlyicWn1s30JJZIOFChhPbA/q5Jtrp
	 85ZOLhvFV9DNHkd21lUlnhRp6XhF6//yHD2G6IfRvLYycY+konaAUWdTUc7acX+eNHyNu
	 HUizp+H5/VUszyIhiz+yTu7i6JI+v+BJ4UbYrpzmrbN697imuIu1yd3tCPUShjz/xk5Ws
	 Ug+zu9mrjBq/fE/WnXaOwJCA3v+Fw7GOq/AhV6Mf9IaqIwLW36nIVc+WgqYZXba6jOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565231;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=iJu8B8OrmHhN4u62EdoFbtp6joe1N8GHz/kLm+hV5s4=;
	b=LEztl1q9o2I/WmBp7izpOpwz/vHcWMfz1vF+5iuf7x0JlGdSwELDqLHIwxl0/qaN5kOd
	 IQgqxLuw8ooc91V1JNYWLEBYjGv0j7qgKQFYqiC/mr+/12d8GzF075UIvTdXxqzu+ZALm
	 SbYonS+Mjyd5qRgQxxKypqZc2d73feh6cfRgHTsejnxfgDII4xzK9Hm0imrajZFxhGRBm
	 ihLIJ2bou+j3r58/B80UsYaXZGoKXT9PcKgRU46uqT19gI6iaUwCjcF7d9P2V3E7jNQK+
	 DBJ2xfG80c2Mro3Jm2OKrnibaqZCeuyTcGt6blHftZ21JrHD1yfCcz9Xci9oZPfC1eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b="dPr+Bum/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33569606A324
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Sun,  1 Nov 2026 20:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dPr+Bum/
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085506513C0
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 20:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793565231; cv=none; b=MA5HERauEJWEJezOam1J+ccUNl/uMjQZaycCzgFHIYP0Fqc/4YA2vNspD3vb8Xw4SsOQX/JODqiWgiaV+1wtClV8+oVNNQJJ5yO2vRlly41iF8s0eioPIOwCJ5Ny4Bwd/+07+HtxiPNnOsVtoA9pBcv1sbNVdvS7opBG/pRJc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793565231; c=relaxed/simple;
	bh=iJu8B8OrmHhN4u62EdoFbtp6joe1N8GHz/kLm+hV5s4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eJXmOSuC6rGK2LFdlbov782VO00WvHehgiRwRCA8Inuo/jxI8TtU4Nmr7lNyr5pVy1SYz/27PdVmEUOzC6j9VfhV/bepGQXe0JiNgowCXq+82MHlXzP6xcMINK1Vmm5/W/YBvUPElSDJ9BbZ3UbgYktnrZd4ejUqk60orh4UZ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPr+Bum/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5319BC2BCFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 20:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793565230;
	bh=iJu8B8OrmHhN4u62EdoFbtp6joe1N8GHz/kLm+hV5s4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dPr+Bum/LcSXKKC8+BnhV1R8VRvPfb38KgubuBpYu1cAKYhxWRBSfwmbYYGfHz34o
	 AnUI6fScSxYyDr2ueFbFOVuPLgExT0Qx6YDdULjlB04CBWmLypChmsnSCWlgJbMqNr
	 pUj0JJQpd+dDy3pDCr1ntlKYWCjspGoIYx5AY6c/S1AxZcqJ5jXgaan1lxv/ZvfkfR
	 gXXlHZfjxOR3/j4Zh9ol8NmcCov+UUqy57oUvrBCrJj284MA/IOzbm806wCvQIgDG5
	 u0PrdPwn0tW60D3J5iEBTXnPwSM+Py8Nbkz41/3PmO0IpOOxY0hsKtdZ4ibqnXetnF
	 MpNTCUURhk9Vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1F21CC4160E; Sun,  1 Nov 2026 20:33:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Sun, 01 Nov 2026 20:33:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: helian.caumeil@clever.cloud
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-zaFpsutP9m@https.bugzilla.kernel.org/>
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

--- Comment #11 from helian.caumeil@clever.cloud ---
Today, I performed a git bisection between 7.2.11 and 7.3 and obtained the
following:

ad873d6340957c1ed5a271eb7ebc8b873c42ba9d is the first 'bad' commit.

Also, maybe this will help, my laptop is a lg gram 15Z80T-G.AU8BF.

> If the patch somehow fixes the problem, then personally i would apply it
> either way. Are you OK with that, Helian?

I am totaly OK with that.
Thanks for the time you take on this !

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

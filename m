Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B48469843
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309109; cv=none; b=ta8Wp7WfWaCqldyQlG7XA9hp/5tUFA0l95hwUFMzfsOoyi3Gn1ViD+PLY2ddSmSMyRxp956WkNCEpiZ11b/2yRzso4PE6cU5RfNdzfGiLyShiw4yAbbHvxmlnOuL6/fxU+MWZuA5IRuuENICzvIbF6wwin/kBRMd9wpufC37bBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309109; c=relaxed/simple;
	bh=nw1J/cg4xWduL2MtmDzQBY7q4knoaLRjRQ2QYY70HS0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QLH6ibcsiVNaygE97XrkmaHy/VN4N+qtFiuinSIRmqVc3e3lfzmQqjJRUvPYY0a85AflCj73MS5vzoSQVspI/3ojWdkBZcZ/n2kHq09Lv08GLdBcAIEK1SwYA+IPH70LaKcFawA+QbfN+dgcWmL8X7iytWQpkeJXunKbF6/3eF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qndyTlax; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qndyTlax"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53F07C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309109;
	bh=nw1J/cg4xWduL2MtmDzQBY7q4knoaLRjRQ2QYY70HS0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qndyTlaxVn2pkDYyATVekreFb0/9eRBRAkJorYYi8RoYqhf1XLA1BoLdNpJ2kOLWk
	 yv0TFfTcq2qEZWzki0OjgwmKgzrz6elOCsxCGpLrwqhh5DFdZsmNl3ffmPh9VJOfRi
	 U5k9mEtIpAqF81xDWolH0xruT7xT9hipC6lXa4kglI29CmBsUKGM2C5Lpu0ROUgz6b
	 ysHqrbMqGaLm/wZEZQmXsNKTD4Y56SJoP5hu+4ZMj1FO+ORoBNiRg1HhEUZdmqlNX3
	 +a7FNepHUnyeG5U7YRlloi64zTqgFF4pT3QJ4ySB3tJMQMb2wxkag41nUyPzGBg5iA
	 D+0L+tQ7IBsvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43E07C41614; Fri, 21 Aug 2026 10:45:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:45:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220926-215701-pa2FrqzL1P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #7 from Gibs (gibs23@proton.me) ---
Created attachment 310698
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310698&action=3Dedit
/sys/kernel/debug/ec/ec0/io dump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

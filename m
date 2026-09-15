Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700E4399EA
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499771; cv=none; b=YKMsBdWMLaaq3bqkT6/w4FvYOnKmMGREM9bWdJfxejdzxy4CeSfEnx5zWvfP3XKG3/tNLmAhwCMey/FtY3+HjlJojH4eBdhtFGbSHfR+1seYr5jpnhe8WsXw3Ef99WVQWbh9Bnnn4GL9cc++zwSYC8xrM9wU2alIXSy49XMVsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499771; c=relaxed/simple;
	bh=nFP3AINVWxm2sKCqCTOQqzWOX1aVeyzHI8Kjg8oL7JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VKw+z2QLVIGvnKwpBfOtH0sAg/+NBjyjtaJO68p2He9beCYglOIq7RrOLXknznQl/7GOcXjZGyK5RUUCjw2bNF2rKHeDlxMgrbXBEQ+vKMDTDusO6SUOU1xrFUqCmXu6Pvbjmp/CsZIKYB1J4m44SvwhcHUVhgf04myb8z0FzHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDMKVJLN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDMKVJLN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4F90C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 19:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789499770;
	bh=nFP3AINVWxm2sKCqCTOQqzWOX1aVeyzHI8Kjg8oL7JA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fDMKVJLNWQmK6Z96KxtpUnnTgKHDAVOhGGbhAlNvPIrcNvmyhlPhoYMgQurzcTS9E
	 MUNFhDJ9srdr8jv+BNyNBZFCgfDehlMzJvsowoWihziftyh0NOaKNymcgaABZtLGCP
	 zdhflu3OlRqZ6FQO/Wqw4Qdg7ytfsJO/xWiMwMGeh2QkL8otijvohN7u+ob5VAwxl/
	 ICu0feC9Bd49oX4c0QcSbIVGi/ARkPfTaCSE70B3LNCtqYmWlGdj6DcKCv6OiykEI5
	 cjASTS8P+SMfAJx16SfEDGQiYIRpUOztqtncLtZBw5N+dncDZY0D0uVTlaB1VMjLwQ
	 t1TB8XkBWco+A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 99B51C3279F; Tue, 15 Sep 2026 19:16:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222002] [BUG] alienware-wmi: Missing support for Alienware 16
 Area-51 (AA16250) lighting controller (AW-ELC 187c:0551)
Date: Tue, 15 Sep 2026 19:16:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222002-215701-O0yQd0IQw5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222002-215701@https.bugzilla.kernel.org/>
References: <bug-222002-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222002

--- Comment #3 from Armin Wolf (W_Armin@gmx.de) ---
Can you share the output of "acpidump"?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

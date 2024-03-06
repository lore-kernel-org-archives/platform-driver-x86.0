Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4AD13BAE8
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709748635; cv=none; b=EjQ5RuTuUpQ9f7OgA7SQvJYxsYv90x8+KbXEnRveDNK4bAmN4FaTXTAAJTOll+zAVtnVRXmDMwO6XlOa8G6o4bN54MKB8SpT1vVsCcqRxyJE2ZWnpiT3r6547B7S4MX0riHqv7g8WSqqjX2x1BqmEIV5PFiDj5pbKfK3Y7fT+dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709748635; c=relaxed/simple;
	bh=iQxRWTa9e+1HF7pP0thirSuoHLpGJsKduBkoO+R4eqg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lMBdfzxGv/CN/lJjebLaosHgQbAGMubgXpZx0wKzZjKqy+O0Tw/r0joSETWk+WqBV5f6skKyN6nBc40Nptmeif+B9cy5slO+J2jGIeZm9PrZwFVHr1wMshq/M231iJRPIZFjQnS4Fw70xgdwktjpg+9C1SAR8LnmZUMX/MbaqNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/rrcf8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/rrcf8B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CAACC433C7
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709748635;
	bh=iQxRWTa9e+1HF7pP0thirSuoHLpGJsKduBkoO+R4eqg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t/rrcf8Bt6VkWhFC/8tchnJvy4ro/tgkKfO+8WIo2mG+bh1s9BJfp6ve4f9rZxduf
	 iHuuBxANnW2FcecJR8hSqj7js3D5FcvQoJ3MmtqK/rwjSsqhSj9BY/7FiuFz+bD0ZJ
	 oiWiZnfZTCzqIAK6RzY27ieFJhMRbum8n/7xc7CL6tTmAw5QXamaS8XixKU1PboxP1
	 SAeBzsdqZ5ENtZ/zuW3zhspN6s0koJhzIQxVqG05lCDsJOqaf6JgQWQpYPlpQSefz9
	 n1RsbFY+iR7d7sBlNdcvkgsVfSqvAJV41lDIf+UNjHRqgHG1ybiarvqQ/D38f7dgOX
	 SbSXK3k+IV1Xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B862C4332E; Wed,  6 Mar 2024 18:10:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Wed, 06 Mar 2024 18:10:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-FgItp80zFv@https.bugzilla.kernel.org/>
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

--- Comment #39 from Armin Wolf (W_Armin@gmx.de) ---
Ok

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

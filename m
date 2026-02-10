Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61FB27AC4D
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770759124; cv=none; b=qBTdpS0vNy5NjVZlzvViqWJwmTqr9IJ9e9pHmzAjIlUcZWHpYPffhjxrH6LMs9vgZFhaZJZjHBEfb5JLf5ujjsvWL0JP7MLAriXC8OToDrnVisDsA5FAH8JiWGGnWHKvUdTbW10wMrmcczPNWcC9Nt6aeMWnAuwCA8wXhBNurgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770759124; c=relaxed/simple;
	bh=C8hSkft6b2esrFd7dx73c8xTNk8FZswr74QO3T+iCIA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tIbPyVWchbKA8LjuJTRWq1WcgW0kC+7Ts8S7wuiiA1xCEktGRxf9LXfrjfPTK7BNPTOTtWFUoDLcFLmr25rGpWnBY0MriZd/JrGG1lF1csZ7LyaiASeicVaZzwBKq3OC1cJUuaZVMRbAUwp4qNVKt/Gs2N/yTKMcSCLAslayYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWUOaPGP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWUOaPGP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83940C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 21:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770759123;
	bh=C8hSkft6b2esrFd7dx73c8xTNk8FZswr74QO3T+iCIA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jWUOaPGPu5SbWcvCqbUEU+x4saMFt5SUvX+IMsJ49+wsGMmCVutGpUc3TMEKuqnEJ
	 QzzAll5zjzs6eZblHTZS4ZtEPhyq3p2WhT/NDjYOiSh52/hTN+oyhBFCk97N3DC9el
	 px9YW9tMA/2UTDjA4QCjCfqM8my7P7u7uhVK1qCyWQPzA2f+PMV77ZGnwAV2CY7O13
	 BiG7SrJc/IMxQZUcTzIVZtYzVmjoswZT1PmHzDTlwX5QoifrJY4WKssD8rDG0FkrhG
	 Aqt6Yuv5zCMUBiUfqgVBCD5LnXBg9Hs6BZMiDpLVDPQaoVbKlu5UhKYt0l4bMiFsuv
	 XCxPCYuc43pSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74694C433E1; Tue, 10 Feb 2026 21:32:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 21:32:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-XKT3Vud8CA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #17 from Armin Wolf (W_Armin@gmx.de) ---
Also, can you read your current battery status successfully?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AC31A6836
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782030225; cv=none; b=SwzcpHU+yVLxzDhX43mR8t0uJMi0E/1K09wodCy5HXy0TKYywCcJNjaICPF2zyBz9HXOfLemHvkehu6tprKS5BmEUaOyNa6928FtaxlNtGS0pjJFRLMstO1nn8FpyrlLGEypJidyz+fEiwVjJQkXUsG6ZG+7shcsM7WqJZ8X10k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782030225; c=relaxed/simple;
	bh=3+DDLM6mA3psAqD5sP3g4E+as0iR9spzLyoum2x0MnY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uKHuaTwMTZOXhvPY3HYxUzuJJK4M1n+4A2xtVZTZz9iSFTX34e2Qrn4IXucvRBU4X5Szo/ecjLOETvxBroH/XMxVx1OcgdJ1D5EfyM3SnD4NDmylGp2lxyy3F/rYm8QGsu4BjtkzolCHZpMBwPAz1A8LoEt5BbTq3w0YnCWvIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POQquq/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POQquq/G"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 408BAC2BCC6
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 08:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782030225;
	bh=3+DDLM6mA3psAqD5sP3g4E+as0iR9spzLyoum2x0MnY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=POQquq/GptfY8FpAqZpi/2bxdn4p9yyMGFt+japffUza7kvV7Oiok6QnqSte/1GRc
	 VXbm3n0NKimG+MFJDcsBA+dV6FzD51NlxJzBWL5lAEE+Vr0VPQuwAPged0MRaV9fjt
	 pt/Dgd3AtskzYonGhKBVs3UVJ3pMEKkcnCaDo0bbHL4bxBgnmAYeaWh7SdZibB+B7k
	 05tQ9k1JAdLVQRTibFZPnBURxiPRtEj2Uz9X2JFYmS8FvToLc0VKdfANjacv+P4lx+
	 mM5qx0jSVf9kNTsOqZx9FS8pE8o6AibCeUqmAEASzF/gEw3iiBoKjyhQJaNgZYnrhf
	 6vP8hb0KsJhWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2271DC3279F; Sun, 21 Jun 2026 08:23:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 21 Jun 2026 08:23:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chgenn.x@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-5TjsVPrVIG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #107 from Evgeny Ch (chgenn.x@gmail.com) ---
Yes, the same commands from previous message work for keyboard backlight fo=
r LG
gram 16 2022 with new driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

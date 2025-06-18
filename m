Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E521CA0D
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750282678; cv=none; b=YOcHdywTN8dJAEDz/He80QjcEziJ/7VQt1AztGi2KfBHxg9PcXqQRniTNIWpmo7rk9UZfwwrbx5MFy+gylkFxmF3m6X4YZFnjTaB3YwXpNuCTcuLoqSUP0TK5ZGUCvnZ/4yXcMBaT3C14P8MEop4riO+bbEAiSXBXGirHlO4J2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750282678; c=relaxed/simple;
	bh=QPNQm3wOJVPAzUjC803KzUu7WglTgkE0rCuG7I+Kf30=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=giW+P0j13FWHNo4WRosfRtRjkzLJU/d+PIlCpW2OPE/M2VASEDUdK6ooNioXXGoYqeA9Xdhyfaplsrp9dSX6n7bQknORzgKIIQNJXK8C/dlzVXwHBVR0sGqDjcRLeqfTSfo2YxLgB2LyI6s2639e+isREJueSNyWzNC6uTaSS50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isdrZLHv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isdrZLHv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F036C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750282677;
	bh=QPNQm3wOJVPAzUjC803KzUu7WglTgkE0rCuG7I+Kf30=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=isdrZLHvEWoMyozmoElaHt/mfcU49kBFADHwS4lFpO2vCt8Y1Bu4WXXnuYWFslURN
	 Z/Z+fzTLkGjnHbG3olQwS8GBKYWlwviS8u7AnG2M4+u+HohL1QNxbXVmRL/MtEiTD+
	 T8jTVPZlLvCzGiphbE3fVlD7e7GgpJKUvjuk2pmGshL/WgcjEpOZpMbLgP8MK2uYF9
	 pl2DMCJOmUycAY/j7IHQVoiQEUG0StAeQhe0BP9J2yY257PSVQOcnD+wJP7SP71h5+
	 uusX1l3Bciqbqqs9V2fWfXB94Xzmjdg2HBzk4Pq18hOLtdwMW59U5A9TTMthsuNN0/
	 RayTn/pc/8UOQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3FD5BC3279F; Wed, 18 Jun 2025 21:37:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 21:37:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-5wg0i0S7zR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #12 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
(In reply to Armin Wolf from comment #10)
> Could you please share the output of "acpidump"?

Attached: https://bugzilla.kernel.org/attachment.cgi?id=3D308288

Now preparing sources for bisecting.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

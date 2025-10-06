Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDEA258EC1
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Oct 2025 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759784520; cv=none; b=oNHw959OgOSkFcaAjyCT10yss8Mb5SZzGhH3PYuUHyUP1/eLLwYrxs8VOAmN0jOeu5oX63Wf0h3wqwRraPHyLZwScYR8Ud4yKFcviwTHrbguPIAintpWnsX8RnbLVmdZp95qr8HvdvgA/skYXpzPQfwHJZDqEuVrBGeNU4R8Vng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759784520; c=relaxed/simple;
	bh=FHCu27UX55QI9ISWr/Qkg9BYxlk42l4Yui/VWFV5ly8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H+NJMpj8MN8bMS8tzJu3kGnMBBlpZTN6UlzLJvyEUWd1BVn+x1DwRj++gjxCI3Y6cbw7gRFLVkDJHhIYUM9OGoXUyrVliu7MwPBX2ljOsDi+imOkpdtX/0gYiF5VX0cWHRLnfNGA35dM6HABIHPxxHG9Jo6N3bU8OWalowDuQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mkd2moDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mkd2moDd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6413CC116D0
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Oct 2025 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759784520;
	bh=FHCu27UX55QI9ISWr/Qkg9BYxlk42l4Yui/VWFV5ly8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Mkd2moDd9gtp8NnI1tzKOwmxlMsXVYB4St2Io8HM4tvhzoKu28vV6hHpGQe4A512D
	 FlHYqXxKRy1a21UhKRrxmJInSVyBvTOAusJLa8hTdr3+xIh1THdwHnEt4gPIJTme+l
	 DctsiwezGobY8FfD4zbSX4XavNyJenoDqq12pwBqviVGkSzTZiqW/FXjuP5mH5gHyr
	 YZqEGHROnaleXUJ/zFoPZkite3WaiEolDxrHSBX9HGQEKkUdhYD69jKj0e39OUvv22
	 AZn/6QindL8rQyEesfzBQLx7KpafMjPQOXa83VMlvyIuQTTiI3WTb4Nm+RklrD+kN/
	 kQZnCN81Am/9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D5CEC53BBF; Mon,  6 Oct 2025 21:02:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 Oct 2025 21:01:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-As26FjsZr0@https.bugzilla.kernel.org/>
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

--- Comment #136 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
I will say that you've had a lot more wakeups from the EC in this test run.=
  I
see 32 hardware sleep cycles.  It seems like once every 5-10 minutes it sen=
ds a
wakeup.  I don't believe there is really a lot that can be done from Linux
there, it should be an OEM EC optimization.

I really think we need to get HP to look at this from their EC perspective =
to
debug this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

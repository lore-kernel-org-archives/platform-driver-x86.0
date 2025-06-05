Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BE12E659
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749121126; cv=none; b=TozVQSmV+DWOzsYt8ACVj5omfA/VaHgicddcAYsEgaz11PBupZrOAvnInQE/FAw/+rDvtWWhOkrGXUvMOeWpN6nYZWX1jItuoP+sLnTgOX4T70dqT4S+6++9WCgrRzND5BJc9+QrfwmjzBr6JaviXeLjZrSmsCCtApitBliv3IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749121126; c=relaxed/simple;
	bh=OGH0Yv9x949jBDL4jv2/c73VnwhGY61tlH71ITAG9+E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qS7oByHRVZnb/I8r2ivxMGZFNCbnWPLF+Dmx7jdgxIT8rTyYVOHQwV/LxwF/stf9KeRWXLUkZLhImAqSY22+Cx+sY5C9FvzSPLQb1okO3LZbN8m/LxNNYUI34fHbNhfA1XRkxJjPH/AaLm3QAB8cPWlK12g8Z+GRoMmhUC52wZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fm2uWpT2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fm2uWpT2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93C44C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749121125;
	bh=OGH0Yv9x949jBDL4jv2/c73VnwhGY61tlH71ITAG9+E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Fm2uWpT2tU1ReMeMnQquanLOxvpBNxhj5bEhivMEYY1mey4qdcYwoIZ9yvyhxAIRd
	 WyaOPqWkhidohBFt6WSukXJXzuL7AFFC1XOUr5g9B/5JgAWAZCiEhPwcZu35689tMr
	 7Cx6qDEdPoQ+dth9kL6pIGCUwySa9wd/m2v5LYh42iklvJQcOj3xmSc0SBT2OPCYeg
	 saraIxrqCA7fRo/u7uoB5CkPVOenfKH3H1HJHLKDDDYIdy6QTnHc+fkeHHCTUQ1yrp
	 3bQ0yAK67SbtZDKKXF3Rb4oudpHByU9W15nGf2ah3DKXxL9pDzK8sHJ5ixXZDqnk+B
	 eI2vtpG2ulSbg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7BBFBC3279F; Thu,  5 Jun 2025 10:58:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Thu, 05 Jun 2025 10:58:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220116-215701-1BEkepVaNd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #20 from raoul (ein4rth@gmail.com) ---
Created attachment 308209
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308209&action=3Dedit
reports with and without wakeup disabled

No I didn't rmmod and I made sure to remove that i8042-keyboard-fix-linux
script I tried before. Here's another 2 tests I've just run, one before
disabling wakeups and one after disabling.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

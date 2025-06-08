Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E295C13CF9C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Jun 2025 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749397229; cv=none; b=dulK5gJdivCdL4AgQ2F9w42Ez+8TW3scSYt1orTxk5wPVH+ndEbJkimenL4KF6OsJJqKQ4E1NrDPLk/bi3pjZnodiCjLFj7030KQa3/XGNpNUH3DPU59QPQu+3p4oXj526cfy/jZHHo5iR9uONeKwMQsvwIEFsjwk8IPQhDL9lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749397229; c=relaxed/simple;
	bh=VKhLtxSW+0+cWaN3cRJAtnamgIPOOiVcetiFajA1FTM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W631GE0E4YbH16cPfc3c49Nv4V9q39+jVaXQI5qcAm1Z9SQh7pFFvNh43gM/8LIxQJXC6BcKIvuBECzt54WtnacGIvxl34L6QXlKITpe2+XjUuPUW83WhBQkPT3C1IuY0toMKh3r/iqDL9Iu4YWZEArjc5h+GJWzOW7/yx0WfbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRgFvYoT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRgFvYoT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B63E4C4CEEE
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Jun 2025 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749397228;
	bh=VKhLtxSW+0+cWaN3cRJAtnamgIPOOiVcetiFajA1FTM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nRgFvYoTP2gHcUNIXuWWESzvncTpEYcBwWIIzycMSToTOmo/yAVJQKmUkfRX01498
	 IeRa4XIHqb9YAIxnCxFmRIZ3zXZtGJlmGkss6dExcx6IYh2XxdhAuRr0rTt7BDOLgn
	 xRvnIMIjwNqekg82pw4BSQK+hQ4tm15oWXIMwCxNAqIwjqgdhaDzaa4GV05f42Mh4l
	 6vbdr75SjfqouOBc7RUn/851X/J441kX3nq9mxfU2Z78UtYJMKTHt9KsZ+wG5QkVW/
	 TcGcvtBREZQUd06Tg5xYFBoBpnvxJbGCsYNaqwWGf+yNYq7sebrch9LycCzWUpDAz7
	 8k3e8w+6Dvk7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AABB2C41613; Sun,  8 Jun 2025 15:40:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date: Sun, 08 Jun 2025 15:40:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211741-215701-oS5aCm7bTo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

--- Comment #12 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you please try this patch?=20=20

https://lore.kernel.org/linux-input/20250527111047.920622-1-Basavaraj.Natik=
ar@amd.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

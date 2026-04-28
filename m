Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07A256C84
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411553; cv=none; b=FXobyNqxWV4tX01hLYYPuT1Jrc1wN1YRXMIsUWJGq7unZxr5kQ7/UjD2EiYVEdF9FZPulBw75Js4rfsOFbhoa3t9bnRvpkMff0hY5oeMSAubvBf5m1cU6dkRca5w/GlUfmnDyls6Bad2sWF14+nohjyiwaj5FHE366UFuibBgSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411553; c=relaxed/simple;
	bh=mE1GhORP3T5Fj/D58UzS58gY1iMDskgjRWdTjwCfExU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JcSwqqmTnd2L+exZJEMEV3q0GsO0qdX/ac3HTU0uTJ522CGNv4HqmcsO/BM1NnrPXJlb1rlXgXGH4seC8LMhWkEbz24y1mOb9HXldtbehsXTisBmuu0FGPM2clC4QqEx/1eTF3tcLvJDXOqOZTjeLncLzaJhwbhOFixP5IzPptY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZwPZ/Ti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZwPZ/Ti"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EAB2C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777411552;
	bh=mE1GhORP3T5Fj/D58UzS58gY1iMDskgjRWdTjwCfExU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DZwPZ/TiRhx5YcKvtuRYHrXbc8ipCpranv+3ceshRdfRkfzSLjxASbgK+ELFiHl/V
	 5NF1ZEqcwNqzyYCnj3aqaD+UQ+gddxt3KXstkOkvilk5Sj6ShRE71Qy5F9MMVPC5V3
	 kAyPBLUOXmqiM6uJzz7zpS1UoKdIVjzBWecQYCvUty3KR5sr4Cuzs5hHfqwEIiC2CR
	 1sF7+gsGpuIJAr8CeC3LfBpE5f9G/fAX+d4AnA6WsfxgenLrAk7B7VSNrAz04akNnM
	 z0OIjk4IF6IPX589D8U5JLOj2Dqu6IAsezw5syBNnjm0XzwlEYzZf6b6Plf7+lGHlB
	 wfuw3s+yECfCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 98F46C433E1; Tue, 28 Apr 2026 21:25:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 28 Apr 2026 21:25:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221430-215701-JCs2iuZdBC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #3 from floquimaurice@gmail.com ---
Created attachment 309995
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309995&action=3Dedit
lspci -nnvv full output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

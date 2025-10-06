Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A96283FE5
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Oct 2025 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759760755; cv=none; b=GtMBD6FeJtYUzRAYhpuOzR8XHBjmKhVYxy2N31YcF0bL1dSN3dYlzDIl7ISI1zBUUv3Zv8VICg5nHee7VBArzXBNerRtFKcmFNPhX+EebQhK0uCuHYK0f1VWTVfqYsleatA+WyOZKq4w1A9dpCST/1/TbSURtsn0KzSZzBZmo+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759760755; c=relaxed/simple;
	bh=yQm8JSpxmHjWj/2qx4h5F9tTE7ggeeL8sh70ahUoviE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hYma6I9LrCpuk7YcxKESZK9iK5E08iBJT6ql3u3UhxVhR4p1nTN/+YN9E8mT67nLO6L+xGaMxAz6xtFDgePiOHDz4nsRlGz8KqdJH8PFcSyj9OJEBTBGQONonXRf+h8dCFUTjEnm326+kP48XdxjQ6Grzdb0Abxi+J2R5nuSD7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsPX72U9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsPX72U9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A75CC116C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Oct 2025 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759760755;
	bh=yQm8JSpxmHjWj/2qx4h5F9tTE7ggeeL8sh70ahUoviE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hsPX72U9GgIY6WVRZ8aOCsNYOKMGGLLohDGQwWTPepV/C+HcyF+7AInf5kudOxLlB
	 BgeJLCrZf02mILgr4J2RGGOEdbn7wcTtnp5ehvZ1n9RmRMWo9c5GO95gUopNETvDf9
	 Qz5zOqRdujViCjgX6FlUr3lUMa0f1Fm88OjWhBo7JHxeedQcdwKzbk5FMR/OC+BNG3
	 JNoXtHoMq9tRXU3MPlNFRUYFWsv/bCZ1D+XQ9pu4IMsJx/J9n/gDa92Tzfe19dZW75
	 JU5j/bHuHtGNXyhElZVi9q1/KHmo9WnEtWiEuRAZgfmAg7R7cZnl3IviNp9vUvdm9z
	 mjpbbJw2/ruVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43FEDC3279F; Mon,  6 Oct 2025 14:25:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Mon, 06 Oct 2025 14:25:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: petar.vidosavljevic@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-T2efcHDJLM@https.bugzilla.kernel.org/>
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

--- Comment #135 from Petar Vidosavljevic (petar.vidosavljevic@gmail.com) -=
--
Posted updated logs.  Luckily I was still running the s2idle script.  I ass=
umed
that this issue was fixed with the quirk patch, but it seems after many
suspend/resume cycles the 544Mhz issue can still occur on my configuration
(Elitebook 845 G10 7840U).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

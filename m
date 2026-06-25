Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4203DC4A0
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387393; cv=none; b=KgIgJxGrtRJxmPnBqyPtsvlPKZjdhqnndj6AJ4oqqlmreyqLpg/4IvuAv74En3o7tQJHhQ0h8uGmz16aR156Rw9WCHGEmrXns9s1WfyPRPBh98tCfZLlU308cxaPk5PCupqXl42A0A+RMzf/VFmrz1XE5Yxa5JVBEQzE2sJfYxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387393; c=relaxed/simple;
	bh=Qfyyj1kjtpdOL3bsNCZJdNZLDJKFjPvM6FCZxmUmbtE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pwCYrCezk+MoShzy/EYqM/VIzbHANqRCS8bckE7Hevm+5zfia2YND/AEqm7fauWQtJOyChPfJDRjBOV4+SBg70xJoUiSVX6OqSb9E6seKkMYus/DzUJr/eAgixnrryjpQD2p6kU1z75t+GkwrvASrygyEvuL/0eAvybjE/SZ9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNOQk+EZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNOQk+EZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36A92C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782387393;
	bh=Qfyyj1kjtpdOL3bsNCZJdNZLDJKFjPvM6FCZxmUmbtE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CNOQk+EZtZqBrt7jGtr3W0Gq6Qhum6D15zzi+TzDQ1DR0TNiTfq4JRDegvAUaH2J2
	 89F1g7XcCmY/3tGpYKfyIC36eB1bEPLmADarumNqgOWPm06lVQAycMLk3w/SkEy1lj
	 4G/+mABDFyGrx2VzCJot71KRrmvTm7cRwVtgIPHungY05qysIYGRgUYM+DI2iiVBff
	 bfSxfc6+Qs8baBJpAGw5IVY/2OOl/vdNIldGQKPKgsd5W81+aeHI22WAiaUQuA9E3A
	 0ho9A4FApzxvJmY0sbbKW8NPrH5okgGk3mdGzUnvOuQDR74LITDulj2DPJNAbyMRFV
	 AeshOezF1fsXA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2678FC41614; Thu, 25 Jun 2026 11:36:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Thu, 25 Jun 2026 11:36:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: scardracs@disroot.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221569-215701-0IRhHNgGU6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #58 from Marco Scardovi (scardracs@disroot.org) ---
Created attachment 310366
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310366&action=3Dedit
0001-wifi-mt76-mt7925-restore-PCIe-state-after-hardware-r.patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

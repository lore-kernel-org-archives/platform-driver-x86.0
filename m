Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D837F32E
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787390941; cv=none; b=fm3lS9AjKFscJkUvMPp1Xe/r568ZJFuP63I5/4QqglJhoLUFxEMrPbGK8lfY+jdnfftSN8oXc/5VpmHEakkROI4kILaWVrVN0kDb4ECtTR7PtImG2zEwNVdskyIaALqG1VmpzccXshTJLNveya3OmElp6pHL2CH6Q+oOBGaSM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787390941; c=relaxed/simple;
	bh=KLAKr/TKavdY3NY3pGSzniH0RajbS144hd7iL1VDRZY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MaqRzSynfKuYZ4YhRfRvrAD0bmb2eOO1wgyzvWQNX0DTKA/JFcq3EdoCLBTsnD7le6ZiUwp1RSiwTkkKIxy2o5nc5aUKX/SjCLDqIOTw1KzoF+5cQtbR3ByYZGbrldSRg2QKv1xhufcuHEu/jSvWr5dXffuUzdn85rOBMi2zIbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aveaw/52; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aveaw/52"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3258C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787390940;
	bh=KLAKr/TKavdY3NY3pGSzniH0RajbS144hd7iL1VDRZY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Aveaw/52Iw8Sb2gv6bjIlsrvXy7jdS/eb2jmN87ZxovmaFbzXzfihWuBMeHAjmvbP
	 KToOKvewbv/s5o8w1vRIY66yLV8wOOtOke2xInU5R7ur5tjV68AJjiA1WrHS77zK/T
	 Kij9bVLv8M4FBxB4a2go4LHh1iwvaZXDVRviYpPIGbolQUiMNPhqx8Pqk2rhQ0ptmE
	 qdu6E8WAM5nA5k15kOhipY534SuWvBdf36ddy4eI4FWYkUFRu5sUistT9kvuDRybcU
	 B9GvMkT/cBNeRoK0PB3suVD2r8HCkJU87E9OLZTBZt2Dj6DE8FNvI7uxU+nw6mPVAs
	 A5rqyrQVx1cIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90F05C433E1; Sat, 22 Aug 2026 09:29:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221907] Acer Nitro AN515-58: internal display backlight cannot
 be controlled (WMBF/WQ00 firmware bug)
Date: Sat, 22 Aug 2026 09:29:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathena161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-221907-215701-s4nv8HYZoi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221907-215701@https.bugzilla.kernel.org/>
References: <bug-221907-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221907

aich (mathena161@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathena161@gmail.com

--- Comment #1 from aich (mathena161@gmail.com) ---
Created attachment 310711
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310711&action=3Dedit
Full ACPI table dump (acpidump, all SSDT/DSDT tables)

ACPI table dump collected via `sudo acpidump > acpi.log`, then split into
individual tables (DSDT + all SSDTs) and compressed with tar/gzip for easier
upload. Note: one table (index 30) failed to dump due to an invalid table
signature (0x4F324824) =E2=80=94 this may itself be relevant to the firmwar=
e bug
being reported, but all other tables dumped successfully.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

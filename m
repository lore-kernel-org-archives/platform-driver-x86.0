Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B73B42F3
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779524; cv=none; b=EcAXOYovvkOyjST57k0t0vxzoT4lnguYqzAusaeT0si0m7KwZ6fLQn6PL8e1YbrBUYu+KiHGeXnOVmNlLmf4sNllIcYFHYRlBVnM2FVa2JTGcEU3EsnuV0Xs52BoCVSROMquPTFcImRquJg+U4tzBcsG1mrTltKsB9YAr1HCoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779524; c=relaxed/simple;
	bh=29kiwg3RpOnXua6b/yz6OWVW004n+UtztYs+/RG7uOY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n0x4F3SSo1X1VpNMkVXL5ItsrMTts9rTwkBIVo5PiqF6FAYQ5drxQ0LAdPGtK/m6j8E67TULt5CSfsF7ZvW+esQ5hfkdplKmJyWVLoEBtLgrbCEpZMcPyiy+6iaMdNOJuAx/ogDWEN+lZ12V3eih2D1k6JLdwjXbnQDq+ECPQdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h96CE4Eg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h96CE4Eg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BEAEC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 20:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780779524;
	bh=29kiwg3RpOnXua6b/yz6OWVW004n+UtztYs+/RG7uOY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h96CE4EgPNC6NdX0z4qVyrBUaG2k5f17eC2VfJNdoErBOKirR+gsCU6yah2mF0LDC
	 q7qd2vIiEhPZHaRyLJiJvJ6Ff8Kp0dvl/pu6LJZvWWCInlw7YkFNgQzMCRhM1g1Qh1
	 tdRe01SB3fStohQwdAzjhllxqx2GOeHF/GGjye4XOk580u6dKgiQArAAWRjLpdwCxH
	 4FFkUnoWUUunwBnBBNHfB8pDQKGaoknBrQRA9RoT8VBxoV03Hz42pkRn+EqYndWeXf
	 /5GN0hIylx9uoWWXM67Ar2AuKPrS3nbESMtV/5Hu1QrGVGc6aLbaPaHe9x3rtxz4z+
	 xWhvUEfgZbsTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1AA8FC41613; Sat,  6 Jun 2026 20:58:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Sat, 06 Jun 2026 20:58:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221583-215701-VIM9MsZQfm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

Rong Zhang (i@rong.moe) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310266|0                           |1
        is obsolete|                            |

--- Comment #36 from Rong Zhang (i@rong.moe) ---
Created attachment 310278
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310278&action=3Dedit
DSDT patch (2nd attempt)

Hi George,

This DSDT patch should allow you to switch between Off and Low using softwa=
re
and get OSD working for all three states.

Software will not prevent you from switching to High anyway, but the hardwa=
re
brightness will be Low.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

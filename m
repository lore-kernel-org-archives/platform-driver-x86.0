Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F2149C7B
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 04:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777351123; cv=none; b=ZPV8zp3W1yFWI48NQSSF8DvFA3nZMoU5AOBN/aCq3QaObQzoJprVqPgYigoeJXj6h7N3sfNb9podhQqM2gtRPZOLSxbeYuA9r8EEHxlbOQ4CN1+OS+X5fhXWhkXLbWTwpaMJNG2EvCD03xc/CWwCQMXUkoyidq9s30PlEeBysy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777351123; c=relaxed/simple;
	bh=yew/8xZ+H8lyvly8uTLfu8bBUQwdtAA4OJxycLy1Duc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jf2ZL1n6BxCFJideOKu07INbELYB/bz8fAG/Q0TqwQyRzUngrs+0pdWcUnsF/u8DrtdOtghqlzEt51aQTG2n69pq6iii7fLYIlsO9HjY4juEGMpaa6oMJA5xfXT5hXrEHz28rgksg6lVygeNYDEEXLEnHs9UItl9AP37cVeIBDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXp4asq4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXp4asq4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD159C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 04:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777351122;
	bh=yew/8xZ+H8lyvly8uTLfu8bBUQwdtAA4OJxycLy1Duc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VXp4asq4F9gZtGJHnk8JZ067vuRZD8NQVh28SgpbkOcZ1h+4s68d99kKRkja3u/ma
	 JDxXp9Np8vG3jd3DyUo4Yj67UTvMU6V+9VfIFrxjzNk81UM5OpuxTTNHAcaXonB9lj
	 EgroHAI1QDpJK2U5j5qtLrviHCg0GODWRmiODduh6ChJkx+1zW+b2BNSn7gHrPiJSh
	 TTd8VXXXlXwjwtE2Hd6TbfuQPcgYB3xaQeeQTniZRwJ96KtvBrZ+NfILLtbJ/7b+AB
	 xwkaFWoAeXJLT/TWc4veg7jSIwC5uupGlJ74/DsadQ3KFKe3d0/h36k7wz2BwziAYH
	 1wGdQSWkmogdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9B2BC433E1; Tue, 28 Apr 2026 04:38:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 04:38:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-221383-215701-2S4Rx0LxfZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

Daniel Gibson (metalcaedes@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #309957|0                           |1
        is obsolete|                            |

--- Comment #53 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309975
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309975&action=3Dedit
patch adding (only) the quirk to amd_pmc

Thanks for the suggestion :)

@Sindre: I'm trying to create the commits in the proper format, with
Reported-by etc.
Are you ok with being listed as "Reported-by: Sindre Henriksen
<sindrehenriksen93@gmail.com>" and a similar "Tested-by:" line?

Can you test the new patch? I changed the DMI matches.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

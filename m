Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2524A29
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819843; cv=none; b=UJN9UcwsmNfVv5L8zBO+SLxQcndaIhdeBcerQEBwdSCEiP3Ae/8ChmWhGyJZPUC3/W0Yyl32VnHpl/D+IzgJYgGLFBqJ1wbCb7Vc/A6urRZOjnrWySLPZlcmei2u2X0hknzlj4FxUwf3iAAbEe7UvIz7o0TVYxjHrDgNN9Ab054=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819843; c=relaxed/simple;
	bh=7Fl4HtPQ/xPOck0reh3S3vd1ePwWQCI3yA1YpDTGhtM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fif2P2X6Sk0G9OYJg72HE0doA2Z8Wu63tgUxEcaiAUCJMcKas4txl7ELd82sFwed2XLwgva/ebAxZDHWwq1cg5ndSUX4hBG0qRMKUSY8X2AcDCTQoSwRllyPbCu2TMbAil4+hXCECLE0AjL0axbZ8iV7cqIBs5e+v579w3yoF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgcxZ8//; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgcxZ8//"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D175CC4CEEF
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819842;
	bh=7Fl4HtPQ/xPOck0reh3S3vd1ePwWQCI3yA1YpDTGhtM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hgcxZ8//vt2SaT8JH8Mv3wxdDa+oP5Msy13baT+b34NOZzZn/DZ6KAZTmBU8322Da
	 ykAt6L/0RvYGL8hafNbypwrcrDBnCHg3MqbOo6HGf9uB+n16S1hz8iu7bfcnfnmHr0
	 10Pxmw5hAVHzSS8pYokJIrJ1bOWC2FG1O0Ff3e6okLCYvm/fqlk1tsy80TaAEmnFwK
	 lHxnrPHy0tAzh6Mpihn1L9x7hwphZAqDw1DxnjBjZx77fmtuDG/RTPUEJF0J0t8Vu3
	 bnTxYiTs1+/YbVJndoOzl7Bf/rmnkAZsk/omj6+Z1drtMoYRSW5+an0o/5FACXZHY1
	 NfUR2+upvCWIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CAB09C41612; Fri, 13 Jun 2025 13:04:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 13:04:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220224-215701-WXzKCQSVsW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #12 from g.molinaro@linuxmail.org ---
Created attachment 308246
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308246&action=3Dedit
Output of dmesg -S for 6.15.2-arch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

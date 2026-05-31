Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BFD1C5F11
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218435; cv=none; b=KXsMI282cwL9k2mPCJzTZcMbXU1IVXJf4odMb7xSsc5jzIYqOKrSneQQH9jYFDVhxAqqHPviOnM5SMDxTL+FG68cQH9EM6UBJFPGkbI9qNTCEGD51bIYYSvTvzVHpgLBibdHPzRi3lQOW3hs88j7wm3G3rE4EhGD/q//8U/lItk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218435; c=relaxed/simple;
	bh=qMlE5Q885S+rOH5ZmkULW+0dbhMMKWTKvt3g+6Bne2U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GLDGdUtab7/YGQmoZwy8/8Y6Cqvt/6Qwd+LjWupCWP0TWYaaIRrhXbKPpa8vAJk+1pC33PlsNW1I4YBu5uWHpC33bsEuWp+NxSkm+amz6CGianLICco6NVz5vHJu5iu4MyekEDoV8ciHGKg/BsB0ZcRlnyY87xXqqxxijZbwZXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKc0DDDr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKc0DDDr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5D4BC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780218434;
	bh=qMlE5Q885S+rOH5ZmkULW+0dbhMMKWTKvt3g+6Bne2U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=vKc0DDDrs7JiB+MS5KpF0js1AKCM3ybPRjH+vn/XXOgITf0wuff9IMq5Ekv/TNMq1
	 rQtUGdihKA7WN34A0y26OpPeaVDkL09tomnnfyuIw+7CyyQ5GAbLP6IWXz+I9DFOom
	 qjVnu6gx5qRehEtcw/N9W39eUnR5RhmoAu6DFAD06QaAiRaoIfloXg/9nopM0u2GvG
	 vayTJeuMukvaUsAbyjha1O5/Hzbqq5w3+q7f/JjMTuZDi2j7kKvLTQQoCM2L9DRdhy
	 V9z7y4DxbFxYL7Jp6icgVsm5v+Z9yWaqG+XCgCnChtu5rPFRW6lHktpKzpUin+GqjX
	 KYKxqlibySxeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DDE82C4160E; Sun, 31 May 2026 09:07:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sun, 31 May 2026 09:07:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221569-215701-YjPs4oD3fP@https.bugzilla.kernel.org/>
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

--- Comment #7 from Milan Oravec (moravec@ukf.sk) ---
Created attachment 310224
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310224&action=3Dedit
syslog7.0.8

syslog7.0.8

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

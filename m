Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C1585C5E
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749819801; cv=none; b=RcVNonJZMjypeNRoa7VB5aVw/pbOQ8GN38cDyOnF3GH9vW9BKhlNx03neAol94RjLHowMcf4BZjYWeEUz/lp9tmvFCkfgjyjDRGWb2+cpRvCTc/SyJU5kbj4qBq7FWNgs9efOeWlgNdZTx97HV6+9/Su4IxiuLkzWvYMc2g6+UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749819801; c=relaxed/simple;
	bh=Mbq9U56Gyc3ZPynY8sKa40Jh+7dBx3eQ3XA/y5/a3aQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DQwmJv2YH5EQGhxRYIb4UJvsViFLMGpSJJGsh2+OzkE6wPfxjjTOcECwoLgO4wt7UnE4iZdPH0KelzZzlzb/mKg09r+L6q6fxfZtVPL3LUKkVUJvMm9AtJUVYeqcs2+L8Z2E5jEOd2c/xD6VISRrFIUvvp1OLl9DMo0kYAAbASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyRTTBie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyRTTBie"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96D69C4CEEF
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 13:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749819800;
	bh=Mbq9U56Gyc3ZPynY8sKa40Jh+7dBx3eQ3XA/y5/a3aQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eyRTTBieLW8C4pZv+foGnR15PhNG330glQMudmK7iQINu7qglUEmiRHqj7Z3AvpR/
	 XsVzXFYPd3pjUHK2Y6C/ITphROd4GZsPx/hYtxqMNbR3KhYkGJ4hc5SNhGzb0XEpAe
	 v9NYztez4oREFBd9YOhZnZbSXovNl1GyqSQbuzhRsE3VXPjU6TZLPNwImOeWN+FEp+
	 ndlzElaw8rs13Ww+QxHDptg7augeTy3ajxgiBvGH0UBaDynesOygmkegOFY50BWCVx
	 d9P0ic5yxWdMwvnKCZxpA34Fa24jBRB/f6osFppjZI06CijnsrCGe7CsH10sagjkWV
	 zl1fd4ELgjn+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E52BC41612; Fri, 13 Jun 2025 13:03:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 13:03:20 +0000
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
Message-ID: <bug-220224-215701-f7IyHBZBRc@https.bugzilla.kernel.org/>
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

--- Comment #11 from g.molinaro@linuxmail.org ---
Created attachment 308245
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308245&action=3Dedit
Output of dmesg for 6.15.2 arch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

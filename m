Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1F3B2FC8
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 17:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777398094; cv=none; b=qMQ8t4IarpSOczLb+CJi5DFw/CFpS9mW1b01YQyGxMxnOdwB+kxVPhIAn3xz+ZJmpEuCmocS84FzM/AWgcB+yk6jQ1pFqzkGac/4hSpahdHLEzXYtOrQ4EJNO1wgm5p0lBI5TcROCgvnr6GmqFKWvrj8Cgr1iptoXu3b+q0N4FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777398094; c=relaxed/simple;
	bh=G0lbtirh9B2m4m30WAKbifWCexx1AGFCgZO3NG4bi0M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8VEjhnGwkfgRxxhbMmXimnUoROMZrm1tjOH+v0Vixse2+TOYThGrxxrs7CyoQqEcdUyVwdW7dlSTZcjNozAvnP+bmLm3RKxIkiTRew5YrI35UHyYnqcB5wUq60pqMv8XKHYYj5eW28pG4oe5lgqc2MDHGejITf99BMJa3ZEXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsXbV7KF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsXbV7KF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 272DEC2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 17:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777398094;
	bh=G0lbtirh9B2m4m30WAKbifWCexx1AGFCgZO3NG4bi0M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jsXbV7KFi/8dPb8FhIW+tkyHfnF3IH5+jyI1r3c0jSBPHyLMsZ3elI7W+AXThZTYB
	 Npy2nQKlQMM+9jtVoOF1lPD3DU9IoON0DQXd4w534dFsn3C8HZGJnEHtevk3EBsU70
	 1qFyO5dnCWkXm7p28wYS1Xf8S+c6xu7HwcV1mpzT/E9M1ykKGwpHM12ZW0I+gktPzt
	 MV21vAoUw0kueT/AZGhBQiWrgpMJLUPVQFPK8cH9wvdFEJrYCx3MTtXchDxmYxLUO7
	 naopA0qU8kgSlbj0yj+i9TICZILQiSspDOgVDszBEcBS3JmmLU9ToV5bfuhaM7IFIl
	 Z2yxv+B7A/gHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19DF8C3279F; Tue, 28 Apr 2026 17:41:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 17:41:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: metalcaedes@gmail.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status assigned_to
Message-ID: <bug-221383-215701-tnYDvGSlMA@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|drivers_platform_x86@kernel |metalcaedes@gmail.com
                   |-bugs.osdl.org              |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

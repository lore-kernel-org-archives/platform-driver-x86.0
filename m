Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB845143C5A
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512866; cv=none; b=XtwM0TF+RwPAxoXb8e7bzxfGDTC/qwF2lcr0PDmfQv62GKpzCnKvvN+r3TVhy8A2XHcsC0rrzC5TsDNnnQGTbo4t8ZPKeVFx1oDx9b0ZELYKFax7crb7L6WogGveMgew0KWkrDMOhRAXe6DxCAjn5P5OIt2DwURu2Ics1mxta5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512866; c=relaxed/simple;
	bh=LGbj8cCsGZ9rbY3Zr4f+pOWiwwkopLtLYoNHSZdWrBc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FSAADJTk9s2mfxlZD+a4uTWNbCPjWtfvTdfYx/yGAB9zgo6HB7bgrLZQRIh9zwKLfCnDT9JaI80cKw1NiMIsPOlZAW/Mec+DkLIXyW+2ygZp4HTspOE7axQIQcn1zeOkDnhUaJ7kfYML+i3OT+8oB51kBX9H8zeDffaV48LS/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKImksQk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKImksQk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C8A0C4AF07
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717512866;
	bh=LGbj8cCsGZ9rbY3Zr4f+pOWiwwkopLtLYoNHSZdWrBc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nKImksQkFISFi1rstrB48+sre8Rsex4TpH9TMqKWDaxY7cCSrbqoXMjsZaj62oDNf
	 7KoRGzc6FCzHPNONGQhZ1XkIRD68qTpdx0mnqzu9Wg0evoXWuMCes1DSEGAznpoVH6
	 B6Sv5YtzPiaadOm6+3HDn00xh0JEj0QP0OIeF4s6sSCV83difnQ64znsUZkKViXoZG
	 bh4FM1MlHMo2eeRYdbHK4KpsWS5Jaj0yFtLe4kMl47OhFb4h3bu5zLttKrVTmSFL1t
	 6aJrPVQVboIDQr+ME8HKkoEuIwq7IqCBTtQcJZC1fpHQ9sJXd7wp0oPMIVKDzU631o
	 YLn5nL/aMaw7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14F7FC53B73; Tue,  4 Jun 2024 14:54:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 14:54:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-IqnqwWguoA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #34 from Armin Wolf (W_Armin@gmx.de) ---
So when you disable the keyboard backlight, the ACPI 192 events stop?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

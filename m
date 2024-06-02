Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85E482ED
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717342764; cv=none; b=hykZoGCkZURxkeYfhbMz+IMpiqPH90mG9PTB6hvwwXrEfVJRThlRUgEOOISdmKe3DGtGxgpVMGJDQXzZZmiHrGk1YvomLONYvJ/rPyX7eXd1wQYCTjDUsyb7UV4OextDcwQO0wz0fAbzwwBZhGqD0nPDOapE797b522ws86EL4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717342764; c=relaxed/simple;
	bh=0OLuS+JcirviOEe3iuTrfWreIFLRIXlg0sN91EQNkJ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ansIO5G0I1XeYEBt4rgVs+ifHMidyNvuOP7QjVUeSOAkfCOr8QR6QgKYFNRFmM2Bye+/9GRpbBOXen1jPDhVxfbh5Ha7T19ds02YHBF0JJia3VOB/j6+FAJzXD6w0Ht2PO+DIaUvo6UFT0cBQPuhqGWmd4FNc8zLQsA6cSbsU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jaO5af6d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jaO5af6d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 090E2C32781
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717342764;
	bh=0OLuS+JcirviOEe3iuTrfWreIFLRIXlg0sN91EQNkJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jaO5af6dBvx5nQm4nNtwO3l4J2W0l7c6uSXp6KawdJ7StEBDLMbWgwIY0JFEgun4m
	 G5s5tlmhP4SNNfV988JIIVul6VcwIyTD7oThXC9XKM8UDXLDGJeOjspqMv/+UEC2W1
	 QL1kH6zoRYa/zalF2mBYVPLbXibowpDGhkrkMw159RHgC1WH1iBAgeD6kKGC71vNCZ
	 N4mc19tfqRRsJCcf+9iiekbPG1kkoA+ODqeShMUAPhX0+iez1mBgRrwanfqVB5msWL
	 ZPZn7Qx3bU1vNHy2DF4DejD91887xtaWSrQDrS20IjC45x7fjHwQeKRyvKISik4Nas
	 JJLgzLM8cYqbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E53FCC433E5; Sun,  2 Jun 2024 15:39:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 15:39:23 +0000
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
Message-ID: <bug-218901-215701-W5XwyHXiDb@https.bugzilla.kernel.org/>
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

--- Comment #20 from Armin Wolf (W_Armin@gmx.de) ---
Regarding the FN-keys: i think this is a different problem. As soon as the
lg-laptop module works on your device, we can focus on getting you FN-keys =
to
work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

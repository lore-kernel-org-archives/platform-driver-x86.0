Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F355E1E5B9E
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757851300; cv=none; b=Dz1/30/Q9haI1EiMeG/ccz69JlEINtA3jhhyCuGEYxyGse4xdb5v5N6NImIMrIp3jvei4185GuAF63bLla9eKZQOIwv773KuVZfX4sGXtrYVIRFc5JK2aClqQORciG5cW2gvcx2NKrIdqzaaDRKl7JIteMXWFMmiWWuc+4yIiPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757851300; c=relaxed/simple;
	bh=xfUqn1Ld2oGyMrjecDTXzGpZQb/BO15W/R+58PG7AS0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aA4TAs8OAObMTFajepfDx+gqACbIxxXTgBNwfvNB05n6hz6OQO3XWOWJdzSDfLarwdwK9PTzxhvGx8bJZEnkkS9psO7CHp9khGLK4hRdkb4gP/9LBGwJ9UEnhuhkCgxNk+MOCsEJO2fYuSr0aVigP+sYIJjj9Glcen3J1gTkCk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqGSUjgY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqGSUjgY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D479C4CEF0
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Sep 2025 12:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757851299;
	bh=xfUqn1Ld2oGyMrjecDTXzGpZQb/BO15W/R+58PG7AS0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HqGSUjgYjlT9JbJONT2qSlEu5AYklckxSlKISV9YJOmvw83u4jpOAUnfrCLBxzdT8
	 aKkXtvczH4FMPH5eu9I0R/Wg+RDDzyDtRrkXtMmGw6UBzO/TMBmceYJ7USTCJVnzmt
	 7OwBDF1e7IsGl0NMvAP95ERPdX/1g4np4M2t4E9gZOBsRLEFzebvTQwq2G1h1KvW2i
	 yfMHfhg6nq0pzTl/z57ODN+eLV4uxk+CkXkp6IkKtEfEfgcDmItFrs4C0ZKW3INE2g
	 EVSwYUg/++qKNZxfWQwxc17p7yNkIBrrN1bEMoHnxlwww9wZ5KZ6wbt6imN+5G5nik
	 302cEi0sLmeuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6476DC41613; Sun, 14 Sep 2025 12:01:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Sun, 14 Sep 2025 12:01:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218305-215701-qbLcxt5o6h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #308671|0                           |1
        is obsolete|                            |

--- Comment #119 from Mario Limonciello (AMD) (mario.limonciello@amd.com) -=
--
Created attachment 308674
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308674&action=3Dedit
updated patch with two quirks for HP systems

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

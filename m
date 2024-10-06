Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619384C91
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728212951; cv=none; b=E9leOszpd7asmmtDHD75aun9OOI3Vbmx8iQLs8fRdA/0fqQmQgTkpbPDYyEDRlNZwPBpHtZcGm3U4SaR6MwP/zdh/funK18s3BFqoxrPP8AAWDqtPQz6F5c6RDxe32bxbVn42Q8ukvf9UQjOVJWs3lR03pP0+uTx8HrHHT5lDC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728212951; c=relaxed/simple;
	bh=CRhgRUlggKfB2umvdV48H8HZtxge1XYnXhpS56W4i/4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TQirrqBuWrYDc1kpoWSSBOaNK3XwStdqmd41wyK3ILcDU01sIgjDk/m/TAZ5CC64ZSbG8b8qQK7b2QIv5GAgGQ2qghzEZBWYceoNbJiVOw2IJr+A2d5JlySuXibvoolAvlnk5yBRN8zM7nerxWccPhxNtEJM2/dZC3bS3jAEk4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4SflYrk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4SflYrk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2B3EC4CEC5
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 11:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728212950;
	bh=CRhgRUlggKfB2umvdV48H8HZtxge1XYnXhpS56W4i/4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V4SflYrkKGeBUxOGlxLqYdSiodakYSm0mjXKMNm0llTQlIr9i2jE8rik8OE9Xyaiu
	 kgLfGC5K+Ht4DvGwcJ+swmddD2jKBy9XoaGDxgKSg7qpWY334fq5LyH4oQikueTTqv
	 ENHnV3ZozYPBRpjISQguIioVmkih3ozDp8Mcy9aYpMOAow8i3ohkPT87Fx15OIyKKp
	 WbWzT3IR3DHNd2DrjA8qAsXHLsnbqBnrc0N94yvVl/ls7k5+AvNxfWr2hjSCo+fSAW
	 7fBUIg4E/Lqpm6XjDG4cJ2GL2JIvO54xecyGlLGT3djYgtltiX+EKAi+adocQRFaA6
	 koK0L+tRvD1aQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B460DC53BC1; Sun,  6 Oct 2024 11:09:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] [BISECTED] Disable ACPI PM Timer breaks suspend on all
 Amber Lake machines
Date: Sun, 06 Oct 2024 11:09:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219346-215701-1ZlXjeygXY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219346-215701@https.bugzilla.kernel.org/>
References: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #9 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for testing, the fix is part of this fixes pull-request which I j=
ust
send to Linus:
https://lore.kernel.org/platform-driver-x86/280a792b-ec54-419d-8cca-17b020a=
38d3f@redhat.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3CD38D3F6
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781299646; cv=none; b=PpmEyII0hHqX2iHR8knGkhttQ3H1OaYX8YCtTy8so21TvVw5pEJfQPvUzcfeiidQwoNh5lk45je9C4/BkOTyN3IrplvB8BxV4LhJ3UNB3z4b6VtqEzhGY6DkxOaRSs5bN2ScpALl3ekguZ7jtkoajLFZ+SZRwRWHPpiV5ugq4EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781299646; c=relaxed/simple;
	bh=sZNI585OrlXEVEW9Ghm4jZ/69+/p1OmlgD6PbnJg0xY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X2ma3qBPoSm3EHU9kuMNlzaAxbTfITyz0kKT9AmNea9VwkhNDSU6Zu+/SwsJXigrs2PAyWhDTWJ9/hiwVuo2cbXFRzcMsi8gRKhXGfYJgf6yl5wbFM6Yy+Kt0tJdsM8+UuE2Vf3wPeFGLt2a5koxc3W7ymFdTKNvY2cVjf+yFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN1OtOMJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN1OtOMJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6760BC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 21:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781299646;
	bh=sZNI585OrlXEVEW9Ghm4jZ/69+/p1OmlgD6PbnJg0xY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nN1OtOMJxouiQUh3l9KNbHxwJQrUFja0UbrSkefY8AfcI+sTaEJ8o9XiT89K1Rn93
	 3DROsndi+IyoVcrlHkgdx39Pemw0dolDTjG2RdTHsv2lYGvrnp4l2HCpiIcrpMquok
	 2bGESXW0wW8Mff5VUxqAxdZhPCTJ+JoBIxlb2vGuLQdOfCZgD8k6bgoyW/Bz3gwp6I
	 zQmS3JXWmvl2slKkPKM9QLZv3+gtzJsha8xWea2T8yaO6oDlQp8GSKOnjQvib6QGk3
	 zEehMzdFgD+l4Wa9TssZ363WcG3uNMO4z1pp413I/gC//gKnGQja5BmLtZJsaNPizK
	 quaXGz7TeyOdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49282C433E1; Fri, 12 Jun 2026 21:27:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Fri, 12 Jun 2026 21:27:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218901-215701-SZeWHcrtjJ@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #310276|0                           |1
        is obsolete|                            |

--- Comment #95 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 310315
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310315&action=3Dedit
Prototype driver with improved hotkey and keyboard backlight handling.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

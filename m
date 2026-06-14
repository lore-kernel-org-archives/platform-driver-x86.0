Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6273A2192F9
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 19:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781466997; cv=none; b=CcEg925OHH8LayeMCLm06vkTXXZo+haDeQpHA5+IMxlTn/7Xzx5sM9LvcvvrTyMwCE/B0banLHY/512rGVsIrc8xFyMVaHP+0U7Hv8FIOBQJFhMAs7jTsXoqErXBQOMrUeh07g1P/qVBm6FYAojdCp0Q3TIOQO8U1azKjBbjwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781466997; c=relaxed/simple;
	bh=MQLFmAPSUeND55czNaPmiu6CGPBwlcVyOTA9kK5OpNY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Grj+s+iVn6XisIcMeArX0frG+dWdmLKEpvlBSKwYaO/BiveVnC5gGebsKhg6BRKAS1zbeB1xPgzYgB4QfAFXNeH0lxaN7XybpVVXs5sRt1xfBEkcYn9rF549sAHL8jSgXg8AZXK+3vWH/GXPl0ioi0Aug/j1lnPJa8Z832Ur66c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=re6yoQL4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="re6yoQL4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D529C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781466997;
	bh=MQLFmAPSUeND55czNaPmiu6CGPBwlcVyOTA9kK5OpNY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=re6yoQL4pKN84ewO7oM+c1z0gPYbZa3ilIxoyOWXtv/Ou75V6Ko3u/PDaTD8m/oVp
	 T4AZxJKTCXAmz69AC6Xl/m64UyjMW7kSeIoIw+/7NqP3Xv9XVU0veRoDEvFdTpqFWs
	 XrG1xku89+CZPg5TFfnSkGoQng4BFNBL/gqAN1oZd4pU/9jd2/hHTICyVEoMOicRKQ
	 tsyCdS4yqIuJIdG7QwtBk8c5w7DOcbl/WrJrNhFuuiSUntRHtPOrajAngP+RsJVa5x
	 EFcxoGn07uGNZDeYxc4HUW1/y/CPoDf2m3MdIyfWrHzf+5ypsuUBCswIXdJ30YBkBP
	 F8lIJsCCE8PmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0069AC41613; Sun, 14 Jun 2026 19:56:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 14 Jun 2026 19:56:36 +0000
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
Message-ID: <bug-218901-215701-pw38ZnJBn3@https.bugzilla.kernel.org/>
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
 Attachment #310315|0                           |1
        is obsolete|                            |

--- Comment #99 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 310323
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310323&action=3Dedit
Prototype driver with improved hotkey and keyboard backlight handling

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

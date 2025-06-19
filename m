Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8AD2248AA
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362712; cv=none; b=ealGBOXWO0bSlt4t/017hus7o7l0x79Z5ynlNDZ0htl/GQcSj79tdRRcacMrmNi2JWTMBbXTZeUZdIiXLDACSsTPW9D0ChzHhUfqngWFmxuQr5qoCrRGfjD/ZDdUkp/4VHk7niHFbGNRIQ9fRoUkRq+R6mUiZrZFxvV7itZfz7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362712; c=relaxed/simple;
	bh=YVNlD/BFTzzYUtsOdxtatTSRWBzAUaL3c8ScvwCEX7k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XwI2Q8tyhyxsJ9YMzitL+BRn6blvL8cS/gEK84SAZmVk0BqzCrqj8u+cVZXwAI7aLPgEDxLBL+05P89o6B6XFWdhKAzh/2PJzpexl66swJ/6wEwzeCwDzqYXPCrjfQcn3KzWqcIXvTbvS9n7R/W53tMcDJb1OTQeZhETgXLC1K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2buWZst; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2buWZst"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36DEAC4CEEE
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362712;
	bh=YVNlD/BFTzzYUtsOdxtatTSRWBzAUaL3c8ScvwCEX7k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R2buWZstr1tZF7XWHBKWLlxrzH5Z/rUvZ0sVbNma8sHzheGMtvmcY1S6fknm7wpkC
	 aP8ENeGoJTrhUB95fjibcuZsGUwNGYcWAOtoQ04jESE6qOLGM5ms6vxuIJ3vLOvOlk
	 U1GXSjGan1SlecayihBkeqMQhYkf1s5IL59GyadvIdfEIHMIpjKg5LIqQN4AA9cjvQ
	 s64Mb2RG4x5N7gY7MtKoYnPwlzuCq/r278v9PiYahffiW0fj8VTnAF8pQUZGjZpYyH
	 V8bionBfewKit/HvV84btv57PbxlX404OeqKYrxy+zvYi+kiFIMGOC0yHpfuxhHC6z
	 9X72SQI5v3ZYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2666FC41612; Thu, 19 Jun 2025 19:51:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Thu, 19 Jun 2025 19:51:51 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220246-215701-b6K8oUIHsP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #18 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 308290
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308290&action=3Dedit
Prototype patch

This patch should fix the problem. Could you please test it and report back=
 if
the hotkey event works again?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

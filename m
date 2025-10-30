Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881330506A
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761838734; cv=none; b=GV3hFOwkVL/o55pf80bE2iVzjrS1eZnPZmn3whVsgYIkbUIK4qQHxq0dd7M7aAlp/b4yMIglrzNal6hN6y2Yn4PmE4tCxhhV9aEAYchVaf2X29wURWVIKYnsei15gAkjsyBlVwFJPCzKiBLsDUP4M+AsylFLpjvYVPD2IpK2JUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761838734; c=relaxed/simple;
	bh=ggo8sWHzxG7h2fQ9eh/hU9fY2bJFv7oVsr5ElzSIOr4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j8O926YLG1PfXcLzJb2p4b4uWQqpY8CIzZeUWNtK9ygvMgW5lS06eP4QH1iS/o4JHwWIjhuB0p0xe/3sTK2pm4nY5qDCmB7c+drQO6FZsPHA23KtxzoWXJLqewyChK9NSerDJvcZz5ijIc7Owh4Bqt/FK8XgJgnlBzLSmGRmUu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKzJnGqD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKzJnGqD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A936C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761838734;
	bh=ggo8sWHzxG7h2fQ9eh/hU9fY2bJFv7oVsr5ElzSIOr4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VKzJnGqDJY3COdguFkoTwTL26n6xuuhspJeR7cePcQDzguvSUB1PzogGyu6qEYcnK
	 xUPJHQk98/USH9VRQD2TkBFHeh4AnyE6fumcEr/lV7MZ+25z4+4jr5bZcdceAWEoKI
	 ZwPHTaBRZmUlDf+4eDooVgRZyUncZXzqfNXGEhXphP3uXmV/x/YQlmTDT/JUyiIoY4
	 IwnyIIBsuzzw86Z9Z/D3PyM0rGRw/HpsFas2aCow0QjDH4dD7S32S1PkhAUNxjx62M
	 derkaFZAR3OiGEwTJrPE4ypKUVyahaR+K40F4CJKUkguu3ABXyZ6mHgs6qalM9ENJE
	 osHYTKZZ8i+aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 03E30C3279F; Thu, 30 Oct 2025 15:38:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:38:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220722-215701-mq7NJWInWi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
AFAICT his touchscreen is USB, that quirk is for I2C.  We probably need ano=
ther
one for USB interface.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

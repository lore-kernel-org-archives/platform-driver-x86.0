Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEE716C85A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712760360; cv=none; b=YMZcKxZo6c+r9w3A+VSnodEHcO9+WGfDEC4BUBJWoy9o8/sjZGTffHMvbUaBmKePxP09SzXyRq9z3B/1CGatEpweZSqmAaJlYE+PjYe0Um4uFZ0PdPTGl5UwHi6mvYU9ucAbfNGCF/e87DDjkMCGQeq62ADwJuIS/OHQK0PYubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712760360; c=relaxed/simple;
	bh=Z8lLqAWU8+Yfz+Oo4Htm5vrViINkovhNzMjboBcSz9Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=okzPwxXHC58qCHiPeVdQd8jRtTOeedulj3cDStnvO8K+DljYv+9OB2z6fq8VFQn/rIR9FAxASm+WsNIUrWvWK0Wjb3D5D95PbVyfn3Y8fly/4tVQ/szrQA9/OPCJrUKt+5UFqqeolUFnBzktqCaDyoNCqiMI0A1+kb9IuhrA46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dI6DZ+Hm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI6DZ+Hm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B7CDC433C7
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712760360;
	bh=Z8lLqAWU8+Yfz+Oo4Htm5vrViINkovhNzMjboBcSz9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dI6DZ+HmOewxaWmn9v8+IV1LlzJSxoVfk4rwdn5XKJNKSaY6QGCFFUj/7OjivscoS
	 p75N9DfhqhuNV7n9ffSIdRmnSpZFMtdlf/wF76ofw4kbPOLEQ4lf5OMXUxAa4+nItn
	 ovxmiWSgnNFzJLOLsM1FbT03qc5PjkKnsB0K2TCNLw8FAY7uKbdarmzBrjFPW+ieQI
	 7v+bm6gj9OqlD4A0qbjDdrDVe89y6Y9FOw4TrOji/KsnPmWqdbz2jXtUDRl03k5UHu
	 XyCVkCk4fWi/vT0jsHa+0iTv3naTE44r32ggsyYzduKDNeyyNb0PpIqvKux+imoRoa
	 qUvOHcWrKgR7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 26414C4332E; Wed, 10 Apr 2024 14:46:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 14:45:59 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-K6k11k0P1o@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #36 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Only need dmidecode if it doesn't work. Doesn't matter when you call it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

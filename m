Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8B9260565
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 18:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153134; cv=none; b=DLbth7nj6es+wHc4v0xjrMSFqTq++Mz/XoOEIVm1WkrHBKDjgCv/R6xJOziWb0X7hsluUkcdR1vhvKwZ+fVEMAqSpsVu0DPQpYf9j6cZ67yWPS9RrZ+2Z53PLzqt3nRfLqONNjLhxCTji4Io4TsYnb95IgWg9j9jYkRWmpMHhDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153134; c=relaxed/simple;
	bh=eCW0Xx7Irx8w/72KLqSDtEsDGnx0sVXcISbUUxb15SU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tYNzJWJ4VFJFWvmIsFQbv0PZrthi4vddO0PYdudwO3vazbeK+NNd5lrBeebHq//STlgM5qSNspCIxLYv59ki2MCuXZGr78+pcGZECoQtBivjJgSl+uMmSAgf4yQqb3Wtcu3Vvi7Y+H5nNttPi2NwR3IiCZJUIgIsVt4e28mxREo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rt7eoLnZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rt7eoLnZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0079C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782153133;
	bh=eCW0Xx7Irx8w/72KLqSDtEsDGnx0sVXcISbUUxb15SU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rt7eoLnZKdkZkyV/0nkvXR/FIWi4NuL1PdZXrMnievi6uUEknq1HdgtmS94VSYuK7
	 yR/bSNZ9HtRXokmhIgYeE7PRlC9LZQ3eUw3XAcxNdH73FE1GkRx9sG64cw5sTHobaR
	 nMzgWdqscSXJ5DpkI1oU76/kjLW6uRLHHlNnCCNZtnh0+Zhr/15HDYZmKnfGAvEaqP
	 C3eee+4y/avaIKW1wWYcHDOgcHmFZvOXS5CrI4U1BFWor5qy8NE/kW2mNl+SA8WVrr
	 +se/DYmqhSVS61BfrFM2g6vkzjpmoMj0S9avZ52vR3pKWnq0/6Khfnx4MCNqE8sNh8
	 3Ii3p1qOv5CwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 96441C4160E; Mon, 22 Jun 2026 18:32:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 22 Jun 2026 18:32:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-9zzpkPP5OD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #49 from Milan Oravec (moravec@ukf.sk) ---
Thank you very much! When is something needed let me know please.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4F21D63EF
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737024795; cv=none; b=XwmiDtm3UIMv6P6CoRIGwqCE+mbDNxKdA55LaR3ii+WL3WkmW9jOPwYLpHD5IfzOrciT4AphcCON6yIMbjsJlud/WonDJJboUX6pLKJ046ZVN2qJVeWKNCQV2SENKrDCLdCkoVDXeI+QWacEUmqEB6pcCATtgN0pquym7Jly9RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737024795; c=relaxed/simple;
	bh=xtUHe7t/KJbYbI7hi1f8lbQ1OCGCeYyMKaa/HQXHquk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pm4L4gWUMiHQCuhoOchdZ/BGCSpEv5U/gIXRP4XQdXhatpEe9ovGYXyjKkg2DHMqubrzG4M5U6e4jBOy2MmV0oHTSdONTzQqwtTH5aIc6a/ueyjEHSnhFl5los5KhOyDRipAQge6iYyuKj/ivl8menZHkud9Sua++aTvu0YCCVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TR72dCMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TR72dCMW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A78D1C4CED6
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jan 2025 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737024794;
	bh=xtUHe7t/KJbYbI7hi1f8lbQ1OCGCeYyMKaa/HQXHquk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TR72dCMW0pZx5ntsRb5cci32sm5iaqG9MxvdpeIBquH4jmu+yNjxAGUCJ71lPrgnu
	 j8bL+SurC8JuZ8ORryDMFN4tG+9LfiyApJgtB41dJh+eJxf/S4eCdIDcGp6JkeNhZp
	 vxvhA2pqzWuJhc1gLEtlOJxwJWcUdWJ5GCG7jL9hlIcAG9c9+VCs6efOfWKBk7iQg6
	 ZyGB/9Si3SHINZGhryn4uczys3C+cA/NjiK+idu/45tAhm6QdMrUsPo2jPTlNyEWEl
	 9qE+cmns+FDW+1EoBGYxmVEdqpE+KBlLpGIQnnotBBBdr6F1qYC/v/ac7GQeixZIBc
	 9Af2evB267UvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A1514C41606; Thu, 16 Jan 2025 10:53:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 16 Jan 2025 10:53:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-Almxy72i2U@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #66 from jarkko@kernel.org ---
Through a few bumps this is now the final fix:
https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/comm=
it/?id=3Dbc1f38c38e68a3e2dee742d75d9b08c8e2839964

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

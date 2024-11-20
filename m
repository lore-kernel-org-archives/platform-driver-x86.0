Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3918A956
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732094138; cv=none; b=YCkaR1Y9/0BETsv+mJ47Xh6mgZUY0Y35vkESUA3TLuINUikM7KptY9xh/gPIhBV//aH5I0Q2l3WA6rQvGVQVv3RqbllOwmkZUhxqKGqDQLjWE6HYinOYyNNlhNNFTpw4K4EC97SLT3ik0QVkO00jKQlm6oYq+dcJvJhCATUhsuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732094138; c=relaxed/simple;
	bh=4Po75xStpu46QO3CNsqhDs6dD15lkTbKef8xFR2SyE4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EQV7fby1x6AsKTGlk3WO+NbrNLsr02J2rUrtKlHbINly3ZqSP1CJxR3vAjKUbcTDLNFJjnSXJQWGcBHMLe014kRau+1/3KHia7mfmh+9dxlqNoAGbaknwvZ9lLUAayQwoaal6aMu01gnqUO2PnFePp8/D4A1jrwCOOiEFk+HLbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f04SWMER; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f04SWMER"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 139C8C4CECD
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732094138;
	bh=4Po75xStpu46QO3CNsqhDs6dD15lkTbKef8xFR2SyE4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f04SWMERT/rR2NkwSsEIDhgRKHEAuMu0VTbyl69mIJreNTZ8A6Ct9wu7h4DFWYTnw
	 ZFWvyLbXdR7rmlk0XtdvIeODMecPCFL7R2oMc+npKbcOUGZc7pobdwM31/txZEfZn7
	 /P1IIN/hSig87rjwU3wLHP3YRw62MWHtVuLblsp7suxMBqWmd4VLgdEdMu+gnsaGRJ
	 kHgHs1oZyYcf5ihDkPGO6IdEV3ET9T3UHvomhyIf6JOHVThmyvHY0Yqt+MZSKDEJNi
	 1cguiJUSosSXyRI55fY1vaB38kJe3PUudFGNNC6f/8FBXf5u4KZqu7wzttayRv4giL
	 F3QjeflxS0Qqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F2096C53BC5; Wed, 20 Nov 2024 09:15:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 20 Nov 2024 09:15:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219495-215701-6ZE9tsMBrU@https.bugzilla.kernel.org/>
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

--- Comment #14 from andy.liang@hpe.com ---
Created attachment 307254
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307254&action=3Dedit
V6.12 dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

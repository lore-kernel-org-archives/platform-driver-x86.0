Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A103ABA3D
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 00:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780186286; cv=none; b=rnNGDv9sJZOg8yjyi9a/gmQvKJXYAtxgGafcAuvF9LWhZ6wdgwoszDXuc8kWHoDCg+Qg1naZWeZ1oXcRDtH2L2Kk+xRky8MDog/18P2ukFcDMld9xNCM0sre1iiDfurFcw9N4aKuOWzsr//1oLX9BRFoe19mIsrKySGWhP74E9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780186286; c=relaxed/simple;
	bh=qMYUm5jGa8sNzV07WCGxLPgwvOq75wgaCLJCaUMd5Gs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V1ngQ6zGYTDn3OUshemyJGG2LJESizSGTyuIXjWFdPwApH72HrYwCXevzJ9ZCxlNHI5aILiqIAodQ0wU47CCDyGVE17u/lQQ4OqtT2KTJ/qPIKB5S6c+rYutF3BiqLify8OkSlU1oNyjNZLcFdDe+cOM9bHnnIUUB3PBiOVxTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mEjqtyC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mEjqtyC3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 386D7C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 00:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780186286;
	bh=qMYUm5jGa8sNzV07WCGxLPgwvOq75wgaCLJCaUMd5Gs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mEjqtyC3T/XwSPFEJrMrRcVmTodlRWzBMtk0TLb1MJ8dcYKo2aD7pNmVTUmBhAKxp
	 cOoMc/5tguaiTHE6meZDz1mD7t6okXACQtAU+aLT/w0LbknWKBOTti3BLkxddxDbSK
	 GNul5Whv7clpMmHjJq/hp2WeAIvI93QbBO9y5B1ckCHT8d933Y6uOyZ8f11H8ajZK4
	 QJ3awwOtCDfIs364BcAGPR0S3VHJ33R+Hcv3eUAe6vuYevhJ3QW8akkEbKKp4/jWas
	 EiJ0mseMOccLqSItJ+f6+DqYUgbEoAMYPTMsDwdMT7ivaGvTwlgQGedis9qNioABkX
	 GICHHBb3+Q3YQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14015C3279F; Sun, 31 May 2026 00:11:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 31 May 2026 00:11:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tacodog311@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218901-215701-bdQJsyOEf1@https.bugzilla.kernel.org/>
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

--- Comment #59 from tacodog311@gmail.com ---
Created attachment 310219
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310219&action=3Dedit
acpidump

"acpidump" for an LG Gram

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

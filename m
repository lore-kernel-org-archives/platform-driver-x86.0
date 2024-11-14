Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1043C38
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 04:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731559729; cv=none; b=osA4vlsn/IgNS9iPip+IqtEw5hGpbUvT4VgVQK7kstDDz7WE2pk484quTOCConjBjcek9Z6lKm2zQprcH5dMX9TV+y/4KBH3LlGyoT22AZoT1GwIrjoxMBiGXkuwtr2Pb0AvRAMXv382ZOXLiTp+Ie50btACVrV3kjAE6gXmBTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731559729; c=relaxed/simple;
	bh=Wxw8iBVhfiimh4KchmYxUAYv7bt7eqyl2a8d4GmK3bQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N8YL1kLwlBo/HauYUuo9WAjD65UFWg0DKKUuF0zPKRgqrASCWSw6dtLbQGSLwernfV6PR/7Pfyg/CSyOw3ykbuRqFzP8kQBPAPSeNNrnhFr6oH1zexwi8dFBLfbewNH4VNcOmJYEawpdxqXmbF+Ws+ntIYlgTabi1eORZdJqmM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXhhozYC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXhhozYC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0118C4CED4
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 04:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731559728;
	bh=Wxw8iBVhfiimh4KchmYxUAYv7bt7eqyl2a8d4GmK3bQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qXhhozYCFl1TrO0oEOgCvCf1nRdOQ7lCH1DZJJMEYCALJX/qqHXJKFZwjCXAT7jSg
	 9aCfzrL6j0+Hk3p8Q/skrc8mEA5ZNjuTdEYsoAVKR7Fce1ouY2UQsNEm2OvVj2o7o9
	 z+4+jjXU3QYMjamOVmoLsBzaqI/o3ftzo0kKS5nbO3XsPg5C54ZJLnx3tiApZN8sP0
	 e8nonedYt4spKHIL6lSbVsClcOkvg5pJXWRyYAfPVnOvN33BDcL92DZBdAEqIC5g3x
	 NjRZ/zidOYITYhwopocVZZOzVYUcBceWL4OlT9lJ1i8+jn+aCC2l0N8h+RyuLORxQ/
	 w0dvIEPAtt9rw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9DB3C53BBF; Thu, 14 Nov 2024 04:48:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 14 Nov 2024 04:48:48 +0000
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
Message-ID: <bug-219495-215701-kY8fRE8J92@https.bugzilla.kernel.org/>
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

--- Comment #10 from andy.liang@hpe.com ---
Created attachment 307217
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307217&action=3Dedit
raw binary_bios_measurements file

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

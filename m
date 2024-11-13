Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021BD185936
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731481554; cv=none; b=fUcSMxc05WcovaBFNeX5/LI8OKEjApdFwGk2GIQKpocMFrRlWgk+MKbyXqeCarbJfRKd+wXt+uwu43e2d7T2vuzwFE2ky98B1bOBjpeEr0bH/B4InzPc8llzQV2sC+7cwW0nNArt3gURuGSJDgRpPKuYW4N4IKmiPx9etEwBgIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731481554; c=relaxed/simple;
	bh=s1azhl2gTNI3KeotAVX1tekD9LdixqdfD2L1eVbbryk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XFcLHJ6wTxT4Va/O4/5bdDjIcGbvqxUBLZhda0wsL7ApjvQaBmrt4Edeqlk28FdCiAW/Kcg/BOp/9axg4sefzAbZ9nhJrPRRH2lPnnKioHb/nhXBgyipQGflgQGO1C9GNgjuVfW1nX4G3FjRnCjh+oEF/4N4lM5hDLp49HUOf9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUC7hjTN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUC7hjTN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F5A1C4CED0
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731481553;
	bh=s1azhl2gTNI3KeotAVX1tekD9LdixqdfD2L1eVbbryk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qUC7hjTNeGyaJR8GFz5MD0xoeozY7jbTsNUJSwhIRFvljOZSMrvLGSGjl+645fwbY
	 3yCHih2zca24h0EJuH3gqplW1Sr9ldHGyFEmJB4XQtwuBtG+6dSJd8bWsgqj6c/hTz
	 +RIoFos9Pj/uc7CA8Z3nz4tsPec5HPTvdV5id+FveCTN4/wQlVHsshltqJ5z2ohB9h
	 HrYEa7WmaCrfS4U4UY/QC2ccXRhmytQHcN3l83Lu7n7dwdbyNY8B+SfcTyKljB3PjB
	 1ksSKPP0GZZLHFjAgI3OelVFFsyO3UFel8fYR3xI39CMl1iXOhMssVxC42pZCweuGc
	 K/KTkB0DEZdwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 62A4FCAB781; Wed, 13 Nov 2024 07:05:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 07:05:53 +0000
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
Message-ID: <bug-219495-215701-60qT3QA9Lb@https.bugzilla.kernel.org/>
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

--- Comment #3 from andy.liang@hpe.com ---
Created attachment 307213
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307213&action=3Dedit
ACPI TPM2 dump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

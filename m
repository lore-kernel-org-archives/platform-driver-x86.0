Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33FD21345
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734881226; cv=none; b=WEVxUQBwxz8OwIYUYTREd05qALqZrHZJE/IUr+vsXeZHvBnVW8HtHN6GFz10j6tzG4MxQ2vYrqafglLATRw+IMnN+KJxrL6VFZWh3yyoAS/WfQynocDTG4OSQwiWZTJr9bBP3yusIYk1LztKf6IdTMZoLMNKO4DLgapuWS/CW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734881226; c=relaxed/simple;
	bh=r0rYf4WJHEZU4hmncgrtkyKxPy0OOD7KtuDxd68h3Bg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lp1GTkBMTQkGGVk1Ud1HTidHv56aiWeuhW2hweURTzgdA0hCLV+Bl8GGoAgzNnFRdxx6isiSPauBcjmJznh3P4qFfdJ92sIej3QskGBuCPT3WdGfugz12d2eQH2R75gCgbGIokBMlqI8XPayDT5uv40ttVOkPzvY9B/ZQw1k+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+9J1qR6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+9J1qR6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CFEFC4CECD
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Dec 2024 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734881226;
	bh=r0rYf4WJHEZU4hmncgrtkyKxPy0OOD7KtuDxd68h3Bg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o+9J1qR6k5k4E8jUoqi+10AUIvVDTE7p5tG+zhvq/8P3v5JenKl+qUSxGxfmJRP0r
	 DkzImjydGkTLcVhAzPmRmUNaPR1V+Bz3XnuUSxblVdEpMUPPpXi82ND+WbFvbZMrKz
	 dOslhQRGYLnNblV77nUc1PYfsmtPcAIox6NPcI/TE2xdmOVdQkzJS54v0/TZR5UhCm
	 fwhEvRuTEmrjgOjIGtDrtpF5+40z8VeBJyRswXQtqj+QaE/82Rspw/QPUX6tn5Tz4I
	 8p8iqeK+djFU8+mzmA0ZjIzALChBl0kOONuCkL63XFgQTeFRtKlG5+2tb97wnXRuaq
	 fhXG0xvxuEuQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 36F0CC4160E; Sun, 22 Dec 2024 15:27:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sun, 22 Dec 2024 15:27:06 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-219495-215701-2NZ3roySJu@https.bugzilla.kernel.org/>
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

jarkko@kernel.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307384|0                           |1
        is obsolete|                            |

--- Comment #49 from jarkko@kernel.org ---
Created attachment 307385
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307385&action=3Dedit
[PATCH v3] tpm: Map the ACPI provided event log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8946D17E
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734740470; cv=none; b=jNgMv66j6srcsZgCL/zIdjarXXFptbFrY7ypE1a0N1NuJxohz9zHOoFhyl7+8NCgczADBI4yAraN5R/SS4w0M8UQ8T9JHBhs571/NSBr5D8kc7FuoTUZaccpCX8YWn2kXNHTioFVJhPzRoFbzUux/G87zjz+edsNRhcaWvFqI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734740470; c=relaxed/simple;
	bh=bChdBeF+Zc3ZPKCm+XTaZWI9iiHAw+8n8oixIyPoO6U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fUbMl8gxS5JtPBHn2kNOTWqc4+fKbNpfzE8N60zXDTjmScJVAZx68ljerv+/BxF8wMlPmXbPDNUaVsCDBWqCI4cOO47mCIeIi8TtUXozlSReCz/1Jcagmwk3WU2+vGVW7wzN91z1+U1bwh/A3GsOpb04hv96Ctr+ofD8+kpGja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L50qrkPc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L50qrkPc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05EE3C4CEDC
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 00:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734740470;
	bh=bChdBeF+Zc3ZPKCm+XTaZWI9iiHAw+8n8oixIyPoO6U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L50qrkPcfwqsDls+YOriUk2AkgUXqCLUygEIAXu2DH68mG8RUxJsGsSSn17biOf2y
	 pu19R7aMvvQ9V3YOBDhBHxuJPIxb9BRFdAxe64+kmX/LHXmLvl8cB3tlv5fJBYmvNF
	 8bmCMJRkiK3F7KIGpMOVydaZBJbDpkBZxAbz2UTvHgAmN9h8VNJXxeahuZBfkRfSpC
	 bfXifUh3wvU/Zpy8ITg7cHAZPFJQZkTebvUirrJSDJHs9krj1nr+9luBMapBicZHHe
	 m/Q1AIpodWMD80b5F8gQeBBg2WaHlHdS6l+f5PbZD/CsVyX9fcvWIszjLdd+3IIR+s
	 jaaNSOZzzleMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E84FBC41606; Sat, 21 Dec 2024 00:21:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sat, 21 Dec 2024 00:21:09 +0000
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
Message-ID: <bug-219495-215701-JBlKBiPk9B@https.bugzilla.kernel.org/>
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
 Attachment #307380|0                           |1
        is obsolete|                            |

--- Comment #43 from jarkko@kernel.org ---
Created attachment 307381
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307381&action=3Dedit
tpm: Map the ACPI provided event log [in-progress]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

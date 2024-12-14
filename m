Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2B137E
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Dec 2024 03:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734146904; cv=none; b=Jp6Hxa0uC75U+AnSYqFCeBObSNxqXVbxcyXdS3WF/d2RWiN+rouWqbLLIdysnFdL9Hc4nbj3OeQrBgaqeDZQvMvWVcgjd1yTfhdbX8N5kyHvoOrwaHF3+GD+l9/c9JuaF0FfVdSkr/94OBtZoxZ8LVWSXTXuHBixRpyOFp0FIlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734146904; c=relaxed/simple;
	bh=fT1ysqfUnjkRkm5RnjFB7rsiDdwO0Zh0GgmCE8Z4FrM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jCe1tatDEu3DTWLN42jVUD33zt6Gwt3pWAJBIIyEg2Z763SRnr+Ikyj9b38UPlQIupNOfG5rQAvHKaJDYNygkEi1Ya4l+RBDUYb2dBxTXgA0bUnFyQRh3mDBF0iMlcCX8PWEpzQYWjcoAoc6rCMNs9Enq7gZPW1GMtl8vRrsMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAcoppYN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAcoppYN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAE0CC4CED6
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Dec 2024 03:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734146903;
	bh=fT1ysqfUnjkRkm5RnjFB7rsiDdwO0Zh0GgmCE8Z4FrM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SAcoppYN+08iZjyg31up5Dv8xbkReRh2sBM1vCvR3e+NpLJTnPryC7PbZdEBnrqxS
	 vwJC90kEyI+RkVt//GlBFDn1a+uT2qDGdGofyLUNFN4rKdFGm35O90NSSPqaeAiM0h
	 fqCL1IODk1SVAamy6pyrinLK9In0rDwb63AwgDdsEPO1CJODugtjC0MRAhYRqIV/fA
	 3FCIW+7NPQF2r+C8hb/9X36dBqxixsEBU/95EoQazJ7bXymdLdPea7FDkDpEXwIxoF
	 9wTttbQm//+7b46mdKKSk2OE+VtoRoNzuxr+1tZ9r6bJh58tkA7bYtiu1zNHD2HVSl
	 FLroFpssI7d/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9554C4160E; Sat, 14 Dec 2024 03:28:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Sat, 14 Dec 2024 03:28:23 +0000
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
Message-ID: <bug-219495-215701-czvzJjRmPz@https.bugzilla.kernel.org/>
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

--- Comment #27 from jarkko@kernel.org ---
(In reply to andy.liang from comment #26)
> (In reply to Stefan Berger from comment #23)
> > I suppose the binary and ascii dumps of the log are still as before.
>=20
> The TPM2 DUMP still shows the TPM event log size as 8MB. Thank you.

And? We don't and should not change TPM2 table.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

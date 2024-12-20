Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61BEC148
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734659152; cv=none; b=HmDUyshpihvDrBwXesBF9D5jD3l1bt/Z/so225IoVqSjgXXnhgaGYl7ENe6i1FFBqkIKRr60RgFMlZ0yCNFOF1eNs5wPvy9WqZDKlslSqKh7TfOr04MeebCUURQrhbXJFJ7ZJ57fiz6QkD1/frKOBmBkU9Pa8LJ2GBbXjxINaBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734659152; c=relaxed/simple;
	bh=Ipdu1qYOSA+5xYOLucuE5LPyW8QPnZEv5OaiLzSxKvw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lai9+ZoUX5VAvKuj58aV+cqYdOpg0o9GZUZEgZk5Gne48vwSL94HvaQj9SGDD/gWlvBam2yGnFSJh4SP4yF/jlreZuV0WQsu6HJrBAdyU2AIP4REzjtDYFu/Z3nB+M4F5jVcMpGdx0tCe5YVAQMuCQsvY3feGsGzoW6aa0ZKC14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1smQZmK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1smQZmK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 419E3C4CED0
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 01:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734659152;
	bh=Ipdu1qYOSA+5xYOLucuE5LPyW8QPnZEv5OaiLzSxKvw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F1smQZmKmuBGWNsAtun3rRqjvwXik9dsRx2Ti4eL6rzP8ZoDnvRbMn3t9lWdFutce
	 9pZLvj98Ibk60yvHU21tnv24n1bIkX9f5mnPIKJRpTA05OANBoQOjoyx4dRqduNXqh
	 PuYiaou0mUdP7Q9tqDPA9FiHtrb8dFwf6MZfBGqYx/ZwwWZgdUuwm80ImYFEj7hnvI
	 SYC7HK8DvPzmMRGygwVhq9ASNMZ/sC5v+dZ8IpcVTkFhXsw6SRvGbvCi6n7N8x1Gdw
	 t76w/9x5rnT9G4QDdLZIcL3661OYBtJVeUGx4NA4NZNzEy+4abMa/+eJr7jv0mxTCz
	 CXlKq6jpmUYEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32BFAC41612; Fri, 20 Dec 2024 01:45:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 01:45:52 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-fcqMIYnlBK@https.bugzilla.kernel.org/>
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

--- Comment #29 from andy.liang@hpe.com ---
(In reply to jarkko from comment #27)
> (In reply to andy.liang from comment #26)
> > (In reply to Stefan Berger from comment #23)
> > > I suppose the binary and ascii dumps of the log are still as before.
> >=20
> > The TPM2 DUMP still shows the TPM event log size as 8MB. Thank you.
>=20
> And? We don't and should not change TPM2 table.

The screenshot only proves the patch is working with the TPM eventlog is st=
ill
8 MB. I understand the patch does not change the TPM2 table.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

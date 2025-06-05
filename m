Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405619F42D
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144766; cv=none; b=C2+nozYX+nVIXAFamKGmYBJiR88FMsTBnEKeBM+NddhYCO9jVBfzGVVib/cPRoLbnxeaecrx6MtWYbTS8cWSC+odIGw7lkYXEz7l13jun9PcpZQDssdACVsMpBTkDPqmgfEdoRVSIu77BN0FaDBap9Q+Vzq5IwZ/sGLkAk/XAq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144766; c=relaxed/simple;
	bh=jQmp5ZAekpQIq1F/DtWLJoXU0E+uK7GlvwL1qbQ/2fs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jUSmgbQUVPZ5PcAPTYnsTLgyZZukTC6gBg88YSJo5QxRH8aRDORrfCjFvxaadUgNrbctmf8AjXP1j2VazmEQokRTCyY3CYt7kGClIITAxHFFYxtl3f1v1uPdH7ULHPwT02qP+rFkHWRZPNtqzJ0y6kwk05wOoKHbXqvCyCzJBjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr/jP933; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr/jP933"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C07DC4CEF3
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 17:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749144764;
	bh=jQmp5ZAekpQIq1F/DtWLJoXU0E+uK7GlvwL1qbQ/2fs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hr/jP933Xq15teZfBvFW+TUCeA7OE7nO1GdZhsiSyIrEtzdiKUy8mWxJKSuqF0vxR
	 CVkTZWf82XIzxTXaq0h2bZaV3cYS1recqIVk5j+oG519NLThvmLGvpPh7DPvPxxEkT
	 BCKRLYDumFeXo36gvvasKKvK1xXiK5UhlZ5Ui6VDNd5S/whB/+L+5WnbbbYgMM/taw
	 2ros/2WZh5fSrJMfgbW6MqT5Cpxc6ZzeFJ/4PqCmb+oKLXOOnPnEPc8Z1OuZie/pET
	 C++/vmBx7TvwfMeclrOcMdmTQQhtB4I6k28FDfcdeWI0BD+u4mKA4I31WNe/yWvGvN
	 FeYYUi3ntPemw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75095C41612; Thu,  5 Jun 2025 17:32:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Thu, 05 Jun 2025 17:32:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to
Message-ID: <bug-220116-215701-7BI3WHGloU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|mario.limonciello@amd.com   |drivers_input-devices@kerne
                   |                            |l-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

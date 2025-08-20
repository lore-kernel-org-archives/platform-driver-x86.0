Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FDE14B08A
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755652751; cv=none; b=Uv3NJWUHgVcT3JNCHF/JJX7o63s1aQOG4s9n2yuXv47Z3gyHQdQPpcpKn2gLJm1kzZidBrHGhqxA+EAZt/Ku9BSf0L54Q0KEGe1mty4eYelPyQL5o61j9vBd0KDltOuQAQyXUF8CzA20janf4Zk6zmtMLv89BOIBpZYbWUqJWgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755652751; c=relaxed/simple;
	bh=/tng+ZJZr9SD8hXttlKaQz9PfI2hOeH/ObCkEBcZz2E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uahX1cRCQkhGhHaX1CLvrJVO01MFN+0W6cYJeIl7N7skRUB2K/gp1dQO2b/V1c4SqaTYET9e1w1JCHLg7bJvbVLeyIdIAkWzA/CCjcSS4cSR3FXE81ujssH+3E6hEqpO1Bbj3iEd6pPyHgEMajd7KUPXPJkTbR7hIGxG+nuKIH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcXWDyXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcXWDyXi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3DF1C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 01:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755652750;
	bh=/tng+ZJZr9SD8hXttlKaQz9PfI2hOeH/ObCkEBcZz2E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PcXWDyXiBcwBoYXe56gAQvSL6dF4tCLelJpZ6ohn9YVi92ed1JclUmpq5ru21fewv
	 bk+n/NCwmeXe0BKEwDb199H3GR10RIysuEcdyvL1mn23DqAvDSpzKg8TQ5zljUGRGP
	 D4WQP53PWE5LJaXDvyhQ8M7vwEdxLVaInNNYYIqyLJZ1ZFnd+mkXC7aoQZFZDtZZ0I
	 wNaCmpPA1oouwHzy2gRbzVJc0ZrZiJO9O603KTEtqiBJqDHJ82uJgUHCK2E9tLUpj1
	 N3snc1uMaVkm9WPi8Hryh+a8K6uRjJrnQmztQ3+cUxNytmBslHHt0oADdZBcBTe3l/
	 SV6hns356FANA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FCAAC3279F; Wed, 20 Aug 2025 01:19:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
 telem endpoint -6
Date: Wed, 20 Aug 2025 01:19:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mapengyu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220421-215701-1j9swycGaK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220421-215701@https.bugzilla.kernel.org/>
References: <bug-220421-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

--- Comment #5 from Pengyu Ma (mapengyu@gmail.com) ---
@David Thank you very much.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

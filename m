Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D92315EFA8
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712749761; cv=none; b=rCBQyqVQmqUoKK9LkChozi9UPntKNO0pgB2DVwmt0rhViZPpm18Htd9W8OM2h6VBf+TI4Z6DC/+dD8XHB3/ysLP1oMApcpf9S+2rWnG96R9u4ytj/Lfazo6igWGSeuMT2tRq4G+b6pJT3+8GKVXl3E7PcMzK4WMZGdwVkZYkh1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712749761; c=relaxed/simple;
	bh=KtE/cYj3D62aLsaFl/XZm4TrW4J4RSXpCfc+OWj+tF0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GTwM1ZAQb4NdNso45CGOW5M54Mz9jFf2SQ3LbZUhlfJtpDLlaiacHG6FxB9mjTBQX2snCaVln64SjvUYUR2QL0wkPmudJnHJwxyMfvKOQhQz99q5AGEOcMHKY2iyJj8pXMIjiP5+QvM986QP2cmYJNBsk9HJEaQLQ5og7UV61C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWpL6TJx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWpL6TJx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF60FC433B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712749760;
	bh=KtE/cYj3D62aLsaFl/XZm4TrW4J4RSXpCfc+OWj+tF0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QWpL6TJxUqHA42KvPcPpk8ZxX8jsGwd1m8uysNSXl3ovr3Y/2iKspYsiYbzRxQZYY
	 pA+fh1qVLLHDt9ExlLPvDiBYAp/XL6EJjwgchUXTYtETQfX+6Rl6ut+stfCl3FXPlA
	 ghRASNmUMLHLjTvebqK320WF1YZPu/r/jn+3t67XskXC3D2fMyHb1Si4xQQsm4cUom
	 izZR8fZTrBSfV3eDobt6SP2yRjX6qqh6Z9q1JbyGGdEJxi8Tqo7VAk5GfuEFqtpxXH
	 WVUe44U+YcuZto7I4zFESp/H1fDA1YlDWGvW4ftjUDcWKQ5rBMmz4KQcLHDQAPmDrr
	 hIYAdnC27MHZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BBAC5C4332E; Wed, 10 Apr 2024 11:49:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:49:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-rOXM2YAC0c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #29 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I did do something a few years ago to let multiple drivers react to profile
changes. This was in advance of amd pmf driver existing but I think the same
concepts can potentially apply.

https://lore.kernel.org/linux-acpi/20211026180535.9096-4-mario.limonciello@=
amd.com/T/

It "could" be dusted off to find the rough edges instead of quirking.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

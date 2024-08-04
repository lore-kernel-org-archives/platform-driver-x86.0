Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC56357CA6
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 Aug 2024 16:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722787407; cv=none; b=NNomBiD2MYH7mMHHNzHs5Q8xNDucJoZHQ8qtZGH+oYl1m3g/usZ+gMSpo7vUNYrqxCDNHGg8G7ancXQDcYk+ZCdhE8XbBx4LC/4HfbtfLuY3SGNZmwKw7mlNNa9SY1Eik0+9v8hYUteVi/encry49TE5FJnbBpieY4+BTUmTEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722787407; c=relaxed/simple;
	bh=BQCathg6pie+iWs8hqvlZ8zqhevKg8YcHVdVqWtyOwk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W8kA56vupGqI2seH8/Bf88wQXYwng84lYhi+Tc6VnCuvJfkSTm4cXcvuOCgr/11T0IEta/XGumnt0QYmXlH7sV1HI/F+KzeAm8jtRhe6lVS0p/iHsROYxoIFgj/X8ODfpCIawKFlHuVK0a0MbGtKGK1yYHXdRhjozIluYbRd17c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVaD+6n0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVaD+6n0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46C7FC4AF0C
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 Aug 2024 16:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722787407;
	bh=BQCathg6pie+iWs8hqvlZ8zqhevKg8YcHVdVqWtyOwk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pVaD+6n0bCCOcZQMEBPuPDr78+WGk+IfhL/g3ERVGqL5HYrkNWEWEfGVAByMkIDdX
	 DmeGh5lwDglLnAq8bEScZkH1t5rAiGXUdnXGhIqSzP1s1w61y49DEyZ2Y1hwl97mgN
	 i7fc8HgBWz+AlMEUaCO0H032c324wXZI70fw4VKXA5FRBC+LiikvxQTT0rvjPyCuTe
	 o8cVvjd31XfA6rEjjN8XESgQdfipz2BWpofm3c4bbEfjGpQFhp2D2LupvGkMS7G2bB
	 iFmB3TYaMSkqmcE30ClF8HSmW8Bznya9xawfaPFhKr841TTu1nxTVzlufYHsWOURA6
	 jd1AG/QUIKNjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 22F8AC53B73; Sun,  4 Aug 2024 16:03:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Sun, 04 Aug 2024 16:03:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-NpZtDh5mpd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

--- Comment #15 from Lucas M=C3=BClling (lmulling@proton.me) ---
Thanks for the update! Good work!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

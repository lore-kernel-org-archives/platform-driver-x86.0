Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778663859CF
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309423; cv=none; b=i5jdlKViFIFg668IGxB3rQ00pL8qgQIxkgk0NxiVexEshQFahZfWWm9AXolYKVZKjsSUewuVD6XYAXM2I+oLbT0JngCmkXyyXIaq4eaWJrsGfmayhRKSS3i6x55D532nIUv9f9XmlgrGNLg+YD9nW+a1naJv8q1SYmrvr4/qCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309423; c=relaxed/simple;
	bh=IhSDipvJ5kCILGFj1K/e8eALwMbCxK1CzPV3panZc3E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PI25sA4Wp61ZpjpOFGRddwHn7x8NZ+extfcrZsnmu9Mv3WzO47jGUiF8eoyPDg9MqDzumdKwtgsKFwBVpibjixhU+XQlu+7Ttpy3BwmR8YBjF5JKgCyalNZ9el8uFbhrFqhekiyR18S0exzWcPIq238il3AAV73xSgwS/Xa6URI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJYlGeAs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJYlGeAs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BB1EC2BCF6
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309422;
	bh=IhSDipvJ5kCILGFj1K/e8eALwMbCxK1CzPV3panZc3E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RJYlGeAsCd8F+PMGYvNco8LRBq4eSKXfP2Fl7quRDNOV+dTQIf2R4Z444tLjQ7LM5
	 w66iAmO1J49AGbMXLfsvBq4ZJD1QIFPxGUwzkV1EJTepVdVo+6fpMdedgVVQb331GL
	 jXRNNnUrZ/dNPI8lia6yrbRyhOr7ZInfM06mzlRkTR+o5amNdQu+9/M0RJ3jNGSBPH
	 Hl/klWuP6g4GEY15kqW87EGui6ZutD3F8cj8vcG/Ba//B/cl6b7GoJZ5S0CS67IaPK
	 sc8Wx0YAjF8lcDDoZJLOQCU8LSJN5+LZ9nujhu8IiJ0yN2Q3iaKPeWCUDYCA5hypYm
	 nj7BXywSrSxFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A851C41614; Fri, 21 Aug 2026 10:50:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:50:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220926-215701-dS4Fajyiss@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #10 from Gibs (gibs23@proton.me) ---
Created attachment 310701
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310701&action=3Dedit
ec dump while charging

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

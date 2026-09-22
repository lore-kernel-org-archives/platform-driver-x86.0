Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76895403EB9
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109864; cv=none; b=MS/qdXsU+OCwmZDRtRvT3YPjIqzPL2bZAet2Di2l35TZ6s4iIi5dBn9Eq27LO+WjOZtkX2yNbDUlYuPGSFWsv1S6l/u+zZnoDxlA0GCwQiWLCuNFnbJvsBpvn4JtPI+Rt2qGwVhqYzrFqC+WVzeppaROrYITecmEUNogBdv1GHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109864; c=relaxed/simple;
	bh=ylNGL4v7mAjeOQQicPuyr8GNN/rgB9glYO7EwETOCNc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JLP27LYqdIlc8dSDWeFg/QLng31Jb1LUbfOttUwC3NNvrj5eqP819ogYPcg7K2zTwuR3d+f3it85PSObC/qQEsDoWNTQpmP1eLfASPqsi6sYOA6YNhuNlaQmzG76MH7RmJsmTmpLwMohcTN226FKly2IGN+w4RqKbs0AFd6Dcb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7RgT3v7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7RgT3v7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC9DBC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790109862;
	bh=ylNGL4v7mAjeOQQicPuyr8GNN/rgB9glYO7EwETOCNc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V7RgT3v7GtLCCn3qgwYfwZmj3s8HcIekwxa6RPQvUTBuyR9BUvfYinxLL7qlmx3XC
	 FuKTsqGAfqf9NPOl5aNFT4HwOgYKKpP3rEBybN9j2R1g8LOMkvfetHJbaGx1281wL1
	 SUQKovj2pBXfrqkirlKgxXXmS0hNF2Uc0bG0gOX9lHOfIwLL6aSOz58qptZ7hVX8y4
	 LINURTCK/yi0/0OVgeZ0GwfhXFBQppnjrHihSPmXbHO8MlsrvnZk48Ey3OzF5MQlQf
	 7JjOv5QJKsyDl+H5BRyz2a9GJw14N5jlRmi1xkKBThnJgVGvTqtMcpuz/txGlVOe+R
	 JaSnIc+OR9riw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 591B5C433E1; Tue, 22 Sep 2026 20:44:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222002] [BUG] alienware-wmi: Missing support for Alienware 16
 Area-51 (AA16250) lighting controller (AW-ELC 187c:0551)
Date: Tue, 22 Sep 2026 20:44:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222002-215701-p4LCfe0xiy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222002-215701@https.bugzilla.kernel.org/>
References: <bug-222002-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222002

--- Comment #5 from Armin Wolf (W_Armin@gmx.de) ---
I am not sure if Openrgb already has support for HID LampArray, and to be
honest i have next to no experience with reverse-engineering USB HID device=
s.

I think the best place to get help with this is OpenRGB
(https://gitlab.com/CalcProgrammer1/OpenRGB/-/work_items/437).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

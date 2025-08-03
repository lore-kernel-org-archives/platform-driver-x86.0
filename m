Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD512E36F0
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 Aug 2025 04:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754196726; cv=none; b=u/ODYwhbXP+P/p/eERZH0k55OkOFcc6MCT/1ARKq/Y9RxZLYqc7kBemrKc/6fIaL5NQ5jJqmLTAFP29eUe39+GL2yHBnzFMY12YCtNvjtGqDk8WhhIEqiGCGUD6X02PY1jJdY1xPlyb2ChIX9ZBPZvzCenvmcKfMKZNztOb0d5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754196726; c=relaxed/simple;
	bh=O/CYpXr8FbVoab0c+0Fb6J0pNlEplvxgTU4v2y1l7tw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JHW+IqhL+RpRGReGUjROhms6f4/xA03K4Ud14lxMYq6UnMq5vnNziWVCf4/W3t07uQ4R1ZnVhTU9s4lMEVlMKaVPz5Ip53YCjQIAp9eHksRsYMiwkouT8VsCRFkvhmYs8qowqqMWMHfbmhYNCJRU1+Alms2ykq/XJqVwYESnPGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cdzc/6qB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cdzc/6qB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51891C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 Aug 2025 04:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754196726;
	bh=O/CYpXr8FbVoab0c+0Fb6J0pNlEplvxgTU4v2y1l7tw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cdzc/6qBK7DSvYYWzo/iNE9YFaGyu5OkoCeYAtME8jY93liVD7vK6Tn1R0oSVUFko
	 92B/SUfUDQ0pGj7ra/xY02k759fSkIQQlvnn8rWz63imck8vcWkJmEPbS/acDEwCK0
	 HrvPe6v0bz5S2usRyptIt16XKOxM/6FO53mqps0wmp/hIItPdfI4hcy8fxzp/k3+vh
	 VGo3+RjFL/ZxXmB2qMSfhW4Odk1vLihT/SZapJZag9oLpVHpLd4nmZwasFLdHSeXYg
	 G21OibCRpHFoHS7nOGuVMJhPCFbbYbZIsvGOowcxNNMP5aCYU7T/NYvowvd9HmV144
	 7N9DO4MBj3HIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43A85C41616; Sun,  3 Aug 2025 04:52:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date: Sun, 03 Aug 2025 04:52:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211741-215701-k1LoZWRcqb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934C22CBC4
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577242; cv=none; b=J72NvqsoywxcLVz8cSPAZWXGsgcChoYXCuqENO2HWiUnnre8a1xoFDYnKV0FefCK60bzru14tcUKcsJn1M8xMi9c+ghhmhzK4MN+P7YO2Fnb8fmW7YamIKDSIlSsF2ujoWbCRq6JXC+tEtWYaegYdzcNR9Fjz/SXIM/pecV8z5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577242; c=relaxed/simple;
	bh=MqZwpp+LX3b37X+xY3iIgBkCLhQSvkj4vOvI8cBSCq4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IBtEMHlFJxYgk3ltWpsZgzqiVTX9hoktBtV5XFnUpkDEEp6lt+T3yq6yIK8F2zcnlGk3nKawyJIVu7pYLUzDUrjKNj4BJ2FJMuFSAzprNh/6SGLupbxRWPYDPLOoT6lHBe5k68Q9HKihdwMrrwJmpMW9LG6v/suOimM4lkzjgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huynqbZC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huynqbZC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B31C4CEEC
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742577241;
	bh=MqZwpp+LX3b37X+xY3iIgBkCLhQSvkj4vOvI8cBSCq4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=huynqbZCH5N94a5NR/+bN1yBfKFc46CqU/LTGBymjxSTAhFRM6fcGnrTEt5HPdcZI
	 ZBQfmrenuwZ+t1b4BbNDFOf7oEpVPVjZWsehxybyvDQdgR33sJZXrbC+nIqVHtnsiG
	 WSRD/pqRm9zBrc1sdZSHL2R9749EUqc+iRg58vkm9FXtU8HHcY03hiCk3FoPyfW3E3
	 fHL0omtD8Mjzn3xNq+m+6OHf6/Ri56LFLpDy6hzExruKU3YSElrSDbHBUug6mHGErD
	 YhnC0f+SXr8xVANZbl+ieOFVJIriUlSvF/b+f1Iygj8VzSaY9dAXnEWZl/cW11yVYJ
	 0KrC1ef/qgKdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 58246C41616; Fri, 21 Mar 2025 17:14:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Fri, 21 Mar 2025 17:14:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tobias.diendorfer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-arLdA0ddwb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #2 from popy (tobias.diendorfer@gmail.com) ---
Yes could be, but than it would affect multiple vendors/boards/bioses.
I think the base BIOS is from Intel, right?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

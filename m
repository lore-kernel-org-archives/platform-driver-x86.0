Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10061C1741
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jun 2025 17:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957493; cv=none; b=Zu3Q68rPOaACls/9uOwted3W1aCsOPUuhHh/A96hurcTE2Nb3fr/TFmqyXs6BUs23fiArhZrNM4ZfeWlWSIslJduUr5cOLjjxMi2k75rnXXtTe2cGDjWHqNZl12DvoTeNhmYJ594RZpDikBtebbbUUlxi6/m75UGtVvx5b7B0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957493; c=relaxed/simple;
	bh=p/Cpl1tqqYQHjO9CbFtzqezL4JI722OEEd4kHHR14vA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=myKNBi6Nn/4dDbtQuHFlLFnvxLnaqD4stwAsFBJxUgqeIaHhsEWrypAm3mC73S7tmQfhmsMPB+WJdv/f+hRiS+9XwAljvtQl85/hZVpuzHsHoX7KB0WTCsrs9WAAnMUlrL4yX/9mp1gNwnvLvNlDyIGYH9utPGeqepG50FqSUQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPbQuVf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPbQuVf6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EEFEC4CEED
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jun 2025 17:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750957493;
	bh=p/Cpl1tqqYQHjO9CbFtzqezL4JI722OEEd4kHHR14vA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nPbQuVf6ORATzc3h1U5B7QoMQWERHdew45j/MxBxZgJxkbAtqzRh6UGEQEhxLwXAY
	 6eIrlsSAKhkrl8WWivE0ZPXTzeE9me+/2WD5thikqNfY8PDjW5zlnKQ1vF80UE/+d6
	 fkIM6bDPyDH4QEalV2V8EXwC9VrTnCepo9K0BYPFdjpfkB2jpJKrDWJZNGqkfDaRcB
	 AGJgkG2Gj/l+APyaWi+kt7/A+yYtCxmAjaeFzt2RCfG0zcJ3GYXH2SQf5/qJ4zAeyM
	 iv0Zh/j/NiIA+hLM4KZNJAVqrpq+U4eTL1T7xpsJgQFz1KxBDgsLeLn5nRPTAFgLJa
	 dyi2ELtMlmOiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4BAE4C433E1; Thu, 26 Jun 2025 17:04:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Thu, 26 Jun 2025 17:04:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220246-215701-c9gaqBtQMW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #22 from Armin Wolf (W_Armin@gmx.de) ---
The patch has been accepted upstream and should appear in the stable kernel=
s in
a short time.

You might now eant to close this bug report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

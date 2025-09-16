Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A32BB13
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 00:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757984299; cv=none; b=XFCtdBPQCj6jkIUjaNx6M8BsPM0N1EV/dA4/d5ci2HeEhkxnLDUlcrEglit2v/xTyDqQmKM2BrkpF2LsBLeM+4T2moUa19LE/MT0b2MV9wP49Dqt+jQuvBV8f7h37y5zPyjqykaY4q34eYsHi+Jtbb17J3cObFQIxMQGn7u9yJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757984299; c=relaxed/simple;
	bh=roJgkA+HqE0zpsSJTJf6AyMieiVZo/ar8A4AyUBtPVw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O5zMv+fwKtiXwtkQ2RMFbOlWDQCscmmA2297A/UOWEZ2k5nR4t1NC4/l+4CcdOf3re8pJigKKwBV8a48UwgrpYbcQ6wqM/ToYzsdaAFhMInhPH5Q9p82y52D3s8bwEQ+xmfuqpL4jBHWe+wGJQ3xspLfikQMwNa7fBTq0yIW4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrpWUtpa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrpWUtpa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A563DC4CEFE
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 00:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757984299;
	bh=roJgkA+HqE0zpsSJTJf6AyMieiVZo/ar8A4AyUBtPVw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BrpWUtpa0n6blC0qCo0vrnm2XGGfnSWjMGNWqfGYIrG90Fm4ND1JG7BwzXgUZrE9Z
	 b2/Zwr1qQfVkd2bT/rxevQwrg7wjQpMkY125xerAWqmW5QPA9vMHaPGa+9kbp4N4pL
	 e5faENBbblobBrzQsT9mrwtHZeFr5rnsEHdod6AktwFex2xO1YBrgeYzImd5Wmp8h/
	 r0f1lLgfsGgrzcHqyEhyuR9khiMlWTnjKUzwm4pBdUyrweoIavgpv1vzhpFZEJq4cr
	 hhSjLcq7Hs6orgEFzLdRWo9gfDUXQWYJbYI/RZPG+sUAcLERM2W5x8BqBZe8gAP8yF
	 4tmPCQsNd0YBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C964C53BC5; Tue, 16 Sep 2025 00:58:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Tue, 16 Sep 2025 00:58:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: marciosr10@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-ZGfBXS2X9d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #128 from M=C3=A1rcio (marciosr10@gmail.com) ---
Created attachment 308682
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308682&action=3Dedit
Logs ACPI patched and unpatched kernel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

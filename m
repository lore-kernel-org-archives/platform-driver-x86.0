Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35696405C51
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 23:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778886396; cv=none; b=cVTaZJ/9bmcJfMZibGsO9EuUEnc7XFXmBWOSrJIAWk0C2/8xkR4QSm/0B8oBEpeqogd81cNR1xqtBIOKL2lIk7sDE8vQlA7pIs8IeF9ouHyz1NeJbZC0Z3XzP8wSfB5hTaro4RrymcE3abFx9Kyh6u6DDPKT2WYiMaJYZBmDP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778886396; c=relaxed/simple;
	bh=56XTwbs/R69y1mxuboLIlGBnfo5SRaIUOUxcZFbgqKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AWZ0iIKslR4YRynnxOhRPhoe/IA0aBEbfMkXYz6IN2kjVbd9DH9Xtq0kkUxF7vkQwyW5jMGxyJHNy+Xczzwws+dgdU5iFMQLzeRGvjPxw3YuwnmRTP5Gcr2o2L55zLZC6PhL+Ss4Sao2ARloLteLtOW0ksqfsfUGVidc6oTOKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7rZMONR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7rZMONR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D38F4C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 23:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778886395;
	bh=56XTwbs/R69y1mxuboLIlGBnfo5SRaIUOUxcZFbgqKE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t7rZMONRu+PI0mAjnGWvQwcX/mJqSE8h1s7H+Qzc0uEBbIKLAIXHHAFci+NQiVQCx
	 2fPeOzcbJQPVByikLgnaXLc8MaMg3aEK4CRhmnaIUFOgcdSJrY5W0JUuaXeDatDQ9b
	 WdU8CZr57lHUQOIWq0IRo70SbewYbk+Ss9PtWzhtdYdHi5BZ/2cLTbyQUFc6hFKagB
	 s+Q2JCWF9qwiLrWmkkOz0EhtQFU0vpFcS6lKgCrY1QtSo0ehO30f/msXgW5GLXowNx
	 5XStuPW6+pQt+2bcSCV3tPXOJjhs/Pl551k07Fxo5S7R0+Tou4a3FuYuw0NQ3brv6R
	 ORnKMPWBimpOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BEBC1C4160E; Fri, 15 May 2026 23:06:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Fri, 15 May 2026 23:06:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-VqdLG1kIJi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221523-215701@https.bugzilla.kernel.org/>
References: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

--- Comment #4 from Ahmet =C3=96zt (sivasli-ahmet@gmx.de) ---
Hi Krishna,

thank you very much for your quick help. I tried compiling and installing
kernel 7.1, but unfortunately I have issues with that as I am currently on
6.17. I get errors when trying to install and kernel panics when trying to
boot.

I also see I cannot apply the fix to 6.17 version of hp_wmi. The file was
refactored in between. Copy pasting the new file to 6.17 causes compile err=
ors.
Can you provide an equivalent fix for 6.17?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

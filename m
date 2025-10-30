Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E8F35BDDB
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837593; cv=none; b=DdsdD7fCAYTxZvbkEzKVJeZT2x4oQZtO9DagI+Fz8Yzss9bxiX5dkiugDf+UiGupyo/Yzr5JTcSv3tQ6zlaf4A7TgeDYQntLEdLrXRt6v8T6z9HZ02AmVEF7lstyYDJgIE0jYoCp4zBD0tBIi6ua5KUNYzf3u1cgWzVBhBkwVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837593; c=relaxed/simple;
	bh=TmwPjM2Zh6uxexMhByh1N41EDlmLOrf7hE+h0ElV/Wk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HfS1DvGnZQP6O258WQ/hUjr9rwAKPoAyfrt+wCohsnMH06dba8zjH4IGgmDZBRZET2ZHPy0ZAADQHJuoR74TG47IjAIcvA2HxhjGO/2AdvOP36szAShZEDQ4xgMc0wGNIiBlE2rYDWwaMhfvGQsBge2qYIx47l8ipDqXczICzzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUlPLOKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUlPLOKz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B23C116B1
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 15:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761837593;
	bh=TmwPjM2Zh6uxexMhByh1N41EDlmLOrf7hE+h0ElV/Wk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NUlPLOKzCrXrzMsbeSM69s2VM6r0M8MJ5r3Una9mqJWeAWYKqs+FQ88go+OPYRkGZ
	 Wap+HgukUPMXlYF96WB8k7uHAiRmgAFvcaZaiXC7qY4d1a8Gv+b+fif/ERCH5bALfq
	 LtgLJuaocp6JAr/Sp/uzpiN2zESM3eer/0Rpa0Vp4yijgWIJFW2fj86ueTwOx0lGew
	 Dsgzc6DqpuTJCeIPH26pbWLStWFjWZrPeXlnWKazZQaOivZcMlCkSm9bYPV3wm3bws
	 8BhZ32c/Dqd/mGQhCtt04NZdXFxnyOo4aM1/1gTXB84IrSzFHDw5EYMH9ymlDjYgsH
	 RHS/phErbonLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B895C41612; Thu, 30 Oct 2025 15:19:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Thu, 30 Oct 2025 15:19:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-q964llWuuc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #2 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
I'm using 6.17.5:

Linux Andre-PC 6.17.5-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 23 Oct 2025 18:49=
:03
+0000 x86_64 GNU/Linux

In Fedora 42 and 43 the same bug appears.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

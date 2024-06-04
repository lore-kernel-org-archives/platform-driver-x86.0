Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6524C13B
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513702; cv=none; b=lh/jRg4hZzr6QnrKFEnwkDeH18Sd7UpIwDm/D/Gmy7Yp3J7BfabUnd3g85yZlWWpiT6pgTdXWGOM+ZDV87PhFNplkMF7LK5W2wKlHuS1TPwHSlGhtfph742MoTPkYGKv20C20SgH8AWLhTrAUc3lRm1xA8ghtYl0IDJ12YBYngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513702; c=relaxed/simple;
	bh=fnssSPCdB8Mm8jkalSl4AiSAkln9UFsAoznQSdYYLF0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=atkiIJN2cngz8b6CMP9KeybiuQC8uAamj27qhKFIHuiyYw7ZgnNE5ByYyeYjQqiuSUnKsy/jDnhrY9+1LMVMPPvtMVrMjwcdlJpFJaJ2dhivqAFGXEvWPOU/QXKkQJ3I3vRZHpr+Jq5/b9oIg/pKNmV4JHb6C4Z30oiEdj6Qv30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcsd+APA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcsd+APA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EBAAC32786
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513702;
	bh=fnssSPCdB8Mm8jkalSl4AiSAkln9UFsAoznQSdYYLF0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gcsd+APAsQ6VjWM52/PxXrVIs3vY1lY2OsWNVttp2jXFT0IOX7X4B35HzTslozQ8J
	 KCMv1q7rCfFXlrcgRGACq0KuKGiTXwK8jx7c1U1eixhduWItep+ULULUFx//wtUK63
	 herXuon3ohbGB42LwSqBZBxY7bfrGnobmgVKoTbQsH8yXRxOo89cQewxGSURp+wyIq
	 rkUv2GjHDp7RSue0N5jVq8CSMILGS9lckLQWsMAcV4/DvZF2A0EAi6Q5ceNPKo1CbS
	 LR/t/dL8zpU2MhQ/GA1mp+YpdMZ7/bH7qtKZXsehNrcxGz9F0t5s6+cz/rVrA1DF7k
	 NmI299DCX9woA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38896C53B50; Tue,  4 Jun 2024 15:08:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 15:08:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-SWbnYYKxoX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #37 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #36)
> Which HUD you are referring to exactly?

The KDE (i think it's part of it anyway) on screen display. I thought it mi=
ght
have been an event not being sent but I think it's just hibernation messing
some things up in that case so it's unrelated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

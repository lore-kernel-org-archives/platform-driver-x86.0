Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198E13ED136
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286434; cv=none; b=KYhS/QW4fJp+JAYo63nMIsK3ID85adj/XJSgCpTtxUdPyQy/F0dJjoPgR5ra8AofIit2175I4NadnzVVhQV27DX+l6oEv1DtgDe8VY4xNhXxGSzcyp+sgowSVHNhYr8pL3DqOizhn9Fv2EtmjGF6CmCCaDX1UcCtl2Ws0s6qCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286434; c=relaxed/simple;
	bh=kK3wBe5YzVpdFlns38FzgEOF+Db/+06U5LTbSC3lT8Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FKI/APopwI+TbJV+MElF5lx6nSYRTqoilw+tWXHli05ewdr0dqqgOkhJxxgJK013woVzIvx29LxfIBpMnhJ9BlDxeeqNujhIQVIfxxJJMed84SCJ5dJ1iYTmgKK+daKulZVlHs6yrSl/xF8182Mi6wEIe74NyV9zp0ss/8B8vOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rKhrWa6f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKhrWa6f"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5827C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779286433;
	bh=kK3wBe5YzVpdFlns38FzgEOF+Db/+06U5LTbSC3lT8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rKhrWa6fQfkyfikGFDCb/HEV2tLv3YU5Vt3Wivxux2NUsRsv5qZ1zN/RpVbLbcm1I
	 Yy1gK+SJJTD9mbzv71eP48vI4HnbrEG6z/XSXykbCdaDRdntaSW7XGxzTlPJ/oW4Cd
	 1eL75EGc6mtD2uMW1Pd92foB9goF77Xl20lJz9cqpFz5cDw9rRKqaNdRJqcTTZ9kSW
	 UmBkzwNZB1a2jBJnj2smR/gAcwecZB9nuEyCU1ftUTq9x4MG1T5q5u0xZOSayH3k5+
	 4hF8sjtCu/GgUzEy9DMgpTHFJS7jVl+dE4xdeCIWv8jI8CgHV6mM1bNseshLWsXbTn
	 twn1KBadhn8pA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8686FC3279F; Wed, 20 May 2026 14:13:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
 available (no PWM)
Date: Wed, 20 May 2026 14:13:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221523-215701-vTYVFEBAoa@https.bugzilla.kernel.org/>
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

--- Comment #11 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Oh sorry, I assumed you were fixing the dGPU power raise issue. If you beli=
eve
power modes and fan control are working, let me know, I will send this patc=
h to
the mailing list.

Also please confirm if this is correct for the Tested-by and Reported-by ta=
gs
of the patch:

Ahmet Ozt <sivasli-ahmet@gmx.de>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

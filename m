Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C76128E17
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749123258; cv=none; b=XK9TnR2JFD8BHnVmpdP7UKW/BnwqVTXlrGZ20Pz0oKvDXN/7oaTnaqQHoHNFOqpOMlX1mk6sjOBaMCth52rHpC4WUJHfDw6aFKYo1DbJCVE7+862+GJBrJiifp8xp02FgZ1I9ai8q9fVkLbdvGrmt+fiJHoZ2weXJ4IvMIGm9uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749123258; c=relaxed/simple;
	bh=Fdr5j/jXBZ0OxMJM++J6tKNH/wFeFZ3tXH3yhMQe7WQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gCSms9q13MSvS4FRnC6X7rj2h0eVXXsMT62PyFX98wNaYMAiacBA095eZQOn6DOMPM0EdCH8obOfIt7IFYSut2znTQ0WBauswL0MtCYPG/Q7uSWwey6uLOot8dnEhFnFs0kowYWpC6I1+67x4KaRv4BICi4V1+oAOBFzIh3JvhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5Ek1iwN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5Ek1iwN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FE93C4CEEE
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749123255;
	bh=Fdr5j/jXBZ0OxMJM++J6tKNH/wFeFZ3tXH3yhMQe7WQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R5Ek1iwNJF7Nv6RIb3FtRZri+WyyUAqNa2izL5gMC1KGEll5qtaVLo7p+IhWHaHiI
	 6WybK5E3pLV4T1BUNJZi6E+3vYy3zlZ3t5JX9OlFnasvq765pJZaF94fevfqPrRclo
	 MLI1XO2kUkpJMRrLSN6dqDLFHYRwVpyD90EzNskfSBc215le/CDt341HdKQmEU2Mue
	 Iykgw5625uS01upKroNoKBk5GQ5kLySE4psbLgOptF+PLpM28rPFHx83br2vR0rRgn
	 T19h1LIrVWIKsXwv6Tpda8YjOFD8FXHdUw3ptjTFOeRkrENmY2czCClo05xHFadSo2
	 RQAARboCxW7PQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F560C3279F; Thu,  5 Jun 2025 11:34:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220116] amd_pmc - Last suspend didn't reach deepest state
Date: Thu, 05 Jun 2025 11:34:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ein4rth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220116-215701-EEH8IDgwjl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220116-215701@https.bugzilla.kernel.org/>
References: <bug-220116-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220116

--- Comment #21 from raoul (ein4rth@gmail.com) ---
Manually pressing the power button to suspend now actually works. I still g=
et
those "spurious ack" you mentioned, and an ucsi_acpi error "failed to re-en=
able
notifications (-110)", but at least I can work.

So this has nothing to do with amdgpu... Should I file a bug report somewhe=
re
else?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

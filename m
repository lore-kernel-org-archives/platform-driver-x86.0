Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8313D299
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512232; cv=none; b=E9bcaKpQjRbiXsWjjh5D7d63Fw8pIHV+HRmK3JZ1ojIF/P1vAtDeFj+I4mMpCtwRe1PI2jAFacrj7svEuc5Z08xmuXEKQA1Kw0vH6nTFsaekcJAmDeehiIcPXN34rjguHXeleVFwevJTplj7D2KLUTyK8qS1mvou119tGjo85iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512232; c=relaxed/simple;
	bh=zclAWeaf1agMqcvGMo1o0Aja9sclSm9DK6Jd/T89c5k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rxl1RWHIPEed/RNbW5Y9rukx7vjNFfkfuBegYkP/ybIi7E3JguFqV2LFQWDO9lkONvZ0E/zCVf/AGrM01iDqz5fDllgOr4v2jyF3kk/nap9Ec73YtjbtlQz2JC5B/YyFAsAsY9urw3NGJ3uP7Gb7HloSWwXh8Nk615yl9XSxPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNdgJVey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNdgJVey"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBA86C4AF07
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717512231;
	bh=zclAWeaf1agMqcvGMo1o0Aja9sclSm9DK6Jd/T89c5k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kNdgJVeyMizI7JfP57l3pe+/YRzu5BzMftI0d3QlxTcXBapawGQ9i+AK8LovbGQ/D
	 2eOIGhii8TN0HjjW/TqXo7xqe4fRu7ROpB7L090syUPGeqsAkokuMI9vTEYgT/Mu7Q
	 FlvHvchDlCmQvCUmUX46+mOAu/x1oHsu5ACN6ta8ZgmslVWZRHuOLjOW3FwMpXvLa7
	 jl01r9WFkq6B1RSMVPu1GleicIaLDK87f2PfaJKDAiudRscPiaqSOChW8AXONWZ54+
	 NrlZVAZ4CmG3z6PoIVkzx5G7SSuhsaQgFO46D4gwjOLgoJtnEs9vjWuvj0wL6uRhVn
	 VUOWFy4QCqTKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A17C4C53B50; Tue,  4 Jun 2024 14:43:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 14:43:51 +0000
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
Message-ID: <bug-218901-215701-9y3uwkxrCG@https.bugzilla.kernel.org/>
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

--- Comment #32 from Armin Wolf (W_Armin@gmx.de) ---
Does this mean that before loading the new lg-laptop driver, you where able=
 to
control the keyboard backlight with FN+F8?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

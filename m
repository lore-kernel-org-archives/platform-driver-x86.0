Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9982146D62
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507509; cv=none; b=NwPZYhkOJFLVbqNsi4klPGqJzTakpWGoPiS+MAL5G/bnBi5zxEc7DIUpAb1IUVIqmiAVdol6y4R0rvxa8lD3cdi4pIFRNdZIQAn5pLBnE0EC7FfQB6Fq7SkIB2w8tq2aqvUp1bqFy3zHYjripAKOgjLx5eaPQ1W02Gynz99rlHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507509; c=relaxed/simple;
	bh=iW9SHQOBv2ymZklAr3AcNKaVNeWjn7OQZYcVDO2/+ag=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yjpj6n2/SRefoJcteKOHVtsqKvhcSLGN5OnyAHmkstPmowPJsGj0DOecnbhPV9zE7EVF5VPVN5EPwBBu19QD28qQ5KRw4qW0LF1uJNz9D2jSDr+PfqB4h5MG/8aCeIU8FYX4wU1rrIFwn+q/92wYotWBsmJGPEGix0UcZh1U+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOxeMNvy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOxeMNvy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C5F0C3277B
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717507509;
	bh=iW9SHQOBv2ymZklAr3AcNKaVNeWjn7OQZYcVDO2/+ag=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XOxeMNvyuHryFc2boWiit+C0TGm3OOg9dfU7t++iymv/GYXrxl/NiVwYtLLSqh6Ul
	 CbDUuaIwp29GljG+hOY3VwTHyjmGy1KLOJ0rDL40XN2/50zdQqmPyKyuIKeAUHMOxG
	 JQXeY4yIZfHqheeYbOzMNnM6W6lq3Elw0aKRdZupl+L8ljyk0Pivqj9XOj4Aidy1CI
	 PPt3XfrdJy5Wj6Fvz4+0VrgM7Elxao89VH1bkTdkarQBfD9zuIuny2+VfR+AmdpK/+
	 duzuuOOzI+eKOkbsqrrJaH4V+QCfy/6TPfKaoK7A1mZSdknujvMhYg1eWBn9inXqhy
	 eYJli6tNpEaXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4509AC53B50; Tue,  4 Jun 2024 13:25:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 13:25:09 +0000
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
Message-ID: <bug-218901-215701-cOx91sfgiM@https.bugzilla.kernel.org/>
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

--- Comment #31 from Agathe Boutmy (agathe@boutmy.com) ---
It also doesn't look like the FN+F8 is able to change the keyboard lightning
anymore.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

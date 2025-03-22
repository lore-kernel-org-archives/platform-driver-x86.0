Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE2427470
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742647886; cv=none; b=CNxyDXClt3yTtU3Q4VszRtvU7mYFWOpnk4qp3fcW41jBhbJxytGtGsN1xwJriQsffNS5RQgbezvPzYo315h9o5ZG0iK24if9otLFTqU6foqQFvAWXUuWwI//u+z8DCtesblfFKReY90oF+n3Ibu7ru14KkFI1/WtWaeK14a+VIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742647886; c=relaxed/simple;
	bh=7JzaEEnc+3PE1Q96g/kvy3n1jRTSg+5/s+QGXV7ZKEk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d88lBwSd9ltdxiwBsvRP/Y7XMSsSBeqdqhTfOREIgneGdB4rY6pm+xSip17vekre5O2d9Xty9jetexGzQ/TvI6HuBF2YH+6Ihh0zDZnabJlEfJNZI15wZLA66pX4mKaG02YUiEtx/SK6UTWOqscQFPahBk5aCUc+OAhV+/j8amw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qo2bmXRu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qo2bmXRu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C053C4CEDD
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Mar 2025 12:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742647885;
	bh=7JzaEEnc+3PE1Q96g/kvy3n1jRTSg+5/s+QGXV7ZKEk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qo2bmXRuhpzy0jLxVrIhwI3trBljA04jaZflQZUdD858vcmI1JTGc1ue8Kz6iUeh1
	 W1B5DP8IbAmb01KlS8xaNUiH575LJ/4AYBZ8wIGX2GcwzjOyoq8bEbxin+/vSWdPDV
	 Ez04yXuLzqLhUZw2o/X2RG2mIaTnzQ6tq+m6XAvnChG7B+26CixAOHreZoYNkEJIqs
	 YBYYgmvDSmZ0+sKrHB6rDtLOqcv/EptJAdc/HCuQtCIDGdf/I6NYBhZdJY4p02Wf3j
	 vTda9D0oH3zYbHHZDpM5ROqyKjvcvfxO8Gks1754vE+5X5BWaTXUCPw3PSFp1zrs/R
	 Yotoq9LTgMsyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 78615C433E1; Sat, 22 Mar 2025 12:51:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 22 Mar 2025 12:51:25 +0000
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
Message-ID: <bug-219904-215701-Kju2VeMoxb@https.bugzilla.kernel.org/>
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

--- Comment #6 from popy (tobias.diendorfer@gmail.com) ---
I have posted on my MoBo's support page: https://esupport.gigabyte.com/
Ticket is: #1818413
Just in case someone of you would also contact them.

Let's see if they contact intel about the issue or we have directly contact
them?
The chances are higher when an mobo manufacture does it.

@all of you with the same issue, please raise tickets to your mobo vendor so
the issue get's attention.

thx

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

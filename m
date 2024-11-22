Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAEA1DE4D1
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732286189; cv=none; b=Dv9N1t8kOkAtG0DQax4g+op4P/lNz40oFr5ZEY3Ui8uL6bAZqlzcmwejWLK1wdYikMhGbJOHuW71J/WvUiNscNF6Q3hCa2B51p0nw4nnFy8O5omWb8ZEDFmGSp9FIoUpy8gd5HZoKk24jaM+IQBNTVuyhsXW0nEQZsiCn1YQyoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732286189; c=relaxed/simple;
	bh=trZ2OHjEvJ2UIaB6HQegAaeUs2Uh792AQxG3UjTtkog=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a9sJc+ilvgJ/QZ6me/wUdk5CaOx7/aprSlWRqKaS4OYsKAU0Wo5mRdK6wWlBU4ViNAZBsTEiodaZYg8EeAYLNh4ZLD5fo7oWDIG15X7fZWd2KFM22+pXgjHYi8Ywyq244UP/0WzNNuST7wHfqqLvvVWQy/ZvflqmU/Qxy0tLB0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6YC1dcX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6YC1dcX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63A15C4CECE
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732286187;
	bh=trZ2OHjEvJ2UIaB6HQegAaeUs2Uh792AQxG3UjTtkog=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L6YC1dcXJtUU7MtudRYhBVq1GRmyJwSfqc3kx3aEinSAnu3fl4v8W86M3/6G8ZaBT
	 GY2/7rGbfFyDTXHQhXy9bSCaonkkVjnyF5aoMuRav60JOtHLYwCGr8Fazn+t1G2m7n
	 1Wl2m0CxEOtfnCEEiN8RRPK/akT80wDhidr7hKN4pgVirOR7iZwq7Aply94KA5mT8o
	 bab7K7KpiKD7QFS75K3d0yRn4YCIGyhJyp1PHHPmKQogqQ9PIDaeM2TXulurnb0knc
	 mtCtjhJxgShZsz0ZOaF5v2B9H9G11Z5sv00Do5v4ZltIgLBJp4hakM/Yq8zNButNs5
	 Y7I5wrZphboVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A76FC53BC7; Fri, 22 Nov 2024 14:36:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Fri, 22 Nov 2024 14:36:27 +0000
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
Message-ID: <bug-219517-215701-sgShTwbyP3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #17 from Armin Wolf (W_Armin@gmx.de) ---
Ok, i will try to fix the issue with the patch.

Do you have a dualboot setup?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

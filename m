Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBA02DC779
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995065; cv=none; b=VbWwbM37hxGVIgsX8gi9Uz02CWmJ4zCC9oq9XafubbUbp8/kK3UWSu/bG/4X2LtUcCrK+rUrMZwGISHwgPgFDXJYBB6VpTNqpvlRJAmGQCi1KpB1zqMnjvLBJyrtqV+UJ/0d3Ddz7RZkvpSVITgJT/iOGy9WXVtXiC/GjI27zHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995065; c=relaxed/simple;
	bh=qkaTvIxTv1lB7dzrFlmWOzT23t1ItBYPQEgntBfuWCY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YwfzaEMuIwN5LX3L8cy9vtrpcatZtcT3cYN6DMOGC677xVGRE5xpUQTpIZUAlNM6zUCotcXf2lZTNRsxfIENyphi3UqYHMHBba5f0lj9seC3n/g6msQBz7GkaBrJx0j/bJlQKLQElRjrFimSQOT4jexazAVw39MeYojCvonOVXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1EJ17e4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1EJ17e4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02D35C4CEEC
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745995065;
	bh=qkaTvIxTv1lB7dzrFlmWOzT23t1ItBYPQEgntBfuWCY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V1EJ17e47FGY5hJqnZMq81iIQqx9dSC8t78J1bADLUDZZntsVFw/OnHSpPR4eWUlB
	 YwnKDtsNnGVnJ6CsaGHwpQNE91cZ3Hq+5gL8GCB5yISpvI1PHai4vBcRO+fgr+hPK+
	 OAkNcxWTT8890kkOB6pP4y6IhgnzAxDMK/ZmMvuLmM/bMzNr3TxYqEWbt74El8FiKW
	 SWDTAM30odv93v6Sz6RnbuliV/caHzfl+VFsOxiTK8sPc2W/wLwyrMDGtVmEJfKKDa
	 8uEn6LP6pcoJAjPqMxK7YUhIoCwVqPY7MQwzWr1Z1ewVHt/OYdPVyU/b6jwYrATSw4
	 WVSP9mOF43sUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0714C433E1; Wed, 30 Apr 2025 06:37:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date: Wed, 30 Apr 2025 06:37:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-199715-215701-GbsefU7JsB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com

--- Comment #69 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
What's the status of this? Should it be closed or...?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

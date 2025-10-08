Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD127814C
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759954208; cv=none; b=eUJNckznNrxeh0YzLDm9YKSSTjsPerKCPV4nbNnT0KoIH6ZghY3WPsTbER8wnk8TUBsPd04KpqaDPs1G24Bxxh3JOGpvEJAFsqTnNk8mAZL7K1Dl/bZ/a65/TIvyRAgGETuERTJZdWoo/TXzwZIJl78VuQ5sBe18wFn9kM217lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759954208; c=relaxed/simple;
	bh=xZLppT8Rs7TJIrmSWwpCzI0jVE2KE05LaM7wLmvao58=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IEQQQT/Bet5y/y/cLbBJdskqA1/8t0c7cgtodldLu5sovsdTRX/kEq8GD+NvVFKDT1y4rekcctaBFcC8fL9J+E73hy+zHjjwfRjJt4sBUAZgf0sJSZG97BbAkT00mn9I5b2SubxtYv9B4Hby+P3UqfbBHa32YSBVThgUsMGcsmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zw1GZ8F4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zw1GZ8F4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 936C0C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 20:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759954206;
	bh=xZLppT8Rs7TJIrmSWwpCzI0jVE2KE05LaM7wLmvao58=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zw1GZ8F4BDfSl+jdQd5Lu+t4iNdLZmS8onEHXnMeiOx8z774ZsGeJVkrIU6fGjhc2
	 Y+3wq+eLukw7ys5ZE+01oesF6N/WvYG5gCGvxQ3sXoZGAaUWm43mNhF/t250RgcuX9
	 z/hC5KDK/8dP2FcxIFuMLOE01ZICmlcGGJ9tQN94AEnVB6Qj6CixiJuBD8KnLx4KPg
	 jFrTqGJn2BSLbOAe4zatRmjhepLrHRprxV/BLmRMLjUbVYzASLBPn6c9bJ56MExTn6
	 BAOBkGkuefDEx/4GaL2q1YFth9hZWfcquQ/liFH65/hmIW/6+KyXP6JJwYEjjBogXV
	 hhEIGAPHn9zaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84C82C3279F; Wed,  8 Oct 2025 20:10:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Wed, 08 Oct 2025 20:10:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-ihMI691Lql@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

--- Comment #2 from Juan Martin Morales (juanm4morales@gmail.com) ---
(In reply to Armin Wolf from comment #1)
> Did you install the Intel thermal daemon?

Not yet. I haven=E2=80=99t installed Intel Thermal Daemon. I=E2=80=99ll ins=
tall it and enable
the service now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

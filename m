Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5DA3B811F
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787391384; cv=none; b=FX/M9fj2zdf/oNnEqRdhuOrvzaC5CQSOBGGWKsy0UOIXVoFdeIZIGq+VpcfIMfhFU6UPm5q478usdJ8VefZJFrmJe1qISNn59e0/3i8Fu14ciKAbGqoImvGF3OWH0NbW1ueioN3WXR9BdchY5LR9v0AsJ3URDy1yRaDWuqfuVZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787391384; c=relaxed/simple;
	bh=ccXTEvmLvAPpaSn0iT0w2YQxzgFQPkHDdjUbevM9F1s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=okmmL/uR8d8LcNJBz/pb36kBt7hTuX9qISjQb8mNhSNik53v1xQDBAVU6mTH5APZHCD9g9YshAteGgm+nf/dhkH8l64LGYfX2YemS1zEtAOux8KSWZ8nb2J/OwYVJnpXFpcec2vigU5ZoRfnZOgnlVZm2SaEaU4atH0eC8jn9fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1mE7opM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1mE7opM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEE6EC2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 09:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787391383;
	bh=ccXTEvmLvAPpaSn0iT0w2YQxzgFQPkHDdjUbevM9F1s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O1mE7opMoHhZTXDABAz07TzBwSPzGFFcQTn8l3HuvKc1vrDcrpoGa8oQk6P798afx
	 vquzRdAlywUAEqqEZpuJ0McGrE1Y9pQtxg1+wXD25pAw6H5nS8ftqhR311r+P6oKWt
	 l9dQ6yoyFllVdYY5MiOZRD/V4MFHffZ/C5oysreTPXE/j/L3G2HiNF6TumMEUEP0J1
	 c/ZdjJFptiME/KrKQ67o1K1qDt4Of+jsJjmQTQ1bJQRnzpiseJEHYBewZbMGRoK/Iv
	 6yP5sdOfMoXDmTLZgLaOVNYcFz5olJUpvshjhmjdrrcbh5LquKdak0DbcAX8ff0XWk
	 4uI7ZRoEfKW4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A623EC3279F; Sat, 22 Aug 2026 09:36:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221907] Acer Nitro AN515-58: internal display backlight cannot
 be controlled (WMBF/WQ00 firmware bug)
Date: Sat, 22 Aug 2026 09:36:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathena161@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221907-215701-zMOSLwARKU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221907-215701@https.bugzilla.kernel.org/>
References: <bug-221907-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221907

--- Comment #2 from aich (mathena161@gmail.com) ---
Created attachment 310712
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310712&action=3Dedit
dmidecode output confirming model and BIOS 2.21

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

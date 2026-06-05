Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379982264CA
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683503; cv=none; b=TaRycDVwsPchh0g3mXXwz8L8KDOPSea96QAOL4g5buDqG9BL6E9Nh1QBBunrB0dI10A0oPMr+nerZvrDUkdTGc8B4kiZIkRb7ffWKn9s4LbnKCql1zkvVPlEWrUU1xNKYdJhS9sSJKcdadnLzFWfi/mnlGfGIXD0/ayfquulIKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683503; c=relaxed/simple;
	bh=fyd41VDlhsdPn4TiX1dhosbbiaTYjDHuJJnpYKw/6Kk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+KEa5wP8P6Vc47Zp4MDZo/FO7LRgMfxcv/Xm74STCGresvnsLilkIsmCNKSXePMMNmt7qYL+yut6V+kJbUBeOefg/9ulIMvu518Q16itMOHvvS+KTSnpyo/M8Qw3eDKVQZWrblfuIQ9JYXbe2q8papp2kBxl7IgYUTHIYK+Uno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aomQtS2l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aomQtS2l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF323C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780683502;
	bh=fyd41VDlhsdPn4TiX1dhosbbiaTYjDHuJJnpYKw/6Kk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aomQtS2l30LJCBmuY0N4XZafkKR9zVIvswTEOz8MI0lms9LiJ6VeKcFiSzLD+92BE
	 8tj3lMDFpiXL5DyF3qVbT8TX2oHEjKPb1bVHuBV4oIceyW6D5TDx1ZJJKC5fvzOORv
	 DghKGyvwy6Qu3glqUpq7CDHQuUdANywceCYWjLHHZyVJa2SS+S3DkhiGVrlSI9Ek2p
	 DMniOAKmDim0biX8IZ71WY6LjUr2c5rJE3Oa0wDB40T4pxnj7wQIFbgWzAGotLSA0n
	 Q3hcUqPEnEnoHWItf4jo1MoBvEI8fwFMSSgsdE7uh1KgLEbNEXUuMgobPabfCW89m1
	 9nPNdmL45eLSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C626BC53BBF; Fri,  5 Jun 2026 18:18:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 18:18:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221583-215701-G3gHlqTaMu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #21 from George (george.stafilidis@proton.me) ---
Created attachment 310275
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310275&action=3Dedit
dmesg_ec.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

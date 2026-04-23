Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482992E62B7
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918162; cv=none; b=aLpM3iWGyfJA8IK7C4UV+fMEgk+B/hfz88+6Tc8E3st+uwtkKNuL3wmDeIRwnYQ9qnc2PW3oATGPoMfG+RsdobphLGTZRONsZo5bLakCQ40BzK/HQNJVsQx8/96asJBmLJEAASNF2YciUudpBKkJzKGAhc6j+c4uHxKqpPyUQS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918162; c=relaxed/simple;
	bh=XmYb1YjyIkPZ4W+39IC2teQrJZObilIkFFlGBxCKkCE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tLB9DP2vaV32BUI4UtwSM+W2/hrmAra0b7bAullYUU4fOUlkW1bnALHEkCtiwokIa+l7iQ59NnxJucDxfOOow7hXVWZFLVbpzmSfvBZmghxUo6C9zP3/WjpdeYh9E92JNBmr052ymAJsS4ROt5epAQbitvjNQYx/m2j6nKXRkK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjzi06hP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjzi06hP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5E93C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 04:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776918161;
	bh=XmYb1YjyIkPZ4W+39IC2teQrJZObilIkFFlGBxCKkCE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hjzi06hPnMsrQfbM+4b9uwRxFsft68GR91+D5San781iTOi0OEBsP2oW5HEV11lpo
	 D5VKaq0vvgCqr1D9pAta9MmJuxA1VtLQqD9nJ7vI9Ubson61cqOn4pqx1o3rD5nvHZ
	 DCMVystIOiN8MrKmcxovu3LtdBGzIrTdXjvHTdoUzpiQkXr84KyVd6TjhjLM4deFkA
	 T6Rj5UT0CAH+A+dVwglBLr7OF/4t0Ot3IeynpngNEsUuatXjA3QJfJmnnRMsQCwNJx
	 716RsAWkIkAi4b+8Zl2rvx2pjSBddV7jNmbt97sgAOn+oawcOqt7RHYhU04T/oBegD
	 GmRQKi/vluhVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D0F26C433E1; Thu, 23 Apr 2026 04:22:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Thu, 23 Apr 2026 04:22:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221383-215701-8zudUvtCD1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #21 from Daniel Gibson (metalcaedes@gmail.com) ---
Created attachment 309936
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309936&action=3Dedit
Daniels /proc/interrupts and lsmod output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87E1DBB19
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736979920; cv=none; b=gYxFSlPkTfv4wmeZKSmAlUcwXkB9EIHK3ft7WZwYixbsjDR3ArLDMFBNXwjTbGd9hZlKt7GzQnqbaqiLBdW9C13r7sZz47T20nj2eHw4etFE6QWNw1B6NAUrajKZEkI17n3b2zaW3+au+whnqu86VS6OCvKUBi2sTy6bnqWC1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736979920; c=relaxed/simple;
	bh=uuC74mam7RQuXM7Lmmfk19Dw5Ds9fs/VBO9ailGKN4Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S5WZyM8fWzpLREfi5CixXF2suZoQHc7vpQVI1fu9L3M7l5Y2+SLOezcsw3gs2g/+h7QHWQovweDxjav6chMkbfAhNj9yU0+IyYSBBv2d5FwF01w5db4Gii2ePZntINEHfI+ZQcgqOK+FdrvSsGfn6GMdOisCMWsox1hYhRYTCZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8O0gVjb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8O0gVjb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 590DDC4CEE3
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 22:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736979920;
	bh=uuC74mam7RQuXM7Lmmfk19Dw5Ds9fs/VBO9ailGKN4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k8O0gVjbbtEAhNPZ6hFV1ZePO7AaHkIW6sOaZemq0Wl61ZgCRhmNePW90xoEWzbwy
	 vacGgUwwIHGiuOc78MvEqjgzR89gKHZ1HKe8QQNwOkEz+6n7gPwYgvN/XL7JH6Ho8k
	 rqTZ16c8aMAx+4DWtMOocF0DMEdMzpCbzti3T+5KOuTCgk5K2SrUpitIVA/ZMWSBPx
	 4NbgdgDCHTDpIh3UykaR7hDtJgjTU6W6vTa1ZGMKJkoF5m/oxUMQwt94yPT5Qi18Il
	 3DrVoZEu+ZOV/UBLiylvICC74GLNDBfZKSk2HbXfort6T4exCTeJT81sjHm3qNgWaP
	 wo/W50auvMC9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E444C41614; Wed, 15 Jan 2025 22:25:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219696] touchscreen (i2c) stop working after hibernation
 (Lenovo YB1-X91F)
Date: Wed, 15 Jan 2025 22:25:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lakostis@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-219696-215701-WMvv47aXBI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219696-215701@https.bugzilla.kernel.org/>
References: <bug-219696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219696

Konstantin A. Lepikhov (lakostis@altlinux.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.12.9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

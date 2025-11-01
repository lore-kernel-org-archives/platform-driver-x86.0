Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4E2566FC
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762014578; cv=none; b=UJ9pdZ9n+9uVYXpqG809hQTDtpWcA0xY2/xFPYTfnMLhRNhlyfMGWti3EnbfGAZxpdpZzeI0auE0Xb+iZc+bxKalWockJyKYdafGe5VXmhyouFU5c2unTSuG2/1GRKFaU5W4M3HV7X8jDXXxszNuu5k2ekebfMc8b/gl+02aups=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762014578; c=relaxed/simple;
	bh=31dg2b0kfwTstFDMVYkMtr4hizkopqy5VURqf0ueOpY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SfVLJvNxe4SD4slho9JoB2hsuFTYVwmTZojThdWSXHwjJ36X1yh0OnOIi/XRdeaiz9LrnInOvhb+AI7yB6nlurVVbdG2uKRBONoWNXEc0AFs3T8J9BukesKYRmu0mSwsQ+rMdfIkq4kKl+a/97x3wGXlnb+cQ3v9qsR1IgFcHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hllavnl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hllavnl6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26DFDC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762014578;
	bh=31dg2b0kfwTstFDMVYkMtr4hizkopqy5VURqf0ueOpY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Hllavnl668KE/ui9Q9KOMNuKgzYpTWqE2eTOK9YqlS+iFRma/IP3fqzrvOWje3N0G
	 kZoSa0ssvAld9PQAN8Ymld3LDIqS7kQeWP768X5vHC8iU9ruCpMCkBwmNnZLhOz2Pz
	 j+MKISlQxlyeGAb75BjR9F0QKu4BVNkpjAQvu8wij61GsxKMFOqvQzt72t2mleVM6Q
	 r+9RRAkbe4pjU/6CFOFYj7E8OyjhnMnx1m2mBn2BRmkmhCGCnrcixg4hlW1dP8FSSj
	 vTN2cTEsZtJ5+vKyFep+gMUnIWXrKnhzzF3zacu8463cH94no22SwMMjBW9BZdWl8E
	 pcd5fxO7sGyog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16802C433E1; Sat,  1 Nov 2025 16:29:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 01 Nov 2025 16:29:37 +0000
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
Message-ID: <bug-219904-215701-i4UBt0JdOn@https.bugzilla.kernel.org/>
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

--- Comment #9 from popy (tobias.diendorfer@gmail.com) ---
@KeyofBlueS my first ticket to gigabyte #1818413 was just receiving an stan=
dard
answer...

Since there is only one comment about the issue on Reddit without any other
information, please provide more info(screenshot or video) about the issue.

Please also clear CMOS, install latest BIOS, install another SSD with no da=
ta
stored, install OS, APP Center, drivers, and check again.

... had not time to test any further so i went with the workaround (after b=
oot
trigger standby and wakup in 5 seconds :-) )

But after i read your post, i am not giving up on this.

Have created an new ticket on gigabyte eSupport platform with link to your
comment.

Hope they take this now serious and just trying to reproduce the issue!

Otherwise i will go the ASUS route for my next system (NAS, PC, ...)

Will keep you updated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

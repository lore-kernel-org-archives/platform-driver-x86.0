Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5F9125AA
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777228993; cv=none; b=sRatGOOTZwPtZLmPGun+WRgrfQUoAXHTJNIOdKJenAkCak121VqV8HQ54fUnWj5bKNJjOUsbqGbRRpQwSPpzNWKadqIRVT1OjTTDFAg+mNjjI1OfHoSpSP98UBmqAfEK1iL1YTFsvevDPnv7x2l0aLtntTXkqgpK7pLuzX/8uSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777228993; c=relaxed/simple;
	bh=MIh3mQUgba5MIwQ2L6fJMv7ICA2umsCydoGPlO434Ic=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PDK0G6sQOZMqFm5Z/yl+LOh9UNlbaWF/n8zjn+VAnsLniuYYv1fhzvdOpTqC1/W0nQs9vxGZ44m9UzDlKmeOJvPbimy1cXoGIRzUgY0mNGjGWwSN9+3hvyezAUYhnLktm3AaKjWhHgpHOeE8VYIAX/g7nef5jk6yljCfkOUMols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxaR7tyH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxaR7tyH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09EA0C2BCC4
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777228993;
	bh=MIh3mQUgba5MIwQ2L6fJMv7ICA2umsCydoGPlO434Ic=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SxaR7tyHxWUFqGcKSvNqEmTLzAW+CgdMFbESUQ6A0vUQZUhFZTWU8Hy4kSyU6Bd+L
	 loyrPrjscVpwCr9aFpkSKAUEZmPrYGM/GK0W9lBTz9TWwyidhJ0j5xHq0bwVZBb6cv
	 u3WvV4Ak77rYsBSyB+cq/0W1vVthw7MHmN8xwxfPULPNUs6tDqx0OClreeHoXVu7PM
	 inFXTwuGYHkctSpQsK5JkY4ChzTE461Pha5s2IYygdnwlBMWTsRRT0dRwGI0OznEW3
	 G13hZCAu4NMXXBU/pf4Yr7LEHecrFKVT6by+Zwr8t8L3Yfse3/1RGd8XHZEfGSGOYh
	 b3zY9v4Zbb1QQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 03D2AC41616; Sun, 26 Apr 2026 18:43:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 26 Apr 2026 18:43:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: boite.pour.spam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-uLDUHbeEqs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #62 from boite.pour.spam@gmail.com ---
Created attachment 309966
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309966&action=3Dedit
ACPI Dump for 83HY

If it's of any help, done with the latest BIOS installed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

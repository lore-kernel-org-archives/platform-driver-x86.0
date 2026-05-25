Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC73380FED
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 13:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715096; cv=none; b=JvSCyq4L4PwuFtry5xF4moNPCqL3IIYwqmwyP4eiM+Vks5VpZmp5daaHuk+U1Ya8tODk64XJ4iew0JIyjxpHPm+AVVN0a7iZdFB06SrOGwuU8YXaCntjYB0eX79VGvVdWF7/57hMXrHGM0+FJ4q5KgKxuG0FQgWh3UBthMIgwKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715096; c=relaxed/simple;
	bh=FdmvCPnrDphoHAdJmyNIPugwhqJL0FH/ZRTVT5vZde4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dmR3MecUpMkUjygUIfPeaYi6KcGzYOhjYc5Lz0bteE56s/P75bMQQMWE0VPsBT+9wXiBJYh3e5bwTI6tERWOHZfGcF9PFGtgBk27ARi/jBcLv7ophgY7wm0CEpYXRrrqusqKF4IJ76/9XpEvlcqW1yRrMe/XcKnd5S95KLokKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQ/tJU9V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQ/tJU9V"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26B4EC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779715096;
	bh=FdmvCPnrDphoHAdJmyNIPugwhqJL0FH/ZRTVT5vZde4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AQ/tJU9VRZFDpaaLkSvHxZibLY+8IsxG7kRKujsBVq3iTYi5vfJFT907FV7TJaSzp
	 p0tOmS2M/Q6CTC6js6WaMytGb+bS33mFRRGhZUgV6HLO92mY7ZAAO5CJkVewPRh1pk
	 5vBHEDbCWvPEeCCn0Cb+wntfDNPFrTERovlL1kC1pLRylgqqgNF1WHRW/U8Y7Y8GNX
	 dYfYcE+kxF8Nufn2m8PtIysaTLk3orOdry0U+OiqdKYOr6aeGRo3JkNIcX74gkdzis
	 iCEBxv0/6mPzFZ8Vkus6oV8QGdcM66tPHpCkbgprcS6mMn7q3VZr8MxMAB+Uv2c8po
	 TLoUT/s0e3KJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08A31C4160E; Mon, 25 May 2026 13:18:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 25 May 2026 13:18:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-4oWmtAJG0V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
I've no idea, but you could bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

to speed up the process of identifying the bad commit and fixing the
regression.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

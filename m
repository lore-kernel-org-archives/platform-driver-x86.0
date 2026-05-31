Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5F32B13C
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218406; cv=none; b=g7JyTFhskl892EKEBcByZA6KcOp0aa8u3HiS1UF70j6Q6/6JpdMSiesMa08PaoNZZm4CxF8atxdeHFmx6ZQqgm0kZWVpOyAM9jgGXO2c4sJbI6fvY5wcqQ2nrMXl15x5cv5dJXOksMefI4/rA9NSpmVCyx7KSNX0iinOX3ssVLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218406; c=relaxed/simple;
	bh=qR4Bs1KxmzdSWnFk+UYAh1CCluMX0C8vIVBUbNSG9Nk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0ArZjqN6njfIUOSWPstz1H3nMhL6uXdzYQ4jD4mMzdYO3nB917NzaNr0BTq9cw1JMJtl8dapVlXDraCt6HY6Co7OXdlToJd6lk2/tz/hkudiOApUV8wF2XoFHHq9E7Eqg18+U+ziU+y2wkQTsAqwZnKQe8lIzcsn8j8mD7TEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GC+mJCTF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GC+mJCTF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F55EC2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780218406;
	bh=qR4Bs1KxmzdSWnFk+UYAh1CCluMX0C8vIVBUbNSG9Nk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GC+mJCTF+T0iCoxSA1sQwMRPlNdd+gMI4SRpBwGCJYHcW67TGZbWNo7h9otGmHdc4
	 2efhjmaGNNet7BBLgAlOlP8oS3tmOQ6W6HX7d6qRdPhJ5bdmhn95TYr5Gc6KQovhqK
	 yMWN2pm0vru6x87RRX6cZdocV7/c741Av3P/+1fxrZyMOWvHkFEy7F+Y0qwvznA+K1
	 fnvyAJUmfKlwq7YWaXvuSadnpZeoGIq6VnIeuuAhe9Z1D6iS4xpNNDGktzjyi/Kcm9
	 SJE87iqmymNuIh/5AciBhhFRTDq2SGmfTLnS8QyEYj51RAXFpIkuWJtpP2CCghji0e
	 4eC3YLF2eXjjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 47018C41612; Sun, 31 May 2026 09:06:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sun, 31 May 2026 09:06:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221569-215701-3OTK9pc7Rs@https.bugzilla.kernel.org/>
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

--- Comment #6 from Milan Oravec (moravec@ukf.sk) ---
Created attachment 310223
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310223&action=3Dedit
syslog7.1-rc

syslog7.1-rc

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

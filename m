Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65492309B6
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 05:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732168229; cv=none; b=qgWnfhP3ZfO1YKsSBjpb95L2+iLC+QdE+N9fo+31NWlJxA0arKe96AUqz7q3Z4Ly5dHwBTX8OHzmF4uQJqPkdaum7V+b64tUchG/7sx4hZ59dkKrmIcM2Pu769lEab48dwYiGdoT7W0p5jRuowYMuKidawqHVgyFQH985sBrPOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732168229; c=relaxed/simple;
	bh=YKBYcO2s6kvNyzn1VoFtOuAC/eXIUFfIaZnZH203OJI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BSGtpc9kgGysfjtwATHtq+vcQ44aZJ83n5gmD0zGtoWpNiDssIeR8UTD2OgEQFf8dsek8LxX49OeeypgK3p3nnAsoZ6j50lD1V3OhXlyhyuGVfoYB2q8CgQPTIbmS38eUDZSrSN7yTidEx9VzB+cN21jGD3RnnN7ifOCYkA+Muo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vix3PdvO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vix3PdvO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88A5CC4CECC
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 05:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732168228;
	bh=YKBYcO2s6kvNyzn1VoFtOuAC/eXIUFfIaZnZH203OJI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vix3PdvOtV+Wuk3LKH3brYY6KwcGFD1gE9Ht5MEVO+jL9HJ0nNzffg0evoWu+YfTU
	 o14weQscLz1E2awURoLSK6ggTAI/u2ybNxLNbZJj0WBrv05nts8ru0c6x9pshuw+FL
	 TZ8TfySjw9tt38DZwq41hI8vt0LC5oOmfm+khXENd/GIr2JGQ8n8xpYdwIBSoIIPra
	 VM4ORivCzlBWMsRr7xmoH7mpLFEXwHkteXm8m1dfXcOdvMje6x9YPep25La10Z1MDh
	 UjmKev5A6LwUa95106HvhjY5X+b0ND+ubLB8h5K5UrR+Q11F/a/2lZr13fNklcg9L9
	 cmgN7SqfzkAKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 789E2C53BBF; Thu, 21 Nov 2024 05:50:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219517] REGRESSION: charge_control missing in 6.12
Date: Thu, 21 Nov 2024 05:50:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: auslands-kv@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219517-215701-hVVboViYyx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219517-215701@https.bugzilla.kernel.org/>
References: <bug-219517-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219517

--- Comment #2 from Michael (auslands-kv@gmx.de) ---
Hi Armin

Yes, the asus-wmi driver loads, but the asus-nb-wmi driver fails with error=
 5.
Here is the relevant dmesg:

 dmesg|grep asus
[   18.552935] asus_wmi: ASUS WMI generic driver loaded
[   18.570919] asus_wmi: Initialization: 0x1
[   18.572730] asus_wmi: SFUN value: 0x21
[   18.572746] asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
[   18.619578] asus_wmi: Failed to set throttle thermal policy (retval): 0x0
[   18.619584] asus_wmi: Failed to set default thermal profile
[   18.619589] asus-nb-wmi asus-nb-wmi: probe with driver asus-nb-wmi failed
with error -5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

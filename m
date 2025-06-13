Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980341E50E
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825300; cv=none; b=soBLkFnGOHD8Ys6Q2tzZpYU4hJf+8k9ftoqAL26CkO7yR1j06J1YgmjzGrQz1iwIUfSrsa45YdzQoFaLmkvQmbki/yL30IN2JlqNtPLzrWJvB6NfbGx35AXetwUI7OrX/ravZxbhngkDtqd8dHOLfXnBRpCnRsucmPidkTT5mIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825300; c=relaxed/simple;
	bh=z9hLIU4TjCl6S5JvAzM63RBzTq5XRYoIeMxvJ99ssOM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bBHaYpO5s8YZEMwoTGXJa05T320GfputBTISaA2RItAtOdaczipuDWMKpycRHfXMBS+qaJWBKyOyaUPNX+vaeYvzRzSvIrQcA1Zywn+Kuje5IGAR6GgGheGFDolZIm+7QkdcnoarmOvqxcTwe4rgejVEaoo+i7rwT1m5kj8boFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkG7CWKX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkG7CWKX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40C1CC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825300;
	bh=z9hLIU4TjCl6S5JvAzM63RBzTq5XRYoIeMxvJ99ssOM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lkG7CWKXCH60B5yhsLcKhD4/eOywIe4CBDddNbWhOYSqV78EsP5t5RvH79s7C6BKG
	 rU7yddZ69twrag7ezwbuabN1k0GIDbhUC08st0/6+NH5X3uniXWEatz1tdKIr+rw9h
	 y0rdmIjUMk05OSvqEvIdbjff3HXMXzk6gUOump1FbTnfwZiCY1sHrG8SLIsEmMhPP8
	 VgFoNf+y1fVibrCQzyVZ0HB0F/VjnkvV/l7sjPcPBH/4p0ZNPHntx0/JeNEB2JORlF
	 9Yj8ynCAgwH05zz6hZh9SgGPIWCwDatKD0aAkQjqpGJarZqtkaYcnNnpOxc65ARuP9
	 AnuBUicZ1N34w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32EB3C41614; Fri, 13 Jun 2025 14:35:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 14:34:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-nrKZvShv8X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #17 from g.molinaro@linuxmail.org ---
Sorry, I thought I had the dmesg, but I cannot find the file. The system may
have crashed before the command could be executed via ssh.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

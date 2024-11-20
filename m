Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C3EE545
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732072794; cv=none; b=Y2FXso8qKlEDhAvZ/58lY8SoWNgJfCV4mZckwmWwOQaq6qbWfktK9exewGL5NFrBC4VEZs1apn7si/hjRQIWhLf4F2+sWFpWplddG5siePC3KkF67x4BZG4M/1U7Y/FQWb0sVA6QAb0pLIt+/3sHD9Y4Kz+G3Uy/6QtAUP45Nec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732072794; c=relaxed/simple;
	bh=MTa3/QuRsImwXrap8W/AcR1DQa5Zn9a6RsqfHRj6GaA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V6DOSzcJiYSeBTC9ZN1Mwc3CqX5PxkG+/QyKadQlc65X5afsobg1KmpCzbMq4fCv9q9bj/VtdVaTPHYGB2ULseZR7IYZpDmxddi5xYY1ru4ulWimNzdIRQFD55Hq+huw7aT6tzIFDO0Gwvh7GaTa6+vWVEpGOVRfcrrbEEsy9AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGNmMMi4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGNmMMi4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12DDEC4CED1
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 03:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732072794;
	bh=MTa3/QuRsImwXrap8W/AcR1DQa5Zn9a6RsqfHRj6GaA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BGNmMMi4eCS1dJg6fAJq2WmBv5PoXPXvT0MuipeEonyc8HFU+oFsUfw8VhVsbZpA+
	 1+4v8VHXAhV6Zff0TUsenxQap9KVdFRJZHMi+3PgjdVP1ZFkcpxhVwj+W/CpBIklyG
	 dufgLcg/uUugBo8HqL5mstCEZcUw679w+sb/Qurr9D9MoeKr5ZY+wyav8TPZmR66ju
	 lalsLYJDZ8C9ISPEqLNUjp+CwvwnjWW9OFt98Obnm/3BwaeeWLViLtf2Ep3VnPWspY
	 Xv90sTARdW8PCDL8wva8l0K8LTjz2CVwVQ1qHgAf8tOmRvwuttwhzbg/91iYZC/GYM
	 AR32Fcsi/vOXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A9E7CAB786; Wed, 20 Nov 2024 03:19:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219515] intel_th_pci Driver Probe Failed with Error Code -107
Date: Wed, 20 Nov 2024 03:19:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219515-215701-tiWPv1jGEM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219515-215701@https.bugzilla.kernel.org/>
References: <bug-219515-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219515

--- Comment #4 from andy.liang@hpe.com ---
Created attachment 307252
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307252&action=3Dedit
S15SP6 Dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

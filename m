Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8237DA93
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Aug 2025 10:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755425042; cv=none; b=gVIZmM62ZQLOLoZlDGDAJ/BzkGPwZMzZmXXXTayd4Yuy3RI3m+Qpi76g18K0jlLGNGyN6pi5BOe0puOXeHd39BLpPR7jwpIQm/ANiqnBG/dM6N6QO9DS0ttKktwjLuG75My/HFQiKXBI4QEVgv4n9DQFcjf8ZMOawA/CFOeGmBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755425042; c=relaxed/simple;
	bh=Qf7fszaBp4CnMiyAnYyV5OYgwwbhnAG68T+RaTiQhBA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ee1ohR2eg87+ID6Nwn0eGsyaI+iYlgHjfyHAZhSAvMyZ/1N9nTHSE8kixuTf5JyGT0jijiKQENSFS4n3ajt0O5y6r1GQE6G9HnprLfDWI1qLgk/cmMiYdX605bP+vVJScUySOjf0DbLK/EeJDdRIDoXWBkOlpAy8zWyqD0nbOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxSMV7JN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxSMV7JN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41BCEC19421
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Aug 2025 10:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755425042;
	bh=Qf7fszaBp4CnMiyAnYyV5OYgwwbhnAG68T+RaTiQhBA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lxSMV7JN3TJiWEMsH3CSAFxSXCIFN3eP9ZaU/aV/kQX2TttDduq10Caimo51lW5WY
	 mQ6YsW7vW+FRYfZDjl06NRueh0Owhzw2dmdyJ8iqbfvmwZke/BB9e5ZCT/qy2AgvnA
	 1sZRxPp+aa40/wLaLgLECPwTdvl7Z3cufczcaQA4iWU/N/sc4XpOZAmVIrMtT4tOZx
	 IIwxxFBwI8suV0hUsLgQE0+JYYWCxQfsYgnqmYkMd72s1OsWxszQx9KFSNwcjzabid
	 B+MS3/J6weIkX7H9UtzgP6NQGABYFGsCMFD9qCEeQrgEf2uDvCSqA19wBdibEy9ZBj
	 frxJ4H8axmYBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3CA13C4160E; Sun, 17 Aug 2025 10:04:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220462] Mute and Mic Mute LEDs not exposed via hp-wmi
Date: Sun, 17 Aug 2025 10:04:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: bp@alien8.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc assigned_to
Message-ID: <bug-220462-215701-6LWYUR3MBy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220462-215701@https.bugzilla.kernel.org/>
References: <bug-220462-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220462

Borislav Petkov (bp@alien8.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bp@alien8.de
           Assignee|platform_x86_64@kernel-bugs |drivers_platform_x86@kernel
                   |.osdl.org                   |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

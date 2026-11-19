Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063865;
	b=X3Jaxq4sppy62jeBiDcx6/ti8T7SM7vMe8b93gzf+mMUxLhAt+k/85aU1/lLSEN1ZBRV
	 JfLobuueFBMYmWlNekYntspT52xpEUcShTVsSC6Up+HOy+BlyN3mieSZMKGARVefNjlFC
	 jSvqmqtemRcv2AwR3VYhxEYt0l3VpkvD3rSXyBAOo25yCFkE7TwqgucNn73Wy2qU+Fmeo
	 wHltic3VbRim/9OJxjEv5R17svMmDFVHOxlFIttxCr/M2RhBP6SUDUYpWY2dhI5yGsE6L
	 7TKDt+Q6DuGSrVLeBAHkQfuq5vpd/2eyqllioaco/See/hu0Hs28G4UvzCNCkveOp7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063865;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=8AIcoNb6emg7X0Jv2EE8QsTJNvbMKuP33CFHtprFvYI=;
	b=yfltwkkUcmiitK+3MnT2M7ANWAAAToS+k0XNuYaROxls44lLVN+WYgTHbqoB0Amhvn5d
	 GNzW1tZoYMbsBJbNiDDjhCRo+OvEtT7PleG2skHpQ2keOscJu5AK+FYSgMMDaAN3eZopl
	 y36RmPEcSNKoyZ1xUMCQKS17aYZsd37aAVqu68Tq31mxI92Fn+SKGAnRsOm+5s0I+cAdu
	 sl6ACeUY8CwEHz+Yq3xuDsADFhZGwtq39BWoGQy+16pRanpYPPmc5UCsJr7Mtaa1lJvyb
	 dKUly+vgBjXFejnFjyd2IPOtrptNHjd4MIMfkrDga0daKvs11pZ230l32mSWjuWUHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRTuczQV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3A606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 04:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRTuczQV
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89DA91F000C5
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 04:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795063865;
	bh=8AIcoNb6emg7X0Jv2EE8QsTJNvbMKuP33CFHtprFvYI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XRTuczQVkFd0Co6OjJMakmnvmDJt0hkIPz8Q1HD1NhXKeWVGNHKu1uQp3LY6jxg64
	 rbIRtGCAekfiIF7us80i8anGQBByw6jjRnNoEl3mTg/vijKcK05qtpfLMCpTXOV9BP
	 wjnQ3RJStBqy6ES395SmQsHTywDH89ijrvaWEPGK/eVm3vMggEO8vpkX00wzbTL5sP
	 1GOQjeoDDRb/KMbC1anFWA8WQVYOVQUiDDwOfqbVuSPtk+5ZzhNbXs7yvq7Q/tO0Jf
	 zQSuQqUKqoUh9HrraDccEp/afrzT8tlzRTTC58OmJhLKnHDaeTdt/xZavZPkwyBusS
	 9nLWhk2WB9zXQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 7CAF8240040D; Thu, 19 Nov 2026 04:51:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222275] lg_laptop: LG gram 16UD55U - kbd_backlight has no
 effect, unknown WMI scancodes on Super key
Date: Thu, 19 Nov 2026 04:51:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222275-215701-RDpPOB3592@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222275-215701@https.bugzilla.kernel.org/>
References: <bug-222275-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222275

--- Comment #6 from Armin Wolf (W_Armin@gmx.de) ---
Created attachment 311507
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311507&action=3Dedit
Patched kernel module

I patched the lg-laptop driver to automatically detect if a given device
support the keyboard backlight feature. Can you check if the patched module
correctly works on your machine and hides the keyboard backlight device?

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=

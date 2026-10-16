Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486B3513546
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172404; cv=none; b=As0FNz+bdCoCTkejQ7jDBCN4KR/k863nPQJB2jlbtUuu8EtLkORuFPtiwv51zY1l2ZoTnrDgE9HArl/caGweneHWOrMdk2TFBxsOWv+9cC0XLmaPAw/Sa8OzTgNOO0IiV/pXTv0Tvix55WWVVD1UGGUPa+VHenEscSQTVTg6KKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172404; c=relaxed/simple;
	bh=1BRFBX1X5bBZ+PgEYbhyEla5n6RSOZ4EFm2v7KB0ALA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b8BvCqCZhMH1nMMoOPoWQXjoGBCLFyyQTVdqNY++AciwYTF/x9XpSI9j6AAwi22YBzG8pjOGxJyfF6E0aRS5ev87gVccmtu5kt4WrYSaVV6JTRjj/aXtXgYxpTPFOF2c9mCAkKs6Ab6buC1r3RoZ29jVI3+mjQVXeLECKMycFPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aM9W4Wcu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aM9W4Wcu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C45F9C2BCF5
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792172403;
	bh=1BRFBX1X5bBZ+PgEYbhyEla5n6RSOZ4EFm2v7KB0ALA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aM9W4WcuZU0TdGX8A07oHeWjqAy12AI+Lx+Ow0wctWIYQRDKPmVWNA3XoFoNaP7O3
	 CpuHJALgApSXO0iCK3Y3B3h/MKoxfjpQNLVciaL3Xx+gQ2atFjDcwcwGTIGzrxPKHg
	 BBGuG8ZcAWMfWEcxwnIsywUi7uvTGmIBjiPAargWjnV6fM2tN3AtTyLjv+3thN3bdD
	 Ie9/yJWcWhmCP9dBsfz9QSIXnaEywyKWmvCOXpv5WHtmA6PgtNaY+BHms9JNUeWetG
	 Iey+z4so3VDtyaA+JF0hmMkYsqISRWpx6smo2JNhp+Mmxhed2MlEWxQMqaVmtrzqWC
	 6i9n0+DsupJjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A66E3C3279F; Fri, 16 Oct 2026 17:40:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222138] hp-wmi: HPWMI_GM queries fail with AE_AML_OPERAND_TYPE
 on OmniBook 5 16-ag1xxx (8DF4); firmware WHCM never calls GMCF
Date: Fri, 16 Oct 2026 17:40:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-222138-215701-SEworU7f1q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222138-215701@https.bugzilla.kernel.org/>
References: <bug-222138-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222138

Krishna Chomal (krishna.chomal108@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krishna.chomal108@gmail.com

--- Comment #2 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Created attachment 311148
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311148&action=3Dedit
Proposed patch for disabling fan support in hwmon

Hi Lorenzo,

Could you test the proposed patch and check if the WHCM errors appear only =
once
during driver init and not regularly.

Also, all hwmon attributes have been disabled, this includes:
- pwm1_enable
- pwm1
- pwm2
- fan1_input
- fan2_input

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

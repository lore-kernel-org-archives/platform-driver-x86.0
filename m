Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913433033EB
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 02:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790301991; cv=none; b=np1Z4zRqqUUSLNpvXVylLECKirADPtMzv0C3xfNbpQCPPRajL0SRrvcbuPRhEz8JLF333OQGklA2sPhyKUr8llkl00BK54OP9+Glv5IVYaRiOKKBmj7GmUikMuzkfgLw3UaTw88m5rqaFGetCxmIGIo7iGlCXScfP96wDofzBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790301991; c=relaxed/simple;
	bh=ZhWfPh8LfDzk48gMgs5cGb3o3MNKD2q0VLApVko+dwM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iSP9/SfdKfOYmJzyUqYAbKAmLkznbPsiJFp/o6bxEuAU+Jf2wqg+bHdwQvQ146SeTjpbd0mdKYBASK7DI+5F5TmdoH4Xx/G8F19aodr8oP3ijIok4jttp5SfIzZtT60S//gNMmurQE+OCDlr1UKDToAojvtoV+ndbs/nUXS4mUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJ0EW3An; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJ0EW3An"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2732DC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 02:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790301991;
	bh=ZhWfPh8LfDzk48gMgs5cGb3o3MNKD2q0VLApVko+dwM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MJ0EW3AnJRp/3oj7ZPouIYuGgC8roXPNsD4c5sls5LEt9eU/TlmAMGN3DCWYQjYnb
	 yHaQK7L0cd94nzENvALjfmwOBYB1CPTcL7lmP2z2X+ydcpH4EVcqcKNPxJ8lynteOI
	 kSAMPsZpMOAzVjeLWFQ0ZNr6r5nnfPLUTHD+7o46ko34DewCrrWvDbG3IuHpLL/D8P
	 SaoWWsFp4ZDDOE+WvyKoU1+KIq3RQgJOW8D2lGDOKb9PC8LPGrvCXaAj5jV/E7B3fg
	 2V0DnKb00ei5YPG3qL9ywK73/hmRo/aM6PPEulYn159uxhsLjhZLbFy7biRVn9/Y82
	 uoWM6Mnd/Egbg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F325BC433E1; Fri, 25 Sep 2026 02:06:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Fri, 25 Sep 2026 02:06:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zhangheng@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-y0iSyDn3ok@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #2 from Zhang Heng (zhangheng@kylinos.cn) ---

sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x03


sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x02


sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x01

sudo hda-verb /dev/snd/hwC0D0 0x01 0x715 0x00


The x in hwCXD0 depends on whether your sound card is card0, card1, or card=
2.
Check whether these GPIO settings are effective.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

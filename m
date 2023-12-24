Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE32E63B2
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ow7XqMKi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 416FAC433C9
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Dec 2023 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703430767;
	bh=YnhnAqKjFMDKIYytO0sMM1369L3Cme+5cj/bMaaHDUs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ow7XqMKi4JSVDwAMRd1y7oZjrsfwDc2ZrVFNMposf7qpEQ9P/FQIwLDinLOP+gLkH
	 NyZYwg3kHlAxEGZ4XrxW7K8F/ibDMgoZ/xvxMFbjRCMpkkf5JAUeGWTN6hzGrA6n99
	 bVrvYrj8gS19dWTRLzo0GxEKvBpukc6ELuvkhTcRMZ61U4xZNVGkZNJ+QzsHY/yrcD
	 vvGkqzsumGn0nZMnGQrviUMmDlgax6QCpG3mT4+5b40gvN7eKr/gSKLuRByTPA17V2
	 922jMhch09J1T2ymmjwAuV3U8SiP1cM5C+xIoPu4VKuODzqKm6SXNa5D4icxQOkcDT
	 ymvzEQrsaZIyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21C5FC4332E; Sun, 24 Dec 2023 15:12:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Sun, 24 Dec 2023 15:12:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-XePPptQMfC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Armin Wolf from comment #2)
> Does the issue also happen if you dont use ryzenadj?

Yes, today a single suspend resume cycle has been enough to trigger this bu=
g.

This is the result of this bug (no settings have been altered prior):

ryzenadj -i
CPU Family: Phoenix
SMU_SERVICE REQ_ID:0x3
SMU_SERVICE REQ: arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0x0, arg5: =
0x0
SMU_SERVICE REP: REP: 0x1, arg0: 0xe, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0=
x0,
arg5: 0x0
SMU BIOS Interface Version: 14
Version: v0.14.0=20
init_table
SMU_SERVICE REQ_ID:0x6
SMU_SERVICE REQ: arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0x0, arg5: =
0x0
SMU_SERVICE REP: REP: 0x1, arg0: 0x4c0008, arg1:0x0, arg2:0x0, arg3:0x0, ar=
g4:
0x0, arg5: 0x0
SMU_SERVICE REQ_ID:0x66
SMU_SERVICE REQ: arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0x0, arg5: =
0x0
SMU_SERVICE REP: REP: 0x1, arg0: 0x9e300000, arg1:0x7, arg2:0x0, arg3:0x0,
arg4: 0x0, arg5: 0x0
SMU_SERVICE REQ_ID:0x65
SMU_SERVICE REQ: arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0x0, arg5: =
0x0
SMU_SERVICE REP: REP: 0xfd, arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: =
0x0,
arg5: 0x0
SMU_SERVICE REQ_ID:0x65
SMU_SERVICE REQ: arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0x0, arg5: =
0x0
SMU_SERVICE REP: REP: 0x1, arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0=
x0,
arg5: 0x0
PM Table Version: 4c0008
SMU_SERVICE REQ_ID:0x65
SMU_SERVICE REQ: arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0x0, arg5: =
0x0
SMU_SERVICE REP: REP: 0x1, arg0: 0x0, arg1:0x0, arg2:0x0, arg3:0x0, arg4: 0=
x0,
arg5: 0x0
|        Name         |   Value   |     Parameter      |
|---------------------|-----------|--------------------|
| STAPM LIMIT         |    51.000 | stapm-limit        |
| STAPM VALUE         |     4.150 |                    |
| PPT LIMIT FAST      |    51.000 | fast-limit         |
| PPT VALUE FAST      |     6.040 |                    |
| PPT LIMIT SLOW      |    41.000 | slow-limit         |
| PPT VALUE SLOW      |     4.056 |                    |
| StapmTimeConst      |       nan | stapm-time         |
| SlowPPTTimeConst    |       nan | slow-time          |
| PPT LIMIT APU       |       nan | apu-slow-limit     |
| PPT VALUE APU       |       nan |                    |
| TDC LIMIT VDD       |       nan | vrm-current        |
| TDC VALUE VDD       |       nan |                    |
| TDC LIMIT SOC       |       nan | vrmsoc-current     |
| TDC VALUE SOC       |       nan |                    |
| EDC LIMIT VDD       |       nan | vrmmax-current     |
| EDC VALUE VDD       |       nan |                    |
| EDC LIMIT SOC       |       nan | vrmsocmax-current  |
| EDC VALUE SOC       |       nan |                    |
| THM LIMIT CORE      |       nan | tctl-temp          |
| THM VALUE CORE      |       nan |                    |
| STT LIMIT APU       |       nan | apu-skin-temp      |
| STT VALUE APU       |       nan |                    |
| STT LIMIT dGPU      |       nan | dgpu-skin-temp     |
| STT VALUE dGPU      |       nan |                    |
| CCLK Boost SETPOINT |       nan | power-saving /     |
| CCLK BUSY VALUE     |       nan | max-performance    |


STAMP, PPT FAST and PPT SLOW all have broken values.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

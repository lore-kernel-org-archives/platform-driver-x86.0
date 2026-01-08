Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3132FFDE2
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767855018; cv=none; b=Vuhs+bk41JcPrtNKRLvdxHIy1AxPd4t0VL70GwfHIcMtjcsfgl2GMzXnCBpnbmRyBbAQaxJta6kupu9kpUNJ2+RNeYmDm0kJ/vDcB2iMp6n2+wqeR9xV4di/7z5duxu1oKsYUrMAVfNHGx5+YfoHkfMJJoTYdQRfDUy/mzg5S/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767855018; c=relaxed/simple;
	bh=wxKbtcujm7Wae4xAliGaKie3QVcg1XYok4gZhtnC1o0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s6PGdEcHX5eGD1JbDhhFZHZHgQCB068MyLiPfk1WQqCfX68A7E6WsTny4jWnoGTr3gky3GPMUmpS6bZGEwre2XT9WxYIfuGJFbVWwuCmSNbyLGiTIHuEpK6AHAfusWRoL23wD+RQukE7GgAOSDHblI3pW6RAHFhNOn8c0aQcRi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFOCCxWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFOCCxWx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D753C2BCAF
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 06:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767855018;
	bh=wxKbtcujm7Wae4xAliGaKie3QVcg1XYok4gZhtnC1o0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TFOCCxWxA9W4Zk2bQ2OaGU5/QfCSeVIgCOIQj3rOh54ePQeaGoPNeZWJwXrxSPdMB
	 sMuI605x9mYwe3Fs3k+Yq4H+YpcIeJ7N+pr3uy14Lf6gREZq2F0td/ZsfEEM5eURr+
	 YnMqW93jyt2wEHq6aGHDRRzclucjesL57jW/gI2Wy67Le34CqFvxdiSTJKScjnlyL1
	 XCaKRTp9zHLCLC4b+hRgq26+sFUeIdrLRFI91zhka7vmU+0TL3FUyfuO1hJKo+IhDz
	 Vyo3Z6X5A8He9RuwoWefPY7iel1h05EXI4NlqypZ8Zhg9vVvKJKEIf1aHB6naFC1z/
	 sI48MaEYKHJQg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 16656C433E1; Thu,  8 Jan 2026 06:50:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 08 Jan 2026 06:50:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tore@fud.no
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218305-215701-l5LPDVWTkU@https.bugzilla.kernel.org/>
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

--- Comment #146 from Tore Anderson (tore@fud.no) ---
Created attachment 309150
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309150&action=3Dedit
acpidump

(In reply to Gergo K from comment #145)
> Can someone upload an acpidump output? Thanks.

Attached. This is from an =C2=ABHP EliteBook 845 14 inch G11 Notebook PC=C2=
=BB with a
=C2=ABAMD Ryzen 7 8840HS w/ Radeon 780M Graphics=C2=BB. Note that CPU was *=
not* throttled
while I took this dump, it was running normally.

Tore

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

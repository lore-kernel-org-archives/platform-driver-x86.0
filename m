Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF93BB47
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717341663; cv=none; b=iVt9PWC78nraVqu5NRWsTp/48nwCIuwNPc2l82Tlv0eY19uEb9etmaBEjNEZWlDYYA9kcid5mVlD5iXrneW7LteLKcylK2yNSdQRbloxxphgNKvwdHniwAVp3sjzxNtzGlx81pf0FExlvIdlJClo3j+A+GQYm/oDljo7J3OAI78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717341663; c=relaxed/simple;
	bh=ufuGE4Sb4x/dRbc+w6hAUMLhG4Pz4ZeTnyDFosCksHo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O1Y2sTC1Gs4lcIsuaYZ2PCDPVCpSW2jDDNhnaQhMPjZwO4Sove9ExW4elMWBBaA4/0zDHWr/qpMGzJn88tVcne6ohr8wKbfQ3hu4xGphOhVaemiIEYX0m2yI4sAK89AHFFE5/g8wRAI9sYD5zD8glxKqWcuVl8NKSbkr83tYLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP1/niem; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP1/niem"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA823C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717341663;
	bh=ufuGE4Sb4x/dRbc+w6hAUMLhG4Pz4ZeTnyDFosCksHo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WP1/niemqJFIP5M9asnQdc+p2M+HbEAXHzEzuoUzwysq4JK6YGc6QptXIQSiQulZ0
	 cC3bLVJD1J9HFi3hw9pnxHmZ35HVxG6EWlrVB+jvdpytAVfSNqtTgER5SSkv8vip/N
	 CTI6yGzc3i6mYtB933EtXKWT7D3Ymchtncn+LjNvGnfRf13OjMHbHMSG7oUbmWEq8g
	 do0Y0sNha68+wWMiou1Rbs8FBMRTEm1H2hYljdN65GywfVMATr79H34MCqDlGr1Wzu
	 rNTEXDsvX2MF8Pr2+man1lhNBEt/G6XG1MF/cqwsoP4KU03xepYcEAXMPUn/HQQgkw
	 d7uiN+IugA8kA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D235EC433E5; Sun,  2 Jun 2024 15:21:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 02 Jun 2024 15:21:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-BIfcJf8En2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #17 from Agathe Boutmy (agathe@boutmy.com) ---
The /sys/devices/platform/lg-laptop/ folder is still missing so maybe that's
related to the issue with the 3 not working FN-keys.
Writing directly in /sys/bus/platform/devices/lg-laptop/reader_mode does not
seem to do anything, /sys/bus/platform/devices/lg-laptop/fn_lock however wo=
rks.
I'm unsure whether fan_mode works or not.
I'm going to turn off the laptop and check if usb_charge works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

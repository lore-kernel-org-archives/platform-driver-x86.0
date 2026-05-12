Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD9C363085
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617401; cv=none; b=AyYpqBS17te/Iit6s7KHD7kK+3R0zf5XmGDSslyoE5jGeWbfjlgU2BMJAKH1tXRC5j1yIJv1dkCCEPrt7mn0dlYPHqhmEZYDIm/cXpQc4E4QavVqLmpuxh355nzRRzGhfHvVJC/FWJvRxRRoh6wEczgunCj8yLBzQUhvgij0nXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617401; c=relaxed/simple;
	bh=GBo6/2jIEXuITBNtVFPgVT4LiJkYDW5JZvfFRRburrI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g78mPCfJ71Iax3axc1ItIl1lTO17U7sVp8wOu5QPJJhdWmPGSGpjXFZ5+fBsZlm5k/JCefFfN2TfvTzMzYRTnYb3hgsu3fgLOevV1HEZg/1Nl/9JBSvbz7RbmYZ0PMMvnm0UJFZiD/0MzWhBNY2b65z0AlS/UMv3X4nWjW84LJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TgLFmWJM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TgLFmWJM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D15E1C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 20:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617400;
	bh=GBo6/2jIEXuITBNtVFPgVT4LiJkYDW5JZvfFRRburrI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TgLFmWJMWTyzfum26wjf2k0F5Ut5dQwCo9QthHf2sSJ8sLNz1GnaKvkCoPTIwtDGD
	 mrhcbIoQItmqt9R1i4Mv06QolzhwAYEp+KubuDYs3DeXS/W9p7inNMxzaJa5Xc+utf
	 5AGj7+jeGg3NofYStzDd4GnefjYEuI8ENU11qE9it/ijdLGE4ctrmTriLmUiRi9k1Q
	 /XeSWynvvbsPdn05BsnaRO+NEim2fAJmYtGaA0RfyWmgsyucfBwpGTJgam0coPS9H+
	 bU7jUuV04sgcUGg/qJM78PYzeY3ksBG4OdEdhUdXOAXSnLLhmvtKcNRyvb/qdmlalL
	 CspBKZI3f7+sw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C63D6C3279F; Tue, 12 May 2026 20:23:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221430] nvidia_wmi_ec_backlight: brightness writes silently
 dropped on HP OMEN 16 (2025)
Date: Tue, 12 May 2026 20:23:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: floquimaurice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221430-215701-p3TsR6curS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221430-215701@https.bugzilla.kernel.org/>
References: <bug-221430-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221430

--- Comment #10 from floquimaurice@gmail.com ---
Created attachment 310098
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310098&action=3Dedit
dmesg debug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

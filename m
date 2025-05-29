Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223A155322
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 May 2025 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748505862; cv=none; b=D9tV0bB44twc0YwrED3boAC2Yru+lUhwvoe0Fpc4ishBObyJOHqb2lUFSCWOroqgb6PZRBjzNH70nxTaygaGdBviqj7xxguAmBTFM2rZ9mms3TgXi/OsYA1W6KXs/VmNpRwOpN7JCOjoNongQaUILV5riNL+vV2uOMfzpUW2qn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748505862; c=relaxed/simple;
	bh=nAE6L4Nb/vqYll3CDJnUF2VA5msn0O5XcEE7y2zwngE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgQfh4RvFjXtqiVx1jLV1xxyFREcCRDH3sVhUXBzynCJYZjb9b30UEvuPZtS4c0HTpcurwrXA1WbN2+B0DyBIunF35vSYpvyxuXX1TFzNTsTyL5wQ6ofZH8a4/YBRUwFrfphIlKE8B6zJpYDP10kGJ5WsuoyzRCW/ULyotW72Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1oQ5Zvv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1oQ5Zvv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C5C6C4CEE7
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 May 2025 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748505861;
	bh=nAE6L4Nb/vqYll3CDJnUF2VA5msn0O5XcEE7y2zwngE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W1oQ5ZvvuV28zugvEPCB4hHtb+9EMxqWVtuebWueH1GwKjlTO0XujvAGjUiPNNDa2
	 NaaukO1zlpCy9aO9EvUQBBM++Yb6gwTGSLc2NN2hkb1jeNua6L5o4Hr3VYBl8EKwyA
	 WWffpgwdLt3735rQ1SfbVD5g9YrjFI4XgQMBxGYz+smMwWqipavNXpQFS/7Iu74if1
	 QEdXc4xZoBS5iUoS91RBY6eg6FNXQL91nG836Z458zzU+w2dsdadlgncOh1hPZUBRi
	 mj7rHwucAps3vDhuC0ghu9knM2FzRZ9vRwckgB0h50EJ82N/gy78Lpg8aJaTiQSuFh
	 cQKVwaDRsrH/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94413C41613; Thu, 29 May 2025 08:04:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218863] [BAD FIRMWARE] amd-pmf AMDI0102:00: ta invoke cmd init
 failed err: 60005
Date: Thu, 29 May 2025 08:04:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: L.Bonnaud@laposte.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: shyam-sundar.s-k@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218863-215701-MfmamAgb1M@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218863-215701@https.bugzilla.kernel.org/>
References: <bug-218863-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218863

--- Comment #40 from Laurent Bonnaud (L.Bonnaud@laposte.net) ---
Intriguing.  I am using a similar laptop and I still see this error with ke=
rnel
6.14.8:

# journalctl | grep amd-pmf
May 24 10:42:02 vougeot kernel: amd-pmf AMDI0102:00: Failed to open TA sess=
ion
(-12)
May 24 10:42:02 vougeot kernel: amd-pmf AMDI0102:00: registered PMF device
successfully

From dmidecode:

        Version: V82 Ver. 01.08.00
        Release Date: 01/14/2025

        Product Name: HP EliteBook 865 16 inch G10 Notebook PC

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=

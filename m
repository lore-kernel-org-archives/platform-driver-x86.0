Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886E1B78F7
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886940; cv=none; b=PvSitf9VDWRagx/ZbGyilzVt1MYJ/MI+qUwcfBCZ4rYw0bdA8kmSuVtAIP4jnhZgS5yhx5vDgd4JSpoOFhecPkjlQ1Qkor/P/hrEQtv4PWK32OQ9C/rZO6VZRbs1cuzKAyJcrWH9BNpA4YTq7npBTWtPabVwA+QpDvvM0fkQgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886940; c=relaxed/simple;
	bh=7Z88G5uWCDdtRe2Isi9GOBBje15UpV9t6LruAwiOuc0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qk+nWbv1IylKKR82OhaKMwOQ3Gj2DXOzgyA+E0+LI7XznGdHF46LT3tG/UciMcYVOAjFdIJnJlcyWfSGO7XzvFkET9TGTL6Inmu8y1dPLfkMYri+yB1HoK8aWF1UpSHy8rAN3DcVGvrbISgQCrZ5qdY7k959feUcpU79Hguze5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb4R6Jav; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb4R6Jav"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68CAAC4CEC5
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886940;
	bh=7Z88G5uWCDdtRe2Isi9GOBBje15UpV9t6LruAwiOuc0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jb4R6JavSgkuua4JB1TzzXMlzHnJ0aFfmAQC6qk/Pc2VIs5xhhyAD3HjFmFgHgRXi
	 ncTjlCo7aGBYjLJXEl0RYwc9ktNWxHG/Wx07mDEOyTY4UyXjqreQSFYureXwZ1xJdG
	 vXT2I3dB+tvCLWGbGE3doWD2mUOWb7R8/FuzVzEJZwGOSbip+MjJKqeCck17U/acmZ
	 vCqs60r+N1+xQB9+6H1BDJaqxctJrICSlYoVMwS4VpMXEB9wk5YLn8Y49wVTZexzD4
	 6vCrb+BpREg8XBFVThXp42lD5uPlgCYIef2GN28E7FfGMeHhFPviqouY8OPNh7jWEF
	 pbmtACZGc+Hdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 589B7C53BB8; Mon,  9 Sep 2024 13:02:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Mon, 09 Sep 2024 13:02:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vt@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218771-215701-GkgWk4RvFz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

Vitaly Chikunov (vt@altlinux.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vt@altlinux.org

--- Comment #9 from Vitaly Chikunov (vt@altlinux.org) ---
The problem still persists on v6.11-rc6 on Lenovo ThinkBook 14 G6+ 2024 AMD
Ryzen 7 8845H. Blacklisting ideapad_laptop module helps to solve it locally.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2BA72623
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 00:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777336098; cv=none; b=aSkCjhCFyj1d2izaJhvE5gtfrh4OyCwe221fcZAe7R0eHPcdpWasl59C8jOi2lnvVi3VjSrvmBE9g6uRmYz+y/thJIwy8be3y8LfwB3aojsnMvGdYoXEzwB3VYdIoEIf4oS/PXKgqPAukPRq1D1+bH+R4QAEnV0Rk+/AD4fSHVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777336098; c=relaxed/simple;
	bh=DsE+5urqCgAklWs6HVOh38oR783bcjy/9sOcGmDHcHk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mipLBt2e2MSfs+q+31xBD5qb7/fGvwu7owqyAg7f+4+tBV/Y2ifcwKhtKCIUPZqtkEyYc3Mg36lz0bVKP/Jz2tAUmOr0nV7PQm4eNq/Eb+SlRH0uOgbxdMfwz9fE6oV0LKpc13ZYEh7cv2tlQUQUlpGXisUF9AodvDywzcvAXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cavfQm8j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cavfQm8j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1D12C2BCB7
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 00:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777336097;
	bh=DsE+5urqCgAklWs6HVOh38oR783bcjy/9sOcGmDHcHk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cavfQm8jG0wm8aCyCtKtGCoDFEATVLezlxtLuS5oPkYZ5xtTzUvauKcQYa1iCda64
	 n0wICscoOe8gPX3lGAohKQ3WFT1VcLROT2mbR9Jhhk4/cC54hSVX+Mtv2QpmfZ75eo
	 L81aSKCV27m+l6KPAC06Qf+M3e2AvdDzsxw1mGK5gKybjgv5wURXD/0FrYKE5KrjBr
	 V/33AD4Hv9jazIFT7IzsO4YXz69NkjhYle5P+f8gYxs8h19+38WniMsRqRuAwes1VA
	 5rC4QnVKSRadWhfnX3o6XPOs+f1lSeU/2PxQLt2LGQZsB13TEg3ud9/38c3Y0jqAji
	 vbvilcLSFmYzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BFC81C4160E; Tue, 28 Apr 2026 00:28:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 00:28:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-CXsfafe1yH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #46 from Daniel Gibson (metalcaedes@gmail.com) ---
Thanks for the feedback!

Do you think matching the whole series (that seem to share the same BIOS, at
least for the different screen sizes of 16ABR8) is ok, like

  {
        .ident =3D "IdeaPad Slim 3",
        .driver_data =3D &quirk_s2idle_need_suspend_delay,
        .matches =3D {
                DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
                /* match all IdeaPad Slim 3 models of the ABR8
                   generation, like 16ABR8, 15ABR8, ... */
                DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad Slim 3"),
                DMI_MATCH(DMI_PRODUCT_FAMILY, "ABR8")
        }
  },

(and the same for Sindre's "ARP10" series)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

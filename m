Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E99031B129
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596683; cv=none; b=f12jqFC2oeCV1PtY9pcmDeWBMxoO3GURfRGsiwveZU5DzvHC/A4ras7JZM7RrBqrEuVUOUrOz4oTdLHyXV7BSzXE3X0RN+tMNDj8aszssp8x0dZhKz7jsC7C5Z6uCpY6TVx3eatc3okvxvhFmBHBBxe05//uBFr3XtsA6r4FSN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596683; c=relaxed/simple;
	bh=iSRK+zy5HHoPZHojkwDtGAqPMp7q86+gK+EAZes6DNg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dmiYow3mdCbzPGXLr2Ggs3cwY4QaSGeyZABdTh4qJ3ROkgzfIv5t5247oj0frMLki37nFy1TSDVOUQswB2GC4uIiljkwOkIG5PKxLpUpFRr+EhjTH/IpD1PZC24ZHt/X7Py4llu+4BhbJcCoOIUNkzbCJwguSLraI/FMeuW42tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzTrcRIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzTrcRIf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44699C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757596683;
	bh=iSRK+zy5HHoPZHojkwDtGAqPMp7q86+gK+EAZes6DNg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DzTrcRIfDU1voCl/8EzZ5m2dfzXeuzIBHyWGgBtobHfegyw3pXSUdqVE/PFh2lIo0
	 /vbeAqsldMnTnGRQz7HTJUA6GAaPhun2SuMIDRlsbEwSML3llUhPLGfa95U8KZXpGm
	 hGr5M5wygE5Dm1dxLTuxJb/JE5s59lIOlZ+2cONmL3VCfiz1pRMtaIj6cfC5mcrZXB
	 rkNj9kzrbA+OV4uliAoI4SP6v/XWtIUr3Gl+pa5mpRX53hSL94wFqcfIeu1vDF+5Rz
	 YPuPtBUQTMfBeGb9WDHqArOjM7L6gd2/dZE56FLccdfef/5LjmQnufmIB5rY0aCqTj
	 Vj/4px2vKZ6qQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F492C433E1; Thu, 11 Sep 2025 13:18:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220566] Lenovo Ideapad laptops wrongly assign "Cut" intstead of
 "Selective_screenshot" to the corresponding hardware key
Date: Thu, 11 Sep 2025 13:18:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hansg@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220566-215701-wVNyfa2NI2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220566-215701@https.bugzilla.kernel.org/>
References: <bug-220566-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220566

Hans de Goede (hansg@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hansg@kernel.org

--- Comment #1 from Hans de Goede (hansg@kernel.org) ---
I believe that you are right. Chances are KEY_CUT was selected in the past
because it has a keycode < 248 where as KEY_SELECTIVE_SCREENSHOT is 0x27a .

And keycodes >=3D 248 do not work under X11.

We have slowly been moving all these to use the correct keycodes though, th=
ere
are options to remap this in userspace if desired.

So yes you're right and this should be changed to KEY_SELECTIVE_SCREENSHOT .

Can you submit a patch to make this change?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

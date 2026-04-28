Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038A22C3248
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 01:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340495; cv=none; b=NhmGXxbRc7iX4qmr4eSW2TuxMfXRIpwv07W3QC3gqqKH/bCoVTfuGhB/Nzc56ZWZ570TOHJTLh6s94VqLDoYaLCb1xqZnzH0IRvL9M/kyR+xA85uXEahAv4SXC5n9cR723ufv3UjH8ovQVsVA4ANcxAGBrtOO3orsw6LVktjZyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340495; c=relaxed/simple;
	bh=5AGEBrSKLdcmR/ltcgROhNqqUY/TQO+mXLSsLawgFlw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J6BOdEUw3g3LqpT/9fbhQ8PyIyl3d5+fdIrgKkMkIwyaiJ5uZ4nYbyYNGhnXPbfTLlHtIj75PmkyzP1je+k2jrsB2HPQ3fqc+rRoXKDGLlv1dZC2RriTPnvcUMFdVFOV8TrFuklbIQfvwDKYfGfJ1i4eJTiRF4VdcAT3h9yTylU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rG8JB7L3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rG8JB7L3"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7FF8C19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 01:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777340494;
	bh=5AGEBrSKLdcmR/ltcgROhNqqUY/TQO+mXLSsLawgFlw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rG8JB7L3/xxtZ41qi4NdvArCDQYvb9o3CQyt5Rbn0h7NQD+/6JeGWJ4Yp6uJY7Hud
	 EszRkhklqxN5hoxRpmOdl9lpxRaq657bvb+xVY6YbDNQoA7ZDLQ+hzNumGtolMXuE6
	 NqYhU87+k9IwhYx0DkHOzVav5VNDGVVCpSHz+D4ONDSnfo4ITdpPtScnfuLHwcctly
	 DM1AQ+w9wp39geGmW6hk1lDHQ1VYAxHEZQB4ndl4L/jiwBvKEBa7scdMEDX4TJapx2
	 p/BTV7ywwiklWjw7Ivr/E7YNfZlrYASFmwcrafbENVrmSukBMeAc4EjIKlbfTxiQgD
	 D790XQgl/kDFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C8685C433E1; Tue, 28 Apr 2026 01:41:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 01:41:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-Rks32etV4m@https.bugzilla.kernel.org/>
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

--- Comment #50 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> My question is: Do you think makes sense?

Ah I see.  Module parameters are usually frowned upon for debugging purpose=
s.=20
How about a debugfs file entry?

This would be just as functional; but arguably more usable.  For example
someone could boot a (future) live media and change just that debugfs value=
 to
activate it.

> I guess matching "IdeaPad Slim 3" + "ABR8" is safer than matching "82X".

So both a DMI_PRODUCT_NAME + DMI_PRODUCT_FAMILY match?

Sounds good to me.  And we can always change this if we discover it's an
untenable approach.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

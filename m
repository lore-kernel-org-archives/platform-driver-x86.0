Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B879339B41
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 13:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760621464; cv=none; b=qCc3ypJTIeVrjsBEtjbyPcdwD446QhtsvKhLaqv529muym0oA7A2whNOSiBLtJRwF9V8kalotJPcVbf0mjz0H5mN0r1H9xARyKPy7KJUwasfbtaWTQYRZCIGOeULnRoMIezAb31uB7eAEb5WYITSED+DRuATWdznVDN8JDJtfyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760621464; c=relaxed/simple;
	bh=H7zfAUmqs4RUvyXwPQonO80zMHnwSQGs8geJbbo2ZKY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PsXl2rOibMwF1FDgTpNWHb1SDAazJExqYDWFtvsVw+ssiTMNxVBgAOuHciLZ7L+WHoibarjVzO353HB9HrllW/GWZlwdKT2rxU6QpedDsevsMqJIAmyVitSgVcH3ZmWvGLR9BVf/cOIgL9nY0Buzn5yR5uwnwPZknTnZjBMb+K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hF00oiyK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hF00oiyK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E72AC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Oct 2025 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760621464;
	bh=H7zfAUmqs4RUvyXwPQonO80zMHnwSQGs8geJbbo2ZKY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hF00oiyKGfg7n3/w5qV0bzHWL9EKeSY2/bvBay/KGLSA0360Y7PJmoJBaDih+oKza
	 N8aGSXb76JSYUXgSQl5+W9zEuii098srYwqH749OLgfQo84z2jka9gh0Q5T6nrnW9D
	 ZUGuNSVU1YrIq8BaDbwy0zJ78Td5tB4oAmpPWVUFsB7DdyOc4fsORvu3zKJKCt8ZcB
	 kGRRCE2xxgIUr/lql55hNQ9XBF9pWMCmppLITzZaYg+tR8UEOxGm++wf2Jv2qza0/J
	 FE+GEwAthNvk4xdEeJoJOza+LJYwRsGAvMC21+x9alONIQvr5hW2GnVxyb0rnpnwRf
	 w+/4/aLBm6y+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F24FDC3279F; Thu, 16 Oct 2025 13:31:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220670] Accelerometer missing on cold boot (Lenovo Yoga 7
 16AKP10, Ryzen AI 7 350)
Date: Thu, 16 Oct 2025 13:31:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: IIO
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_iio@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-220670-215701-knmUug9EWN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220670-215701@https.bugzilla.kernel.org/>
References: <bug-220670-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220670

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com
          Component|Platform_x86                |IIO
           Assignee|drivers_platform_x86@kernel |drivers_iio@kernel-bugs.ker
                   |-bugs.osdl.org              |nel.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

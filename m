Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4A5327C0D
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871514; cv=none; b=CNE/+DHHh18PKC5lKS3mGd2hBJQzqO3jesJEDjuOSeHyeppHpa50Bui8TudeT6FCMDFxYGMCoEmRq0SbaN+EbAYfrpmB2OGSDSaou6E5HjW8bXRcengKdbX5/BugX39HvF5BtHVtLVpD76rgDp7TEkN9Wh23dyGhvWMdi2ucY3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871514; c=relaxed/simple;
	bh=AeEUPkQbYqqRzenNcz/QgpqVBm/ZIjTIyyhlPlgh2kA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GJn+TkFqBA6uc27lfqw3xUoYVUaVhAZYVdBHq43aLpQ/mjlfyacvoHR/ftctTJ42pCpuq92QwvP3zPrKzvVNjnmt005I+fFtjgLL+mE56szgnzpMfleJ3F9XItidaxXkQDR1rwsXTMGTyNvggs3HYaYAF7TYPpYO+/flrXPSQk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5k7cBVa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5k7cBVa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9732AC19421
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771871513;
	bh=AeEUPkQbYqqRzenNcz/QgpqVBm/ZIjTIyyhlPlgh2kA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n5k7cBVaLlqiKYIUu2M/fIaLesxyrQFoivE3qOr3a1d0nqjU66O6JQokY90jXo97o
	 SaCOYvzBQi+SxJFl+XytZ1zt5X/VRZo3tADPVDfnqu9VwQnK9hiModp2+5j+sIIhb+
	 Mq0qd8tpDkMWcqBACi3x8H795U5eqJibgpM4FGUUe5n7MYj5+HWZguZePftfAtcwZp
	 RjeiQH/jfkKiwC3NqADDJAeK/3dw6sIsANEHdNHrHdojgLymvrgXkWAGjPCtD9B7DV
	 ellhmwZx+NhPowae4EyTQy42Z4p6GrC4S6AP35uxgVB6jGhUc2RK/FnScnrm3eNulr
	 Jg9CSDIzZ9XRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76D21C433E1; Mon, 23 Feb 2026 18:31:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Mon, 23 Feb 2026 18:31:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ggrundik@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-AuQCvy8ZmY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #16 from ggrundik@gmail.com ---
> And in case of these ELAN touchscreens it throws a "ELAN Touchscreen Styl=
us
> battery low" warning and it does so *all* the time, because upower is tel=
ling
> it that there is a "ELAN Touchscreen Stylus" battery at 0%.

KDE uses the same upower, but does not freaks out. So its a GNOME problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

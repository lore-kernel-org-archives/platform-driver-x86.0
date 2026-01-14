Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB234B1BE
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380147; cv=none; b=VVz8r++IpiN/XiHoPYuWCWhkiA2yskpiRZQCxq4PJSjUTvoG8f+/mEyxQQLL5flw9cNKXFAlQut2c0+UjoM5i8BtMm038aUbR/TX77Bi+sKeJUaH1PBC7N/x8nSmM2w6yyUdTzbK8I7raYo0JwbwxTPQvZbh2lLwTl4Bi1BHZeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380147; c=relaxed/simple;
	bh=xguCVU3AccgviBE85tEgmmqcgBQ+KmbluLHl1TDqlXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p7mZAoe7vw16ifcff7NSJY6sQ3Cq+8Ti3Secntr3x6N/2GXQZ7rjcN2N4pc/zHqt8xvwJT7N6LkmDfj8GKUqEVX4Zr2q/7wLE/Pwwc8eJVfqXCAaNXehT+4EFHsrd8bq5R5QXkIS3Ax66jjSGGMd0FogSlrpY6woGKHxfQdsgaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4RvOE+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4RvOE+B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91F82C16AAE
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Jan 2026 08:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768380146;
	bh=xguCVU3AccgviBE85tEgmmqcgBQ+KmbluLHl1TDqlXE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n4RvOE+B5CL2yOd7KXBducLrrV+qiBkjiiq7XI9DACpD45kipZQfrHxv6dsaq09Wi
	 rv/TPQQ+8Pg5EujuOjtdJQeJB41vhpys7Nn286UeE9hwXeE1H7CnIzYqfJovVaCDzP
	 v5N608/3j6V8D6Vd2bXpF2YalAKrkAEEPL4MVossFtJTCm6TY0YTNuDsaLnsj8hJx6
	 4cVbz9SPsVZVoNgu9oQc1dhu9c83Z1FNwUX64MoJ9cqDKvAzZx6qatP2x3JIEbilUg
	 CDaNiAphq56owoNP4Q2lMZAATRjtgM4qF24TeSbN48GmOjl2wPI6Jz9yNoAl4WeIEt
	 5a0vcnFsKwn8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CC14C41613; Wed, 14 Jan 2026 08:42:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220978] [DRM/ACPI] ASUS VivoBook TP412FA: Fn keys send unknown
 scancodes after resume from S4 (Hibernate) on fedora 43
Date: Wed, 14 Jan 2026 08:42:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status component assigned_to
Message-ID: <bug-220978-215701-dNVwDK34Ke@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220978-215701@https.bugzilla.kernel.org/>
References: <bug-220978-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220978

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
          Component|Platform_x86                |Input Devices
           Assignee|drivers_platform_x86@kernel |drivers_input-devices@kerne
                   |-bugs.osdl.org              |l-bugs.osdl.org

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Is this a regression?

If it is, please bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

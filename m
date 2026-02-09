Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958532DCC08
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 19:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664759; cv=none; b=fyARF+yz25iu41/jTP3UBDKz+nLMx5wzXqea2lr22nxp/RqizIp5o9evAgxKvwVxxyR8ZGR4bKpk9J/qQ1psVTqihifWsD71zOWEZLBQZzqNTOu6NGGjn35PGiMvmrdrSZuR5Zs9wbzOApuYp8PgyoV2+LDbgthbYQTQJ5qfBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664759; c=relaxed/simple;
	bh=ll2YX1Bn1OTsxLNmMSLA3T438HH2Eu99HWcXX+a7gYM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Qb57SrXmArk/HieHwVqgVmijfH/8wyoW5d1z60s0yxeac6pknHaEIUJG6JKOC/c2Sf2g07O4fiOA2Zb6/9JxEhgHOdVxFHTF2S1D0yzUN7rt1WCHfNhLxvUL1H9k4OHsNCT9CIOiwvzBt0PyArIIfFKpzLJKCbIviO5YN46sPvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BR499hD7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BR499hD7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34FC1C116C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770664759;
	bh=ll2YX1Bn1OTsxLNmMSLA3T438HH2Eu99HWcXX+a7gYM=;
	h=From:To:Subject:Date:From;
	b=BR499hD7N8r2jedhchugLDeI+t5MOPkob1A+I63kQNIDa81RuHXJw5Lc8rmiujZe5
	 nu1mNhZt57IQu6V26/J47IvZ1qPnqRwWzrvVM0USlvVZ+3Sp7HZPdcRUEwwpc9Yl2T
	 g297TV/W+yEe/uu+L0bL4Ku3/wZIrNIIGMcicnUr+lFSDUf582RkHlEi4ePMzpEkyk
	 iU68X/ZXImE4rts6zEqUrfdrn4kHnwV4oh9lnaSckwM+PVSk650xebjPsm8VKMjSyP
	 Gcw+nPZ+qwGRZ4zsIHUSz8QOeP5QJ3l2N+gC7odF4Tjr3sZeLizxnfqIvsCtzNG0cI
	 19MDmw7rTPprQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 235C5C433E1; Mon,  9 Feb 2026 19:19:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221067] New: Lenovo Thnkpad X1 Carbon Gen 13 camera not working
Date: Mon, 09 Feb 2026 19:19:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ramiro@diaztrepat.name
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221067-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221067

            Bug ID: 221067
           Summary: Lenovo Thnkpad X1 Carbon Gen 13 camera not working
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: ramiro@diaztrepat.name
        Regression: No

Created attachment 309325
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309325&action=3Dedit
Context and steps to fix

Fix for camera not working attached

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36330126C02
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 May 2026 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779637603; cv=none; b=Ubkg9IuTjfCY79B1nlXgqtaR6zZ/OlFPxmgdjeoWCuxXLC200KdGDdGnP/EbL6I0O8iaB1z8048FMzHlR0TfJSgu8VwgPHqSYi72PogJGd504pOO85l0NSLxqzXS+qABDwCzsi9feu08zKWm2kNNbrBNURXBw6O/ovss2mehFqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779637603; c=relaxed/simple;
	bh=18yKHUckhH5UwHfeOhuc6bJqRzABNe+pR4ZlJxrnAmQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=doKPuV/bzBHNqz4qksIM7kllD7aV1ka16hk7x3+PSbyRc7+VEF0wHLvyhG44YsyIVmsIiTN2mMmjv3ckNF2Py0CoCGwLt9E1anKEjF1KWJmpBmEolaM7lJaS2zTAFbFu/mB4ZaIG0I8uGvVR/1YTifAJpS3TMl2sniu9hcj8eSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToOP8pby; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToOP8pby"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E41A5C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 May 2026 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779637602;
	bh=18yKHUckhH5UwHfeOhuc6bJqRzABNe+pR4ZlJxrnAmQ=;
	h=From:To:Subject:Date:From;
	b=ToOP8pbyeu6uHw6Irkr4SNKmt7ggt1Ys0qdIxLMu8JvlnA4yOux0U3jivgFR4Fpbe
	 MHDjBRjWXoyPnvJUnqnSe521hiK9mvo+OcZRyNk+H3M3+KJchXDZrM9R1GAxjlSHZ5
	 htdkpPTHsApOvPuVmQmL02IQTmotuAcVMHhm9p/+9a8L2soNaL9RtsXaAPvM2SiW7O
	 kZDIbg+aVbIsMrMf+HnGEmUqWLitaOZcijRtRjeWdkBLbzYDQR1wCdLU9gfBdg+eFX
	 OCeSnh3AWc/nhFTfqZjlHorSvABL8xNdrVYAVBz92ohYb+2nxevSxHBNO+b7Cerwfd
	 VdjpqDej6Sq+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7393C3279F; Sun, 24 May 2026 15:46:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] New: Laptop fan too loud (spinning nearly always)
 hp-wmi 7.1-rc4 kerenel
Date: Sun, 24 May 2026 15:46:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

            Bug ID: 221569
           Summary: Laptop fan too loud (spinning nearly always) hp-wmi
                    7.1-rc4 kerenel
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: moravec@ukf.sk
        Regression: No

Hello, I'm testing 7.1 kernel tree end seeing much louder fan on my laptop =
even
when system is idling. CPU fan is spinning nearly all the time even CPU
reported temperatures are low. Currently:

migo@migo-HP:~$ uname -a
Linux migo-HP 7.1.0-rc4-00685-g4cbfe4502e3d #45 SMP PREEMPT_DYNAMIC Sun May=
 24
12:47:18 CEST 2026 x86_64 GNU/Linux


In 7.0 kernel tree is my laptop much quieter, fan spins only sometimes and =
with
lower RPM.

Machine is: HP OmniBook X Flip Laptop 16-ar0xx, with Arch Linux installed.

Is there any way I can make more exact/useful report or debug this issue?

Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

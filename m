Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD89736495B
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124648; cv=none; b=Ti0kDEVc4dcFvh1dJbBuQrmmJiVDJfaAdZQXHSqxcJ5gAHrENsLcrXHf3RlN/o66Q+L2+jjDMIXMfOGu0wFhCznHybW9f5mhgg45omsv0z/xmVy3z9LaE3Q07OoFtihldGDcc2ixRAL9EIs1wogaLOOF7N642Y2nKEUjOnsqxJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124648; c=relaxed/simple;
	bh=JfqLjCZNVILYyTE1VOL7T/26benAXUHRpeB0sC/RQEU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NPvMY9Ka0pVuHJYlc0UylPnku/dCZVKSXjOc95gBdN4HcR2FhbbqzHY2JpU+NBjhrzIwzKcsyeLZigNfVb9lSl4GeEJlStHCabzjSubSdBiBCdjUEoohGhCHk0jQF9h2uEdp7FwzVwEcweg3s5RFLnrK8NICEF689dkc74DDwzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI0Iy5Q6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI0Iy5Q6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E210C2BCF5
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 17:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779124648;
	bh=JfqLjCZNVILYyTE1VOL7T/26benAXUHRpeB0sC/RQEU=;
	h=From:To:Subject:Date:From;
	b=jI0Iy5Q678APu1sd9YsuyqSE3SI0CQ2G1ndvgcZ2L3wx1JIhDHXd8yEEUOXp+VaRb
	 XnkJncRNbsnii1WDVsTWPHJvolBo9RsIRlXIFNjTEnJcvcaT+FV16xPpFS8jGycNXv
	 XdUeZ9Xe9UiSCmOUCeIp+tws1RIlXpjFRkpylKKbjvu1OjkjVhonf/neD2i3rwutNR
	 uEsMKBUTjnkD70f/faCfayuoJCBbhBaQAf+Ljyn//lvWyMXIBcSbXcYikRcOJ82fJh
	 GTZSMySfCsgyOLDWF+wTKpHganLCXhgasSUbxkTmVGnEl642TKAmEILCfPe4DbDSg3
	 5kovXugBhgCLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A702C3279F; Mon, 18 May 2026 17:17:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221546] New: Fujitsu u727 notebook lid close does nothing
 kernel 7.x - normal triggered suspend/sleep working
Date: Mon, 18 May 2026 17:17:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: software@f-hasel.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221546-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221546

            Bug ID: 221546
           Summary: Fujitsu u727 notebook lid close does nothing kernel
                    7.x - normal triggered suspend/sleep working
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: software@f-hasel.de
        Regression: No

Hello,
I own a aged U727 Fujitsu notebook intel i5 6200u

Runs pretty well, but after updating to any 7.x kernel, the lid function not
working anymore (it is configured as sleep/suspend in plasma). With 6.12.88
from arch and other 6.14-6.19 kernels (liquorix) this worked flawlessly.
Screen dimming with keyboard does with < 7.1.0-rc3

A normal manual suspend/sleep action and wakeup works perfectly.

I did not receive any suspicous entries abount powerdevil in dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

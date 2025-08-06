Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB27221FD4
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754470235; cv=none; b=Zk/maxw6uGPjrd3tW2OxGnNMTdEkjeJYh0MXjHRTZ9ove0MNTcrr+nhdQWicgJFDwQMnzbv9FbBmlxnkX8/wNcgpJKwZpDwPHxgm+lwyTmqLaqnO2hLngf1lqkkiDqGOxTWuPAOTin6QcEUjU/UMrLJNTw1ppB9mHUJYPoFsuWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754470235; c=relaxed/simple;
	bh=p9FDFNtuN5DO6LrMEd/Zxh3ukFn1quVfp4RFuwtMz6I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kEklwjLtzXquyNm8GoXONWrHjZuZ/EkOL45SrY3mJiFuKFc69aAxVNL0KiWbtQ9qMWjTcA5ptRjXrXa02NdhZ8AZroVEqFw+7CrYhRUQUBXI54au1MjQ71Hh6B8ReSI+e3TNUS41ezFZsTGv0kLBkLJfIwK96vvXnA20ndabvZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c53rYW0Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c53rYW0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E95CC4CEF9
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 08:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754470235;
	bh=p9FDFNtuN5DO6LrMEd/Zxh3ukFn1quVfp4RFuwtMz6I=;
	h=From:To:Subject:Date:From;
	b=c53rYW0ZSsMIA4gPRg5T3Y95MOgJC7E7jSwM74IbfbRv+jvbkLyoSimzDFD2xTIJY
	 vH4JAwFZUQ4HqthMDapE6ugi1rx1r2xnBuGHwIdJuex+Ol2cXiMgKBQZyisFt1AFjN
	 mWrjm/+bHq+oQBXJ8CWf6TgsTQn1VaVr9/NSK3qnAQFzHM4dLGztxb1ww81ID70KLI
	 NGKGWyjcCMNWj7fSMqtcJzc38zazI4PlddkNxkLilcGufJ/yfdZAX48znHv2kJ+Af6
	 pT41IvWU4Sj4Bf172EnfC9kQAWAEPZlZSdIp3guh3FEtFudGJNpoEKNJsax06n+UQL
	 ASyQcby0lNhgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F3B72C4160E; Wed,  6 Aug 2025 08:50:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] New: intel_pmc_core INT33A1:00: pmc_core: couldn't get
 DMU telem endpoint -6
Date: Wed, 06 Aug 2025 08:50:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mapengyu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220421-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

            Bug ID: 220421
           Summary: intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
                    telem endpoint -6
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: mapengyu@gmail.com
        Regression: No

Created attachment 308460
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308460&action=3Dedit
p16g4-6.16-intel-arl-pmc-error-dmesg.txt

- CPU: Intel(R) Core(TM) Ultra 5 225H

- Kernel version (v6.16)

- Exact hardware model (ThinkPad P16s Gen 4)

- Steps to reproduce (Boot up and check dmesg)

- Relevant dmesg output is attached.

Error log:
[    6.619085] intel_pmc_core INT33A1:00: Assuming a default substate order=
 for
this platform
[    6.619106] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU telem
endpoint -6
[    6.619274] intel_pmc_core INT33A1:00:  initialized

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

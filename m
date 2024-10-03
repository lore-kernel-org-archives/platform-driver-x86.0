Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8250148314
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950639; cv=none; b=pIF5c7hPeEN2rsjL1mipxXArzBV6JEx3UogmdPkTGHnXl8VSxfdWMtZr0VI+pFothaSmLu64pywMXFJUriNN8GCReWCf0CkwpAA7f95HOJ3G+g0g4XKqqeFBDznGo3bED0xLlv8N3VIa8YO94z5Bxn2HhJL78gq7hhHXxtai+Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950639; c=relaxed/simple;
	bh=tlCuhZYN+CAOn6rN7eUSqTbUITdhBqilLKLpEurb0iY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mCT4yaH+hNbCJ4IdhYGJ/t11Xk0vLujRMOQzicbnUV/gE/HMTO3qBuCA14A1vx4DHxU2opDa/NCTDazM9FQZZttBo4eTlYiZ0TSjXHz0oKDl1OkdUufBbQWPeh9BQH/HUmJ6bkTeFcqIpRM3SjX8dkdCasQbofJrHzBnDIIdx9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POfA+gB+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POfA+gB+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80465C4CEC7
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Oct 2024 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727950638;
	bh=tlCuhZYN+CAOn6rN7eUSqTbUITdhBqilLKLpEurb0iY=;
	h=From:To:Subject:Date:From;
	b=POfA+gB+mQgg81waHvlIrCURgNsm5ynLOaNG+qQFXRVcKHAMUWMsnWgpF7nYN889k
	 /OMrH7CaRgoLBdVwp+ri9a7X7ifVLRsM6XWyRLhd4D9NGs3qDmeYOWE7AbGv2gXLOj
	 +s0KCPSOXsyWLpXF//wrvkiYWprMjPQMTQzFD3017fyllpi2k7vq2Wei2cYLWqjKWx
	 DdqPffmnii6A58ICWraLsIpJbaj+ftYQrh5icBPCId4ezOq+EBXdQ3ofNc+bGKRHc9
	 PE0zmCIB1S1C/OXJdwF8TzL5Qak7Oxjm/cE3aUSzdMvlZG2FrXanBvMVrvynwGkJPx
	 5f9/V4Z77nOyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6E34CC53BBF; Thu,  3 Oct 2024 10:17:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219346] New: [BISECTED] Disable ACPI PM Timer breaks suspend on
 all Amber Lake machines
Date: Thu, 03 Oct 2024 10:17:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 blocked cf_regression cf_bisect_commit
Message-ID: <bug-219346-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219346

            Bug ID: 219346
           Summary: [BISECTED] Disable ACPI PM Timer breaks suspend on all
                    Amber Lake machines
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: todd.e.brandt@intel.com
                CC: jwrdegoede@fedoraproject.org
            Blocks: 178231
        Regression: Yes
           Bisected e86c8186d03a6ba018e881ed45f0962ad553e861
         commit-id:

We have two amber lake machines in our lab that have started hanging on fre=
eze
in 6.12-rc1. I've bisected to this commit:

commit e86c8186d03a6ba018e881ed45f0962ad553e861 (refs/bisect/bad)
Author: Marek Maslanka <mmaslanka@google.com>
Date:   Mon Aug 12 18:42:00 2024 +0000

    platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when
suspended

    Allow to disable ACPI PM Timer on suspend and enable on resume. A
    disabled timer helps optimise power consumption when the system is
    suspended. On resume the timer is only reactivated if it was activated
    prior to suspend, so unless the ACPI PM timer is enabled in the BIOS,
    this won't change anything.

    The ACPI PM timer is used by Intel's iTCO/wdat_wdt watchdog to drive the
    watchdog, so it doesn't need to run during suspend.

    Signed-off-by: Marek Maslanka <mmaslanka@google.com>
    Reviewed-by: Hans de Goede <hdegoede@redhat.com>
    Link:
https://lore.kernel.org/r/20240812184208.1080710-1-mmaslanka@google.com
    Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

I understand there may already be a potential fix in the pipeline but I'd l=
ike
to track this issue here.


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=3D178231
[Bug 178231] Meta-bug: Linux suspend-to-mem and freeze performance optimiza=
tion
--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC45546AEE2
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842307; cv=none; b=hz+23gSYtwx+Pt0ZcgKrhYztOUQeWt8odR2mq2qL9huBM/vxs2qeXPKhmz4Y9szHrVxXmfBMSMbTAtGP2cxQHgPUQXVTNywmR/rryFZsE+EQax2WWNYejXmzB9KtFucCpfVkm6Dd1WoHagIuHfqhZq21CREimFC7zUXHFV7+ozY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842307; c=relaxed/simple;
	bh=49eGW+DbxQTzvQI7rTiE3tZ77NeL7uezZllRWyqO7c4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G3QWwGEBNnoh8DS5eJxA9VD9xGTCglhzYBuu3qDWmDz+KQ2EyQtcmUKnO1Lw243sk/jCO4eEugVN0xUfO3aEOf2ZO/plKWIhaeIXkREu5M07T4dp2yA62OyLcHez4Y6TsOeekRzISn09syW9pKy7LivypyJ8mrikZF3vbn+aVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rrizi3f0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rrizi3f0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80488C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778842307;
	bh=49eGW+DbxQTzvQI7rTiE3tZ77NeL7uezZllRWyqO7c4=;
	h=From:To:Subject:Date:From;
	b=Rrizi3f0WcxwblIJIQQ8ZXcSc5mqQtJ7qLugNcIidG14ofU3t0uvrb3yc3mZuNnmB
	 UfhuqvPdN466R2HgNIdN5l4p5Hx7XsfSOr88ZWm6tc8E/E2iZLYfsT1P6xvwOYNWiw
	 PTbBVvucfb6fnPd6VuPDivv4fYRCEzfA5VHp/3epo7f/o42u53E8meiT7Ck3SJyenU
	 pp+vPqKNA8vn3UP2GVkvDGQC8izklwm4c0wLNB6RJTnRD+8VOatiMg82i4BhJzPl9X
	 SCXEvxWiQUrEFRMF7FQG8aZyUQnxQRp99XWjY2vattsbFgpAr+Pmy8xzPFJk15lR/f
	 F5Vgjhf9DrvmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70C0FC433E1; Fri, 15 May 2026 10:51:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221523] New: [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control
 not available (no PWM)
Date: Fri, 15 May 2026 10:51:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sivasli-ahmet@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221523-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221523

            Bug ID: 221523
           Summary: [BUG] hp-wmi: OMEN 16-ap0xxx (8E35) - fan control not
                    available (no PWM)
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: sivasli-ahmet@gmx.de
        Regression: No

Created attachment 310126
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310126&action=3Dedit
dmesg, dmidecode and xxd ec output

Like other users are reporting, with the HP Omen ap-16ap0xxx (motherboard 8=
E35)
the fans are not working properly.

Issue:
The system is able to read fan speeds correctly, but no PWM control interfa=
ce
is exposed.
Fans appear to run at firmware-controlled speeds and do not respond to
temperature changes driven by the OS. Under heavy workload, the CPU and GPU
temperature will rise to 100=C2=B0C, thermal throttling will begin, but fan=
 speeds
might or might now increase.=20

Details:
- fans detected
- fan1 and fan2 report valid RPM values
- no PWM control available (pwm1: N/A)
- fan_target not working

Impact:
The system does not adjust fan speeds on heavy workloads.

Possible Reason:
Board ID (8E35) not listed in hp_wmi driver.

Attached logs:
- dmesg
- dmidecode
- EC dump
- OMEN gaming hub log from windows

Please let me know if additional debugging (ACPI tables, EC dump, etc.) is
required.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

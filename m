Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B021B4F1F
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749761230; cv=none; b=rP16WGZFeRagKhDi5ZeCQhnNwyPWwEMVDXz0ClpgbobQqSva6X4cEDw6dSo2DvBk8d2nZQD8TFDFv9PrVbF6E3pZAhQpi9j6Db3x9qT6Prybi9bU+B2RkDfgOCUssQPsyH72xWrRuZq9wmPZ1A8JnDv30r9TeHPm0B6VqFvQg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749761230; c=relaxed/simple;
	bh=+b18ToAwkKNbBHk61rBgZX0a9Q+kmbpqxZ/R41/uyFg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D9imZCpJg9uFnG63HMPMvie+Npb6//dS8VSmFlVSuWfF2CF0OPpAaQSNG+2ANj9XznloIzWu1TToUn7d3+JeS5485lCHrCadZ5OtALzsbyg2uq75RTDsSGA8huxaGQ5pZhqIwvAX3I3yCgWTlqWsAhsZea/NBvrSXzJarCJ2sjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0/AooI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0/AooI2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57975C4CEED
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jun 2025 20:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749761230;
	bh=+b18ToAwkKNbBHk61rBgZX0a9Q+kmbpqxZ/R41/uyFg=;
	h=From:To:Subject:Date:From;
	b=U0/AooI2w3gT1v0hiwCAPs/6gTP6Bt4/XmB06C831jjFIncsxY+mkvoUi1YabYLVL
	 WijVhdzAtc3oaHv2sdegJe7DfiX3ltJSErcSs7i8hqWJzUwG9HrZ19+xS/b1NLmBIG
	 SmkNun7QsCcL1DlrzS31rRKbAwUzA+S6AN+rVmrHm05BsTtnp8LNXnu412Cup/JXg5
	 u5fhd04TaWJt2PlAiMNdDpEyU2EkBfY53ik0immbfwut6xUpwZOdHer6km+By2a5PI
	 s1wY5MV5z/4pWb9cpE8IUuJQgHieT3EN5PQ7YxyHPEDfRrqU7nmll4vsEGce88Q8Us
	 Ctlrp3inZktyA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 46E3BC41614; Thu, 12 Jun 2025 20:47:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] New: Kernel 6.15 causes crash (general protection
 fault) due to amd_sfh module
Date: Thu, 12 Jun 2025 20:47:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: g.molinaro@linuxmail.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

            Bug ID: 220224
           Summary: Kernel 6.15 causes crash (general protection fault)
                    due to amd_sfh module
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: g.molinaro@linuxmail.org
        Regression: No

Created attachment 308234
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308234&action=3Dedit
dmesg from successful boot (with module blacklisted)

On my MSI Alpha 15 B5EEK laptop (AMD Ryzen 7 5800H), the system fails to bo=
ot
on Linux 6.15 due to a general protection fault linked to the amd_sfh (Sens=
or
Fusion Hub) module.

The error occurs early in the boot process, and results in a kernel panic.
Booting with the amd_sfh module blacklisted resolves the issue. Additionall=
y,
the latest LTS kernel (6.1.x) works fine with the module enabled.

System is running Arch Linux with linux-cachyos kernel 6.15.2-2.

No critical side effects are observed when the module is blacklisted =E2=80=
=94 the
system appears stable and fully functional.

**Reproducible:** Always=20=20
**Workaround:** Blacklist `amd_sfh` and rebuild initramfs


Hardware:

    Laptop: MSI Alpha 15 B5EEK

    CPU: AMD Ryzen 7 5800H with Radeon Graphics

    BIOS: E158LAMS.10B (05/18/2023)

Steps to Reproduce:

    Boot system with Linux 6.15 kernel

    Observe crash (kernel panic from general protection fault in amd_sfh)

    Boot with amd_sfh blacklisted =E2=80=94 issue no longer occurs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

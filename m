Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D06E3AD51E
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123898; cv=none; b=ZbLtIWF5hk7MqM5K7ibEnOlA9dEzH8iKUjD7ZieLa617fcU+orkVmtb9nu5jMzbES6LingtydrmDi/3HcZgX9MCryybxxBuSGgJYlqaf+YLESoaY1HCVVHt3fKitaF0v0U+bq69BvPplnYyggy52L5oKt8zEOcaA97S3qDDfnwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123898; c=relaxed/simple;
	bh=IjJnEtS6gEElL4gii+prlk8umylodXJIj5sicABRdtE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c7RjV5rAlQ1u2bppHpFztpbZhTOa1p9kAEAoGjrpXpFaIGpFwpGgUTWcoPIkLji7ALi6ltCekTvqo6xkkyzC4eq3g9aTWw5Q8pUJTZBNI/tY90Zi5zE/L/DPfVzGplAfY4nysvB+WnjRnGWCZfuLg5SoSpF/wEJP6x/Zi+fDc04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEOUe+rR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEOUe+rR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88468C116C6
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775123897;
	bh=IjJnEtS6gEElL4gii+prlk8umylodXJIj5sicABRdtE=;
	h=From:To:Subject:Date:From;
	b=HEOUe+rRfGVqVW++XeZILVJqBmdJFYYondWQ79D/KK/treamjjewm+udNKahnZ+fE
	 aoiaAGzfo5GFPpSivH55+iz1jl/KRxTaijIuAAeU3XdErrOox/KUypBcFE3loKMGLT
	 PcQXcxDzZHR7v8qneD2vDb/I41UlfuV50m8x8jg55BP1kNBtxfJ+HnLCKnohLZr75e
	 cnm+eTqKNZcGDs7pPhIy/jZnySDjA5s/PuXlQnzUMiB2qfiR0wrYuaZjls8vR2HM2j
	 AMheybUYHplssOw1lzRb/4beTLD9l6qpdsLE1fwwGlJ+IJyLuz+3/uf1yWuf82KI8n
	 baQlVdBI3urqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7BEF8C3279F; Thu,  2 Apr 2026 09:58:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjEzMTFdIE5ldzogQVNVUyBaZW5ib29rIFMgMTYgVU01?=
 =?UTF-8?B?NjA2V0Eg4oCUIFRvdWNocGFkIChFTEFOMTAxMCkgYmVjb21lcyB1bnJlc3Bv?=
 =?UTF-8?B?bnNpdmUgZHVlIHRvIEVDIHN0YXRlIGNvcnJ1cHRpb24=?=
Date: Thu, 02 Apr 2026 09:58:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david@flyboard.ai
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221311-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221311

            Bug ID: 221311
           Summary: ASUS Zenbook S 16 UM5606WA =E2=80=94 Touchpad (ELAN1010)
                    becomes unresponsive due to EC state corruption
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: david@flyboard.ai
        Regression: No

Created attachment 309800
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309800&action=3Dedit
dmesg, acpidump, DSDT disassembly, and full ACPI analysis for ELAN1010 touc=
hpad
failure on UM5606WA

On the ASUS Zenbook S 16 UM5606WA (BIOS 318, kernel 6.19.8-200.fc43.x86_64,=
 AMD
Ryzen AI 9 HX 370), the ELAN1010 I2C touchpad intermittently becomes
unresponsive.

The ACPI _STA method for \_SB.I2CC.ETPD returns 0, so i2c-hid-acpi never bi=
nds.
The Fn+F7 touchpad toggle hotkey has no effect (no OSD, no EC event). A warm
reboot does not fix it =E2=80=94 only a full shutdown (power-off) restores =
the touchpad
by resetting the EC.

The _STA logic gates on two EC/firmware variables (TPIF and DSYN) that appe=
ar
to get corrupted during normal use. No user action triggered the failure.

The DSDT also has pre-existing errors: duplicate named objects on
\_SB.PCI0.GPP4 (_S0W, _PR0, _PR3).

Full ACPI analysis, dmesg, DSDT disassembly, and acpidump attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

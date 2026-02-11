Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3994B3016F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824127; cv=none; b=Ft5ENxTLydln//ZflWf5xS7RRTezb8xz+cNyL18/JY21wvEGXaJS1IVM0tIErFIQjEuJ9BE0halIZDWUMJj895yG3nwb6/3g+UgQDTBQAPB36/GIDGsYb1WX3hpfc11PHM3yvdLa63hUSF8Dw02Wn/89W/O1Bez8Z0+Ts+RT3S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824127; c=relaxed/simple;
	bh=ij8EnvkT4acKI4Kva39PFUsdiByY/TZpobCSJXP+oHo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IHDZtn16wBWm67L3MtW0kuglkgQz//a4XOnJN/IOVwcXNB0beDYhFmSmo0Uw9OIXZHI007pnWjfpXmgOtJKzeaQNlYred8MYB+MpKGyLcRUrTD+k9hwIhhjNasg3+yswhraWM7fSOVsd/SaJuAznnxcd6Lo9iFbJd3lcjSdePcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZBqBpjg+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBqBpjg+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6636C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770824126;
	bh=ij8EnvkT4acKI4Kva39PFUsdiByY/TZpobCSJXP+oHo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZBqBpjg+OzcXdDZ6j0sQMB9rmG8BVZIC7Gn+FfuLuJafgSA1FnpzsX/yUSpNdB8SH
	 94mFvg58xcnTQbHJq0FVLXHnMDAZ3ohn0AKLeSpgIo2LlTERu5C/UU2F8wFhM3JkMT
	 ul9nQvJFel92EfulAqDz68Vwa+Kyw0jADX2NQvtgxYOFhj5nc31shH+bMfQyFdnD1j
	 pbQfblZ1lViWVfXEPiPoQH9v3QWXINWnCn22kP2NDUryCundPzys1lZLFw32IJwx70
	 yTfrR6clFqnHMfOUlY911oiI4Y5ANWb3bbcx4YSAt7mxM8Y8FWBlUGhYnSBQqlkRjf
	 DXtMGnhSzbNrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BFCCFC433E1; Wed, 11 Feb 2026 15:35:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 15:35:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-UyraYDz9pC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #27 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Rong Zhang from comment #26)
> Avraham, could you test if the patch fixes the issue?
>=20
> It's just a PoC as I haven't seen Raphael's acpidump so IDK if it works on
> their device.
>=20
> Mark, could you check the documentation of the GBMD interface? Will its
> return value have any byte being 0xFF under normal circumstances? If not,=
 I
> think the workaround can be applied unconditionally without a DMI quirk.
> Also the issue should really be fixed from the FW side. Could you coordin=
ate
> with the FW team about this?

It did not. Unplugging and replugging the charger a bunch of times results =
in:

ACPI Error: Thread 386093824 cannot release Mutex [ECMT] acquired by thread
32582016 (20250807/exmutex-378)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.ECCC due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-529)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.RPAM due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-529)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0._Q93 due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-529)
power_supply BAT0: driver failed to report `charge_types' property: -5
power_supply BAT0: driver failed to report `charge_types' property: -5
ACPI Error: Thread 348558528 cannot release Mutex [ECMT] acquired by thread
350311168 (20250807/exmutex-378)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.ECCC due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-529)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.VPC0.DYTC due to previous er=
ror
(AE_AML_NOT_OWNER) (20250807/psparse-529)
ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-110)
power_supply BAT0: driver failed to report `charge_types' property: -5
power_supply BAT0: driver failed to report `charge_types' property: -5
ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS fa=
iled
(-5)
ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS fa=
iled
(-5)
ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-5)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

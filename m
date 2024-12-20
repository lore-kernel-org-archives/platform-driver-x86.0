Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38358218EB9
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 18:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734720418; cv=none; b=DQOS8OcBAgUrgBCxKsycm+tYnxZRhZmE/i8cr9lx2HkxWcKmDsEWBIGhjMxGO+/WceknJts95Vkm+g2RVTqJR8GXDCl9DhhU0wdCadotT9E5K8sLcZm3s9f6qMT/adHyGpL+Pjufjj3OBfj+1TK0TwnENdhKy2Pc0qsO0WihnZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734720418; c=relaxed/simple;
	bh=cJa6uFC0MYzDiMduLcEehIf1uH1qZmeQo1MP84r2Le4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ITEJ5pjRmbLhrDYHMAqrUWhKmGdid+H1BTnDhHu4gNH0LW8qEOhhOlpFn2csKLCNHmqIzAt8yjq1W+Ld6aClIsyQxDM/4ooLJ8xqPSveft3kDM9MFUl6n3ym2mn7MNSECRTxW2QzVTvAvMUsLvhI8uRmAmONjTrt4YFN7kARbL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+T5F73y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+T5F73y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC702C4CECD
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 18:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734720417;
	bh=cJa6uFC0MYzDiMduLcEehIf1uH1qZmeQo1MP84r2Le4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c+T5F73ybeXcgS2FnvESF31ZpXUeBXOwqLxP1ZrLMgC/OYCEkyvJx1MUC7kuqxlYa
	 w+13dEj/TGLiMYUA30ifvIXacQUkofuPVxbkp37kMgfS40svdm1z1fVSuPUNUWpMBl
	 BnPdjq2yDqUWKzNC/WAMb/6hO5M0nsq6dIE3P3MM/jUenPntlF9WP/VtqVcGIjzsZK
	 IRAYaoQBMmPZkxzUKagC6OxtnVv/cKXXLunWFLrJ2wRzT8ip9mZ7gtNtDHdW4eQtYD
	 hYBwdL0houadDrGTEdrQkKIczUMs8SMt7T5zGsfN5aZrKm79z1ewqlhsrY2lw/Nx14
	 RuynUnsvyetGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A3967C41612; Fri, 20 Dec 2024 18:46:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 18:46:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-1L2fbejFtS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #35 from jarkko@kernel.org ---
Copy-pasting what I wrote to the header of tpm_read_log_acpi() should clear=
 up
a bit what I'm aiming for:

/*
 * Find out the physical address range for the event log from TCPA and TPM2
 * ACPI tables. If successful, sets TPM_CHIP_FLAG_EVENTLOG_ACPI. Also,
 * chip->bios_event_log and chip->bios_event_log_end will end up containing
 * physical address range, rather than virtual. This range must be mapped
 * with acpi_os_map_iomem().
 */

int tpm_read_log_acpi(struct tpm_chip *chip)
{
        u8 event[sizeof(struct tcg_pcr_event) + sizeof(struct
tcg_efi_specid_event_head)];
        struct tcg_pcr_event *event_header =3D (struct tcg_pcr_event *)even=
t;
        struct tcg_efi_specid_event_head *efispecid =3D

Then just tweak the code paths in eventlog/tpm2.c and that should fix this =
up.
I read a fixed-size buffer just to open code tpm_is_tpm2_log() to the funct=
ion
and that way also the pre-existing code is still needed, just without the
allocation part.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

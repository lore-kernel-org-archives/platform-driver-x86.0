Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E32DE6FF
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751436; cv=none; b=TGeNHBFDCDFtFCqJhvtu8nQ4tQdhuft5/2pbeCWYuGaRviuK0q2HPu1GptfTxD7CAuphq/Vg4sh1HdYvL/N2+PP1iiWNOiym24gMFN2sU+5BNQEnh3kVzMQLUzb/ep66soylBjcedRXqWKWQ8Dqs1HXtHXVeDb4+fHboTu6PEKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751436; c=relaxed/simple;
	bh=4Ew+qlm/C94YNMME5ut6adJhNRe4YR8LFXsbvxxUAKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UC3Oi+tlcyEQqUqbBxuhFKCW2vFlrWt0y9Nu247ydlkOFQXoCK8z10sY8H0FpZc9Y+jpFONGrEmA977YlxGAax5p4EudbPNC2hbixUznErvJVVWbfKnzabc4WjVCRPsL8OEUDmsOhJYZWfggj7DyLPsPUbyNu/ZojcH4z/W6LoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1VQFWuE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1VQFWuE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCFF4C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770751435;
	bh=4Ew+qlm/C94YNMME5ut6adJhNRe4YR8LFXsbvxxUAKE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H1VQFWuEecx8hk+/feQ5rQe4hV1R2RLXTw4+us5eSAI9bZlErV1tEI8UKnBMnDPGl
	 vhLY3PHLrlmfcmk/2uXT9in24wmPOzSqn00xT5zMspoCkCzep5V0f0ZhUueoNCgfW+
	 cuUjX+mxGqx99PN9qlWZ4n+0ArMFacYpxMZQ9K2D7urynfzLm1Hrx1C56sdHIIjCl9
	 Bd7BLRJ95dLdNs7fMzbAdQje2i0m1zDouARzoiY8YY3ZIoU5FdPIks6P5zGOVhaiau
	 5mYJjuuVKdmLJmPUjRGsfcGUnnrGsX3bf4fAwGZVVFJYnhptC96ObVFT6bc/X4xfbw
	 0VB01gksVZ8Ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B0725C433E1; Tue, 10 Feb 2026 19:23:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 19:23:55 +0000
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
Message-ID: <bug-221065-215701-z640cqoeLM@https.bugzilla.kernel.org/>
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

--- Comment #11 from Avraham Hollander (anhollander516@gmail.com) ---
It seems also that after writing something to charge_types, the ucsi-acpi
driver complains too, along with an ACPI error whenever the charger is plug=
ged
in:

ACPI Error: Thread 2157330176 cannot release Mutex [ECMT] acquired by thread
2188863744 (20250807/exmutex-378)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.ECCC due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-531)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.RPAM due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-531)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0._Q92 due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-531)
ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast] and [Long_Lif=
e]
are enabled
ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS fa=
iled
(-5)
ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS fa=
iled
(-5)
ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-5)
ACPI Error: Thread 2156041472 cannot release Mutex [ECMT] acquired by thread
2188863744 (20250807/exmutex-378)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.ECCC due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-531)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.RPAM due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-531)
ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0._Q9E due to previous error
(AE_AML_NOT_OWNER) (20250807/psparse-531)
ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast] and [Long_Lif=
e]
are enabled
ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS fa=
iled
(-110)
ucsi_acpi USBC000:00: ucsi_handle_connector_change entered without
EVENT_PENDING
ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS fa=
iled
(-110)


The ideapad_acpi driver's behavior doesn't seem to be affected by plugging =
in
or unplugging the charger.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

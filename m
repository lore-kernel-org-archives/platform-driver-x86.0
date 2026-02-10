Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D422B5AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751557; cv=none; b=hlgWD7ndxWmzVlAiTx5ii7CPzy9Pe/NUkiPHMkbdhfzuMFqoLpXmm8mwj1ieCgWVCmm2/USpj8wlZiUZUuIkY2781pJI0bt3xO9ZbQDU1HcSyHNN8nLzM/NTs0I0edpWBYuPuYjqEEjslm1p0ywC+RNbgf30TEyuql6BKK44R7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751557; c=relaxed/simple;
	bh=fJ7rVhwOuc1ccnP30WuxKym3PVc/lVmpNjAGreMj4ps=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jL9GbNTZlWAfdhuyvuI0ze+6KwIGqDDh9RWXPmWtLdNkjpM4oj/b9Ruu/kJMgvGStWEhjwcRSOE8P0ruYUilq6xWAN+g9RmrOt78Yfpb0vkT45fswnMlVUju0QpNL/IAdKjjq5nMiTjh62QWXCk0SJzo35vxn90Q0Z9L7K2hFuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6VHyohs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6VHyohs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49B5EC19421
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770751557;
	bh=fJ7rVhwOuc1ccnP30WuxKym3PVc/lVmpNjAGreMj4ps=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L6VHyohs45E85P50hYRKwYvZghOwI/JqO834NphktXNt1e83ELcErkNQei8sr4AN0
	 62uyykXVx+Nt6lHkbKiU17dgz6gqtJaAPV0wHIa9JLIYpSbOQMlVfT0H7myuav61sT
	 RB+M0VwI5N/OB61tB06WZERRzxW0yzvlGjGuC7P8BGrUC9DwE55WSd4Yiz8ae4BBm+
	 M7QrHHOy/VvAQ7lCmQ2p5oHzXxiJZ3RrwBxBz99Vf45t5boZMdjs3+6Jrwta0Jz3a4
	 Q0A8PjxwR4/OuHRBfCSAHCDygX7UTx0G9Wx3BhJVy0hHTdv6nP+LQ8URFJVo/Vs52E
	 zmK1w5fc9TFSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 38BC5C3279F; Tue, 10 Feb 2026 19:25:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 19:25:57 +0000
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
Message-ID: <bug-221065-215701-g268e2E6hr@https.bugzilla.kernel.org/>
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

--- Comment #12 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Avraham Hollander from comment #11)
> It seems also that after writing something to charge_types, the ucsi-acpi
> driver complains too, along with an ACPI error whenever the charger is
> plugged in:
>=20
> ACPI Error: Thread 2157330176 cannot release Mutex [ECMT] acquired by thr=
ead
> 2188863744 (20250807/exmutex-378)
> ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.ECCC due to previous error
> (AE_AML_NOT_OWNER) (20250807/psparse-531)
> ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.RPAM due to previous error
> (AE_AML_NOT_OWNER) (20250807/psparse-531)
> ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0._Q92 due to previous error
> (AE_AML_NOT_OWNER) (20250807/psparse-531)
> ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast] and
> [Long_Life] are enabled
> ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS
> failed (-5)
> ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS
> failed (-5)
> ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-5)
> ACPI Error: Thread 2156041472 cannot release Mutex [ECMT] acquired by thr=
ead
> 2188863744 (20250807/exmutex-378)
> ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.ECCC due to previous error
> (AE_AML_NOT_OWNER) (20250807/psparse-531)
> ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0.RPAM due to previous error
> (AE_AML_NOT_OWNER) (20250807/psparse-531)
> ACPI Error: Aborting method \_SB.PCI0.LPC0.EC0._Q9E due to previous error
> (AE_AML_NOT_OWNER) (20250807/psparse-531)
> ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast] and
> [Long_Life] are enabled
> ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS
> failed (-110)
> ucsi_acpi USBC000:00: ucsi_handle_connector_change entered without
> EVENT_PENDING
> ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS
> failed (-110)
>=20
>=20
> The ideapad_acpi driver's behavior doesn't seem to be affected by plugging
> in or unplugging the charger.

Actually, I take that back. All of this is triggerable without writing to
charge_types.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

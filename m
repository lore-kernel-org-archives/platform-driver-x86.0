Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908333F360
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 18:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749892; cv=none; b=Uk1E0i0glBohvWAvQ0Pr9I617WpApjDD3aK42hrD+qC5xawAmDCvQuILJziQoGrXLLBxAyYNKmxdNyUeSM+AzFC2pzk9QFSCH/Nc0VEZ9Bkswmr6mGeMBGm6WxRcI1A4JVLr7Iju7jOONBtlROevos76RPgnlQ9Z+lxCMRTHo7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749892; c=relaxed/simple;
	bh=UqLXC+shupuRbP9j66drREaeX2XIDLt6uGrUh3PKtjs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MsBTesUZW2UYqOxzuiOj04s3YUgopU/4kJk9le4gQHEJKwiLVQB6r4SK5nYvSQzSnu05YsoqG9/Ujz5WVJdsV4s7EFA7qK1yspbjm4ncR6wHhs+pc6UskRFtr2ik6lpm7hc62sJdSN/1pq/y6PSqHMQtD7qToF5PxyIjwtH91Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeBCSYGf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeBCSYGf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99AD4C19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 18:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770749891;
	bh=UqLXC+shupuRbP9j66drREaeX2XIDLt6uGrUh3PKtjs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YeBCSYGfiYMPmNyI3ICGlhfQpXKTw9D3IW+66VPcGnFaxE9d6HULXEsQfPxVTl7S7
	 /5yxQ44Vw+Oqvs7CvsJeKx91pBcZ7fyDk+JwAkfFnUQRostwm5IkL4CcK6zMsD4X4a
	 ni5o8U1YUNqwu9ZipgEv22gVoq8wBBqRdn8lgNbMgtMxGqUREV9C5RaPq7VBj4VxkD
	 1DGP7AtPDPdhzvmVUFfrZqYdIgQoawvDlTMmoDD6bShTTRFtvDzgSGbzqBmeQx3Mte
	 4xKzdzKtk/0FlitBuWt+UioiaZT8n6o7VZM/Msx8fWemwBhie3YRLKEkL718YrBit6
	 VG1hgiI2YEvpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 935B0C433E1; Tue, 10 Feb 2026 18:58:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 10 Feb 2026 18:58:11 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221065-215701-92HduiP6NX@https.bugzilla.kernel.org/>
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

--- Comment #8 from Avraham Hollander (anhollander516@gmail.com) ---
Created attachment 309342
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309342&action=3Dedit
linux-tkg customization.cfg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

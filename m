Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF342A166
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 16:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305369; cv=none; b=blyLNwo/7udNTyLiY0Kxu8wwGZ6efy+49Oa0uOpOYQjPoDnwl/VTOCkKQGuse5bxgJErMVYC+cFZyVJGrl5ffEd3kZDKgROLExnlyIOX5Du4jQnqW6Is8kXuUwoxeldD5VXWeeFT1kayffVFIHTsQHASQSl9MIlqDCobXnG1VYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305369; c=relaxed/simple;
	bh=BJFMJXEEE2Uh1+HhRQ0wWNAReksbgFWJgFOdVjP8sLc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G/m+Tdh1URbGIHHHZ6bzp9UGd007iZuduMGOMSqHf3zP4U80JhJVDIKp0T1xptn/puAjK8rSoRVX5m8aZWQ+7J9yF2+DTJu8OvZLrATZm9RcVzNIrYGSrTPSAoBMdrZgitvx4TTFB1yOwI6hA6tHzY7+SE0FRtOMVYK9jWoaFjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uY8kBTYk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uY8kBTYk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D3E3C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784305368;
	bh=BJFMJXEEE2Uh1+HhRQ0wWNAReksbgFWJgFOdVjP8sLc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uY8kBTYkfAOBgusZeK9cdAuqoMXmPBA34yHCGV7OGAxZApG+bbXHR3hElw7QrxFzZ
	 OIF2g7uk5swvg5HtN8iIV9dmybFyU6d4t7F9lSNmF2EBGhaFdEXB/tNpaltSZaKwPa
	 +mGyaVePfLl6zAY9xJ+HflwLqp2VrpHn3FDhBN7aUfLhAeqo0mvR3iGRLuNbgvNqXX
	 I+HkE0eeQq6f8k2Qt1EqJazv3tLAcO5tow3lZaOUc20xCyj2tdCEnD0C+/NQ5xCnvI
	 fB0ekL1Qksxx4y7AkTwclNhDVj40AHobP7rurf6u4GHFr9E33JjBPvo6QBo96Ywf8e
	 HClIHDF+dbhdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6D4F7C433E1; Fri, 17 Jul 2026 16:22:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221759] amd_pmc: failed probe leaks LPS0 handler registration;
 subsequent probe hits list_add BUG in acpi_register_lps0_dev
Date: Fri, 17 Jul 2026 16:22:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: mario.limonciello@amd.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status assigned_to
Message-ID: <bug-221759-215701-xqHE2GXj80@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221759-215701@https.bugzilla.kernel.org/>
References: <bug-221759-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221759

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|drivers_platform_x86@kernel |mario.limonciello@amd.com
                   |-bugs.osdl.org              |

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Sent for review.

https://lore.kernel.org/platform-driver-x86/20260717162023.956346-1-mario.l=
imonciello@amd.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

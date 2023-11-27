Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2722F51
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gf2StmgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10D0CC433C7
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Nov 2023 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701121736;
	bh=Oy7IqgwA0aF8YkyIhd0n7PBHkfA0s5Uxb7PCoaN8b+g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gf2StmgJh7Vdn0bnZFMuptI3fnuUTJzdgdoLFwi0hK7AUIEXvJtAdcMgR/MVakPFX
	 2udQO7t/eYMqgX5nTueV1JPvySP5v092XKrlc9bKPgocETWO2LzdRoPY9tDnjxqQIk
	 38hFgkttF1z/gEkxoC6al/zyr3YqS0lhUbBvOCY/t0VNSAkcJ9yoOavR1ea9/kVkLj
	 LPwbJjNcicF1kU1bRgHCK200zqYROuqIlq4jpBOYjesdbx7VY5cd6HKliqq8iezmrD
	 cKa8GtJ1Oc861tYHT3fe5YzhxrMbwi+2HuYk19aihGBBM9QH4BwVhoQOLlt31ENa3G
	 EAHsPfr5EPUyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0ACFC53BD0; Mon, 27 Nov 2023 21:48:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Mon, 27 Nov 2023 21:48:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-ilRXgLAeH2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218188-215701@https.bugzilla.kernel.org/>
References: <bug-218188-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218188

--- Comment #19 from Armin Wolf (W_Armin@gmx.de) ---
Your DSDT ACPI table contains calls to _OSI, can you try if removing
acpi_osi=3D"Linux" helps?

Since the WMI patch seems to be fine, i will post it upstream then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

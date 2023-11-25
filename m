Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46681D512
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VizLW1hV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC645C433C9
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 15:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700925208;
	bh=fQdeKYbl5/ulnbNxljzKpLM8hs+iUjFCaqiWz+jmpPs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VizLW1hVtFy0ZfoVfwa9kP8+BY9fRKD+MA34/rTw7Ua2U+QHYIPDnnri9Y7QwEt20
	 pNxxRzhN48wk3dQUn0NxzNGFSnIN7476io5tyYn3JveDIdqLnD6vNaPDlD5xSs3Hnb
	 swnDZs2OyU7L31Aj39gJcsBSndZgE62av4VoVzjOn7+L60gD1ORg0DNZEVbU1UETnw
	 TeHP2/TGRuUmBybNo/MUaWh29L5vkVqNYaoQzjvi+6lqiwUq47V+uGry4Qfi5bLfXJ
	 KZHMN+kqCJ9ZWS559UTuI45PMz72LzzhK0K7EpJfdRqQNV7D0HXAcrVUcAAPRZk4Od
	 W/9RCh/apaCtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90A57C53BCD; Sat, 25 Nov 2023 15:13:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 15:13:28 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218188-215701-TKZeQlyyzX@https.bugzilla.kernel.org/>
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

Armin Wolf (W_Armin@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |W_Armin@gmx.de

--- Comment #1 from Armin Wolf (W_Armin@gmx.de) ---
It seems that the ACPI tables contain only stub methods for the
HPBIOS_BIOSNumericSensor WMI class and also signal that only zero instances=
 are
available.

It seems your device does not support any HPBIOS_BIOSNumericSensor classes,
maybe
the dummy WMI device is used by HP to ensure that the MOF data of the
HPBIOS_BIOSNumericSensor class is loaded into the WMI repository when runni=
ng
Windows.

I think the WMI core can prevent WMI drivers from probing such devices.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

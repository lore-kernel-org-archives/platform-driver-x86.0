Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4982FC31
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 19:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5EZ/pR4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 215B5C433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700941832;
	bh=fsmf4kdKDNLcs/JyJRLbjIu+GuOXPAhRlvd8qkreeJg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F5EZ/pR4W4gSzHoA5QIZn6czUX74piHVL0bQ9qHYM63v3AQCDzxc7EQLA0rUCFlpG
	 XsYLlXWUdempj8aFWonORccrd/jSEQzrQYgIoTO6yBacOw+MdPoPl0yyrmUk8I2wrY
	 LFXLgY2QiJPNrfFhG4DSN+RU5x7S/CJBKf5OPQ5+iT5ve4Vu2aLAuDiuQ0xCazPgl1
	 zXmsdXByMpwss4A5HoDAtiXgINcinfh2Guuhv8SRDvUQ/gi+L0KKEyypKxkOceLLld
	 tzLj7rcEzuHPaiU7J/JcT0b37rJzTwTjoR+tOuxa8xVD5vw348ABFmCFzrq8WkaFZk
	 h3TrchIAv41jA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0477FC4332E; Sat, 25 Nov 2023 19:50:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 19:50:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-krvFSjXfKF@https.bugzilla.kernel.org/>
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

--- Comment #7 from Alexis Belmonte (alexbelm48@gmail.com) ---
This seems to work, I get the messages as expected in the kernel logs and
there's no error regarding hp_wmi_sensors:

# dmesg | grep wmi
[    2.040776] wmi_bus wmi_bus-PNP0C14:00: WQ00 data block query control me=
thod
not found
[    2.041019] wmi_bus wmi_bus-PNP0C14:03: [Firmware Info]:
8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    2.041020] wmi_bus wmi_bus-PNP0C14:03: [Firmware Info]:
8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    2.041021] wmi_bus wmi_bus-PNP0C14:03: [Firmware Info]:
7391A661-223A-47DB-A77A-7BE84C60822D has zero instances
[    2.041021] wmi_bus wmi_bus-PNP0C14:03: [Firmware Info]:
DF4E63B6-3BBC-4858-9737-C74F82F821F3 has zero instances

Once thing that I'm wondering is why hp_wmi_sensors isn't loaded at boot. It
seems that the fans now scale up properly though, so that's good!

Another thing which is really weird is that even though I set the "performa=
nce"
power profile through Gnome (and through powerprofilesctl indirectly), my T=
DP
scales back down to max 55W. Looking at /sys/firmware/acpi/platform_profile=
, it
shows back "balanced" -- choosing "performance" again makes
/sys/firmware/acpi/platform_profile output "performance" again until the CPU
goes idle after a short while.

Do you have any idea as to why is this happening? I have nothing really
relevant in the dmesg logs, although I'm still going to attach it there if =
you
need it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

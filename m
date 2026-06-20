Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F43451DA
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781948712; cv=none; b=Up8xoenoZO0Qccw6O32zFAFLQ+Q3SdFb9FFdcWsdpFl6dM4EK4lrvgMJDVdsZ96tAwzxd6jNtMTeyjCi9nawcLMwvf/XKMJfPrHcPgVLgE5uINwShDK0YkzMwFEH1PcFcJ5qM/QDyRw4lzDVRNXNUcQT8421NIsovO9XdqaCTTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781948712; c=relaxed/simple;
	bh=UZWDPonkUTBNW7ZTBuI+P8XUltmQQuk4VSS84Q7HjJA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BVVO7afuo3F8cGONwWVsbfFMC+St3QFRa7JkA/YBft6dz8VI0/qC1MWyaYRrq/mHR4zj6kYepfdYwxivnKVyqgdWtvVrPGiFgIEToP5c4dUi9vpm9kvnh6jBy0J2WpoaoyOJuU2cwS33n8RZhWs57FbqIzyoDZgF2DhQ6pT5Vfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMPBzSVn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMPBzSVn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 723FAC2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781948711;
	bh=UZWDPonkUTBNW7ZTBuI+P8XUltmQQuk4VSS84Q7HjJA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CMPBzSVnsv9QdVCApyLJ7saxrw7P1jDmtfALktxYY9fGmv10J4DsbAIsv0RLB4AcV
	 5U1cEmfBXFjLL/FjjEMqVqqTyYtfqR4pEd06KZmJMN78D1lPiiZuJbfCC51BL5MlNS
	 MCcPB06cRh/pJ5U7zDAoCWZ7amr7Df9c7NigIUaaT3PPKxQBeo4hATAXVcO7Toq2AF
	 R71xVBWmxbJJCZx3/eQ3pD8kA41W7X+UJCLEr1JMtAjsxMajDpoIv+XKG0OE89DHW4
	 vfM7snP/AyzllqFVVTV2U8ZTC3wo3J9QdsFxKsh/Y98wiJUiXq5J1VcXkpc7WbSBfn
	 /eJGRTGO4QJtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52E4AC41612; Sat, 20 Jun 2026 09:45:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 09:45:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-bZDOzC5gox@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #33 from Milan Oravec (moravec@ukf.sk) ---
Thank you!

Here is output of /sys/calss ifaces:

root@migo-HP:/home/migo# tail /sys/class/thermal/thermal_zone*/type
acpitz
root@migo-HP:/home/migo# tail /sys/class/thermal/thermal_zone*/temp
38000

It should be triggered by CPU now, right?

FAN still at 2100RPM

This are usable modes on my laptop:

(choose from 'power-saver', 'balanced', 'performance')

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

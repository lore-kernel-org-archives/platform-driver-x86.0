Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024DF3085A6
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750269533; cv=none; b=qxmpklkVmBcPbMwJ0t3OyBLq/rNrlC9/KriOim+MT+CasLdVsaI37JoIX6UrOhE62jZn/V1AG9OdRgU9gN7RwgTNWevm2FxTBUrV4RgXSxqlAtXhFqseXAcwP5tD7RPARSf6CyTjpyMnHz6agGM8yXTkWl0Njy9iypD6GgxmYck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750269533; c=relaxed/simple;
	bh=wan37h5dFpXP13K3Snl759kO25oIdeKxbnLFatOqn4A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PEUqkd8DQ2sUfuF/TEbEtcQu+wXyVNv+Yi3wh0Y9l2cz24EQizLMmDYsVbXA6CCfRTpP4I3HxWQ6Kbkrr9m/1S+HSY083AjlykIn6d5/bxVbGsZaNXA2RXTatky8DB27QgrfxwQ5XV1mv9Rz7w1ChKvcbJgXuxp99Wae4SRBPNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrSP8Us+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrSP8Us+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76201C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750269532;
	bh=wan37h5dFpXP13K3Snl759kO25oIdeKxbnLFatOqn4A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RrSP8Us+sE68YIVDxDGza+jiapk7SlBTsdtVD2xGmlfildZgaJH/6HF+gUffEPYVO
	 F8knNIcRQFQUVuvjxYITtLnZbEidRS49GZ9V6wdbgLVyFryzaqB4tHM9k4bgA1edeD
	 lWd+NueKP+NW6tFf1A7Qmfk4YrLIHCVs3dAXaoC7KM/bUaZqVtqi4WiHzHN2TcOtEX
	 j5RnTL+so5bKxurGydqSTPudLiUn3vRWh/1CzZaagtt3B/QUlaYw8Uz1OgMJ2IWq+7
	 mo1tHCBE182ZKG6qYd+q/Agb/XJLkZDGH2d0efhtIodxK3KRFqYaCejLNpOl8mskuF
	 fVjljLUqCj4Zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 65E2EC3279F; Wed, 18 Jun 2025 17:58:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220246] Dell Latitude 5400: Mic Mute key stopped to work in
 v6.15
Date: Wed, 18 Jun 2025 17:58:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dimich.dmb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220246-215701-YkImRIMcJQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220246-215701@https.bugzilla.kernel.org/>
References: <bug-220246-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220246

--- Comment #2 from Dmytro Bagrii (dimich.dmb@gmail.com) ---
Created attachment 308285
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308285&action=3Dedit
Output of `libinput list-devices`

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

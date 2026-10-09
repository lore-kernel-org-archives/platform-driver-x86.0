Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1F11429D
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 01:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510371; cv=none; b=oThtP83yl0URZQekEkfT0UUR5VPyvCv6Bf+LmDwanczPF7kgyM1b1xC8rAYMaQSn8kRsE29tpKadwoXPUIRA4nC7gVoEcPkTGjh6KFOzEOuhCcaTffLYVEPCQ3YNpD4wLJrDjxVljDn/zfw3qiERL5RNVzKHDoatqNk5Ltm8yBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510371; c=relaxed/simple;
	bh=UAgUR66ECXFPouJNe9SgpceSG401QpYff/79N5OAX4Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNkxs8lMhINDiDiI/siXdprGRXLuy4qONKIm/cGB3iqnRhjGTr7z16HRW7Weij5nRe+1KKkB/gY+dMvdci8ukEU3w/6YM2CMjQpSs1rChdCKlcGk0uShp6cVee4QTDBHeDlJnw0zGk47xGTQQTM+u3AKEaYjMImZJSAMJ682FIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUtJ7Y7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUtJ7Y7E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 927ACC2BCFA
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 01:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791510370;
	bh=UAgUR66ECXFPouJNe9SgpceSG401QpYff/79N5OAX4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DUtJ7Y7EUU1r2LGNp3N6EmKaKqyRnMUvuIxTKs/jMCPDCZpqLf3b735EotDU7Izm7
	 O/iCattJY68vBa8a0f9A1luWcii2ccwZOiDgnL2Qe5ZMJUcnjX8EX0SquYX5Bfim6K
	 ybC/wDYIC4yEVHfdPDjbs18CJYiJ/q4eIbTRsUXkYisnzOaFqERsMHHEYnMtIjZZzA
	 gghG+kdv7cXL61oh762B7LDu2/sl7CvVnEDVse97InZGVcG1wK/AabJxh3FUwWw6po
	 gooRPddQxM1O7S5DUFviVCpftZwq5DwrQC9Zueua2r4wMDT9bSOFJptSwPSR7I+7EM
	 QXztP5zcxax+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64ECFC3279F; Fri,  9 Oct 2026 01:46:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Fri, 09 Oct 2026 01:46:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zhangheng@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222044-215701-YXf8fwStX4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

--- Comment #7 from Zhang Heng (zhangheng@kylinos.cn) ---
        [ALC236_FIXUP_HP_DMIC] =3D {
                .type =3D HDA_FIXUP_PINS,
                .v.pins =3D (const struct hda_pintbl[]) {
                        { 0x12, 0x90a60160 }, /* use as internal mic */
                        { }
                },
                .chained =3D true,
                .chain_id =3D ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO
        },

+               .chained =3D true,
+               .chain_id =3D ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO


Try adding these two lines to the ALC236_FIXUP_HP_DMIC quirk on your side.
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO can basically implement the functiona=
lity
of your code. Build a new kernel and test it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

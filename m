Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2587144D23
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507459; cv=none; b=fhbZKfCsbA8Jg0y7q04kKF0ZSKZ6Yiery1YanlRfc7RCcjpicw6QJXH4QwjFNjAVv3fnF6VN6/vQWDD+YAg7Q3vbBBVZWJJro16FIWad+wlSqYQcnJUsCSDZZUWGRSZLn4jytuasvVZlvsJgjRPnavF1lnYlXsGM/nDqQgs82YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507459; c=relaxed/simple;
	bh=ovitGQtKYtqdqw55fFI6Kl/5+hT2FMFRH4ZE5c916yI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tlqqN0hwpFU99o97981qPL6kKvPZz0tl4zaD/etzrXtZfKS84cwRgnSrkcItepIbqFpVqK/bm8/Z5hCiwUOrVUUERbKgBwD1H/YjfQV1Qc+MTZYH8PBlqdY5+Su/UE6WV1rPKglm1pbdEGVqGV3m/NdXppHomRhNXlGkbTtXJbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vf4Xe7gZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vf4Xe7gZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8472DC3277B
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717507458;
	bh=ovitGQtKYtqdqw55fFI6Kl/5+hT2FMFRH4ZE5c916yI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vf4Xe7gZldUpDvg0+gkLZsMEUwYdDdEf9mXqxXP3ghyNNzqazedbZ59t1mOMOcQ6Q
	 x6EKPMwHJjOhMEFv4GOd6/N8aK1hDPH8/pdOC8Cxm5Af02cJZwvP6gjKNJKlE1RUiA
	 CpuBxlxmNTkB+LmAjkZUGE89wq0x3UmLDpUe6V6BxqDgqY4N2/g97Ufovcv6pJqZIh
	 s/9HgWcRAcTAyLzmgbY37K/NiwmcgMK7imj50feuPIHH3kGqWkMqdecH+5gxcx59E+
	 0OqQ6X/3sdL8iABrZDgMwiGuTfNCJIA6Lxc1PI9E6uI1goru7dXlyM48F+tBZUIwWs
	 JQC7v+f/OipCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6DD8DC53B50; Tue,  4 Jun 2024 13:24:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 13:24:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-f5x14EGuGn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218901-215701@https.bugzilla.kernel.org/>
References: <bug-218901-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218901

--- Comment #30 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #29)
> Created attachment 306408 [details]
> Prototype kernel module v4
>=20
> I have removed the airplane mode hotkey handling from the driver, can you
> test again if the wifi issues are resolved now?

Yes, it no longers deactivate the wifi.

> Can you also send me the output of dmesg after pressing FN+F8? I am curio=
us
> if the strange ACPI events are still happening.

it is still happening: here is the output once I press FN+F8:

[26146.735205] lg_laptop: event guid 2
[26146.735305] lg_laptop: Type: 1    Eventcode: 0x30010000
[26148.031450] lg_laptop: event guid 2
[26148.031517] lg_laptop: Type: 1    Eventcode: 0x30010001
[26148.054930] lg_laptop: event guid 2
[26148.058063] lg_laptop: Type: 1    Eventcode: 0x10000000
[26148.141362] lg_laptop: event guid 2
[26148.141429] lg_laptop: Type: 1    Eventcode: 0x30010001
[26148.301453] lg_laptop: event guid 2
[26148.301518] lg_laptop: Type: 1    Eventcode: 0x30010001
[26148.324300] ACPI: \_SB_.XINI: notify: 192
[26150.350874] ACPI: \_SB_.XINI: notify: 192
[26151.363858] ACPI: \_SB_.XINI: notify: 192
[26152.380376] ACPI: \_SB_.XINI: notify: 192


it keeps sending the acpi event with any key press.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

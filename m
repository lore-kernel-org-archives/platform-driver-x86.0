Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793717912;
	b=tPJx55by4Euy+OV3D2CO7yMu0BmloSLcJ4L8VOZ7+B81lvuLigI82uw8Rw4PSHnr+zfx
	 dFAPEShEtmMQ3riFE1IE/G6kDJYH41xdkUrLredCt07HtgnHB8ToXsSZ/r1+skUGowQWl
	 G6OqJ6K1acCq8o4BinXev8bunTlmzgudmp9JMQsZDN/OxKlSQrHllkJTpD3LPttVcFRKr
	 S1ftu+GUlMXXaTJUOCDUsFPpaYuXOya3UJcg7FHMqCZ0njo6RE5ljVBVHUWh/G/W20KQe
	 X8odZhgExjxTFUv8ELIDo+K7qX0ImoguqdkIODxmHlBUOCf52ySRKjrTV2C4lIVNxoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717912;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=40w4cdXhqn94W4Bt0vrRYod6H63/eZVjMzDnHVbffcw=;
	b=2z3xr0BMNoGp68cLZYims/qdYoNTqNwgj6kfmrHyaG/cCKNtHz5qKz0KIBSQZY3SKowL
	 ZfO6MS2IObWdQ9zynbQAMHGtXIBDuqK8lbMYzxNmMAN8uuy6X+O1mcIP/jMxZmzvTnvhq
	 M0sC7Ud19QFnWBg/QN8BlmO+rm5r/F/RrE7hTt4F5t958Ri5Xcq0d30kCQiTtZQa9d8sI
	 tHUrY1w0UUIy2fSUSvWp8Q8NgT6FvxFRKaLjDUV9PUmov+6vKH8c7PFNmHDUXGwP04nCu
	 8+5/PdKvam9szzRZenbbAK3grD8umPEJWdZUriaWDH4W9OVpUdxVzQ7XlDh33Enc7WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=movUvXL8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AC8606C81C
	for <platform-driver-x86.vger.kernel.org@localhost.mlmmj>; Tue,  3 Nov 2026 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=movUvXL8
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFEE6513C0
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793717912; cv=none; b=lMctE3e5mlnXadFpKzcZ9x5/yo7v0aK+4K3wvsmIdXGAyEE22Pxl58DMx/dkkP6rrpwF2bWnUeeXuoCUp94BC5gMLu96sUGuq3G9dITF7vMgGYwpOHhpUiq5CL9Jjdt/WA8Vg6omLGmEMECXZfIm7muWIoqmhBDJVZ6DPxpoAmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793717912; c=relaxed/simple;
	bh=40w4cdXhqn94W4Bt0vrRYod6H63/eZVjMzDnHVbffcw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L3FsCiUkMca3thKIdzBMfzWlbfBJIoxYsC8Kadx9VcdHFu7qzF8yh3o0pHKLn99atyV+XvUEDRHFKjzCSZK/grILIdeDqR0xLZpmQEdpu5Tfghqm8+9LZHUr/GLZ4QLgxK2pwZh2CBQCNSxhV8FD2Qway87SETl8J7k1/MTbIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=movUvXL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A21EC2BCFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793717911;
	bh=40w4cdXhqn94W4Bt0vrRYod6H63/eZVjMzDnHVbffcw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=movUvXL8qpj3CMsSj9wa8mq8wDCUc+43hgakL0m3OwQ7/jBMQdKrAQGAO8mYuMSKe
	 MvtFIGUMdOMyPRK0lHQ8+0jPr9auUjS5LP0T/OceitEBTW5NtitRp/XUa1NDFEoRd/
	 yvRpcFrYqF5tCjNlhjEiPJEXkNki7+eUoXqdE6Cp15xzJtuPZ/49BM5cggffsHftRN
	 +3I0ecm3LX6bUc278vGWSVejlluNoVP/eC0j7d0UVAu/lPltzv0cqYo7kkUO60nARo
	 E2/R8k7UWNNKN7voRVied3+NcDIHc6nPx/z6tJ4Hil68pjcJ7Djeq1mnlLfHMuT0g0
	 /Y9E7vLB95tIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E99D9C4160E; Tue,  3 Nov 2026 14:58:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222161] platform/x86: lg-laptop: Double input of super key
Date: Tue, 03 Nov 2026 14:58:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-222161-215701-YDyOdiASYa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222161-215701@https.bugzilla.kernel.org/>
References: <bug-222161-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222161

--- Comment #15 from Armin Wolf (W_Armin@gmx.de) ---
Regarding the ACPI tables: Your device always dispatches ACPI events to the
native device handled by lg-laptop, so the offending patch enables hotkey
events on your device for the first time.

I suspect that somehow userspace becomes confused when receiving KEY_UNKNOW=
N,
so you patch should be enough.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

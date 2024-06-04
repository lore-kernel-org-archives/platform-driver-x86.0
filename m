Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63126C13B
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717513146; cv=none; b=pXBhUyxOqmQKdyWf0Bp6CFKoU4RdZtAz0M8baCaSQubxMJOY5QAlS2YgFjvqoVckO+r9Hk3AX0N+UEHDTXFQXKJkUoFwcBMhUN+zPttxSL0R38XuB6AswwOI8Hcbp3YC/3p2csB6qUTuAw3SFUCtTBF9Hy+D/ypcE+cWvKa5ejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717513146; c=relaxed/simple;
	bh=1b33iUs4cdezdOylrE9KgpCl8WGS/dxbXz4aO0dQvbI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k/wiKEDIne5or1qyiBESqGUZJADl7pw8EBXtid9c2JwWtwS4gifqJ0haXwVKktl2b27ARWjIC+hePtE9sTTVlMwrcSLsdVwLhFyguK7341L1hFmqLV9LwnRx/QC43E9QXgm/xCViFYgKUhZeOegjB9O3BYrtuKGVX7KDn8gseQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QU27AwwD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QU27AwwD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B9D7C2BBFC
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513146;
	bh=1b33iUs4cdezdOylrE9KgpCl8WGS/dxbXz4aO0dQvbI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QU27AwwDw+nsKLl0PbddYV2kLTUrdqYFQjRdFVTc7r8tOd9kb3hqjHn5aRyr0PTpt
	 TwsAL6XaPnSfWmnoSsqfAN6w2as0Q3eM/+h/1Y+4liyb3MnOMXraBNVR+7yqNply6r
	 R4hxavZzv7z40UJMncnurrBpUGLMaiKUwG8B+eb5Fjyg5jxJh4Tz9DODS/KGxvr2Lo
	 eJP5snv/TqRmQP+ZNUj83jEl6R4XNyFODUcDyL2ziv4mv1kfYVC/GTnzy+jtadeC/s
	 OCpuMmX31AhPjj65zkBRNTLAZgbUlBHhe3HCV/eshgfHKlCvMJ1+qUAwdpaUuKJzqZ
	 8ruUbgcmEE76g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2AB5BC53B50; Tue,  4 Jun 2024 14:59:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 14:59:05 +0000
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
Message-ID: <bug-218901-215701-taghvxHS2c@https.bugzilla.kernel.org/>
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

--- Comment #35 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #34)
> So when you disable the keyboard backlight, the ACPI 192 events stop?

Yes. And I think the hud issue might have been because the laptop was in
hibernation before I tried, after a reboot it seems to work properly
(hibernation seems to break sound as well but I think I found a workaround).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

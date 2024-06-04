Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF6414900F
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512556; cv=none; b=XVvvyr5I6ZnsRMQTG9XBW2+7d8sduPJJbMgEhalPNBCzcK3PxKMOeOWnnCj8tt0RTEuv0S90NuEkN0W5anYIkcfj+5DBQf0P97VN4tzhIJylXJsedXdF1EHPc+q18enhndvCfCSwohm8h5PhFeThhkE/WqboUjOGC9mMQBH/4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512556; c=relaxed/simple;
	bh=fQe52o2tNJQ0FrwKZCZ8zQq+DOJoj7AryFRY6oJQzWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BLbx04e5ZZPFQSGR26t5jo9QwGP8emgWeuIivkvnpI1I4zH0mQkOe/7OSwp5GTd/PEUf2mOnYr4TKOp2LVoVET8IGXbvzl/jU/gWEAmwnQwAt89EzvAW9pZcWVKtqPWYNo0WnCwLQOwBCKetNtgTwAIg8pqR92JLUnHgdvnMkDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQzTXl+u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQzTXl+u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F70AC4AF07
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jun 2024 14:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717512556;
	bh=fQe52o2tNJQ0FrwKZCZ8zQq+DOJoj7AryFRY6oJQzWc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dQzTXl+ujvw2rbhKS9cjjJQuchfZCCEkGAxJFsB7d8oBKYijv1LQn+K7NPmHcDnWg
	 s/rXXFqSS5lY5dIU1oSgkH1UWXOnaY4EWjKGg/qZoS7CWQmP1cV0Kpjjyxz/Gjk1+H
	 ct5G01M7jwIao//gIWveLjLK9fw8fprHbS6wiPQeorv9h+B1bf9NiI41vs7gDTrbxO
	 nbnUsskQ5OWlKalZXWM2Nhqb+Y1sbuN+2nUMDgIeJ5noxhN68TTYcBu7sWSfwzm+GD
	 ZBFB+wZwc21r7MkKCuxYvhark1IxsV+sdr1vaPBqiV3+2ywhfHRg3fOm4KFRnwLkS5
	 OQcZA+1eppXuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 27C14C53B50; Tue,  4 Jun 2024 14:49:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Tue, 04 Jun 2024 14:49:15 +0000
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
Message-ID: <bug-218901-215701-3MhL6afr8A@https.bugzilla.kernel.org/>
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

--- Comment #33 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #32)
> Does this mean that before loading the new lg-laptop driver, you where ab=
le
> to control the keyboard backlight with FN+F8?

I think I might have tested it too quickly. It works, I just don't have the=
 HUD
anymore when using it.
It also looks like the ACPI event is only sent when the keyboard lights are=
 on.
My intuition is that it is used to tell the system to keep them on as long =
as
the keyboard is being used?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

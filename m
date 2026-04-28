Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2582D8795
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 01:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340243; cv=none; b=kkLOtI9dKkPuwEovnBwF6/FSpK6Gk5g4y3jWIC8m5s2YbGsHCSu4zFSYJXLE6PcqjqI8HlxMtkodds5ZIU5BwhVMdWHN2fY3bY17bnNC3ON63RV8RQdck0ZQLrpA6T3LQTR8fegvIm57ICZcv0r0ZSCt5o/xS4bhjCfpCaPEmIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340243; c=relaxed/simple;
	bh=ZDLefiUm72hY8ZXS6lrgw05qQFWaTgxriLTMDl11P5E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BF5pcB8vd5i+K2F8/nYILPO30sr+sLMuwJeIiE08qDxAfjzooCHQUizAZvz8Y5wP217hvUR6u2PIt4zsqtReJODWMQfMYhLiLky71IiAvc4lpdnrq2Hf0uFmlCKYzRs4DWLijI30e8c2hRRcVI9FgiaeIxfGPMCKu/aEODBzR+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grqcryVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grqcryVg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F94EC19425
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 01:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777340243;
	bh=ZDLefiUm72hY8ZXS6lrgw05qQFWaTgxriLTMDl11P5E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=grqcryVg8kXKPIkOq4GRj7LPwR0raUn1UJICu5KBo1qNbIe6XP8Z2Pnbf1l2nHuVm
	 v4F5ViMrx0P/0JiT42gOKAgSbYlXNhW53hgGdXsI5Y5EVx3oyu11TQhRkqp5NTMnJ2
	 kNgVB+dFuZ+ONXVY44WBC6YQHGVwxM7Zxy8koAL6RAGAfTrQY4sHxZ501CLCP49eE6
	 VqXJPSRWa0M337DjZri8xWXZ29zJzFpID4cHedihpE6cEPRBRgOIfqlG3Ofmp77xjI
	 ZLBaDg92oJNYnXfUm9I3rX9dlC9WnR32gKsNlBR+dBAcXyT8ogSkq7jij9wXStfWNw
	 lmlVijH9re2IA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 58B59C4160E; Tue, 28 Apr 2026 01:37:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 01:37:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: metalcaedes@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-aBPQwrGRxC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #49 from Daniel Gibson (metalcaedes@gmail.com) ---
> Try using DMI_PRODUCT_NAME like the other Lenovo systems.  This should ma=
tch
> whole generations hopefully.

As far as I can tell it doesn't. For my 16ABR8 it's 82XR, the dmesg log of
https://bugzilla.kernel.org/show_bug.cgi?id=3D220521 mentions 82XM, which s=
eems
to be 15ABR8 (says
https://download.lenovo.com/consumer/mobiles_pub/ideapad_slim_3_hmm.pdf), so
presumably the last char of the product name is the screen size.

I guess matching "IdeaPad Slim 3" + "ABR8" is safer than matching "82X".

> As for the other ideapad-laptop question, you need to talk to the authors=
 of
> that module.

Sorry, I didn't mean to add anything to that module. It was just an example=
 of
a module having a parameter that works around hardware bugs with a descript=
ion
that explicitly asks users to report their hardware so it can be added to t=
he
quirks list (or at least that's my assumption why they ask for it).

My question is: Do you think

  static int delay_suspend =3D -1;
  module_param(delay_suspend, int, 0644)
  MODULE_PARM_DESC(delay_suspend,
        "Delays s2idle by 2.5 seconds to work around buggy ECs, often causi=
ng
keyboard issues after suspend. "
        "0: don't delay, 1: do delay, -1 (default): let amd_pmc decide. "
        "If you need this please report this to:
platform-driver-x86@vger.kernel.org");

makes sense?
(I guess it would be the same e-mail address, as this bugreport goes to that
list as well.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

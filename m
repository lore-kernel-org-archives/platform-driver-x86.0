Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E95464D
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683831; cv=none; b=YCWMlM4mwEns54YqeOMU/UQi6tcq21xZDGC53kBNM/2a9KdvR2g1naeH3in6blBUE93H1uFJxKQit9sIEYBzlual8+sR458L2arcrIGDZwDPXh8mYpMyhMh8TgHM4aI4YGVcYeGnbX5kbpxW9FWi3bWIz0gzH31MP2etxrQK2h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683831; c=relaxed/simple;
	bh=/MkXdE8yCeKSxrWLB1gjkr0BEZSNSCT2i24B49nZrGg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RKQXM5nrjv/wUUpoE3eYmOtnwZS/zQVW4gOJQXBhuUpVkF1q61rL8wZ70jZir+UQ8aMy3iZBJ43ZLiPXSAwK3jywMkqfN8qLtBk+EdJ931rS5H66mzhP/VIFvkCcTQXHpX8mZ4g8clgxmmlUkBD0tkg6cEbrAeXzSa+IuNLrr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZZoliaD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZZoliaD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F7DCC2BCC4
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jun 2026 18:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780683831;
	bh=/MkXdE8yCeKSxrWLB1gjkr0BEZSNSCT2i24B49nZrGg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lZZoliaD/CbaXfCdZCORuVvhAJVPO6oUifAUsU+maTVeLF6h6En2k+htpzvmRHhNj
	 z3aVyHJ7J+HRir2WPRdnvqPaxgSNxrDKdaBxMZZ7a/afAWUBhMHxEFKGgaATRBdNwM
	 r5z2zJsaESH22f41nYPfZm9mdhzFK5R5ne67Q+bKJGICKHK3QM7TIB2+Zo9GJHV5bf
	 FCAgMxL3o4hx7chfe+wwii10o4gt8ZkozSgO5HLsxK3A6W0AFM3DcW031uOQE0JluQ
	 ylE5jAkano6IpCavYrAbvufst+Y9pSX7/H/xStgInIBwr2bK7ShjehxoPk4s69LjVB
	 3TResXbwM+Jtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3E367C3279F; Fri,  5 Jun 2026 18:23:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221583] Lenovo 82KU: keyboard backlight works via Fn+Space but
 no kbd_backlight LED device exposed
Date: Fri, 05 Jun 2026 18:23:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: george.stafilidis@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221583-215701-UBw2N8RbYk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221583-215701@https.bugzilla.kernel.org/>
References: <bug-221583-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221583

--- Comment #22 from George (george.stafilidis@proton.me) ---
Thank you for the explanation and for your patience. I have attached
(dump_off.txt,dump_low.txt,dump_high.txt and dmesg_ec.txt) I hope i did it
correctly.


I did try the unmodified patch and from what i can see the GNOME Quick Sett=
ings
panel correctly displays all three states (Off, Low, High) but dotes not ch=
ange
the brightness of they keyboard. Pressing Fn + Space correctly triggers the=
 OSD
notification. i could upload a video if that's possible to show you what I =
can
see. (is it possible to upload mp4?)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

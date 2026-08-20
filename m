Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D6391E78
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Aug 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787218633; cv=none; b=dXzz6gyp45xpFfq+D5Rx2b/kKVakTjHuLIm2+mjDjrLTzaFJV8cIZu3BszQ/kM2mt4rvD9h5ze23+47SL7NtRKJvDoaedorz0rudDPTtkBeLENourTt36jltKX+igfJcvJi7vjZolyTi0ytoVRiI8Pf6LzFGA/fi53xBX17T/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787218633; c=relaxed/simple;
	bh=EKY/eZEJ6NPZuRRkUmq51tkmekSHRD23MidOpKUoeRI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S/L2kKpSmcAH04+42xtX7uXMt6PEMJASNRx68GRnavIkR7GF7hbSc7SfFonRIPdWxBsLfmwKAhm9qVb6YzZAqWgeDhUMB4Cga9Rz+v624H9A9PQf4pgH4OKaK3cE8YXF157ZMnQ5itOW8r1D6G+ax2xvnq3U5Skyz3Vs26k1tr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfDmw2wj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfDmw2wj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92217C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Aug 2026 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787218632;
	bh=EKY/eZEJ6NPZuRRkUmq51tkmekSHRD23MidOpKUoeRI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OfDmw2wjz2mCq3bArKGRfWZ6XC8xDZ7fOolhk7SMyBEDne9xsxuDXzS9QCmfi3/y+
	 QtJDZH3/7t9pWP1KXhtfzdvKWDF7vRU5Sm7OxCarI/d/ws/AbKjwCUUa/UTr71Kz3A
	 N5h/1EagDb/3m+oc+dvvD0IFEGYkZ2VcxlT6g3juPaF9jJYIpWvrO1Iuxw0o8lOkFk
	 SfPUxpZv/jNxxJOCpbqomFI8bDUaSy+tCKZIB3/KStpuS4denrZf66n5yLfi5n3qdp
	 vx6yx4LqyutGRFrjadrNZdJSuxwf9u2LP1y0/A7N2PMTODJ5m1j/Rm+fnXwV11+f4l
	 ZZnLZ/KS9SfCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 751B7C433E1; Thu, 20 Aug 2026 09:37:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Thu, 20 Aug 2026 09:37:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220926-215701-wguLNY7zB6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #4 from Gibs (gibs23@proton.me) ---
(In reply to Suryansh Singh from comment #2)
> (In reply to Gibs from comment #1)
> > I have the same problem on same platform on kernel 7.1.8.
> > Changing profiles does change fan behavior, but RPM reads 0 with hp-wmi.
> >=20
> > Package power also seems to max at 40W no matter the profile. On Window=
s I
> > have peaks of 115W and then drops at 55W after a short while.
> >=20
> > I also tried mapping my board ID to Omen or Victus configs but doesn't =
work,
> > the ENVY seems to be different.
>=20
> Hi,
>=20
> Could you please provide your board ID, or clarify if it is the same as
> Andres?
>=20
>=20
> Are you sure you've tried out all Omen or Victus configs? The latest bran=
ch
> for the platforms/x86 subsystem (pdx86/for-next) has an expanded driver
> scope compared to the current upstream version of the kernel you're runni=
ng,
> so consider using the code on that branch for mapping your board ID to
> specific driver data in hp_wmi_feature_boards[]
>=20
>=20
> In case none of the existing parameters apply to your ENVY laptop, the EC
> behavior and specific quirks required to get it working will have to be
> reverse engineered and patched into the code, rather than the regular pat=
ch
> of mapping the board ID under predefined parameters.
> You may contact me at my mail if that happens to be true, I'll be glad to
> help in the whole process if it gets that complex.

I tried the version from the next branch but still no results. With
&omen_v1_no_ec_thermal_params I get a kernel panic, and with the others the
driver fails to load with hp-wmi hp-wmi: probe with driver hp-wmi failed wi=
th
error -22.
For one of them I got an extra:
hp_wmi: Unknown EC layout for board 8BE5. Thermal profile readback will be
disabled. Please report this to platform-driver-x86@vger.kernel.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

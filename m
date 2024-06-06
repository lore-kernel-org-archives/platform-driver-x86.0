Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03845146A88
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678099; cv=none; b=Z2KTIXarFEWD/gFGqcPH4bGV1/79tiGm+YaExWpooKuDEmjRxLvxlMrz0HwOcEyTedt/6iykYmP9xI2ooFfb6d4NiLEsQMvhh+C2HRRUm5k/cj7qF6mYIdSvLSlt7ihuYzewWTorlLn0UyV1601E4RDO2//Vb9+GLnN9xgmmaMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678099; c=relaxed/simple;
	bh=V81yN/seTmpliDP8VaB1PZi2Wja/LZtULWZuudYnGbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=knKm/Hlg25Fu5+1SNG1aJT1fqYOzP+yirHz9KuNwYmiAKVPS1j/vbmOXyRXYWvb4bq1pP7dUAFFRlHDcYLjxVRrXTFr0G+fY3r5gKb4KGZeJ2yB1YiMzmD6OBVbuHgFrcCLmGIZ3J0FxrT2gVQQ45JCI8DMiFrI73NvdkBG+37c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOXxJmMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOXxJmMi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0423C2BD10
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Jun 2024 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717678098;
	bh=V81yN/seTmpliDP8VaB1PZi2Wja/LZtULWZuudYnGbY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mOXxJmMiddCZZdaHK2J271X6wW5EyZjsmYRe3hH5+f9qnwhA9K4y6qybZPWx6m6KW
	 HhRd3wXjgHgVPMVW2KwmxQ9zYLBRHYP1GD/Vd209fu8eM7Oo53qqPQT2zBxGzb4yrC
	 E6/oIcW1visMM/JyqDDVDY/EUa14FDWUUlh9pb5RKv8KHIG2ISt0cfseB1BsD24PJb
	 sNmSTMGciPMxjLVzxYFR2cGOVzCEDlsfoZBMvbBGEldN5BI/FUCOPf8h0VWFSgVdCS
	 z7ttuLMBKUFI/x79K5NIruUe0DE+R6QVDETMo+p6fQ0TfUAgP8jg9mLBbSXKUaPWU/
	 nW6jO3kUJ+eqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 960E3C53B73; Thu,  6 Jun 2024 12:48:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Thu, 06 Jun 2024 12:48:18 +0000
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
Message-ID: <bug-218901-215701-8pYLWWr4T1@https.bugzilla.kernel.org/>
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

--- Comment #47 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Matan Ziv-Av from comment #46)
> I will look at the code later, but regarding the reader mode:
>=20
> In models after 2017 (I am not sure about the exact years) reader mode on=
ly
> controls the reader mode led. The firmware does not change the color
> temperature, as it does in 2017 and older models.
>=20
> I guess that whatever changes pressing FN-F9 happen in windows are done by
> installed LG software.

ok, that would make sense. It's not a big deal anyway since night mode exis=
t.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

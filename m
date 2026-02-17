Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7E422B584
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 01:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293572; cv=none; b=Kv53f+sjR9kGkb6ds4THP8BDPyNlSkov9a7bSYvWfykl/BLEo6yzjtv30HIImbqsKGfD8D1VipridNia+f21WwZEvDLQYDFDwORJSd6Q62OHlGFJ8eQc2MhflML3rdQvwRYZ+4UNkZtq4rT4eNN+iXKUdI82S8+PnZfkxDxxawc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293572; c=relaxed/simple;
	bh=xdddF9gUrJmejBmPkQa5nBav5Fvl3ghlYT0sHqc/aAc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORelbfSjpW9ZTI+YNiO0q9y12/Z1OoIkYwHt2IE7is9zqTYEt5JHrZx7uasFzcZdimGUn6kVniu+rWQxYYemWkRsPFy10eEYI8hzDxjs/FMuk8wm9+6KFYvwOhM3KDKGz+iLQ5ISd/Xc1rHiuXX5Vo0Bu3Gy7Oet+fErVSFM050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jO7371hD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jO7371hD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 304A5C116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 01:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771293572;
	bh=xdddF9gUrJmejBmPkQa5nBav5Fvl3ghlYT0sHqc/aAc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jO7371hDs3LYkzeK/iKA+MCjAIQQJ6DY9dJ65GFY/6REjKQLxpOflBBiJklY/2iys
	 ewBNkNK+CtR498BXQvNyU4KtAbaRWhHIuVd/5T+TashGGhkQSrfsCHtVofJUECXFIG
	 5hX4x26Jf4BupJEmCsRuZpmBbLXNlp4ZvwB3riJIsuLpD20B2CUZaPIPjlMdPRzKiy
	 3ZsuVhtNJFtlONRWycW/jEYOTbiNaemDGpBU63uJJZjnJ19xBzD6rSUBfBxPMR5sx+
	 9vEco2ilQSvY4noBNUo4L/jg30C9SQJ5r8EvjSGbaup5W1gDya+YVG1NOsT+t+6P7R
	 KHloyQIP3aviA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1DB7DC3279F; Tue, 17 Feb 2026 01:59:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 17 Feb 2026 01:59:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: anhollander516@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-DoaX7IIr58@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #36 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Rong Zhang from comment #34)
> I also found some time looking into ucsi_acpi and the AML code of the ACPI
> device (in SSDT17).
>=20
> Two helper methods (\_SB.PCI0.LPC0.EC0.ECRD for reading,
> \_SB.PCI0.LPC0.EC0.ECWT for writing) are repeatedly called a total of 25 =
(!)
> times when handling a UCSI command. Their timeout for acquiring the ECMT
> mutex is 1s. Therefore, it is not surprising that some of these calls will
> time out.
>=20
> Considering this, it seems that ucsi_acpi will cause significant pressure=
 on
> the ECMT mutex, as each UCSI command acquires and releases it 25 times.
> Instead of blacklisting ideapad-laptop, could you try to blacklist
> ucsi_acpi? Doing so should reduce the pressure on the ECMT mutex a lot, so
> other ACPI methods may be less likely to time out. Again, this won't
> completely "fix" the issue, and a BIOS update is the only way to fix it.
>=20
> Moreover, there is no way for us to determine if any call within them has
> failed, so we can't trust the UCSI ACPI device anymore -- a quirk will al=
so
> be required to disable usci_acpi on 83DR.

I don't *seem* to be getting the mutex error with it blacklisted. However, =
I'm
still getting the original error from ideapad_acpi.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

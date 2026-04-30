Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23410367F22
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541407; cv=none; b=bmPaij0jFfbc1tjY4G8sOESyK1jI5CttygUaq6pbUUxt/3lSIL6wXvNabg1YujFLZy7bpQZ+aezyRkYB5DigyzdIrvKtUqWcyHWBgRiYZ/GtKJa3LeSi6AKyxe6dBmVt4acYn99yYECIutJwXMhMYkrX5QkF4meteiM6TcSmD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541407; c=relaxed/simple;
	bh=yuhBl/AfQ5KM5nF1s2UKQS3xt+BhC01pwxMZhsYphTA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W/ojqDVyhYpedxtgli+g39Dbm27tnYK4F2oNHptZKsZWOTCe3B/UroVehStkpTRNC5zdmWKs4T8pBBBGo/qovljZOuP3T0SyhQuW20kZOKHPc3iBVENP0pBZK/dqD1DdARc/KMaTz6RjDp2140JhM7nht24fmHwNqLjhmcdSLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORtW+ypE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORtW+ypE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98DB2C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541406;
	bh=yuhBl/AfQ5KM5nF1s2UKQS3xt+BhC01pwxMZhsYphTA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ORtW+ypEsbK9GT98e1nKpjwZvd+DBkwB+uLr5WKF4nP1Oi6+hXRPC/yf2ckIhokRO
	 IHMpRX8cM1+I/HqR4TdcMW82IZJ2Nq/KZSnmN4DXYtRUMefezyGkcuKJUfrqMfXTbj
	 XtNEolzaXvxhwisd5rgXZ8NjtmpRBqPKBMlAT5grUbqWje/ZO8BShWS+7MkVb/CaY3
	 cfGANkmpE2kseKjJJesWswrLpQIXpPpy3ytLHMznn3QV64ymdRiIkzYLXqXxOAQ+J/
	 ZG2o59Zo+/ap9tYQARHjAvNHyn3oKJrGzTdZh8wQB94G6868lvC3t+2nn3m3ROWAUa
	 BRKJ9mBQMy5mA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 93085C53BBF; Thu, 30 Apr 2026 09:30:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Thu, 30 Apr 2026 09:30:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jeffrey@waelti.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-AJhJgN1zL6@https.bugzilla.kernel.org/>
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

--- Comment #74 from jeffrey@waelti.dev ---
(In reply to Rick from comment #60)
> I found this bug trying to track down a system (GUI?) pause every 7 minut=
es
> or so which seems to correlate with the event discussed in this bug (as s=
een
> using "dmesg -w").  The pause is around a second in duration and oddly the
> mouse cursor will still move but everything else stops.=20=20
>=20
> If this is the cause of my pauses then at least I can stop looking and wa=
it
> for either a bug fix here or in the Lenovo BIOS.
>=20
> Can someone confirm that this event correlates with a system GUI pause?

I can't confirm whether this is the cause, but I also see freezes (most
noticeable by the shell becoming unresponsive in the terminal), which when
checking the logs always seems to correlate with one of these errors.

(In reply to Hans de Goede from comment #72)
> > However, with only ideapad_laptop loaded and not ucsi_acpi, I still got=
 ...
>=20
> There is nothing we can do about those messages. The real question is if
> there are still any messages which repeat periodically filling the disk w=
ith
> logs, like the original messages starting this bug.
>=20
> Or if there are any actual problems when using the laptop?

If this is actually the cause, then there are definitely problems using
affected devices, since these very regular freezes of the whole system are =
more
than just a cosmetic issue in the logs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

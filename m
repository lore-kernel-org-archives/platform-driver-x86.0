Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923903EBF02
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771296273; cv=none; b=OHGvDQLehEqlx8VvFOBLrp35ZtFnCD2yl/bKmAeT9B8b62veQIS6ShD74r22hydRy5K5Tq41wlXIGUBcMdNbOEuljz3KgrF3h1+z4UfB47aeukY9ZnL6ejg7yQ2h6I5JEuA0+hU6rN1FHxjZzr288b9TBpk0vlFzuzpsfUdDg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771296273; c=relaxed/simple;
	bh=tP1mOT7VbP33WXQ2u7HnkCkjnaVtD3i9eoH7um0Cxhs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pRA7QU6Ofyyo9bZcgylLtk6vc9I9QMM2GCyNIxmJ/Ju+JMPhTU1QFRDc8ceRzDkMmnv2mc5tXjEFjpUnDtZCjQOy+26k5Z6XMiN0arbSIDGFwMHTFVEOiDXnmTgtaz+GsLKf/+ZU1KLkaU+sXdXBZbK1+XOVCwMAWp1qKkF9Qz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujRYdDN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujRYdDN1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27C5BC116C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 02:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771296273;
	bh=tP1mOT7VbP33WXQ2u7HnkCkjnaVtD3i9eoH7um0Cxhs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ujRYdDN1NJQZg6FYQtcK7RdeKBN2FJvqpJP0kTpmnU52ckxx+bOlTF0Iurz8OX3CP
	 QJp9D5La+7a/srhejBxDvUyh5ZGxV0IcDZcxDCPQF8PACUIFYx1SNPnUhcZUK+VzRl
	 Qx1LkWKXaqn9D+4PR/4Cm51Pq/cO/08tXBbzXo/UqVG8mAvmuAxV+cXXzQIbmMy+W4
	 ByXjq1eaHO2rdIqtvGur/gzVhS9qp+I9WD1hfThqYwBrk5alud1wRl7OC8P5tpzmIO
	 2XOOdE+Ee31Y4/2HG/lf+Rts36VWjOXeYwjqXlIpYMIl/OL0Yj/KaphusKw1CAZHnc
	 fFNvkcpKVbPxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21BDFC3279F; Tue, 17 Feb 2026 02:44:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 17 Feb 2026 02:44:32 +0000
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
Message-ID: <bug-221065-215701-UKSYthnR7c@https.bugzilla.kernel.org/>
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

--- Comment #40 from Avraham Hollander (anhollander516@gmail.com) ---
(In reply to Mark Pearson from comment #38)
> > Rong Zhang's choice to CC Mark Pearson proves otherwise.
>=20
> I can't promise anything - I don't have any official levers to pull for t=
his
> platform I'm afraid (it is better to buy Linux supported/certified systems
> ;) )
>=20
> But, having all the details above is very useful and I can ask for help f=
rom
> platforms that aren't officially in the Linux program and sometimes get
> lucky.
>=20
> Last week was very busy for me so I didn't look at this thread properly.
> With it being Chinese New Year this week there's no point me sending off
> emails which will get lost in the holiday swamp.
> Can someone nudge me next week if I don't post a note? I'll get this tick=
et
> forwarded to the Yoga team then and ask for them to look at it.
>=20
> Mark

Don't worry about it, we're patient.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

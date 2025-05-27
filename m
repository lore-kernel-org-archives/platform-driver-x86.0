Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782A1248882
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 May 2025 14:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357072; cv=none; b=FHJEASvtBRpYWjTdlyeiPDe66DlW1C9kG4BUONTdf1CbekbTEHP/Pfqc//ETU/TQKWYT9I0Jh72Jpy54jOeu8Wrlcf4y/UJNtmCfyqKFuymfSTxQb4dr+0WEqmMa61j8inSgeygiGi9g+BDo6YXyL3/namEJoTYI6lyVw2KPcyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357072; c=relaxed/simple;
	bh=PfVt4ancmogGRuCjqgrjv1TohDugZPl+qDMHlidW3Kw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mvNu5HlqvORXhgX4r0+/nhlHL1cnf1QoZxUVy+iGl6/qNCF2XZkh+XbNWK7s3E7ma4IaAOUSjfySv0fzNVrHhgHxdNCS3rcdBDZYx9HXS6qHGcBqEshEczaEl9AIU7vZExS1LNJ9J/kucaMUGZD4L/w1QGsKwlngugDDQRtdKmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2GuVuUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2GuVuUd"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4762C4CEE9
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 May 2025 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748357071;
	bh=PfVt4ancmogGRuCjqgrjv1TohDugZPl+qDMHlidW3Kw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V2GuVuUdeE4DpmvPbRBDJ2ZgMsQiL6IPOp8mw/wRTmyAp703EQlIXQZwZlu4OhIiB
	 ySWwbNdqPBGzdcWV3siz0KHo58syvH/NJ3caWWfO8A3/BZg9S3H6jCklpKybtOM+yd
	 PLzg8JMsWlSbrGxdJoz8DNvosmx7qUeNGL/ljIeAwpk20oopnZW6k+z7CYjQ9cFL0W
	 baUVSssbrhhBunsVPcroCjwBUxevLlOvyhvTg7eSwxi4mCNb6uP1X6kmE6uITLktir
	 XFClii+VBeCsRDnHqk4s19jbI5iQ3jBCDqaHzdOXyvLD20xBtEitYciB6T9PLx3l1n
	 ySzXRKbtaYUaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2C8DC3279F; Tue, 27 May 2025 14:44:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218771] Lenovo Thinkbook - turning off after closing lid or
 (dis)connecting charger
Date: Tue, 27 May 2025 14:44:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pawel.radziszewski@pw.edu.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218771-215701-rwtTXKD9or@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218771-215701@https.bugzilla.kernel.org/>
References: <bug-218771-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218771

--- Comment #11 from PMR (pawel.radziszewski@pw.edu.pl) ---
THX :))

I am not sure: I could not find it in a change log - is this patch an
experimental one or will it be included into the main kernel line?

I usually do not compile a kernel, relying on binary forms from distributio=
ns,
so I will most probably await a bit until it emerges there; one of the
workarounds (removing of the ideapad-laptop module), although cuts some ene=
rgy
management-related functionalities, works for me by now, so the bug ceased =
to
be a critical in my case.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

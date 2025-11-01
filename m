Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C367262A
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762019496; cv=none; b=bzErqcZdTPeeI1afRlQ/4isU1jrTwVF5E57gkLp8XR0ufTDPEF//qgfH3BkKIAOqBznQn1QWAYmlC+1KyBx4dcRx+KAW9z0tngbpZVXV4nnBcoTm/GT+sjespYYXKx02I91zeWaU+ols3g5OanAfMYU3X5V6PMP8aixTM22vPmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762019496; c=relaxed/simple;
	bh=oud3yF9I13CJFFfiMiO/TnnxY1KdOIGDXRzPffXhZH0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WQnfDhnrImCgHnAV/3Chz9OHI40YsL3PIKelbekiZLb//MfCT9DzNFjBohsZu+/Oc+V4aVSwtOXBTJOZlqhB9FS/6bF3Pq4EghyAJkxr0LImHAEDkCNADTYFresJzRXgIOfuOSMGDS9/S43uuV00LUO7dmGXoLiw/1B71F/gV4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAHWjesq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAHWjesq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 688AFC4CEF1
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Nov 2025 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762019495;
	bh=oud3yF9I13CJFFfiMiO/TnnxY1KdOIGDXRzPffXhZH0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WAHWjesqGwBzVUc9viZL+KK/5h4k6YYiWioyON752dg3npmA0m3PouCmG5DSL0Xbf
	 qlNLbNjDjICZ9ZHjSV/m/wqE/6fzwny2RefMpbgTtjdqwKSppxgGklPDqqlCI1va+L
	 QktKWFaBcuhrOfFCiFFPLzSHBFLwn8IzJU+4I4WFC7gSahoc/tkXwh0IYPngSeroW1
	 aXsypzDkMgkrhoIhYJ+tyZSW3uGsQV5smf/2M26Y5K8wANlO9iPWtAp0W7YFiQGm7b
	 jumBOhK6zKDdjIvJ29+FEdd4wcaPxXq72vCuD4BnoyTTIfnjJ8rGSbCMg5S3lRDrhk
	 ENkXXFrEhaLyQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56003C3279F; Sat,  1 Nov 2025 17:51:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219904] pc speaker not working (just pop's/click's) on intel
 chipsets gen 6, 7 and probably more
Date: Sat, 01 Nov 2025 17:51:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tobias.diendorfer@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219904-215701-f2VkVotVNF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219904-215701@https.bugzilla.kernel.org/>
References: <bug-219904-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219904

--- Comment #11 from popy (tobias.diendorfer@gmail.com) ---
thx for the info.
Will keep you updated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

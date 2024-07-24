Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D348917C6A
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jul 2024 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721816826; cv=none; b=bHJyHc+l/sREBWvPNb6smiOlrxyiraqNazCj65rvS9ege6jCgHy15SRxv8gGpWOKyFHakJXYwnj4JvbmI03oP5A8RLh/a9ajv+YBtur34wRBf3AsHQ7oyww0GriBmPXBAmpP5GU9zypX+iz/1vY4PXh1KZS9Bptc42THpDL+WZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721816826; c=relaxed/simple;
	bh=86MAFfW3UolaWjPjKNsivYAH+TFPbA/Tp074sLJtPyk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gHmbrWrIlYbgkrEzuNVaAydJwUjXWIPFIhnkqj0NtyWBo2/Vb7ow26mr5Xmf+USs56AqiPqB5JHWS74yMaExVbiLc+S7g99AJXtVtRtKsZnzMMUdcVrGBQcwxp+N0tYgEJDSQ3jrvQc7aSkNK86PD9+Y9lNqNW/bIXKXHOZdcJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Stm5ROWq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Stm5ROWq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 652CDC4AF11
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jul 2024 10:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721816826;
	bh=86MAFfW3UolaWjPjKNsivYAH+TFPbA/Tp074sLJtPyk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Stm5ROWq9sEdbqXPlbTYqPm5VLXpquUlO8pmoRK9VhcbJF9HHWuoKH7OGrcseoP/5
	 +gPaAD+uy1NQZ1m0ufLVRKnyQSDbwN0pf5VTX9UCb+SHphdUQdowM+xCr5srE10sa/
	 Vc9TQL1FvVc5q+2o7wtZEk5xpXPgPIxmSAqUl67ZS5q1EAxPJYPj3lg8zKO0o53x9I
	 3XU7kwIBkLfBtfkhmof+c8ixGrbFGXmW9ItJcrGSI/aExZRNbE5LHnFXE12ranjCo7
	 5ZI42ctk/GOIjhaYiOLwGGbir4ZEYdwyN0heOEhhfJB80bqfRfnH08wbrfGCckkfU1
	 B/MCEWVm0PmEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52CC8C53B73; Wed, 24 Jul 2024 10:27:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Wed, 24 Jul 2024 10:27:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218901-215701-eXeKw9S1tX@https.bugzilla.kernel.org/>
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

Agathe Boutmy (agathe@boutmy.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #51 from Agathe Boutmy (agathe@boutmy.com) ---
(In reply to Armin Wolf from comment #50)
> You might close this bug report as fixed then.

done, thanks a bunch for the patch :)

I'm having another issue with some thermal stuff not being handled properly=
 now
(it's generating a lot of spam in dmesg) but I don't think this is directly
related as this wasn't happening when testing the module, I'll open a new i=
ssue
when I have the time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

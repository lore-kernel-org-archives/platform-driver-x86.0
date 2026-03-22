Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8F730DED1
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774182197; cv=none; b=VSJXemLEiKMJSXzYjcWliYqA7tJtvqKN4CWTCm128q4jzdYK3fMHt8sucTbUz6WalaNYjXR2qPB9uDrA+DdTFMKiEqXjGw5J1f0FgTFNU3xMFnuJt4Xsanh1rBiJzgs7TFf7mg069My1AVkuflO3X46eH+dkcTKrLlxaMfrOViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774182197; c=relaxed/simple;
	bh=K2aUJpy4ybaP7biGW6Zq8InlDEabpg6/ZYD3Fm4oeNA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qWzi2UFE/Fjr4FYFisIBdeddjRfF8heU6JtanFY+uTCjL5e6TLtDo5AGwWlHQXDngojVKZsk2LTTjWNHVTA+e37C5Twiz5dh+fZc4/GsP42qzLTXtRM6RdzP57kOCHjLmNI4ZWPljXgp8qO1lnKx08XGJZ8LINL4NLVxnEATpYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/p+Cc6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/p+Cc6p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 553A0C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774182197;
	bh=K2aUJpy4ybaP7biGW6Zq8InlDEabpg6/ZYD3Fm4oeNA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C/p+Cc6pM18TnKD8Fkt2xAPA8Jl3ucNzzdWLUFmmZAxIMKsv++nca7YM9um2TTfQY
	 RJns1jlQ/u8dKDxlNSVDFLhmpLr025tCAwsKDX7X8JnFIsq4zNmn1NLvL9nUqQ6LDc
	 lHFSDqV0F4an7otGiz8FcOrn5m/C+dDsCDeUqGsbbq4BkCbqo/q1Fk0mzJ99Dg5zOi
	 /PQi+vSLwukP6kfzYoPbdnA5VKOYMfgnstcaihMkyYyRHHn2H6mx2WGjQ5laq0Eso9
	 02e3y9TnpzznZemjfRI97/OYtiDfEJkOfS9Ixc4AEbYWQuCDnwXw4V3ts2pSJXCuP8
	 30uweX0AhZ83A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5161FC41614; Sun, 22 Mar 2026 12:23:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sun, 22 Mar 2026 12:23:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-d0vruN9oZn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #307964|0                           |1
        is obsolete|                            |

--- Comment #356 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 309727
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309727&action=3Dedit
Asus WMI for nct6775 v6.19 base (2026.03.22)

Updated list of board, such boards could be supported:
"B840M AYW GAMING WIFI",=20
"B840M MAX GAMING AX",=20
"B850 MAX GAMING WIFI W",=20
"B850 MAX GAMING WIFI",=20
"B850M AYW GAMING OC WIFI7 W",
"B850M AYW GAMING WIFI",
"B850M MAX GAMING WIFI",
"EX-B850M-V7",
"EX-B850M-V9",
"PRIME B840-PLUS WIFI",
"PRIME B840M-A WIFI",
"PRIME B840M-A",
"PRIME B840M-K",
"PRIME B850-PLUS WIFI",
"PRIME B850-PLUS",
"PRIME B850M-A WIFI",
"PRIME B850M-A",
"PRIME B850M-K",
"Pro WS B850M-ACE SE",
"Pro WS TRX50-SAGE WIFI",
"Pro WS W880-ACE SE",
"ROG STRIX B850-A GAMING WIFI",
"ROG STRIX B850-A GAMING WIFI7 NEO",
"ROG STRIX B850-E GAMING WIFI",
"ROG STRIX B850-F GAMING WIFI",
"ROG STRIX B850-F GAMING WIFI7 NEO",
"ROG STRIX B850-G GAMING WIFI",
"ROG STRIX B850-I GAMING WIFI",
"ROG STRIX B850-I GAMING WIFI7 W",
"TUF GAMING B850-BTF WIFI W",
"TUF GAMING B850-E WIFI",
"TUF GAMING B850-PLUS WIFI",
"TUF GAMING B850-PRO WIFI7 W NEO",
"TUF GAMING B850M-E WIFI",
"TUF GAMING B850M-PLUS II",
"TUF GAMING B850M-PLUS WIFI",
"TUF GAMING B850M-PLUS WIFI7 W",
"TUF GAMING B850M-PLUS WIFI7",=20
"TUF GAMING B850M-PLUS".

if you have such, please check.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

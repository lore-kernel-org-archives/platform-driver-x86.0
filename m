Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5D2D3727
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 21:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781473694; cv=none; b=RyxT+6podQtUn6bJ0DlkOuRTLcenUtfOkfvPrCufkjAiLNuP4qX7rUaK2I9bJt9tiJvJJvqXSQkyhHGYiw3rhfwNBaC2DPydEV1eB/Lri6U+6ErqyMnCzYo7FVAWKE09gvdAQ6lutT8NqLmq2sgZjiDpqOcG9zovW5TVLidbrGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781473694; c=relaxed/simple;
	bh=xBqvNP0wvjTOivV7InqXHWAlq591LxgSPNu7Zqb9OL0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d+6sFxZYqjUaNonP6iKxhOcVjvpVusaZzQXQz3tPa4936f/c/GVH74GltSsTS/fUM/Ilw/D1CiupMAj3aurc+BzlfgUaz7VshRPeGeYmdvv39r3RhCaOGZh9Dd2HO+KZgfjGPu7ZaxjOY+fwJtfq4UITK2DXlTMr2EUuR/OgmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZ6jx6b7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZ6jx6b7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06190C4AF0D
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781473694;
	bh=xBqvNP0wvjTOivV7InqXHWAlq591LxgSPNu7Zqb9OL0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oZ6jx6b7rwNYx6tWvVDVVufKpS+eOvePN4d+LFO2FpbVQ/bwKwoVSxCxI8cngHJ85
	 lnFrwxK7tMIj2D3zBv2b2T8Rfw9BkmqafMCuNiiciVllFWy4tmZKDendC+v/4XZv+u
	 lXML6jwWmXwz6OC4HYpq7SExwo4jHJptDIrSvlFlpXNLIrFBj/KjUrgBXo8peJhhk3
	 JY8pZ9A9e5DmPKTvhxHNHP/15p3YjFnin89gd/mP16790zmQfYrq7VriD9jiPVPg29
	 UWy63FpoAUeyxfDwRE661nDhwwZH8g9YKphWYXUGKi/1aVS1vHmaNDJFhUIXte7aoS
	 MXtQ8ewd0sDBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D79DAC433E1; Sun, 14 Jun 2026 21:48:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Sun, 14 Jun 2026 21:48:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matan@svgalib.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218901-215701-FQtftff6y9@https.bugzilla.kernel.org/>
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

--- Comment #101 from Matan Ziv-Av (matan@svgalib.org) ---
I am afraid that this document needs some updates.

First - for newer models (from 2019, I believe) reader_mode sysfs node only
controls the reader mode led. The testers should be aware of this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

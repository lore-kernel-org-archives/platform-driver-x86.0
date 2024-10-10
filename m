Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01D219F3
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Oct 2024 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728528344; cv=none; b=qVmR+X+uJ0G4LU8rdqStzGxPk17r+N8RvYwuICmkkiVD18d2ZOGSnqePc0M8xfu9h5aRSz5dk8qRouz9OIyj6upqP7eUWWiXEmDWcmfrrPvKrXDgqaaQLmyvYYnfmMWpc+Arbt0z6Ugz1vTXd6z5rBZU3MpY6QOKjQ30V7BD9y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728528344; c=relaxed/simple;
	bh=z8F8LWGczu4rpicsWzVZ53S+4ucn5+Lg76d3bOZoGQs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k0Z29YBMV3l/Q9lbV8JwP4KHUv6pH1DmhAkDurxuuQCbcCtVC7uX7od9YYR9xVq45PqKwIDGheXKzitLSnK0UU9mhU17VVmQyktEthWe8mpk5F4UxP5YF32fBTukorBkghRmiHXJKx1OlLn3pTeIilH3BzX+1yIH+PVi2tHE0CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnYyQ0rM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnYyQ0rM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC9ABC4CEC3
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Oct 2024 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728528344;
	bh=z8F8LWGczu4rpicsWzVZ53S+4ucn5+Lg76d3bOZoGQs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UnYyQ0rMK3g1kEidYIpkDqITh4bomWl9mmH5vBLDHLygWWxD0cGdE1L/+2OZzL3A4
	 zG1cB37Zbm+kxun9+PME9pgblhHkROlNE0ClAwy3C385RG3KIFKCEF+io9WAbwx+Ty
	 oR3kLtNSThy1c6BB39wfDuJDzmkLt1K6+KrSwGNqGipb34oIpE/GQ2lo4RGNOEoN1N
	 kN9meieAOEIc1O153SjiYHE58MTkgrLgR7TkN7U2bckyf2cVxj8tnXl7glYYUPOERJ
	 TM6ulBFYbub9l/scSlJkY+RZMNCRUtZ9lrD3kgGzJfHTriZIny7HMEQYjYfBcvOKLS
	 9m2eZo3Ns3U5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D8FAEC53BC5; Thu, 10 Oct 2024 02:45:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Thu, 10 Oct 2024 02:45:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218696-215701-LVGfH84AlT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218696-215701@https.bugzilla.kernel.org/>
References: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

Lucas M=C3=BClling (lmulling@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #17 from Lucas M=C3=BClling (lmulling@proton.me) ---
Hi Mark,

Just to update this, I've updated the EC to version R1YHT44W. Been testing =
for
a few days now and could not reproduce de problem anymore, there's still the
weird frequency scaling thing but this is probably unrelated to any firmwar=
e.

Thanks again!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

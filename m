Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0518460
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734009769; cv=none; b=avlyq2z0wr8BdYn1nA7jsVJ+ubgyEQc+LQIECIjie/MQH1rt0MkeE78tma+XHwntSBwMC6q8IcXLaSaLguV35L8UDLNdip6AGrcp67JxtdyMeJdigzDWUjrNWY2sK7xZO8ayMTALfAyOMV4g0YpWvhsWaar76C57yxolYh5UdQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734009769; c=relaxed/simple;
	bh=9nNsRQYtO7kn+qapuY0LRdKcf1EZWRijjdqm3I5ohq0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uXqLdTkWf5jf0N90WGWm9RiOhwF9VInqc/oQeo/H/hBelx7ihVLxw07ZpP4dfd6W8XvAYRAara6X/K3fFYcuADXpk0qSlpS1/jtgpJktVtmz1VSlS51OszrZeWt9OGFtUFXtJITpe/zpnvqQcfFjauyRjCXOrjRUVDnkXi/dic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWGPCyhz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWGPCyhz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C99AFC4CECE
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Dec 2024 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734009768;
	bh=9nNsRQYtO7kn+qapuY0LRdKcf1EZWRijjdqm3I5ohq0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MWGPCyhz0lhpeNL9clIa1sYMvTikhMKoa9nV0nOBdCe3tAdGLRtxKHXA4OkjQr6Cs
	 gvgRjWjqfYO0NRy+y5NJb1To/L0Mwl0raTJ8ejppPUoJrZAjoLeiP4ITqRgLGRT9+D
	 iFP3fXhV7TzGnf2DOvDhfPjM7EMH8Eeskr5QPOY6Prmrk96eMMNo+Zct9y0Ri4QDQb
	 95FuR9ZaYsCEVrDhW4/7AKtJweRRTuc+8lbSxyV0mgsE+UUW+E5JZsFGIbxl6kenET
	 Z4RoZZl7zWKuMecZe/Zw/wSiH41+q5al5a2DOKs25iCvFKcUEHV8UDAHJJit1/lYLX
	 Y7c51NCjjc11g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BDE1DC4160E; Thu, 12 Dec 2024 13:22:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Thu, 12 Dec 2024 13:22:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefanb@linux.ibm.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-SradgjwlaR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #23 from Stefan Berger (stefanb@linux.ibm.com) ---
I suppose the binary and ascii dumps of the log are still as before.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

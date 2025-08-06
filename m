Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89211F9EC0
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754471238; cv=none; b=r/ELuyFbfepzysL1CCb+crcex3S0goF0SAMzXWoczFNnYmv04URc+XdSJMFiLis8jqARZsL9yWHn+KfEZYBA6ID/k1OOnvDHwk38gkZBmTeMuBRnY2Zl45+v5qRD1iAZbbowfGg4ZtWlFAPExVsDsvL7uSWqJdJlb2r+esIWu9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754471238; c=relaxed/simple;
	bh=SVq08Z0bRFlPE9yFfsgS/Pa3LvW0XdEF0VqZhnUtn0s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBlqdMAYaYGQRRtCR+svWNWAB+m3ZnBmUW3UYRB5pYTxy8/hvRyJCf8Klc3eWEJ26CbuiFiz7YrNf7eKI0XKkVUyJQp9CI0uBHZhafLLlc+4BsYYtfx0c+sldUAcG7FZt4+tOOHOqvbS7hq1jV13TQelmlBTesiRB9VUjNVjrCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4VMNOW/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4VMNOW/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 287E3C4CEF9
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754471238;
	bh=SVq08Z0bRFlPE9yFfsgS/Pa3LvW0XdEF0VqZhnUtn0s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m4VMNOW/v6/wjfc5G+Lq1GtW9l45D5Tj/qXYlv571+oInG23EelCXbQHlIF59oc0b
	 2S1ZN5tXez8H01D/nUutngM/ho/aIZ0hW7RbQY2YG4OekzCjv4ZE2AQ4rMEqK364s7
	 Y+YaQIrocMfnvTcPe4wiHrBVHKUxiUmwW1Arh3OjH37DvRfqUqiw/JGM+hOYdtRwJS
	 WZmc1VVv7AOMtBzIM3s8pTFgUxtwf/iMuSmEIDjfrBkfYf7EekMQVjoRqEXlLnLGmD
	 wJ2xsj9ixZp1lLjq7O1GXUP76Uh2z57/NM4HvYR4wjA1V3gyrb0GLn4zxDGEQjTRmF
	 DzagBxEie8ysg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1AC0AC41616; Wed,  6 Aug 2025 09:07:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220421] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU
 telem endpoint -6
Date: Wed, 06 Aug 2025 09:07:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mapengyu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220421-215701-pkd7K7FrZw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220421-215701@https.bugzilla.kernel.org/>
References: <bug-220421-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220421

--- Comment #2 from Pengyu Ma (mapengyu@gmail.com) ---
# ls /sys/kernel/debug/pmc_core/
lpm_latch_mode  package_cstate_show             substate_requirements
ltr_ignore      pch_ip_power_gating_status      substate_residencies
ltr_restore     slp_s0_residency_usec           substate_status_registers
ltr_show        substate_live_status_registers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

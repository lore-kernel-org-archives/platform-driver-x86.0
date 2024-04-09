Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C81050A62
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712673059; cv=none; b=thsiuwyj2c6Ck2intc2co0i3UoaGY5srZehEC9gZrWaI835a1S1FavCQSGZt5zLjrjJKZhuXiXZxsvOI2iKRwEvjusSwQCcdMWloR2xnNytLAqlJd19VW7297WoDbwgL+dZQpD9FDYRpIdP4nAZpp9TEg4LUpy9R1659lxBuJVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712673059; c=relaxed/simple;
	bh=NHVdSlq6P1IEAHq1YRW2CDNwC6uS9IrLMTOiNwhrcfQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P11EWr7Wnu0nJRNESqxqfwhF2CvIun+x4Q4YcqVqIOfurLyDfKOcFhddmhSsKB54YXClTpsGWJuQk6QmRKRvv5eq3mH7DoEWq5RMZpdxyIhyZ3Of2EulycCSLc1INDgQDw+t/MSA4yua4jvkyimRFGF4TFfHVpSzUmHf9RamTzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1NvJVMG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1NvJVMG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35AFAC433C7
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Apr 2024 14:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712673059;
	bh=NHVdSlq6P1IEAHq1YRW2CDNwC6uS9IrLMTOiNwhrcfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H1NvJVMGgrVsDDGDluSbgeAkx/zKeUHjrp5CWGnM+g51bE3vxzQiL/lTFZ4m5jsWJ
	 nYJddxS0DR2xkVJK3TzF4Hq7EE1dJ+Vo8T/pAlDylG00zpbnAUEQamjWUvIvBhLF/g
	 iY0bqj7E/bGJXQ/6aci6lOW1ILErFxVzwqYIJbukz8VJ+HoRXULUVnciUmuDjqVojX
	 HzUn8VsmEHwR4HIUwLKktCJVFCzQK7hq8sclJNTykCYwXMgus/nh4OhLLi8f7qKEd8
	 4MCagfG8lqIQ30LCjQULR6fttlyCrfKUSYBvVcpFTyDl6Ni2kJlbWMO/e1+5B/M4Q6
	 D5jGtGyjbgkLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 212C3C4332E; Tue,  9 Apr 2024 14:30:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] DYTC frequency scaling deterioration and event spam
Date: Tue, 09 Apr 2024 14:30:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218696-215701-xKBD64573G@https.bugzilla.kernel.org/>
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

--- Comment #4 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Thanks! (for my reference - L14 G3 AMD)

I've created internal ticket LO-2964 and we'll see if we can reproduce and =
get
insight from the FW team as to what is happening.

If you have some of the ACPI events recorded (I assume you're running
acpi_listen?) that might be useful - just so we can show the FW team what
events are being sent. Hopefully we can reproduce the issue in the lab thou=
gh.

Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

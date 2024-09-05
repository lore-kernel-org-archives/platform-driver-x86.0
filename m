Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59C19415D
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Sep 2024 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538378; cv=none; b=bcmloxt7FUSHAJpDYZtBeqE6lA/Pg0Z1qRmwPWvsdfLOg8WklWkfXLX5tg2eX24LhMZzYl5eWRWIhBG1m0kVku1bCBGA6d/KL41ZGSaO0U6vWZj6TF5kc415xbGcIU/zT/7ZyVPRH1FMJLLFpANz41xLU0TQLnGz0Vdhyf16Hps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538378; c=relaxed/simple;
	bh=dxp+lX/5Gs+sdPo0G/VcENHvCB9BFOQy19FnDug0YyM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gLrgzPrlFap5O/Jv9UnbPxqIcsFY/Ss/8/Fms2O3gmSpTAy58918oGbHEwbmi6nCFBvWut/wWAsHvU/e20zTuyOjxmd364SmFfixiIbbJdIhFDR12ALlRicx1dvXZh2GndT83U+aZGpU+iW9pYyiv4pGchL7LyY0DA7xosN1Qdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADjHtET5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADjHtET5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CEEBC4CECC
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Sep 2024 12:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725538378;
	bh=dxp+lX/5Gs+sdPo0G/VcENHvCB9BFOQy19FnDug0YyM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ADjHtET5fbH5rmv2uYi3+S+evhZscjsqI2Znd+JBH69ZrxiZ57QJ6PkDT8DBsyqWp
	 E8LOGaNwctD9JKDMqMiRuAcuSL463r1LabV5HP+yd6ccAlE+jo+VUaCe72CxC0UevF
	 Gjg22lPvxu4yPVkmVFbzvvzDpnIBMAnwj0ZIh1/xmuWfWFI9uIzLfhmADwg9TERLIr
	 u0WYLe75WT7htG05RyJ8AyNtkmokC/4U9pjy4H4ai7uhra0cSz4Y1ORLCshgG0yuKY
	 P7jMNE1mCxpkWDPwdNCvC1wqphBE5TiWOUneXQAc+xXR88+zPcsz3CbZhZwUpT9C/0
	 1uir7fSOzSEDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7625CC53BC7; Thu,  5 Sep 2024 12:12:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 38082] Fan sensor/controls not working in Thinkpad Edge E220s
Date: Thu, 05 Sep 2024 12:12:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Fan
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: acpi_power-fan@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-38082-215701-A3gcnwXmFb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-38082-215701@https.bugzilla.kernel.org/>
References: <bug-38082-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D38082

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |Power-Fan
           Assignee|drivers_platform_x86@kernel |acpi_power-fan@kernel-bugs.
                   |-bugs.osdl.org              |osdl.org
            Product|Drivers                     |ACPI

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

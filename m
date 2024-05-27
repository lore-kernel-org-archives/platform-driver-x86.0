Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3441E4BF
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 16:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716828484; cv=none; b=nls8v8OagengClOMhwsDTx5QLivEAsOE1Mbs/+EXw3owWcCH63/qQ/i1I7Fwp+5b2pgbqnws6F75pQoxiWsephaOyJouD+BmQfypX1YQHbZl8CzhBrEdsYX/o8gC3uSCGQAEU4D8YCAAYXuvHqUSuw30cGYbzgnvqNh+OfnWj8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716828484; c=relaxed/simple;
	bh=q9VngkeJi4+BVVjEnb+zkwN8oWelf9BbrzaytXMAMoU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=V7kVYng1tmoWy8TjcT64luo4TbrbdxL6KCA7H2yvBuWQ2d9ks2GaUJmbfKzEUR3nOKrHROD1GmBYPgkGwWtqJ/uio2MIjx05IRLmfKvfGcfrZONWiHIzKNR6HnyBgPDEg9YPpUAqiIEI7j2N0nLvgQKXqWXClH7afQdjrYzTKJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILZb6xgi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILZb6xgi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B756DC2BBFC
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716828482;
	bh=q9VngkeJi4+BVVjEnb+zkwN8oWelf9BbrzaytXMAMoU=;
	h=From:To:Subject:Date:From;
	b=ILZb6xgiRFLHHVLUdIEcjDk/VhMPyuhtJnFq8ebLsh7SDqTpLyHTzipOiUwZnrrEH
	 uCpsNyKDZ7TUZOXxhT8WKMRNQK/jkHdrhLYfcJQyyZAHqBDHWsdWvNptk9WEmXA0Bg
	 b8oMFmCBdB9AOPzwMtQ3lixVoMPcv+UJiwxtX2k6jVZykFOx9jncwQ8Nsl+k/fX8Xn
	 x4D5K5cHsL0JhTcn3q3XHs0UNZhTuWxiTqQ6h8HPRT66xFi6jBsSLX8hG39toxZSPb
	 mb2Aa/mZPOZl6rK3dZSZTAaEbV/GtdDIcVJxPqRR+p2jzPyfLb3YFOzE5vuCV17Xa7
	 Fq8sJj26fbU+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A430CC53B73; Mon, 27 May 2024 16:48:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218901] New: LG Gram Laptop Extra Features not working on 2024
 models (16Z90S)
Date: Mon, 27 May 2024 16:48:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: agathe@boutmy.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-218901-215701@https.bugzilla.kernel.org/>
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

            Bug ID: 218901
           Summary: LG Gram Laptop Extra Features not working on 2024
                    models (16Z90S)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.9,6.9.2,6.10-rc1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: agathe@boutmy.com
        Regression: No

On a 2024 LG Gram laptop, while the year is correctly identified by lg-lapt=
op:
`[   12.865584] [    T528] lg_laptop: product: 16Z90S-G.AD7BF  year: 2022
`
some functionnalities such as battery charge limit and reader mode do not w=
ork.
The only error I have found so far is in dmesg: ```[   26.841164] [    T837]
lg_laptop: Cannot get handle
[   26.865830] [   T1167] lg_laptop: Cannot get handle
```
it seems to be related to ACPI as this is what is returned here:
https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lg-lapto=
p.c#L106
(among other emplacements in the code)

Trying to read the value in
`/sys/devices/platform/lg-laptop/battery_care_limit` or
`/sys/class/power_supply/BAT0/charge_control_end_threshold` results in a `c=
at:
/sys/class/power_supply/BAT0/charge_control_end_threshold: Input/output err=
or
` in both cases and trying to write 80 or 100 returns the same error.
this also happens for `reader_mode`, `fan_mode`, `usb_charge` and `fn_lock`.
I have not tried the other variables but the keyboard lightning does not se=
em
to be impacted by this.

I have tried on both new installations of Manjaro and Fedora as well as Fed=
ora
Rawhide and Manjaro with a 6.9.2 kernel and 6.10-rc1 kernel freshly compile=
d.

A colleague has the 2023 version of the laptop and the issue is not present=
 on
kernel 6.9.1.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

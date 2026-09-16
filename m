Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A474E8DEA
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555315; cv=none; b=oYdY4cBQOF8Zdyr/Y8rPb/UMBTHRipadgmwHTjWMSgeHAp4J6TBliZ24gca+rwYLk8wIvPmJuRTci+fey4GlA2sDBBsjLDu0MeTVFKWts/xIrleEQbanq0uQFL+9rara+Wc1K0/XcQECwms9vhMBwVmvqfKh5J91U0pVtB5ouvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555315; c=relaxed/simple;
	bh=O4G0pKHDgHF+q98o/6z0OvPGkeobf8NXAxpcNAjEA+Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IZtxu2/vhbXIDFcBwl1IGhe8C/ItqYy0YAoCxzCfYVFUiFc8eCBOIMVppfGy+ROZrXgd0lJK7EDh/rfU4PCSTVFuQaT4mYFEbwfAdkDTMZjsV4ZMpvzJQZnQTexj1FzxwDdnM23+4JkM+bfNw+SorpIRRDdonlpo8YVkCs/ZgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTy4axzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTy4axzA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91584C2BCB9
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789555313;
	bh=O4G0pKHDgHF+q98o/6z0OvPGkeobf8NXAxpcNAjEA+Q=;
	h=From:To:Subject:Date:From;
	b=tTy4axzAgBmacHUk1YafkFmx+DDMWsz/YTzPgOP34zkHMwZ7GHMDRFtbX1YZTzmyt
	 O9XfR4BXoFCIV2cC6Y2RABNneDtOhd2CD+1HC6ALJWXPJuplpua9GMJuCoTKBQ+mTY
	 KE+CCqPykMYKkI87wLgzhk194ZnCmhFa/3orLuP5CH/DzDYouj3GSar/Jag/ghTxAd
	 yavvl1u8Aj4jMtw4CNkh4Y1xgo5NQqDfXDKU5kAWgYh8jsCoBZmhBHmrAytAQ/51RA
	 yiEO1IO97AAZA0ns6hVFnkukYXCzt/u/MqiRBNsbpxHD0yFmUnHcopNvmaYoDm99Hb
	 INM17pUS7FrPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7A852C3279F; Wed, 16 Sep 2026 10:41:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjIwMTldIE5ldzogYWNlci13bWk6IG5vIGRldmljZSBt?=
 =?UTF-8?B?YXRjaGluZyBmb3IgQWNlciBBc3BpcmUgQTcxNS03OUcg4oCUIEVDIGF1dG9t?=
 =?UTF-8?B?YXRpYyBmYW4gY29udHJvbCBpbmFjdGl2ZSBvbiBib290?=
Date: Wed, 16 Sep 2026 10:41:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: muhammedanaspaika@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-222019-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222019

            Bug ID: 222019
           Summary: acer-wmi: no device matching for Acer Aspire A715-79G
                    =E2=80=94 EC automatic fan control inactive on boot
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: muhammedanaspaika@gmail.com
        Regression: No

Summary:
The Acer Aspire A715-79G (BIOS 1.07.01TACI, ITE 8222 EC) exposes WMI GUIDs
ABBC0F6B / ABBC0F6C / ABBC0F6D, but acer-wmi carries no matching modalias, =
so
it never binds. With no driver claiming the GUIDs, the EC keeps its default
quiet thermal profile and fans stay OFF at idle (60-75 C). The fan starts o=
nly
after pressing Fn+1 (Cooler Boost) or writing to the EC profile via the ACPI
SCMD method.

Reproduction:
1. Cold boot kernel 7.1.13 or 7.2.5 (Fedora 44).
2. Observe: fans off, CPU ~60-75 C, no fan in sensors, no acer-wmi loaded.

Evidence:
- modinfo acer_wmi aliases:
  676AA15E-6A47-4D9F-A2CC-1E6D18D14026
  6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3
  67C3371D-95A3-4C37-BB61-DD47B491DAAB
- Platform GUIDs (present, unbound):
  ABBC0F6B-8EA1-11D1-00A0-C90629100000
  ABBC0F6C-8EA1-11D1-00A0-C90629100000
  ABBC0F6D-8EA1-11D1-00A0-C90629100000

Workaround (verified working):
Loader applies SCMD(0x69, BIT(2-1)) =3D balanced profile at boot. Fans then=
 run
~1300 RPM idle and ramp under load; automatic on every boot.

Requested:
- Add ABBC0F6B / ABBC0F6C / ABBC0F6D to acer-wmi device table.
- Issue the EC fan-profile SCMD at boot or expose platform_profile so the f=
an
curve is activated on stock kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

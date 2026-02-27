Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4981F92E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189724; cv=none; b=S5nx6bQUs+aiLU3tVM6IvemVS2j3+pPD0Stg4NXRAaCL8swYG38Z6E/UCUdV7kE0ZNO6J8xLV4oi7CokOsQ0I+xj6krbxya1jsc1ndvhMDroRhyeiVg6UJvnU/IQoX9Af0liEXfh9uswUtEfAMpEPbQI53ovrHZcO7o4NKAfR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189724; c=relaxed/simple;
	bh=G2d7WkgFLR3wLHVQmGSP2TkyLqhoI7+Trf0B39uAF5g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNK++WpdSl1FUqLMFQR+NS6xItmJ8bl/IL8x/a5tdfy+yLiXB8GFRwfQR0fQ7nmAzgvFExg9D+didS3/c+S1iX1O9nuQJbBGb5OrOkhxOwI6yuZAEPTyeYdGDW5n0XVYbroyXqCefAIIu5Cmy7TRzBegEcdXiHE67cs85M/oqeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ot+pUPJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot+pUPJO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC996C116C6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 10:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772189723;
	bh=G2d7WkgFLR3wLHVQmGSP2TkyLqhoI7+Trf0B39uAF5g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ot+pUPJOBbNtVPXQnRTF9VLEhXjNBHFrhjCsD1sThmb8Db6UdnwD+1j2es61DGoSx
	 Yby2py/qX10O7oJYDzjQV2wstF0mpj5XDP8FF1T8lldBRLfzfuzn1w585D0v4Tw61P
	 v8GskebMMdRhg2EuTMzJJBkKnmDzWza2LDrgFoQNob2arBgYAjwE6MF2C6lGzN+EbJ
	 gbI1fV/NIyBbCmSOipkgjBxhkECrQ0dOaIyasLDT1bxNxcxfyZaII4BxTLvRVSRTVn
	 YY9kYWQnrBXHqJ54vO4WTj+FlbH5TEBWCva/z+N83ylRTWXdsu/ER+QLdSMEiPoYO2
	 KcrD8bMQR6xdQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A39D5C3279F; Fri, 27 Feb 2026 10:55:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221149] hp-wmi: Fan control fails and RPM always reads as zero
 on HP OMEN 16-wf1xxx (Board 8C76)
Date: Fri, 27 Feb 2026 10:55:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221149-215701-vBszDfVJjD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221149-215701@https.bugzilla.kernel.org/>
References: <bug-221149-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221149

Krishna Chomal (krishna.chomal108@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krishna.chomal108@gmail.com

--- Comment #1 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi,

Based on the OGH log file from Windows, it is clear that your laptop uses t=
he
newer Victus S style WMI interface.

Can you please test the following patch on the pdx86 tree?


diff --git a/drivers/platform/x86/hp/hp-wmi.c
b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..aeed12f8a3d4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -185,6 +185,10 @@ static const struct dmi_system_id
victus_s_thermal_profile_boards[] __initconst
                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
                .driver_data =3D (void *)&victus_s_thermal_params,
        },
+       {
+               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
+               .driver_data =3D (void *)&omen_v1_thermal_params,
+       },
        {
                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
                .driver_data =3D (void *)&omen_v1_thermal_params,


After loading the patched driver, please verify the following:

1. Check dmesg for successful registration message:
   "hp_wmi: Registered as platform profile handler"

2. Verify that fan RPM is readable and controllable via sysfs.

3. Verify that on changing platform profile, and it does physically change =
the
amount of power drawn in the CPU/GPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

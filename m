Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E43C2EB5AF
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 17:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211984; cv=none; b=Nvwb6E3Mj6TADBL80Uo0U3HW1kgezeUybcmixk7Qvt/9AFLIdbWmgwCo3TYkmmP7ahEaeDjVr5SAggrcu9L8jqqV4ukhKAQnMQlhV5m9DaCgQYAelvcsgFLZm+jUQGN83feN5vLmAnnbpELBTBFUW4LxWz7GD+FHki4Psy6KM8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211984; c=relaxed/simple;
	bh=cwcx35gQosYkkPk9w9kUGTfQm9ojhon0uiue+8X9X/U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZI1q2oHPI6+N1Ji/k9H7PAm5UYYCc4AhB9N6iKHjCdjvIVQ7XjpBrwht4laNPm53lAgHDPqBeMHBz3cVk40vG8SXav/j4Xp1uMcQJ6vf8LDWH3vTG6R1g9p7IlV54RitiMP64Xg8n6TIEMXetu6b2Zr+swtChV3eQGdpx/VUJ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFmUJsOl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFmUJsOl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38C57C19423
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Feb 2026 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772211984;
	bh=cwcx35gQosYkkPk9w9kUGTfQm9ojhon0uiue+8X9X/U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DFmUJsOlKyOthpL/8oCna3auo5YiQ52ioWNDF5Htb3D2dCXUW1agfGDuCH5K/ahwW
	 iVm0j1y1/GURXPzIrx1nYNR5EjVlS4hNLOqWO8ZkWsDTXaUcKEHQJJdWMHrQc21vo7
	 vhfL+XLSGsYNdrNUISFuA7klADxcy3Aj1BuIDHMW0y56+DXEap/QM699wrIkdLLzB/
	 d/E//dm+QgNyvetoHKupYMnClZ8n2oOBcGenTzrFoxbq41Lfr9beIOEIPlx9DRUcCM
	 NGabueqKT/DrVO2a/e4uidPD6ZDzk9GKOjan+xs1JhMNhOdYgVuj0IyuZUtHp5LsKq
	 KBTkrrqi+Nutw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2A918C433E1; Fri, 27 Feb 2026 17:06:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjExNTBdIFtCVUddIGhwLXdtaTogT01FTiAxNi1rMHh4?=
 =?UTF-8?B?eCAoYm9hcmQgOEE0RCkg4oCTIHZlcmlmaWNhdGlvbiBvZiBwbGF0Zm9ybV9w?=
 =?UTF-8?B?cm9maWxlIGFuZCBFQyByZWdpc3RlciBiZWhhdmlvcg==?=
Date: Fri, 27 Feb 2026 17:06:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: krishna.chomal108@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221150-215701-8EYwxXukEh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221150-215701@https.bugzilla.kernel.org/>
References: <bug-221150-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221150

Krishna Chomal (krishna.chomal108@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |krishna.chomal108@gmail.com

--- Comment #4 from Krishna Chomal (krishna.chomal108@gmail.com) ---
Hi,

Your board, 8A4D is not currently present in any whitelist in the hp-wmi
driver. As a result, it defaults to legacy Omen WMI interface to register t=
he
platform-profile.

From your Omen Gaming Hub logs and EC dump, it is evident that your board
requires the newer Victus S style WMI queries for platform-profile switching
(and fan related activities), instead of the legacy queries.

Can you please apply the below patch and test the following:
1. Check dmesg for successful registration message:
   "hp_wmi: Registered as platform profile handler"

2. Verify that fan RPM is readable and controllable via sysfs
(/sys/devices/platform/hp-wmi/hwmon/*).

3. Verify that on changing platform profile, and it does physically change =
the
amount of power drawn in the CPU/GPU.



diff --git a/drivers/platform/x86/hp/hp-wmi.c
b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..756b94ac4a35 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -120,6 +120,13 @@ static const struct thermal_profile_params
omen_v1_thermal_params =3D {
        .ec_tp_offset   =3D HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
 };

+static const struct thermal_profile_params omen_hybrid_thermal_params =3D {
+       .performance    =3D HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
+       .balanced       =3D HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+       .low_power      =3D HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+       .ec_tp_offset   =3D HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 /*
  * A generic pointer for the currently-active board's thermal profile
  * parameters.
@@ -173,6 +180,10 @@ static const char * const victus_thermal_profile_board=
s[]
=3D {

 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const struct dmi_system_id victus_s_thermal_profile_boards[]
__initconst =3D {
+       {
+               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
+               .driver_data =3D (void *)&omen_hybrid_thermal_params,
+       },
        {
                .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
                .driver_data =3D (void *)&victus_s_thermal_params,

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

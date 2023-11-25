Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAC1F9FE
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 12:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIPO2tW4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DC2BC433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700916886;
	bh=DU6Pw9dwX8W2ECC4dqx4WHNsbfeQ1+Jz19aim5docUc=;
	h=From:To:Subject:Date:From;
	b=CIPO2tW4b/e5zMXsuqWQSNggHoaW3TgTomOQLajHVv+BObrBfGfkInA/T31BsDmJo
	 8l5moAt924FQgcUl1TRqRjHkwwZyBa9nK+WXLBAmyAPbtRoxOC/L+cM073/DChvKVh
	 K6nLZ34Gir2v0GX+o6L8dlVmt+EJ1qzfnBxoL7KpTT+pZ/zNgDwPmVq/mJmlNq3Z+T
	 F+kAizUnEiHCm2sQRP+NjO7hjeZXuaWen4FjT3t6KvvQhClotXplcd6vUEHAkMnUHW
	 dsFU/0RPsHIoZntIkvO65QW8zKPhDIEUTiZ/nmo6z6Kq2MZiLH3TM74f37frUmsTtq
	 VGXmdPfSharbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E5E6EC4332E; Sat, 25 Nov 2023 12:54:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] New: hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 12:54:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218188-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218188

            Bug ID: 218188
           Summary: hp_wmi_sensors: probe of
                    8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error
                    -61
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: alexbelm48@gmail.com
        Regression: No

Created attachment 305470
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305470&action=3Dedit
ACPI dump & disassembly + BMOF and MOF files from the ck2000nf (8BAD) board

I've installed ArchLinux on my HP Omen 17 ck2000nf laptop, and I've noticed
that the hp_wmi_sensors module isn't loaded automatically by the kernel.

Modprobing manually, the hp-wmi-sensors module fails to load with a -61
(ENODATA) error:
[  350.834728] hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A
failed with error -61

Peeking at the MOF files after dumping them with bmf2mof, the WMI
HPBIOS_BIOSNumericSensor object is defined as expected:

#pragma namespace("\\\\.\\root\\HP\\InstrumentedBIOS")=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
#pragma classflags("forceupdate")=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[WMI, Dynamic, Provider("Provider_BIOSInterface"), Description("Class Sensor
Data"), GUID("{8F1F6435-9F42-42c8-BADC-0E9424F20C9A}")]
class HPBIOS_BIOSNumericSensor : HP_BIOSNumericSensor {=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  [key, read] string InstanceName;=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
  [read] boolean Active;=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  [WmiDataId(7), read] string PossibleStates[3];=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
};

The only thing that's odd is that there's a lowercase 'c' in the GUID strin=
g,
but *maybe* it's just an issue with the bmf2mof tool. Could it be the sourc=
e of
the problem?

I run linux-next kernel 6.7.0-rc2-next-20231124-00403-g4bdf9e948c23, as I h=
ave
modified hp-wmi to add my board (8BAD) to the list of supported
omen_thermal_profile_boards, so that my CPU isn't power limited by my embed=
ded
controller.

The issue is also observable with mainline 6.6.2-arch1-1.

I'm also dropping in my full set of raw/dumped MOF and ACPI files in the
attachment, if that can help troubleshoot the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3111257844
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 09:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775984732; cv=none; b=dunk2LWZkdsi/9HQVuZe4hIzjDxD7KIdGqrCf+SrIuthuyWqeRyube3KtfWea47nGqsDLPwqOHsCmelG5NPZiKUm5cv2PW6MYMQUZQxW7ELQSkHyALd1F7y4Vl8DKc16iZMnnhVU0EkHDYqAUOA+IHW30XdcLfLisDQAj1gzsec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775984732; c=relaxed/simple;
	bh=M5AFdESz+ehu46jlR0u44s+7eqynE4DDNCg4s7mfw+g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FebAM+hbNY1REIsBLeoAsNk5McY66xosS1nnyF3+uo+S4k2abgwb0fFHAKVWMcLCZEz1/pgf+WVzmoQITqAqFgVfSxrFrKHHP97g8TKW8qlhwCFJhgg7MEjluf1FeFdzUmJ0SqWj8GPAgrXuFPmK3cXxpY238C2XhjUMoDSSkDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTmPkRmb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTmPkRmb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F3D7C19424
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775984732;
	bh=M5AFdESz+ehu46jlR0u44s+7eqynE4DDNCg4s7mfw+g=;
	h=From:To:Subject:Date:From;
	b=YTmPkRmbcTzhDdh0lnVCB2t4JPJZk5S+h0ZomoLPZhDcGAgaoaUJL95P4oidyuWSb
	 xNQTark2GqC4mZ73DWLfoKYEOqglEfoMfrUnN6bgmCbGeGXD626xC9NjJ9yASFdbmk
	 A6zlX7kEeD093xQFaV2nYW9BH7Jk176GzOSh5JK527WJ3mi3bq96E6wspWQ5ZHm1+A
	 aBJJisXFCmyTA1e6o7+gRTvwBJfuJFcFpB0rscI2rjA8mOcmzL6Zh5aexhd/chys+y
	 Odp0xzJ3a3aJOj+1IF/XduM9BPjjOWKY2+7WElfSuZdh9E6LRHXPVqUq3IoTib0jRx
	 2qEWPW+NoZUTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 674DDC433E1; Sun, 12 Apr 2026 09:05:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221353] New: ideapad_acpi: fan_mode values 1/2/4 all trigger
 dust cleaning mode
Date: Sun, 12 Apr 2026 09:05:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: basak.sb2006@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221353-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221353

            Bug ID: 221353
           Summary: ideapad_acpi: fan_mode values 1/2/4 all trigger dust
                    cleaning mode
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: basak.sb2006@gmail.com
        Regression: No

# Hardware

## DMI

- system-manufacturer: `LENOVO`
- system-version: `IdeaPad 3 15ALC6 Ub`
- system-product-name: `82KU`
- bios-version: `GLCN46WW`

## Kernel

- `uname -a`: `Linux ideapad 6.19.11-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 02=
 Apr
2026 23:33:01 +0000 x86_64 GNU/Linux`


# Description

According to
[Documentation/ABI/testing/sysfs-platform-ideapad-laptop](https://github.co=
m/torvalds/linux/blob/f5459048c38a00fc583658d6dcd0f894aff6df8f/Documentatio=
n/ABI/testing/sysfs-platform-ideapad-laptop),

fan_mode supports:
0 =3D Super Silent
1 =3D Standard
2 =3D Dust Cleaning
4 =3D Efficient Thermal Dissipation

However, on this device:
- Writing 1, 2, or 4 all produce identical behavior.
- Fan enters a pulsing high-speed mode where it ramps up to max speed and t=
hen
ramps down to 0 RPM about 10 times. Consistent with "dust cleaning" mode.
- Only value 0 behaves differently. It changes it to the default/"Super Sil=
ent"
mode.

Here is the observation table:
| Input | Transition (read immediately afterwards)              | Finish (r=
ead
after 1 min or so)|
|-------|-------------------------------------------------------|----------=
----------------------|
| 0     | immediately 133, minimal fan activity                 | 133=20=20=
=20=20=20=20=20=20=20=20
                 |
| 1     | 3, enters "dust cleaning" mode                        | 5=20=20=
=20=20=20=20=20=20=20=20=20=20
                 |
| 2     | 3                                                     | 5=20=20=
=20=20=20=20=20=20=20=20=20=20
                 |
| 4     | 3                                                     | 5=20=20=
=20=20=20=20=20=20=20=20=20=20
                 |


# Steps to Reproduce

1. Switch to a fan mode.
- echo 0 | sudo tee  /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_=
mode
- echo 1 | sudo tee  /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_=
mode
- echo 2 | sudo tee  /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_=
mode
- echo 4 | sudo tee  /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fan_=
mode

2. Observe that all of them except mode "0" (a.k.a. "Super Silent" mode) ma=
ke
the fan enter the "dust cleaning" mode.


# Expected

Different fan behaviors per documented modes.


# Actual

All non-zero modes behave like dust cleaning.


Best Regards,
Sourajyoti Basak

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

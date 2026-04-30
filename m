Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4361219E839
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777547095; cv=none; b=oGC6loDtN54ioIzU+hk7E/WwEyVzeooA0nL5tJDiiNO4yvD+OIzne4NgyMxbLzCJ3VP9nF/TulfVYOoi/UjFUTWaUyJ2XyOvgWpNg7OnJvHZWCNzYq9SeMyxg8ifRfM07RR6b4OUZKuKJwUFAg06qG9gE3a6w6BNobHFTwD38jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777547095; c=relaxed/simple;
	bh=ndVx3Y66sjjbcCSmeD+c/GYNLGU2kEevBiJc6xSumzY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KdKUFPNGKqNbvG3piiCGb1bwZJw6XQMv8b1BJEH/2qXynZVVickwUY24iP4TtM1K0WiavkvNdCtfgoI8StDL3GxBN2hxL4WRvShjZ7DC7zPqgxjg9b7Tx11rjixGbtFYXtGlAq51DDk1WqL+kBxBdxfpzRx1/jO47YQuw/7ol3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4njKW8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4njKW8n"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7A86C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777547094;
	bh=ndVx3Y66sjjbcCSmeD+c/GYNLGU2kEevBiJc6xSumzY=;
	h=From:To:Subject:Date:From;
	b=j4njKW8ndLdQIB/tG42umXfQTvJGKiXDxqqyGI9NMrTjxHdK/LarNvvccHs/xGJhb
	 hpVYt+roh/PFHm6l0otU+LYrJ2xvlT3wwLoCEwfdEJ8jQouZZBd/UA7TbXyE0kGyEY
	 ASL6WuWzKFtktJL0B6FFitAACkVv3EY3JJi5kZ/6nVaeooSg6pY1SigGfq9pT4UpB8
	 gZW/ca9zH1Z6nS12NLchvKzRE+AxuBUKfb+44VmQyLS38Pz7a//PpOQgME4encHZnu
	 oPSqHWOO05CQdEYCslo/b8K3/A6sfJeKCWL96NlPi68wZnXTqb31i5vpcbJwrKzUuP
	 wxgTb25eQ5Q0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D0CF0C3279F; Thu, 30 Apr 2026 11:04:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221441] New: asus-wmi/asus-armoury warnings on ASUS FX608LP: no
 matching power limits, fan_curve_get_factory_default failed
Date: Thu, 30 Apr 2026 11:04:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fxzxaxon@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221441-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221441

            Bug ID: 221441
           Summary: asus-wmi/asus-armoury warnings on ASUS FX608LP: no
                    matching power limits, fan_curve_get_factory_default
                    failed
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: fxzxaxon@outlook.com
        Regression: No

Hi,

On a new ASUS TX Gaming FX608LP_FX608LP laptop, the ASUS platform drivers
appear to load and expose several expected interfaces, but the kernel logs =
the
following ASUS WMI / Armoury warnings during boot:

  asus_armoury: No matching power limits found for this system
  asus_wmi: fan_curve_get_factory_default (0x00110032) failed: -19

I am reporting this in case this model needs a new DMI match / model data
entry.

System information:

  Kernel:
    Linux ASUS-TX-FX608-PC 6.19.14-300.fc44.x86_64 #1 SMP PREEMPT_DYNAMIC T=
hu
Apr 23 15:17:50 UTC 2026 x86_64 GNU/Linux

  DMI:
    bios_vendor: American Megatrends International, LLC.
    bios_version: FX608LP.313
    bios_date: 11/18/2025
    sys_vendor: ASUSTeK COMPUTER INC.
    product_name: TX Gaming FX608LP_FX608LP
    product_version: 1.0
    product_family: TX Gaming
    product_sku:
    board_vendor: ASUSTeK COMPUTER INC.
    board_name: FX608LP
    board_version: 1.0
    board_asset_tag: ATN12345678901234567
    chassis_vendor: ASUSTeK COMPUTER INC.
    chassis_type: 10
    chassis_version: 1.0

  DMI modalias:
=20=20=20
dmi:bvnAmericanMegatrendsInternational,LLC.:bvrFX608LP.313:bd11/18/2025:br5=
.32:efr3.6:svnASUSTeKCOMPUTERINC.:pnTXGamingFX608LP_FX608LP:pvr1.0:rvnASUST=
eKCOMPUTERINC.:rnFX608LP:rvr1.0:cvnASUSTeKCOMPUTERINC.:ct10:cvr1.0:sku:

Relevant kernel log:

  rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D24
  acpi-fan PNP0C0B:00: Using Microsoft fan extensions
  wmi_bus wmi_bus-PNP0C14:00: [Firmware Bug]: WQ00 data block query control
method not found
  asus_wmi: ASUS WMI generic driver loaded
  asus_armoury: No matching power limits found for this system
  asus_wmi: Initialization: 0x1
  asus_wmi: SFUN value: 0x21
  asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
  asus-nb-wmi asus-nb-wmi: Using throttle_thermal_policy for platform_profi=
le
support
  input: Asus WMI hotkeys as /devices/platform/asus-nb-wmi/input/input17
  asus_wmi: fan_curve_get_factory_default (0x00110032) failed: -19
  asus_wmi: using asus-wmi for asus::kbd_backlight

Current platform_profile state:

  platform_profile:
    balanced

  platform_profile_choices:
    quiet balanced performance

The platform profile interface appears to work, and switching between
quiet/balanced/performance succeeds.

hwmon status:

  The system exposes ASUS hwmon nodes under asus-nb-wmi, including:

    /sys/class/hwmon/hwmon11/name: asus
    fan1_input
    fan1_label
    fan2_input
    fan2_label
    pwm1_enable
    pwm2_enable

    /sys/class/hwmon/hwmon12/name: asus_custom_fan_curve
    pwm1_auto_point*_temp
    pwm1_auto_point*_pwm
    pwm2_auto_point*_temp
    pwm2_auto_point*_pwm
    pwm1_enable
    pwm2_enable

So this does not appear to be a complete lack of ASUS WMI support. Basic
platform profile support and ASUS hwmon interfaces are present.

Additional note:

  find /sys/bus/wmi/devices -name modalias

returns no output on this system.

I have not noticed a clear user-visible malfunction so far. This report is
mainly to provide DMI/model information for this new ASUS model and to ask
whether the two warnings above indicate missing model data.

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

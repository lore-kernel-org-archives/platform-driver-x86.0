Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9300F8634C
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766227139; cv=none; b=L8zdVuLdGIoswM8QApbrGcDh2k3VdPnM71RctjvpzEs6M8C0KjGeYBz0+0JNNqdTzZogWxlF1k56Gzu5SSJlvvQMYKvGO9BiJDC0WZqXN101Wcn8AcnrVdhoMsl1zXl4wjZpTMN6sPVqWYlyX6b6EpcahJdR7HbxFg6YLaOlZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766227139; c=relaxed/simple;
	bh=qCb/ufhJvE4mOT2N/PZfxFWnCdj8BUvTgrylHclV8z4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FupnbgBcAekWM48/9hes3/6FpL0/7oDzpjuaJDipZnYjgvoure458R+ATbFwWPuOxWSwO/3uwSkZ8Lv569TYESZIAlfomf64BJKerxpJT426UJfgnzD9h+r7gfhQli4mV7YtbJtCQSbcLftTDfefoAbaBqziFldKIqW6y/0+Xfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJrI94m6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJrI94m6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19B1FC16AAE
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Dec 2025 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766227139;
	bh=qCb/ufhJvE4mOT2N/PZfxFWnCdj8BUvTgrylHclV8z4=;
	h=From:To:Subject:Date:From;
	b=KJrI94m6OJIqr+ADRb7VxqYgXpPmYCbjvVKVGOaRZjHE/whRZHgp49c5zPAvFM+3F
	 jCAUNRV3Ngd89CzRt0n/AS8TXTvRir8VeJ6Vt8bebig250/0ulTzln0onoegOTynH9
	 cNutQ4sehNPfxpA/3ywuzo5daZyckPU6pMPjHMCLo7FcS8E+euxn5uyAb/4OqNXB8M
	 TkIheZW53Qd0ZBjXK8h3tj84Urq8CXfAQZHLsRfRg0nNIBeEiCBwG0Tzs6jU7Qj8mA
	 p3Lc9P1Gq/oOT+lszfxbAiqea/rtla3RQyR3AtkaDTbGIX04taGqi7c687SsYpRQw2
	 R8RwGHjmDaugA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0D323C41612; Sat, 20 Dec 2025 10:38:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220882] New: mfd_aaeon incorrectly binds on ASUS TUF Gaming A16
 (FA608UM), preventing asus_nb_wmi
Date: Sat, 20 Dec 2025 10:38:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: preeny@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220882-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220882

            Bug ID: 220882
           Summary: mfd_aaeon incorrectly binds on ASUS TUF Gaming A16
                    (FA608UM), preventing asus_nb_wmi
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: preeny@gmail.com
        Regression: No

I'm not the greatest with this stuff so I'll be honest, ChatGPT was to the
rescue here.

I am running Faustus and Aurora to control keyboard backlight which worked
perfectly, until setting secureboot for a couple of games on Windows (dual
boot, separate physical drives) I had to create a MOK for Faustus so it wou=
ld
load correctly.

Let me know if I can be of more help.

------------

Chatty G output:

On ASUS TUF Gaming A16 (board FA608UM), the kernel module mfd_aaeon binds e=
arly
and prevents asus_nb_wmi from loading. This causes asusd to fail with
"MissingFunction('asus-nb-wmi not found')" and breaks keyboard backlight
control
and other ASUS WMI features.

Symptoms:
- asus_nb_wmi fails with "No such device"
- asusd fails to start

This occurs regardless of Secure Boot state.
Blacklisting mfd_aaeon restores correct behavior.

Expected behavior:
asus_nb_wmi should bind to the device on this system, or mfd_aaeon should n=
ot
bind on this DMI match.

Workaround:
blacklist mfd_aaeon

-------

Hardware:

System manufacturer: ASUS
Product name: TUF Gaming A16
Board name: FA608UM

-------

$ dmesg | grep -E "aaeon|asus_nb_wmi|asus_wmi"
[    3.733678] asus_wmi: ASUS WMI generic driver loaded
[    3.738550] asus_wmi: Initialization: 0x1
[    3.738692] asus_wmi: SFUN value: 0x21
[    3.767492] asus_wmi: fan_curve_get_factory_default (0x00110032) failed:=
 -19
[   13.315905] asus_wmi: Unknown key code 0x4f

--------

$ sudo dmidecode -s system-manufacturer
sudo dmidecode -s system-product-name
sudo dmidecode -s baseboard-product-name
[sudo] password for preen:=20=20=20=20=20
ASUSTeK COMPUTER INC.
ASUS TUF Gaming A16 FA608UM_FA608UM
FA608UM

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

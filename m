Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DD62EAE4
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNNG5hQp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC9E8C433C8
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700937287;
	bh=c1NOkQv2sNKauF/yCZg5RJEdyn+f32tucpYEaMwQU7Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZNNG5hQp30AA18mqoRGtSFLb+04timNRGmKx2XGxvnrT0krg+wOVdJ6kk5hzdmuO8
	 W5dqTuqTbuQEQUhkXWo/Dk7sm45PRTnEYROYhMpaG4QSa/O12KAr12oe8n0Fb+lKmo
	 VPJtVfQmDg/2RfMOWd4SgPEkCYd05i3GINQWbWwieb7VAr4f0XzcVoMjkyE7N70w4t
	 CYMql++TFgjmP7kqVeeWR+PNxi2OzP1/+jbST3BRCW0sm9AeyXJ6jhGu2PsYEQZibt
	 vQg2xhnNjkafDrX3UbE7b3R3EsMpBb91H/hrGQV1KwDysJ6QOshQiFR8BsYGTSJ9wz
	 w8vrSUx+L0+qA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C26E3C53BD0; Sat, 25 Nov 2023 18:34:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 18:34:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: W_Armin@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-fpPLLRg8Om@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218188-215701@https.bugzilla.kernel.org/>
References: <bug-218188-215701@https.bugzilla.kernel.org/>
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

--- Comment #6 from Armin Wolf (W_Armin@gmx.de) ---
Can you try this one:

From ecbb0f5eeab921baf51270e554d432ec09ae9b5c Mon Sep 17 00:00:00 2001
From: Armin Wolf <W_Armin@gmx.de>
Date: Sat, 25 Nov 2023 16:46:06 +0100
Subject: [PATCH] platform/x86: wmi: Skip blocks with zero instances

Some machines like the HP Omen 17 ck2000nf contain
WMI blocks with zero instances, so any WMI driver
which tries to handle the associated WMI device will
fail.
Skip such WMI blocks to avoid confusing any WMI drivers.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
---
 drivers/platform/x86/wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 5c27b4aa9690..5dd22258cb3b 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1340,6 +1340,11 @@ static int parse_wdg(struct device *wmi_bus_dev, str=
uct
platform_device *pdev)
                if (debug_dump_wdg)
                        wmi_dump_wdg(&gblock[i]);

+               if (!gblock[i].instance_count) {
+                       dev_info(wmi_bus_dev, FW_INFO "%pUL has zero
instances\n", &gblock[i].guid);
+                       continue;
+               }
+
                if (guid_already_parsed_for_legacy(device, &gblock[i].guid))
                        continue;

--=20
2.39.2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

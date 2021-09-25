Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8562C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 13:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC1D56135A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 13:33:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245152AbhIYNfN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Sep 2021 09:35:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:40502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245112AbhIYNfM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Sep 2021 09:35:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4DAE06128B
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Sep 2021 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632576818;
        bh=QXRdIs64xXjnZ/4S5zFSQA49YKWSVRSNoc0BrPRrYKE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Af79PVwe0s7vTrJpHiVFv7U1zR5DiqIsp2C4QceM9wRuSViKbnrudXPDkyhqDXbzh
         dLoEawbnCin8EW/jE0842nj4cjQ0L4PAJTt3B3r2zPyhxTGSjQcP6/WFXW8Pw6grMU
         UJK9JZsThBApquxwsCVpI0KdMaGp7pkdxuEvNAVd4dL8y8CTAn2o9Yu9BjtIv4F/75
         J9Mu9bikK2c8wPQEvsEb7kV8QF7+uBt8FMXkH5iVF4GIqyoaycQH6k8XN2Gmfv81wi
         owhsRBQk4EjhwbBK02nL9PERyrgqhmY+2XRvFv2TVYrsYSGyRUy9GdPsZqu0ErIXEk
         lzJvSjoaCEdHQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 25 Sep 2021 13:33:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-I38ChR8wsB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298905|0                           |1
        is obsolete|                            |

--- Comment #128 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 298971
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298971&action=3Dedit
Add support for access via Asus WMI (2021.09.25)

Support by nct6775:ASUSWMI:
---
+       "PRIME B360-PLUS",
+       "PRIME B460-PLUS",
+       "PRIME X570-PRO",
+       "ROG CROSSHAIR VIII DARK HERO",
+       "ROG CROSSHAIR VIII FORMULA",
+       "ROG CROSSHAIR VIII HERO",
+       "ROG CROSSHAIR VIII IMPACT",
+       "ROG STRIX B550-E GAMING",
+       "ROG STRIX B550-F GAMING",
+       "ROG STRIX B550-F GAMING (WI-FI)",
+       "ROG STRIX B550-I GAMING",
+       "ROG STRIX X570-F GAMING",
+       "ROG STRIX Z390-E GAMING",
+       "ROG STRIX Z490-I GAMING",
+       "TUF GAMING B550M-PLUS",
+       "TUF GAMING B550M-PLUS (WI-FI)",
+       "TUF GAMING B550-PLUS",
+       "TUF GAMING B550-PRO",
+       "TUF GAMING X570-PLUS",
+       "TUF GAMING X570-PLUS (WI-FI)",
+       "TUF GAMING X570-PRO (WI-FI)",
+       "TUF GAMING Z490-PLUS (WI-FI)",
---

Support nct6775:i2c (OpenRGB code):
--
+       "PRIME B450M-GAMING",
+       "PRIME X370-PRO",
+       "PRIME X399-A",
+       "PRIME X470-PRO",
+       "PRIME Z270-A",
+       "PRIME Z370-A",
+       "ROG CROSSHAIR VI HERO",
+       "ROG STRIX B350-F GAMING",
+       "ROG STRIX B450-F GAMING",
+       "ROG STRIX X399-E GAMING",
+       "ROG STRIX Z270-E",
+       "ROG STRIX Z370-E",
+       "ROG STRIX Z490-E GAMING",
+       "TUF B450 PLUS GAMING",
--

Support ASUS WSI asus_wmi_sensors:native
(https://github.com/electrified/asus-wmi-sensors):
---
+       "ROG CROSSHAIR VII HERO (WI-FI)",
+       "ROG CROSSHAIR VII HERO",
+       "ROG CROSSHAIR VI HERO (WI-FI AC)",
+       "CROSSHAIR VI HERO",
+       "ROG CROSSHAIR VI EXTREME",
+       "ROG ZENITH EXTREME",
+       "ROG ZENITH EXTREME ALPHA",
+       "PRIME X399-A",
+       "PRIME X470-PRO",
+       "ROG STRIX X399-E GAMING",
+       "ROG STRIX B450-E GAMING",
+       "ROG STRIX B450-F GAMING",
+       "ROG STRIX B450-I GAMING",
+       "ROG STRIX X470-I GAMING",
+       "ROG STRIX X470-F GAMING",
----

Support ASUS WSI asus_wmi_sensors:ec
(https://github.com/zeule/asus-wmi-ec-sensors/blob/master):
---
+       [BOARD_R_C8H] =3D "ROG CROSSHAIR VIII HERO",
+       [BOARD_R_C8DH] =3D "ROG CROSSHAIR VIII DARK HERO",
+       [BOARD_R_C8F] =3D "ROG CROSSHAIR VIII FORMULA",
+       [BOARD_RS_X570_E_G] =3D "ROG STRIX X570-E GAMING",
+       [BOARD_RS_B550_E_G] =3D "ROG STRIX B550-E GAMING",
---

(In reply to Kamil Pietrzak from comment #122)
> static const u16 scale_in[15] =3D {
>       888, 4000, 1600, 1600, 9600, 800, 800, 1600, 1600, 1600, 1600, 1600,
> 800,
>       800, 800
> };

@Kamil Pietrzak Could you please check that scale applied to your board
correctly?

(In reply to Eugene Shalygin from comment #111)
> Thus I created a little HWMON driver [1] to read them using WMI method
> 'BREC'.

@Eugene Shalygin Could you please check that combined version is still work=
ed?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

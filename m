Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FA72DB7BD
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 15:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784819203; cv=none; b=TWoutf9Ghr1jO9wM+3eyYnCTe1Cfooix0u+z9cPVMucSbdfSBtT7OxYIhlF//Fkl+eHUjLxudJU/WBt9BIDkZA17Qig6JbStMAddiG5riCr/IAivpBzibkjvj/KnY+kCZDCt56b8YVRhTJ6CXq/CqPhFtKMupMEAHIgodabRhrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784819203; c=relaxed/simple;
	bh=/okyBU+u1MqJsDQglC/cVtUrEUkdPiclhOdBObG6Ew4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uJ079wivoZy3pSkyADhzqqVRB1/TkcOzg84teQC7DAuikw2xSwlYuSvPfu8tijea504L9L00pjHRRLe6oH/3310e1yZSlyG7kKbFO8oy9RL/ua5GxboRYvQdWCVqCqhTckBQwGy5+zpoh8QRJcXwKvvvX66Tr+roHTiVtz9Yw3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5xT+xId; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5xT+xId"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6BE9C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 15:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784819202;
	bh=/okyBU+u1MqJsDQglC/cVtUrEUkdPiclhOdBObG6Ew4=;
	h=From:To:Subject:Date:From;
	b=P5xT+xIdu7u6399p95MzkZ64wpj66gZAqmIYoz0FnB1CgGy30hM6x0u0KobcUxHMH
	 4CbVnyIh/84uuGvP0qwJCDgOkBrP5gUaq1Hw7Mtx1qjJzk9AotbzdKuxMW36/kYlSN
	 DLpTPOLL8u+4DSVoCofP+Bu9KDbKU7csgmBQyt2RM371ERKfGRZ+QmUerBMpg4zm5m
	 jTp8neoyvYzC9kQRWVUu4F87d1/+OqyI0zioaJh9X70hg8o2kAo4IE4jqwD2z02Fda
	 vPrqu6iNP0cWJtvyEKewtNBCR3bZNlvLvUUSBs23+nQKSDmg4UfWd5Nc65gRN2YdGc
	 0IHwAE2T5Ppcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AFA54C433E1; Thu, 23 Jul 2026 15:06:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221780] New: Samsung Galaxy Book Pro 6 (Core Ultra X7 358H):
 camera unavailable because samsung_galaxybook fails CSFI "block recording"
 query
Date: Thu, 23 Jul 2026 15:06:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tm@tmgldn.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221780-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221780

            Bug ID: 221780
           Summary: Samsung Galaxy Book Pro 6 (Core Ultra X7 358H): camera
                    unavailable because samsung_galaxybook fails CSFI
                    "block recording" query
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: tm@tmgldn.com
        Regression: No

Created attachment 310494
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310494&action=3Dedit
uname.txt, lspci.txt, dmesg.txt, journal.txt, ovti08f4-status.txt, dsdt.dsl

drivers/platform/x86/samsung-galaxybook.c

The integrated camera is not detected under Linux on a Samsung Galaxy Book =
Pro
6 with an Intel Core Ultra X7 358H (Panther Lake).

The Intel IPU7 driver loads successfully, but no camera sensor is discovered
because the Samsung platform driver fails to query the firmware's block
recording feature.

The driver logs:

`acpi SAM0430:00: failed to execute CSFI; device responded with failure code
0xff`

After this, the camera sensor remains disabled and libcamera cannot discover
it.

## System

* Laptop: Samsung Galaxy Book Pro 6
* CPU: Intel Core Ultra X7 358H
* Kernel: (see attached uname.txt)
* Distribution: Arch Linux
* IPU PCI ID: 8086:b05d
* Camera sensor ACPI ID: OVTI08F4

## Observed behaviour

The IPU7 driver loads successfully.

`v4l2-ctl --list-devices` shows the IPU.

`libcamera` reports:

`No sensor found for /dev/media0`

Kernel log contains:

```
intel-ipu7 ... no subdev found in graph
acpi SAM0430:00: failed to execute CSFI; device responded with failure code
0xff
```

The camera sensor exists in ACPI:

`OVTI08F4`

but

`/sys/bus/acpi/devices/OVTI08F4:00/status`

contains:

`0`

The `samsung_galaxybook` driver loads correctly.

Working features include:

* keyboard backlight
* platform profile

The firmware attributes directory exists but contains no camera-related
attributes.

The privacy key generates a normal F11 key event and no ACPI notification is
produced.

## Investigation

I inspected the current `drivers/platform/x86/samsung-galaxybook.c` source.

The failure occurs during the `CSFI` request used for
`GB_SASB_BLOCK_RECORDING`.

The ACPI method itself exists in the firmware:

```asl
Method (CSFI, 1, Serialized)
{
    Return (SAWS (Arg0))
}
```

The AML simply forwards the request to `SAWS`.

`SAWS` returns the firmware response.

The Linux driver reaches the `GB_GUNM_FAIL` check and reports:

`failed to execute CSFI; device responded with failure code 0xff`

This suggests the firmware rejects the request rather than the ACPI method
itself failing.

Because this query fails, the camera privacy feature is never initialised a=
nd
the sensor remains unavailable.

## Expected behaviour

The Samsung platform driver should successfully initialise the camera/priva=
cy
feature on this model so that the camera sensor becomes available to the In=
tel
IPU stack.

## Attachments

* uname.txt
* lspci.txt
* dmesg.txt
* journal.txt
* ovti08f4-status.txt
* dsdt.dsl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

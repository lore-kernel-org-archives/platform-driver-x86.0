Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5BBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 18:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66E146115C
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Sep 2021 18:52:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhIYSxe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Sep 2021 14:53:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:51710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229711AbhIYSxe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Sep 2021 14:53:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 34DBD610D1
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Sep 2021 18:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632595919;
        bh=97gWgpOlA/sE7vsD+RJDlcGVnvd+qZgz4vVAvOyyG9I=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K3SlcRJxpSHNWlswOFIwOcV4KhKdYCxX3nmksFQLPCOpzIdu+TI9cL1mWfCLhANN9
         V7ne6vycpto2fS9jlqWVlYAKBn8vEA2XKvXr2LKuKWDMJFt223DO43guFpG3wfWap3
         eagYPIUv28yNONIBY7KdKsveKVYm4tTWG8d/GBh/RaZ8CriO8UzDJJ4iZ+Id/kdvoF
         bekXiA4F8AMgsrAma+6suqqp73FQFibe5WdTIrAcOinyVjHYVT9nGG21n8C4hmdNpN
         lQTjjfeTOEPQh2MFjnHgTPolWUG+FiBEYTNYsyWhaCqTWVCKvaFI0Ecv2bXp6LE2bF
         8tZOnHVj+lLsA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 25 Sep 2021 18:51:58 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-ibnifmayJi@https.bugzilla.kernel.org/>
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

--- Comment #131 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to Eugene Shalygin from comment #129)
> Thank you for your efforts to mainline these drivers! I have a couple of
> changes and questions to the EC part. Is a review going on somewhere wher=
e I
> can participate? Otherwise here are the main points:
>=20
I have not sent it to review yet. I prefer to have checked at least one
motherboard from each group before send for review. Especially i2c adapter.=
=20

(In reply to Eugene Shalygin from comment #129)
> 1. I'm pretty sure the B550-E GAMING board has no EC sensors. Other B550
> boards I've seen DSDT from provide a dummy BREC() function.

As for me it has returned reasonable values for "ROG STRIX B550-E GAMING":
----
asuswmiecsensors-isa-0000
Adapter: ISA adapter
Chipset:      +32.0=C2=B0C=20=20
CPU:          +22.0=C2=B0C=20=20
Motherboard:  +22.0=C2=B0C=20=20
T_Sensor:    +216.0=C2=B0C=20=20
VRM:          +28.0=C2=B0C=20=20

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +25.1=C2=B0C=20=20
Tdie:         +25.1=C2=B0C=20=20
Tccd1:        +22.5=C2=B0C=20=20
Tccd2:        +24.5=C2=B0C=20
----

Maybe it has other valuable sensors, I have used some lucky values for now =
that
looks as reasonable. Motherboard for sure has T_Sensor and AIO_PUMP by
https://rog.asus.com/motherboards/rog-strix/rog-strix-b550-e-gaming-model/s=
pec.

(In reply to Kamil Pietrzak from comment #130)
> Motherboard "TUF GAMING Z490-PLUS (WI-FI)" is using Nuvoton NCT6798D Super
> I/O, so probably all motherboards that use same Nuvoton chip may benefit
> from those new voltage scaling factors.=20=20

What do you think about use kernel mode parameter for use custom value unti=
l we
will have some approve that other motherboards with NCT6798D has same scale
factors?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

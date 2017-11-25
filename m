From: Jason Gerecke <killertofu@gmail.com>
Subject: Intel "5-button array" support on MobileStudio Pro
Date: Sat, 25 Nov 2017 10:23:33 -0800
Message-ID: <5F052604-4CFE-44AA-9E41-2DB516D150A8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pl0-f53.google.com ([209.85.160.53]:39017 "EHLO
        mail-pl0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750729AbdKYSXh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Nov 2017 13:23:37 -0500
Received: by mail-pl0-f53.google.com with SMTP id l16so6098842pli.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2017 10:23:37 -0800 (PST)
Received: from ?IPv6:2601:1c1:8800:899:711a:407c:6ee7:59d4? ([2601:1c1:8800:899:711a:407c:6ee7:59d4])
        by smtp.gmail.com with ESMTPSA id s14sm43443979pfe.36.2017.11.25.10.23.35
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 Nov 2017 10:23:35 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

I've just filed a bug [1] about a device which appears to use the "5-button=
 array" that the patch [2] added support for earlier this year=2E It seems =
that on this particular device (a Wacom MobileStudio Pro), there is no "HEB=
C" entry in the ACPI table=2E Because of this, the kernel does not load sup=
port for the "5-button array" that this device seems to use=2E

Please let me know what additional information would be helpful to provide=
=2E I am able to test kernel patches=2E

[1]: https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D197991

[2]:=C2=A0https://patchwork=2Ekernel=2Eorg/patch/9571353/

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one=C2=A0 /
(That is to say, eight) to the two,=C2=A0 =C2=A0 =C2=A0/
But you can=E2=80=99t take seven from three,=C2=A0 =C2=A0 /
So you look at the sixty-fours=2E=2E=2E=2E

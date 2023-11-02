Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B5CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 18:06:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjKBSGq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 14:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjKBSGo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 14:06:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129422137
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 11:05:44 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 827B0C433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698948253;
        bh=N4EP6VgdJhPeto7oOqd1/uJiYIuB6/LaEsUE6HgDFHU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gJLXeY3YSvv8NpqQTD2s/HUv86Ii8S9rg/N6Q/glYK7zxVv9KMvdj7lAjZ+SPF7AX
         ED2zWFHTnLoaKFWrTwkEH0HL7xUlnqF3jS92TZ9fiinK0DmqbFMLILN1mrraKIcA9G
         8ZIGM6jl1ici/O4xaw5TX+Msc3FCzItKF7oqHmzXfFQ9Xo19UWUYNIado3FPX3WbOK
         kmkd1DQ26hMp3yN3lkAEOs/KuGTShzO82Bn8DBBEKyUmze6VruIHuit+7ZAxyQ0rHa
         tU5NC+uuHqeOWVFRggZDuKjf9DDuI7qUUdljGZ+AKqFujXQqFcDhZ5/oQ4Sf5jkSvO
         YT9bJOOmGFxeA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 68EDDC4332E; Thu,  2 Nov 2023 18:04:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 18:04:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-f2Lj6CiI4w@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #42 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #40)
> Created attachment 305348 [details]
> fixed up config

It take about 15 minutes and give this error at the end:

  LD [M]  net/vmw_vsock/hv_sock.ko
  LD [M]  net/vmw_vsock/vsock_loopback.ko
  LD [M]  net/nsh/nsh.ko
  LD [M]  net/hsr/hsr.ko
  LD [M]  net/qrtr/qrtr.ko
  LD [M]  net/qrtr/qrtr-smd.ko
  LD [M]  net/qrtr/qrtr-tun.ko
  LD [M]  net/qrtr/qrtr-mhi.ko
  LD [M]  virt/lib/irqbypass.ko
make -f ./Makefile ARCH=3Dx86 \
KERNELRELEASE=3D6.6.0 \
run-command KBUILD_RUN_COMMAND=3D+./scripts/package/builddeb
  SYMLINK debian/linux-image/lib/modules/6.6.0/build
  INSTALL debian/linux-image/lib/modules/6.6.0/modules.order
  INSTALL debian/linux-image/lib/modules/6.6.0/modules.builtin
  INSTALL debian/linux-image/lib/modules/6.6.0/modules.builtin.modinfo
  INSTALL
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/amd/amd-uncore.=
ko
  INSTALL
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/intel/intel-cst=
ate.ko
  INSTALL debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/rapl.=
ko
  INSTALL
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpu/mce/mce-inj=
ect.ko
  INSTALL debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/msr.ko
  SIGN=20=20=20
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/amd/amd-uncore.=
ko
  SIGN=20=20=20
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/intel/intel-cst=
ate.ko
  SIGN    debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/rapl.=
ko
  SIGN=20=20=20
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpu/mce/mce-inj=
ect.ko
  SIGN    debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/msr.ko
  INSTALL debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpuid=
.ko
  SIGN    debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpuid=
.ko
At main.c:170:
- SSL error:1E08010C:DECODER routines::unsupported:
../crypto/encode_decode/decoder_lib.c:101
sign-file: ./
At main.c:170:
- SSL error:1E08010C:DECODER routines::unsupported:
../crypto/encode_decode/decoder_lib.c:101
sign-file: ./
At main.c:170:
- SSL error:1E08010C:DECODER routines::unsupported:
../crypto/encode_decode/decoder_lib.c:101
sign-file: ./
At main.c:170:
- SSL error:1E08010C:DECODER routines::unsupported:
../crypto/encode_decode/decoder_lib.c:101
sign-file: ./
At main.c:170:
- SSL error:1E08010C:DECODER routines::unsupported:
../crypto/encode_decode/decoder_lib.c:101
sign-file: ./
At main.c:170:
- SSL error:1E08010C:DECODER routines::unsupported:
../crypto/encode_decode/decoder_lib.c:101
sign-file: ./
make[6]: *** [scripts/Makefile.modinst:121:
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/amd/amd-uncore.=
ko]
Error 1
make[6]: *** Deleting file
'debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/amd/amd-uncore=
.ko'
make[6]: *** Waiting for unfinished jobs....
make[6]: *** [scripts/Makefile.modinst:121:
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/intel/intel-cst=
ate.ko]
Error 1
make[6]: *** Deleting file
'debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/intel/intel-cs=
tate.ko'
make[6]: *** [scripts/Makefile.modinst:121:
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/rapl.ko] Error 1
make[6]: *** Deleting file
'debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/events/rapl.ko'
make[6]: *** [scripts/Makefile.modinst:121:
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpu/mce/mce-inj=
ect.ko]
Error 1
make[6]: *** Deleting file
'debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpu/mce/mce-in=
ject.ko'
make[6]: *** [scripts/Makefile.modinst:121:
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/msr.ko] Error 1
make[6]: *** Deleting file
'debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/msr.ko'
make[6]: *** [scripts/Makefile.modinst:121:
debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpuid.ko] Error=
 1
make[6]: *** Deleting file
'debian/linux-image/lib/modules/6.6.0/kernel/arch/x86/kernel/cpuid.ko'
make[5]: *** [Makefile:1821: modules_install] Error 2
make[4]: *** [Makefile:2036: run-command] Error 2
make[3]: *** [debian/rules:17: binary-arch] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess returned e=
xit
status 2
make[2]: *** [scripts/Makefile.package:146: bindeb-pkg] Error 2
make[1]: *** [/home/ertugruluyar/Desktop/linux-6.6/Makefile:1538: bindeb-pk=
g]
Error 2
make: *** [Makefile:234: __sub-make] Error 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

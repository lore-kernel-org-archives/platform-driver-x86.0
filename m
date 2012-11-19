From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: asus-wmi: update wlan LED through rfkill led trigger
Date: Mon, 19 Nov 2012 11:26:42 +0800
Message-ID: <CAMz9Wg_g3qngDb393p=X6zSOvH4o1F+rSMSDO_2U+P6HVy9ucA@mail.gmail.com>
References: <CAMz9Wg8WxQHntfyhqMDvYdPf+7Rq+TiDFL7UiTLfozLiQ76PZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:59961 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751859Ab2KSD0p (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Nov 2012 22:26:45 -0500
Received: by mail-la0-f46.google.com with SMTP id p5so772850lag.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Nov 2012 19:26:44 -0800 (PST)
In-Reply-To: <CAMz9Wg8WxQHntfyhqMDvYdPf+7Rq+TiDFL7UiTLfozLiQ76PZw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Dear Matthew,

I'm afraid you forgot to submit this patch.
It's located in the linux-next branch and is not submitted until now.
Please help to submit this when you are available.
Thanks.

commit 154a7a7b22342ab9ccde34f583e4b730965ee515
Author: AceLan Kao <acelan.kao@canonical.com>
Date:   Fri Jul 27 16:51:59 2012 +0800

    asus-wmi: update wlan LED through rfkill led trigger

    For those machines with wapf=4, BIOS won't update the wireless LED,
    since wapf=4 means user application will take in chage of the wifi and bt.
    So, we have to update wlan LED status explicitly.

    But I found there is another wireless LED bug in launchpad and which is
    not in the wapf=4 quirk.
    So, it might be better to set wireless LED status explicitly for all
    machines.

    BugLink: https://launchpad.net/bugs/901105

    Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
    Signed-off-by: Matthew Garrett <mjg@redhat.com>

Best regards,
AceLan Kao.

2012/10/17 AceLan Kao <acelan.kao@canonical.com>:
> Dear Matthew,
>
> Just a note that the queued commit
> 47b4970 asus-wmi: update wlan LED through rfkill led trigger
> could be submitted now.
> The dependent rfkill commit is already in linus' tree.
> Thanks.
>
> commit 06d7de831dab8b93adb86e039a2f3d36604a9197
> Author: AceLan Kao <acelan.kao@canonical.com>
> Date:   Thu Jul 26 09:51:08 2012 +0800
>
>     Revert "rfkill: remove dead code"
>
>     This reverts commit 2e48928d8a0f38c1b5c81eb3f1294de8a6382c68.
>
>     Those functions are needed and should not be removed, or
>     there is no way to set the rfkill led trigger name.
>
>     Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>     Signed-off-by: Johannes Berg <johannes.berg@intel.com>
>
> Best regards,
> AceLan Kao.
>
> --
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

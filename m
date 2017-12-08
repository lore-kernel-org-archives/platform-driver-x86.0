From: Andy Lutomirski <luto@kernel.org>
Subject: Re: Multiple MOF GUID's
Date: Fri, 8 Dec 2017 11:32:57 -0800
Message-ID: <CALCETrX9cTYKEDLvcS8fWJmT75Sco1_wuFPOxLESXR9J7s5BLA@mail.gmail.com>
References: <2c96ee1da98c41a1b8f905f00f2f5544@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752521AbdLHTdT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 14:33:19 -0500
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com [209.85.214.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 789E421881
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Dec 2017 19:33:18 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id m11so6071831iti.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Dec 2017 11:33:18 -0800 (PST)
In-Reply-To: <2c96ee1da98c41a1b8f905f00f2f5544@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

On Fri, Dec 8, 2017 at 11:30 AM,  <Mario.Limonciello@dell.com> wrote:
> Andy,
>
> I was looking at a system that will have many more WMI methods, and realizing that I can't
> view the bmof for the extra methods.  This is because of b0e863029 which will show a warning
> when multiple of the same WMI GUID's are found.
> The same GUID 05901221-D566-11D1-B2F0-00A0C9062910 is used to describe each one of them.

So there are multiple WMI instances, both of which have bmof?

>
> I think the symlinks in sysfs will break if the warning is just removed.
>
> So what should we do about this?  I think they should both be accessible from the bmof driver from
> userspace.

Fixing it will require changing the data structures to get rid of the
global wmi_block_list.  I don't think it'll affect the ABI.  I'll
gladly review a patch ;)

--Andy

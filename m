Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E432C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 22:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJNWaA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 18:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiJNW37 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 18:29:59 -0400
X-Greylist: delayed 1035 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 14 Oct 2022 15:29:57 PDT
Received: from mx.dolansoft.org (s2.dolansoft.org [212.51.146.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A82726489
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
        s=s1; h=MIME-Version:Message-Id:To:Subject:From:Date:In-Reply-To:References:
        From:To:CC:Subject:Date:Message-ID:Reply-To;
        bh=Njr7R64ffpLwhPIZMvuoHOGBhh8zveETJSp2+e/QmiI=; b=d2fs4XlcSV1z2DyDCtXKnuIXt4
        J3YuPc8auJGh67HnI6/zFirtGHTUGF4SW37TxKz6B9BTJxgkX64KM+L27FTb8mNIZByZc/sEAI4CW
        n4F0czB8yZnuZRge4VyvkdXfoNJCiQIoVE40C0r8NS6bSKDtL9wlV/gW3f1sCLCjjRpIURfesr15s
        2UvTecPRg9dV1neHi2dCSpd1rbqTtyRxawPBgk9jVQkcTin+ZXhz5XCkk/vSMMnHfaSN1RNOvIajh
        8vrcJzr1yLhDvgxjq0vIiIojOK590qzHFCF02MlNp7xYBZrOO00ptgNBsgs30WXPuG22hy2j2Iq/J
        UMKUA7/Q==;
Received: from [212.51.153.89] (helo=[192.168.12.54])
        by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <lorenz@dolansoft.org>)
        id 1ojSv0-000011-1O
        for platform-driver-x86@vger.kernel.org;
        Fri, 14 Oct 2022 22:12:38 +0000
Date:   Sat, 15 Oct 2022 00:12:32 +0200
From:   Lorenz Brun <lorenz@brun.one>
Subject: Upstreaming Lenovo tablet switch driver
To:     platform-driver-x86 <platform-driver-x86@vger.kernel.org>
Message-Id: <WCKRJR.J6HLBHK1X1TT3@brun.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: lorenz@dolansoft.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi x86 platform list,

I'm considering contributing support for the usage mode/tablet mode 
switch for some Lenovo laptops (including the popular IdeaPad Flex 
series).
There is already an out-of-tree driver at 
https://github.com/lukas-w/yoga-usage-mode which works well,
but I'd like to get this support upstream.

I have a few questions regarding the best approach:
1. There is the ideapad-laptop module already which deals with a bunch 
of functionality related to these laptops, but not the mode switch. Do 
you prefer a separate driver or should the functionality be added to 
ideapad-laptop?
2. The existing out-of-tree driver uses a WMI interface to access mode 
information. Should I work on the WMI layer or should I figure out 
which EC registers to use to get the functionality independently? If 
yes, how do we want to identify support for this type of mode switch?

Regards,
Lorenz



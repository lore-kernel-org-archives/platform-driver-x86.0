Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A485FC3DA7D
	for <platform-driver-x86@archiver.kernel.org>; Sat, 31 Dec 2022 14:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbiLaOWJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 31 Dec 2022 09:22:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiLaOWI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 31 Dec 2022 09:22:08 -0500
X-Greylist: delayed 357 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 31 Dec 2022 06:22:06 PST
Received: from vm146.dmsolutionsonline.de (vm146.dmsolutionsonline.de [84.19.161.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1972110A3;
        Sat, 31 Dec 2022 06:22:05 -0800 (PST)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by vm146.dmsolutionsonline.de (Postfix) with ESMTP id CF1541C2A72;
        Sat, 31 Dec 2022 15:16:06 +0100 (CET)
Received: from vm146.dmsolutionsonline.de ([127.0.0.1])
        by localhost (vm146.dmsolutionsonline.de [127.0.0.1]) (amavisd-new, port 10025)
        with ESMTP id J1Js59n3b3jW; Sat, 31 Dec 2022 15:16:06 +0100 (CET)
Received: from Andreas (pd9fb5d07.dip0.t-ipconnect.de [217.251.93.7])
        (Authenticated sender: andreas@eberlein.it)
        by vm146.dmsolutionsonline.de (Postfix) with ESMTPSA;
        Sat, 31 Dec 2022 15:16:05 +0100 (CET)
From:   <foodeas@aeberlein.de>
Sender: "Andreas Eberlein" <andreas@eberlein.it>
To:     "'Philip Prindeville'" <philipp@redfish-solutions.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-x86_64@vger.kernel.org>,
        <platform-driver-x86@vger.linux.org>
Cc:     "'Ed Wildgoose'" <kernel@wildgooses.com>,
        "'Andres Salomon'" <dilinger@queued.net>,
        "'Andreas Eberlein'" <foodeas@aeberlein.de>
References: <20221230180715.2785959-1-philipp@redfish-solutions.com>
In-Reply-To: <20221230180715.2785959-1-philipp@redfish-solutions.com>
Subject: [PATCH 1/1] apu6: add apu6 variation to apu2 driver family
Date:   Sat, 31 Dec 2022 15:16:04 +0100
Message-ID: <000001d91d22$6b92b2d0$42b81870$@aeberlein.de>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: de
Thread-Index: AQHBUN91r8AGVmG+G2zQdYB+kQGkd663onfg
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Looks good for me!


Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B6AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 08:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F43160F9D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Oct 2021 08:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236779AbhJ0IWY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Oct 2021 04:22:24 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:44115 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236592AbhJ0IWY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Oct 2021 04:22:24 -0400
Received: (Authenticated sender: peter@korsgaard.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5EA5020009;
        Wed, 27 Oct 2021 08:19:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peter@korsgaard.com>)
        id 1mfeA6-0006U4-4d; Wed, 27 Oct 2021 10:19:54 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     cgel.zte@gmail.com
Cc:     santoshkumar.yadav@barco.com, peter.korsgaard@barco.com,
        hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        ran jianping <ran.jianping@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] platform/x86: remove duplicate include in barco-p50-gpio.c
References: <20211027081516.1865-1-ran.jianping@zte.com.cn>
Date:   Wed, 27 Oct 2021 10:19:54 +0200
In-Reply-To: <20211027081516.1865-1-ran.jianping@zte.com.cn> (cgel zte's
        message of "Wed, 27 Oct 2021 08:15:16 +0000")
Message-ID: <87v91iriad.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>>>>> "cgel" == cgel zte <cgel.zte@gmail.com> writes:

 > From: ran jianping <ran.jianping@zte.com.cn>
 > 'linux/io.h' included in 'drivers/platform/x86/barco-p50-gpio.c'
 >  is duplicated.It is also included on the 17 line.

 > Reported-by: Zeal Robot <zealci@zte.com.cn>
 > Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
 > ---
 >  drivers/platform/x86/barco-p50-gpio.c | 1 -
 >  1 file changed, 1 deletion(-)

 > diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
 > index f5c72e33f9ae..bb8ed8e95225 100644
 > --- a/drivers/platform/x86/barco-p50-gpio.c
 > +++ b/drivers/platform/x86/barco-p50-gpio.c
 > @@ -14,7 +14,6 @@
 >  #include <linux/delay.h>
 >  #include <linux/dmi.h>
 >  #include <linux/err.h>
 > -#include <linux/io.h>

It probably makes more sense to drop the include from line 17 to keep
alphabetical ordering, but otherwise it looks good to.

With that fixed:

Acked-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

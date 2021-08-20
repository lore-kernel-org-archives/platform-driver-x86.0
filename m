Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6675C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 10:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98AE76103B
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Aug 2021 10:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhHTKn5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Aug 2021 06:43:57 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:34267 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhHTKn5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Aug 2021 06:43:57 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 985231BF20A;
        Fri, 20 Aug 2021 10:43:17 +0000 (UTC)
Message-ID: <e7fbcf85f61b5c727a93df07b3bfe1624547067f.camel@hadess.net>
Subject: Re: [PATCH v4 1/1] asus-wmi: Add support for custom fan curves
From:   Bastien Nocera <hadess@hadess.net>
To:     Luke Jones <luke@ljones.dev>
Cc:     linux-kernel@vger.kernel.org, hdegoede@redhat.com,
        platform-driver-x86@vger.kernel.org
Date:   Fri, 20 Aug 2021 12:43:17 +0200
In-Reply-To: <L0W4YQ.ZVWQDLFJE8NR2@ljones.dev>
References: <20210820095726.14131-1-luke@ljones.dev>
         <20210820095726.14131-2-luke@ljones.dev>
         <321afe1a293be3a623a9be53feea3a008e044b31.camel@hadess.net>
         <L0W4YQ.ZVWQDLFJE8NR2@ljones.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 2021-08-20 at 22:33 +1200, Luke Jones wrote:
> > Am I going to get bug reports from Asus users that will complain
> > that
> > power-profiles-daemon doesn't work correctly, where I will have to
> > wearily ask if they're using an Asus Rog laptop?
> 
> No. Definitely not. The changes to fan curves per-profile need to be 
> explicitly enabled and set. So a new user will be unaware that this 
> control exists (until they look for it) and their laptop will behave 
> exactly as default.

"The user will need to change the fan curves manually so will
definitely remember to mention it in bug reports" is a very different
thing to "the user can't change the fan curves to be nonsensical and
mean opposite things".

I can assure you that I will eventually get bug reports from "power
users" who break their setup and wonder why things don't work properly,
without ever mentioning the changes they made changes to the fan
curves, or anything else they might have changed.


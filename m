Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89BEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 09:13:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FCFA2255F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 09:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbhAFJNk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 04:13:40 -0500
Received: from smtprelay0146.hostedemail.com ([216.40.44.146]:49956 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726430AbhAFJNk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 04:13:40 -0500
X-Greylist: delayed 679 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Jan 2021 04:13:40 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 3353E18037FDF
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Jan 2021 09:02:22 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2625918037C58;
        Wed,  6 Jan 2021 09:01:41 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: duck79_510625a274e0
X-Filterd-Recvd-Size: 1842
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf20.hostedemail.com (Postfix) with ESMTPA;
        Wed,  6 Jan 2021 09:01:39 +0000 (UTC)
Message-ID: <2d5f6ffcf47ec4675cde21ff52fc70a9dd13b023.camel@perches.com>
Subject: Re: [PATCH] thinkpad_acpi: fix: use scnprintf instead of snprintf.
From:   Joe Perches <joe@perches.com>
To:     YANG LI <abaci-bugfix@linux.alibaba.com>, hdegoede@redhat.com
Cc:     mgross@linux.intel.com, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 06 Jan 2021 01:01:37 -0800
In-Reply-To: <1609914976-28113-1-git-send-email-abaci-bugfix@linux.alibaba.com>
References: <1609914976-28113-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 2021-01-06 at 14:36 +0800, YANG LI wrote:
> The snprintf() function returns the number of characters which would
> have been printed if there were enough space, but the scnprintf()
> returns the number of characters which were actually printed. If the
> buffer is not large enough, then using snprintf() would result in a
> read overflow and an information leak. This error was found with the
> help of coccicheck.

In all cases, the buffer _is_ large enough.

tmpi is length 5 and ok.
include/sound/core.h:   char shortname[32];             /* short name of this soundcard */
include/sound/core.h:   char longname[80];              /* name of this soundcard */
include/sound/core.h:   char mixername[80];             /* mixer name */

_show function lengths are OK for all the uses with PAGE_SIZE.
And it's probably better to use sysfs_emit for all the _show functions



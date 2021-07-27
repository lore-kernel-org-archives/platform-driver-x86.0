Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920FDC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Jul 2021 03:46:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66B50600D0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Jul 2021 03:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhG0DGI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Jul 2021 23:06:08 -0400
Received: from smtprelay0074.hostedemail.com ([216.40.44.74]:39660 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234679AbhG0DGI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Jul 2021 23:06:08 -0400
X-Greylist: delayed 602 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Jul 2021 23:06:08 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 904588122D60
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jul 2021 03:36:36 +0000 (UTC)
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 95DA41835109D;
        Tue, 27 Jul 2021 03:36:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 8CDEC2448B5;
        Tue, 27 Jul 2021 03:36:31 +0000 (UTC)
Message-ID: <45ccb9e8c610678e72f461b1e9d61de0a4c9bc79.camel@perches.com>
Subject: Re: [PATCH v2] platform/x86/intel: Move Intel PMT drivers to new
 subfolder
From:   Joe Perches <joe@perches.com>
To:     "David E. Box" <david.e.box@linux.intel.com>, hdegoede@redhat.com,
        mgross@linux.intel.com, andriy.shevchenko@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Date:   Mon, 26 Jul 2021 20:36:30 -0700
In-Reply-To: <20210727022550.3083745-1-david.e.box@linux.intel.com>
References: <20210727022550.3083745-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8CDEC2448B5
X-Stat-Signature: ctnwfp3onemo6gessdmzijbbuqdtizuu
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+Btk9cYTe4JtrpZlbIX6LKl0DX3OWuH7E=
X-HE-Tag: 1627356991-794102
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2021-07-26 at 19:25 -0700, David E. Box wrote:
> Move all Intel Platform Monitoring Technology drivers to
> drivers/platform/x86/intel/pmt.
[]
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -9494,7 +9494,7 @@ INTEL PMT DRIVER
>  M:	"David E. Box" <david.e.box@linux.intel.com>
>  S:	Maintained
>  F:	drivers/mfd/intel_pmt.c
> -F:	drivers/platform/x86/intel_pmt_*
> +F:	drivers/platform/x86/intel/pmt/*

Unless you are suggesting you are not maintainer of any files
in any subdirectories below this directory, you should not use
a *

F:	drivers/platform/x86/intel/pmt/

> diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
[]
> @@ -7,3 +7,4 @@
>  obj-$(CONFIG_INTEL_CHT_INT33FE)		+= int33fe/
>  obj-$(CONFIG_INTEL_SKL_INT3472)		+= int3472/
>  obj-$(CONFIG_INTEL_PMC_CORE)		+= pmc/
> +obj-y					+= pmt/

This seems odd.  Perhaps:

obj-$(CONFIG_PMT_CLASS)				+= pmt/

?



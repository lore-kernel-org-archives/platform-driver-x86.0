From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/7] Constify platform/x86 attribute_group structures.
Date: Tue, 11 Jul 2017 09:24:26 -0700
Message-ID: <20170711162426.GE25390@fury>
References: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57660 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933039AbdGKQYa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2017 12:24:30 -0400
Content-Disposition: inline
In-Reply-To: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: andy@infradead.org, jwoithe@just42.net, cezary.jackiewicz@gmail.com, corentin.chary@gmail.com, laforge@gnumonks.org, coproscefalo@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 11, 2017 at 04:18:13PM +0530, Arvind Yadav wrote:
> attribute_groups are not supposed to change at runtime. All functions
> working with attribute_groups provided by <linux/sysfs.h> work
> with const attribute_group. So mark the non-const structs as const.

Build tested, no warnings/errors found. Queued to testing, thanks Arvind.

> 
> Arvind Yadav (7):
>   [PATCH 1/7] platform/x86: fujitsu-laptop: constify attribute_group structures.
>   [PATCH 2/7] platform/x86: compal-laptop: constify attribute_group structures.
>   [PATCH 3/7] platform/x86: samsung-laptop: constify attribute_group structures.
>   [PATCH 4/7] platform/x86: alienware-wmi: constify attribute_group structures.
>   [PATCH 5/7] platform/x86: panasonic-laptop: constify attribute_group structures.
>   [PATCH 6/7] platform/x86: asus-wmi: constify attribute_group structures.
>   [PATCH 7/7] platform/x86: toshiba_acpi: constify attribute_group structures.
> 
>  drivers/platform/x86/alienware-wmi.c    | 6 +++---
>  drivers/platform/x86/asus-wmi.c         | 4 ++--
>  drivers/platform/x86/compal-laptop.c    | 2 +-
>  drivers/platform/x86/fujitsu-laptop.c   | 2 +-
>  drivers/platform/x86/panasonic-laptop.c | 2 +-
>  drivers/platform/x86/samsung-laptop.c   | 2 +-
>  drivers/platform/x86/toshiba_acpi.c     | 2 +-
>  7 files changed, 10 insertions(+), 10 deletions(-)
> 
> -- 
> 1.9.1
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center

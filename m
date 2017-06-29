From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add IdeaPad V310-14ISK to
 no_hw_rfkill
Date: Thu, 29 Jun 2017 16:50:56 -0700
Message-ID: <20170629235056.GB28736@fury>
References: <CAFwVRQEzmkYO9wZpFH4CaFbTHWzukkWsajU=UN0Hf6VUyrOEnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:58798 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751532AbdF2Xu7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Jun 2017 19:50:59 -0400
Content-Disposition: inline
In-Reply-To: <CAFwVRQEzmkYO9wZpFH4CaFbTHWzukkWsajU=UN0Hf6VUyrOEnw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bin Li <bin.li@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, andy@infradead.org

On Thu, Jun 29, 2017 at 04:16:43PM +0800, Bin Li wrote:
> Like other Lenovo models the IdeaPad V310-14ISK does not have an hw
> rfkill switch. This results in hard-blocked radios after boot, resulting
> in always blocked radios rendering them unusable.
> 
> Add the IdeaPad V310-14ISK to the no_hw_rfkill DMI list and allows using
> the built-in radios.
> 
> Signed-off-by: Bin Li <bin.li@canonical.com>

Hi Bin Li,

The content of the patch is fine, but please always run checkpatch.pl
against your patches prior to submission to catch obvious mechanical
errors. In this case, you are indenting with spaces instead of tabs,
which violates coding style and is inconsistent with the file you are
patching.

Please consider configuring your editor to display whitespace so these
kinds of errors are immediately obvious.

Please correct and resubmit.

Thanks,

-- 
Darren Hart
VMware Open Source Technology Center

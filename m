From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] acer-wmi: support Lenovo ideapad S205 10382JG wifi switch
Date: Thu, 30 Aug 2012 14:13:14 -0700
Message-ID: <20120830211314.GE3276@kroah.com>
References: <1346294381-16529-1-git-send-email-jlee@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:62836 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751530Ab2H3VNT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Aug 2012 17:13:19 -0400
Received: by dady13 with SMTP id y13so1476277dad.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Aug 2012 14:13:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1346294381-16529-1-git-send-email-jlee@suse.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, stable@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Ivo Anjo <knuckles@gmail.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>

On Thu, Aug 30, 2012 at 10:39:41AM +0800, Lee, Chun-Yi wrote:
> Found another Lenovo ideapad S205 the product name is 10382JG, it has
> a 0x78 EC register exposes the state of wifi hardware switch on the machine.
> 
> So, add this patch to support Lenovo ideapad S205-10382JG wifi hardware
> switch in acer-wmi driver.
> 
> Evidently the Ideapad S205 is just a model name on the market, but they have
> totally different product name in DMI table.
> 
> Reference: bko#43007
>         https://bugzilla.kernel.org/show_bug.cgi?id=43007
> 
> Cc: Ivo Anjo <knuckles@gmail.com>
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> ---
>  drivers/platform/x86/acer-wmi.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>

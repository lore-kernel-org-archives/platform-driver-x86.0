From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <keng-yu.lin@canonical.com>
Subject: Re: [PATCH v2] dell-laptop: Add debugfs support
Date: Fri, 17 Sep 2010 13:47:26 +0800
Message-ID: <AANLkTi=xFLaFbFQrRFQop2wtkHt0-oAcTrvMGvc3g9hD@mail.gmail.com>
References: <AANLkTime84o+hJWVDegQWHxcvUiftKW-2psW5tv4a-yR@mail.gmail.com>
 <1284607186-13129-1-git-send-email-keng-yu.lin@canonical.com> <alpine.LFD.2.00.1009161239140.2727@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64942 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750788Ab0IQFrr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Sep 2010 01:47:47 -0400
In-Reply-To: <alpine.LFD.2.00.1009161239140.2727@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: mjg59@srcf.ucam.org, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, superm1@ubuntu.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 17, 2010 at 12:46 AM, Len Brown <lenb@kernel.org> wrote:
>
>> +#ifdef CONFIG_DEBUG_FS
>
> Looks like you can delete these.
>
> Of course you'd want to properly check the return value
> from debugfs_create_dir(), which returns an ERR_PTR
> when CONFIG_DEBUG_FS is not defined. (even though
> few in the kernel seem to be bothering to use IS_ERR() here.)
>
> cheers,
> Len Brown, Intel Open Source Technology Center
>

Hi Len:
  If CONFIG_DEBUG_FS is not defined, all debugfs_create_dir(),
debugfs_create_file() and debugfs_remove_recursive() here will just
return -ENODEV. I think in this case, it causes little harm just to
skip checking the return value with IS_ERR() since no follow-up action
for that.

  Regards,
-kengyu

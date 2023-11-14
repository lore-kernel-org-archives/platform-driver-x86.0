Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E72C4167B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 11:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjKNLEw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 06:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjKNLEv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 06:04:51 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAE7D1;
        Tue, 14 Nov 2023 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699959888; x=1731495888;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mqCGEy7uTwKe0+FeG0SsxohxV9po8hZxqERtyxa4cXE=;
  b=ZztuliG5vR8yVVY0ztGccWcSW04Atpu2/6KwYN7PE8KNm7cet71lY4N5
   9bApN9OXWHBjCnc+zt0XKOjugQhqBPxzT/mU8DwT+7qgWALt6W2JLjykz
   fhauHvuh55Ar3dwexPD/Ij0+aoRm8ng8/xCnzWClN05WUYaq4HGYqcvGw
   DeysqIsVekQhMQxyu6NVxfpfxxpMn82FxUgn7PBplzVzgukjieW5yweqz
   GktKcNaOQkOWQ1pkciYZZCgzth81TZi5s6QHX94GD1/tmdYfrQKPPZmLw
   Xa//JhStkKOuPSCSCcWvYfN+eGFgo1ID1XT8I5Of9Xwq/oZiGkwqbUNmu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3691333"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="3691333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:04:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938047042"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938047042"
Received: from rauhjoha-mobl2.ger.corp.intel.com ([10.251.217.194])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:04:45 -0800
Date:   Tue, 14 Nov 2023 13:04:43 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/dell: alienware-wmi: Use kasprintf()
In-Reply-To: <f2b2c9e5d80550e480a627c1b2139d5cc9472ffa.1699775015.git.christophe.jaillet@wanadoo.fr>
Message-ID: <78d8b4c-9053-5256-66b6-18b17dd2e9f9@linux.intel.com>
References: <f2b2c9e5d80550e480a627c1b2139d5cc9472ffa.1699775015.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-153308950-1699959887=:1748"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-153308950-1699959887=:1748
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Sun, 12 Nov 2023, Christophe JAILLET wrote:

> Use kasprintf() instead of hand writing it.
> This saves the need of an intermediate buffer.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

> ---
>  drivers/platform/x86/dell/alienware-wmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index a9477e5432e4..f5ee62ce1753 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -429,7 +429,6 @@ static DEVICE_ATTR(lighting_control_state, 0644, show_control_state,
>  static int alienware_zone_init(struct platform_device *dev)
>  {
>  	u8 zone;
> -	char buffer[10];
>  	char *name;
>  
>  	if (interface == WMAX) {
> @@ -466,8 +465,7 @@ static int alienware_zone_init(struct platform_device *dev)
>  		return -ENOMEM;
>  
>  	for (zone = 0; zone < quirks->num_zones; zone++) {
> -		sprintf(buffer, "zone%02hhX", zone);
> -		name = kstrdup(buffer, GFP_KERNEL);
> +		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
>  		if (name == NULL)
>  			return 1;
>  		sysfs_attr_init(&zone_dev_attrs[zone].attr);
> 
--8323329-153308950-1699959887=:1748--

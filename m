Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2ECC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 11:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjKNLJa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 06:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjKNLJ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 06:09:29 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBC112C
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 03:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699960166; x=1731496166;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kupiR7XNplnGSV2q74DxENetFLbwizHrVwM2ASSN5LI=;
  b=cIUdwvODKSq5gHX/RsGAFFh4mZg4RbEPRg9IW4/XWKP2Ra+VG94ceyNJ
   PS+3gSLbOqWVMsusQ4vWpABfSHTyUtQpP8QLhiftQJVtvWfTOwY3snImY
   Z93zKIijzVAkmWtYeOU9f4zrZZiXeiERJavmOEIacbfrwa7qd2/AeiNLL
   zpBtCPNXfQdNdEuQSjUFZiITF7VTkeX1Z9rLoK6bhlisrEpjiIUgZuAJT
   mxVcqcNdBJpfSNJmrUN/qaJcOkkv1om9rZcBi4+4HZFphgG95Ax7pcWh6
   IUafpcpbxn8s9z8UucaxUnYONK1jK9KNAQpgJzKyYv+pz4CwQerOJPfh9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="3692170"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="3692170"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="12404797"
Received: from rauhjoha-mobl2.ger.corp.intel.com ([10.251.217.194])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:09:17 -0800
Date:   Tue, 14 Nov 2023 13:09:15 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Jules Irenge <jbi.octave@gmail.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        vadimp@nvidia.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/mellanox: mlxbf-tmfifo: Remove unnecessary
 bool conversion
In-Reply-To: <ZUWIIKbz4vukl8qb@octinomon>
Message-ID: <42dad56-f73a-cfcf-eedb-60412eb6a7e4@linux.intel.com>
References: <ZUWIIKbz4vukl8qb@octinomon>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-896689569-1699960158=:1748"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-896689569-1699960158=:1748
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Fri, 3 Nov 2023, Jules Irenge wrote:

> This commit fixes coccinelle warning in macro function
> IS_VRING_DROP() which complains conversion to bool not needed here.
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Not an end of the world but just in case you have it stored somewhere, my 
email address was lacking the first letter in your post.

-- 
 i.

> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index ab7d7a1235b8..88472c024680 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -91,7 +91,7 @@ struct mlxbf_tmfifo_vring {
>  /* Check whether vring is in drop mode. */
>  #define IS_VRING_DROP(_r) ({ \
>  	typeof(_r) (r) = (_r); \
> -	(r->desc_head == &r->drop_desc ? true : false); })
> +	r->desc_head == &r->drop_desc; })
>  
>  /* A stub length to drop maximum length packet. */
>  #define VRING_DROP_DESC_MAX_LEN		GENMASK(15, 0)
> 
--8323329-896689569-1699960158=:1748--

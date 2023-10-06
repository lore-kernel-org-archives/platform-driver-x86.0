Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8747E81DF9
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 13:22:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbjJFNWD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 09:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbjJFNWC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 09:22:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B450A9E
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696598519; x=1728134519;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M4NP2lpJz4kBk0+GKkQOQiooarNaJaF9O43yPt39ww4=;
  b=U7+WtZp5YfTK85mxdr/liYTBbMTZncq6Pim9IdA5eZFbh04UGumScCIN
   8r3wpJtQwT2ZBt3AMWsh9bWA7dfVD3Ym1Sn2K850KG/6XKawP6C3elY9j
   LCfBkUBIwdFl2DMpnum9hykElw/MjoqUTOiYDuhBAn2qxa4sORyjEifAr
   71igM3+SkOkpmkHJanUgSJKG3CBzrxKwbF4On4Zav8Adh4ezDw/hjcnbu
   6Vg++Dpc6G8egF87/tz/QgKquEhjP9BK/kEOc+Mi/HZt/JxUSi4PswJP+
   ozKKLVp7GWRpkL4iOVt5U/bJa05rsVm2zdFrFTnmvGA10OslPZQylqgpd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="383640349"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="383640349"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 06:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="781655999"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="781655999"
Received: from srab-mobl1.ger.corp.intel.com ([10.252.43.69])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 06:21:56 -0700
Date:   Fri, 6 Oct 2023 16:21:54 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <suma.hegde@amd.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v4 2/3] platform/x86/amd/hsmp: add support for metrics
 tbl
In-Reply-To: <20231005053932.149497-2-suma.hegde@amd.com>
Message-ID: <d3b1aeb1-b86e-7df5-1b69-3e7d9ed9caaf@linux.intel.com>
References: <20231005053932.149497-1-suma.hegde@amd.com> <20231005053932.149497-2-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 5 Oct 2023, Suma Hegde wrote:

> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
> all the system management information from SMU.
> 
> The metrics table is made available as hexadecimal sysfs binary file
> under per socket sysfs directory created at
> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> 
> Metrics table definitions will be documented as part of Public PPR.
> The same is defined in the amd_hsmp.h header.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>


> +static int hsmp_create_sysfs_interface(void)
> +{
> +	const struct attribute_group **hsmp_attr_grps;
> +	struct bin_attribute **hsmp_bin_attrs;
> +	struct attribute_group *attr_grp;
> +	int ret;
> +	u8 i;
> +
> +	hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct attribute_group *) *
> +				      (plat_dev.num_sockets + 1), GFP_KERNEL);
> +	if (!hsmp_attr_grps)
> +		return -ENOMEM;
> +
> +	/* Create a sysfs directory for each socket */
> +	for (i = 0; i < plat_dev.num_sockets; i++) {

The change for i to u8 seems not very wise given num_sockets still is u16
as it can turn this into an infinite loop.

-- 
 i.


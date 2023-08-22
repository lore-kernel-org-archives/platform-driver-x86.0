Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3B1EE4993
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 08:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbjHVI6b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 04:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234135AbjHVI62 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 04:58:28 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C9510D3
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 01:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692694678; x=1724230678;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=56I6tQqeZ8YQMDYrzsd8xjiEP9JbRQHiqzhkFWN8sb0=;
  b=CJZdaRI/YjsZE5E4s88geKOVWmcaEEso7Q7bfFABGRUmGoLSYcoqI1yM
   6yDG8R9CBIKbGfDrviZdM7aqYk7KHGBcoISaWqabOcGNH8RE7Fd0/qNPx
   QmpkQKuFsG7s0KkZv5FOWMbZ4cnltwUdZMsYqYpb20H7UbXlobSCwFi1N
   IeEGoC0kT6IWr8xzj5uaNIUhgKnpCzQDxboOG4fg5fxtskG/r+biW37MV
   OIlOnvz+UiaLC0ud9zWUgDCppSaRjOxd4q7XQXWNwtSsozMDIKoH7pezw
   lYK6FFDyap+otRlVfI4GUDsDbPflYVUcBDmvxi2oYT4iTVADsXIpN3uZR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373799247"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="373799247"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="736131054"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="736131054"
Received: from refaase-mobl.ger.corp.intel.com ([10.252.53.244])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:57:56 -0700
Date:   Tue, 22 Aug 2023 11:57:54 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <Suma.Hegde@amd.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: add support for metrics tbl
In-Reply-To: <20230818125119.1323499-3-Suma.Hegde@amd.com>
Message-ID: <f6d62567-3efa-32cd-e9ea-f66455ccde9b@linux.intel.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com> <20230818125119.1323499-3-Suma.Hegde@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 18 Aug 2023, Suma Hegde wrote:

> From: Suma Hegde <suma.hegde@amd.com>
> 
> AMD MI300 MCM provides GET_METRICS_TABLE message with which
> all the system management information from SMU can be retrieved in just
> one message.
> 
> The metrics table is available as hexadecimal sysfs binary file in
> /sys/devices/platform/amd_hsmp/socket%d_metrics_bin 
> Metrics table definitions will be documented as part of PPR which
> available in public domain. The same is defined in the amd_hsmp.h header
> file as well.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---

> +#define HSMP_ATRR_NAME_SIZE 25
> +static int hsmp_create_metric_tbl_sysfs_file(int sock_ind)
> +{
> +	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
> +	char *name;
> +
> +	sysfs_attr_init(&plat_dev.sock[sock_ind].hsmp_attr);
> +	name = devm_kzalloc(plat_dev.dev, HSMP_ATRR_NAME_SIZE, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;
> +	sprintf(name, "socket%d_metrics_bin", sock_ind);

The structure would be more future-proof if you do socket%d/metrics_bin 
instead. Are you expected to add at some point in the future more files 
which are socket specific?

You didn't provide any documentation for this interface btw, you should 
add it.

> +	hattr->attr.name	= name;
> +	hattr->attr.mode	= 0444;
> +	hattr->read		= hsmp_metric_tbl_read;
> +	hattr->size		= sizeof(struct hsmp_metric_table);
> +	hattr->private		= &plat_dev.sock[sock_ind];
> +
> +	return device_create_bin_file(plat_dev.dev, hattr);
> +}

> +static int hsmp_create_sysfs_file(void)
> +{
> +	int ret, i;
> +
> +	for (i = 0; i < num_sockets; i++) {
> +		ret = hsmp_get_tbl_dram_base(i);
> +		if (ret)
> +			goto cleanup;
> +
> +		ret = hsmp_create_metric_tbl_sysfs_file(i);
> +		if (ret) {
> +			dev_err(plat_dev.dev, "Unable to create sysfs file for metric table\n");
> +			goto cleanup;
> +		}
> +	}
> +
> +	return 0;
> +
> +cleanup:
> +	while (i > 0)
> +		device_remove_bin_file(plat_dev.dev, &plat_dev.sock[--i].hsmp_attr);
> +	return ret;
> +}
> +
> +static int hsmp_cache_proto_ver(void)
> +{
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	msg.msg_id	= HSMP_GET_PROTO_VER;
> +	msg.sock_ind	= 0;
> +	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (!ret)
> +		plat_dev.proto_ver = msg.args[0];
> +
> +	return ret;
> +}
> +
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
> -	int i;
> +	int ret, i;
>  
>  	plat_dev.sock = devm_kzalloc(&pdev->dev,
>  				     (num_sockets * sizeof(struct hsmp_socket)),
> @@ -344,18 +463,44 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		plat_dev.sock[i].sock_ind = i;
>  	}
>  
> -	plat_dev.hsmp_device.name	= "hsmp_cdev";
> +	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
>  	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
>  	plat_dev.hsmp_device.fops	= &hsmp_fops;
>  	plat_dev.hsmp_device.parent	= &pdev->dev;
> -	plat_dev.hsmp_device.nodename	= "hsmp";
> +	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
>  	plat_dev.hsmp_device.mode	= 0644;
>  
> -	return misc_register(&plat_dev.hsmp_device);
> +	ret = misc_register(&plat_dev.hsmp_device);
> +	if (ret)
> +		return ret;
> +
> +	ret = hsmp_cache_proto_ver();
> +	if (ret) {
> +		dev_err(plat_dev.dev, "Failed to read HSMP protocol version\n");
> +		goto cleanup;
> +	}
> +
> +	/* metrics table is supported only from proto ver6 EPYCs */
> +	if (plat_dev.proto_ver >= HSMP_PROTO_VER6) {
> +		ret = hsmp_create_sysfs_file();

For new things, driver/device attribute_group should be used where 
possible. .is_visible() can handle that condition check for you.


-- 
 i.


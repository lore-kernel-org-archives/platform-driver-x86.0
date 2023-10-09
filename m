Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C21E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 11:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346215AbjJILX0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346171AbjJILX0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 07:23:26 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92F79E
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 04:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696850603; x=1728386603;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zRJySkG2Y/jPhcEQ2vN4TrAO0GWaURhyFCi+PqYdMUs=;
  b=Jts0vrkMgO6kArWyQqKPc+JZmPFcrExm1hrd2BWLYSRJZvWv8Y7U3nuz
   ZIEdpdXdLkX1pCVjeqnayAolwlQTMCzrwwY4K2c77CY30TrDvDcGqWkUN
   FAa0Tmnq8pDKC582NxwQZ5jbpABZStYFKz7rzT2HoGlZHsUb7UmaQ/Uio
   y4xcjVPkPiUqCsQ6GrfJRDjvWOr/8kq82oQgnMeZRR0pRFbB33or2iQhf
   P2ueelLSl8odou52iHMGkO/cR4Na62pug3FYuRmdqK6xRi6xVgdh1rQBQ
   UJ1412szoLRer8hIOZUg5H/lm9/wkEprSKaDzeXCPZ26uBe+Ze/Zt87r+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381384596"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="381384596"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="782459067"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="782459067"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 04:23:21 -0700
Date:   Mon, 9 Oct 2023 14:23:18 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     "Hegde, Suma" <Suma.Hegde@amd.com>
cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v4 2/3] platform/x86/amd/hsmp: add support for metrics
 tbl
In-Reply-To: <bb3ec2c2-332e-d6ca-2c06-31d2b68d346b@amd.com>
Message-ID: <faf39eb5-ac8a-b32a-d6a-a4bb6ea8ab3a@linux.intel.com>
References: <20231005053932.149497-1-suma.hegde@amd.com> <20231005053932.149497-2-suma.hegde@amd.com> <d3b1aeb1-b86e-7df5-1b69-3e7d9ed9caaf@linux.intel.com> <bb3ec2c2-332e-d6ca-2c06-31d2b68d346b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-888908837-1696850602=:1721"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-888908837-1696850602=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Hegde, Suma wrote:
> On 10/6/2023 6:51 PM, Ilpo Järvinen wrote:
> > On Thu, 5 Oct 2023, Suma Hegde wrote:
> > 
> > > AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
> > > all the system management information from SMU.
> > > 
> > > The metrics table is made available as hexadecimal sysfs binary file
> > > under per socket sysfs directory created at
> > > /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> > > 
> > > Metrics table definitions will be documented as part of Public PPR.
> > > The same is defined in the amd_hsmp.h header.
> > > 
> > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> > 
> > > +static int hsmp_create_sysfs_interface(void)
> > > +{
> > > +     const struct attribute_group **hsmp_attr_grps;
> > > +     struct bin_attribute **hsmp_bin_attrs;
> > > +     struct attribute_group *attr_grp;
> > > +     int ret;
> > > +     u8 i;
> > > +
> > > +     hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct
> > > attribute_group *) *
> > > +                                   (plat_dev.num_sockets + 1),
> > > GFP_KERNEL);
> > > +     if (!hsmp_attr_grps)
> > > +             return -ENOMEM;
> > > +
> > > +     /* Create a sysfs directory for each socket */
> > > +     for (i = 0; i < plat_dev.num_sockets; i++) {
> > The change for i to u8 seems not very wise given num_sockets still is u16
> > as it can turn this into an infinite loop.
> 
> Hi Ilpo,
> 
> amd_nb_num() API which we use to identify the number of sockets on a node
> returns u16. So, we used u16 for plat_dev.num_sockets.
> u8 should be enough, as present AMD processors support upto 8 sockets on a
> node.

I wasn't expecting it to fail at the moment, I just don't want to leave a 
silent trap for the future.

> Coming to the warning raised:
> We have defined, HSMP_ATTR_GRP_NAME_SIZE as 10bytes, 6 chars for 'socket', 3
> chars for 3digits (socket index) and a null terminator.
> Socket index may not need more than 3 digits in the foreseeable future. How
> about, we declare i as u16 and typecast it as (u8) in the snprintf.
> 
>         int ret;
> -       u8 i;
> +       u16 i;
> 
>         hsmp_attr_grps = devm_kzalloc(plat_dev.dev, sizeof(struct
> attribute_group *) *
>                                   (plat_dev.num_sockets + 1), GFP_KERNEL); @@
> -449,7 +449,7 @@ static int hsmp_create_sysfs_interface(void)
>         if (!attr_grp)
>                 return -ENOMEM;
> 
> -       snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u",
> i);
> +       snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE,
> + "socket%u", (u8)i);
>         attr_grp->name = plat_dev.sock[i].name;

This is similarly trappy as it truncates i if num_sockets is > 255.

I suggest you just put this into start of the function:

	/* String formatting is currently limited to u8 sockets */
	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
		return -ERANGE;

to catch the too many sockets case if it is ever going to occur.
And explain in the changelog that u8 is enough for foreseeable future 
and the string formatting triggers a warning if unnecessarily large type 
is passed to snprintf().


-- 
 i.

--8323329-888908837-1696850602=:1721--

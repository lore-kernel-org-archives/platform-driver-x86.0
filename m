Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C701CD4F33
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Sep 2023 08:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbjIVI4W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Sep 2023 04:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232696AbjIVI4V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Sep 2023 04:56:21 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A712ECA
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Sep 2023 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695372975; x=1726908975;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+72xfHqHdpCJromq9NP4fV7IZD8GcGNlgIHaEf+gGVw=;
  b=d8DTCPZfQNc5fBxqFolA+IKd57FT9qCCgUUqEAKXs47L9CmOorEJm4Xa
   ey84ZSGqJ0It5hLKaWOaLSOcyAvxfT/zmBlsyRDAfYZ54eJiiMZ01xMbR
   qB92DThycNGgC5ibjrzjluEVDyFamkmJ+Z8zdc/YvBEShdYYIg7BXR9ug
   1HbBXFqHOtFMSI1Y7aQem07Sn9Y46ceYCi2tybs1fKebQApt0gBoH2qac
   stDBvFEwoL0UohhY+riQjjZ0L0ebyxtCdyNIpU69qVseXoh0R1XRklK+R
   fWUsBJm4oSprWt+cOLI6lcr/i/9SZpURs6/f2U/oWzLGS7Mue1/+lkPeb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383526236"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383526236"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 01:56:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="697092972"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="697092972"
Received: from rblanarx-mobl.ger.corp.intel.com ([10.252.52.48])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 01:56:13 -0700
Date:   Fri, 22 Sep 2023 11:56:11 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Suma Hegde <suma.hegde@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v3 2/3] platform/x86/amd/hsmp: add support for metrics
 tbl
In-Reply-To: <39a60d46-a916-9921-4c6a-5c95bcdbb82e@redhat.com>
Message-ID: <166b4e9d-71e7-a95d-e11a-895f2c5dd2f8@linux.intel.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com> <20230919092057.2235437-2-suma.hegde@amd.com> <38442217-9629-5fa8-8d36-4eebc6fda4f4@linux.intel.com> <39a60d46-a916-9921-4c6a-5c95bcdbb82e@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1807030652-1695372975=:1840"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1807030652-1695372975=:1840
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 21 Sep 2023, Hans de Goede wrote:
> On 9/19/23 15:07, Ilpo Järvinen wrote:
> > On Tue, 19 Sep 2023, Suma Hegde wrote:
> > 
> >> AMD MI300 MCM provides GET_METRICS_TABLE message to retrieve
> >> all the system management information from SMU.
> >>
> >> The metrics table is made available as hexadecimal sysfs binary file
> >> under per socket sysfs directory created at
> >> /sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> >>
> >> Metrics table definitions will be documented as part of Public PPR.
> >> The same is defined in the amd_hsmp.h header.
> >>
> >> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> >> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> >> ---
> >> Changes since v1:
> >> 1. Remove HSMP_DEVNODE_NAME and HSMP_CDEV_NAME macro definitions in
> >> this patch
> >> 2. Remove extra space in comments for HSMP_GET_METRIC_TABLE_VER,
> >>    HSMP_GET_METRIC_TABLE and HSMP_GET_METRIC_TABLE_DRAM_ADDR enum
> >>    definition in amd_hsmp.h files
> >> 3. Change check, count == 0 to !count in hsmp_metric_tbl_read() function
> >> 4. Add hsmp_metric_table_visible() function 
> >> 5. hsmp_create_metric_tbl_sysfs_file() is renamed as hsmp_init_metric_tbl_bin_attr()
> >>    and code is also modified slightly
> >> 6. Modify hsmp_create_sysfs_file() to use devm_device_add_groups()
> >> 7. Change from cleanup label to deregister label
> >> 8. Add dev_err print in hsmp_get_tbl_dram_base()
> >> 9. Reword "Unable to Failed" in hsmp_get_tbl_dram_base()
> >> 10. Add HSMP_GRP_NAME_SIZE and NUM_ATTRS macros
> >> 11. Remove sysfs cleanup code in hsmp_pltdrv_remove()
> >> 12. Correct ATRR typo error
> >> 13. Change sprintf to snprintf
> >> 14. Check metrics table support only against HSMP_PROTO_VER6
> >> Changes since v2:
> >> 1. squash documentation patch into this patch
> >> 2. change from num_sockets to plat_dev.num_sockets
> >>
> >>  Documentation/arch/x86/amd_hsmp.rst  |  16 +++
> >>  arch/x86/include/uapi/asm/amd_hsmp.h | 109 ++++++++++++++++
> >>  drivers/platform/x86/amd/hsmp.c      | 180 ++++++++++++++++++++++++++-
> >>  3 files changed, 302 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> >> index 440e4b645a1c..a4c308784818 100644
> >> --- a/Documentation/arch/x86/amd_hsmp.rst
> >> +++ b/Documentation/arch/x86/amd_hsmp.rst
> >> @@ -41,6 +41,22 @@ In-kernel integration:
> >>   * Locking across callers is taken care by the driver.
> >>  
> >>  
> >> +HSMP sysfs interface
> >> +====================
> >> +
> >> +1. Metrics table binary sysfs
> >> +
> >> +AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
> >> +all the system management information from SMU.
> >> +
> >> +The metrics table is made available as hexadecimal sysfs binary file
> >> +under per socket sysfs directory created at
> >> +/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> >> +
> >> +Metrics table definitions will be documented as part of Public PPR.
> >> +The same is defined in the amd_hsmp.h header.
> >> +
> >> +
> >>  An example
> >>  ==========
> >>  
> > 
> > I'd have expected to have the sysfs documentation appear under 
> > Documentation/ABI/testing/sysfs-...
> 
> Actually it is somewhat normal for sysfs files to be paired
> together with other documentation when there is more extensive
> documentation then just the sysfs files, see e.g. :
> 
> Documentation/admin-guide/laptops/thinkpad-acpi.rst

Okay but that seems to result in attempting to handle deprecation 
within that file too which feels wrong beyond just hacing documentation in 
an unusual location.

> So there is precedent for this and I think it make sense
> to keep all the documentation in one place, rather then to add
> a Documentation/ABI/testing/sysfs-platform-amd-hsmp file
> just for the sysfs attributes .
> 
> OTOH people are used to look for sysfs attribute documentation
> in a place like Documentation/ABI/testing/sysfs-platform-amd-hsmp,
> but I think that keeping all the docs together is more important.
> 
> So I have a slight preference for keeping this as is and
> just merging v3 of this series as is.
> 
> Ilpo, what do you think ?

I don't have strong preference myself if you think the current location 
is fine. So feel free to merge it as is.

-- 
 i.

--8323329-1807030652-1695372975=:1840--

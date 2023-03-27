Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3428C7619A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:10:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjC0NKe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232220AbjC0NKc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:10:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70398171D
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679922584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EIAFYlnzHIrx2qTCRRpVe38GuMi/7+4xPc8Crk8tx2w=;
        b=WVBZqooISS+tyRhMChMQLA9o4ljpEGK29Tk18zUwsecVjns3N77fXY3V8BNUX47hcnOSZY
        XmWsZ3EVKjxKhexa/4ilmPKrfEx+botmI2mmx2aGEC4EesBhTmHzlYVTYbvlVU3vUPSHFX
        HI8h7sQ9Jq6ivdMZwKberhvn1Wj42x0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-rVlvjtkvM1Sw38EgFmyrUA-1; Mon, 27 Mar 2023 09:09:43 -0400
X-MC-Unique: rVlvjtkvM1Sw38EgFmyrUA-1
Received: by mail-ed1-f72.google.com with SMTP id a40-20020a509eab000000b005024c025bf4so207449edf.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679922582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIAFYlnzHIrx2qTCRRpVe38GuMi/7+4xPc8Crk8tx2w=;
        b=BhmjZvQKG9gXjmSiKnbwMtbUME5xHIVf91OCBANM+LZogtPymECoCk8i9pwHBTVOJ+
         SWyjw8+5zp0zITg5a7dJAMZPaUbV7E42NbFCTEvL6YbxqZ/8Ab0CIFGqAGdacZuc/VxP
         83W4acEA5dOk8vLRccalx9blyEAsIqR2VpX0dCCiOI2U7wXSzQ6Fdfq8hgAB0i7/oibH
         sxkStJFSMUn4ZtrQbxlqXAd/ExxGN6w5v6UccHPOtPjeYx43hYahZPAmisq8w+1TPjCU
         NohZnlDnxhWQwe0QJVXv4uX8oN8lypZOevk/XYTIvdbSW1YOfbujUKioCa2sQD1wQMu+
         /xDA==
X-Gm-Message-State: AAQBX9da30ssORtDSaXjRaVjKsM8cxUJga7VeSC4Hy8lJuRl2ds0q/Av
        SGpq9Z9cCOxD+Rs606YeCQYMYyrDE74iOPnbq3k5sypep1EivAuzp7pI28JHXDJ9WN38wKc89Mu
        uwr5ZAC1oVPWPVNfN6NEX2owm35pXVr4bSK4BQc+zXg==
X-Received: by 2002:a17:906:f2d1:b0:932:35b1:47f8 with SMTP id gz17-20020a170906f2d100b0093235b147f8mr12388103ejb.34.1679922582043;
        Mon, 27 Mar 2023 06:09:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZwYVRbtEIY1pgC12CfLuq0bF3Ch9Euug2HfyvtbO8j3dY2A9K/RHNVJ+ATIeFo/iAKM8Jf6g==
X-Received: by 2002:a17:906:f2d1:b0:932:35b1:47f8 with SMTP id gz17-20020a170906f2d100b0093235b147f8mr12388078ejb.34.1679922581710;
        Mon, 27 Mar 2023 06:09:41 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id xi3-20020a170906dac300b009445d6213c0sm1603164ejb.75.2023.03.27.06.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 06:09:40 -0700 (PDT)
Message-ID: <06080942-8b70-05d0-ddca-c94b3b09457b@redhat.com>
Date:   Mon, 27 Mar 2023 15:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.4-rc1
Content-Language: en-US
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <c05d53c61c4b491e4ffe3ac159031aae31b1e98b.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c05d53c61c4b491e4ffe3ac159031aae31b1e98b.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/23/23 00:22, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> Pull request for Intel Speed Select version v1.15:

Thanks.

I've merged the current intel-sst branch / commit
19799d3ae2edec99435b792cfe76b1cba74665fe into review-hans
as is.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> Summary of changes:
> 
> Till the commit:
> "tools/power/x86/intel-speed-select: Get punit core mapping
> information"
> 
> All patches just lays foundation for adding new hardware interface
> in addition to existing MSR/MMIO interface.
> 
> All patches prefixed with "Abstract" just adds individual hardware
> callback for functions called from the core processing.
> 
> The mailbox processing is abstracted to a new file with callbacks.
> 
> In addition some changes to reduce duplicated code for display
> of TRL level.
> 
> Patch "Introduce Punit ID concept and add related API" add further
> abstraction in addition to existing package and die scope.
> 
> -----------
> tools/power/x86/intel-speed-select: Get punit core mapping information
> -Adds a new way to get package/die/punit information for each CPU.
> -----------
> 
> Introduce TPMI interface support
> - Implement all abstracted callbacks above to use TPMI IOCTL interface.
> -----------
> 
> tools/power/x86/intel-speed-select: Display punit info
> - With TPMI the granularity is per punit, which can be multiple in a
> package/die.
> ----------
> 
> tools/power/x86/intel-speed-select: Remove cpu mask display for non-cpu
> power domain
> tools/power/x86/intel-speed-select: Display fact info for non-cpu power
> domain
> -There are some power domains with no CPUs, the above patches adds CPU
> as invalid
> for these domains
> ----------
> 
> tools/power/x86/intel-speed-select: Use cgroup v2 isolation
> - Adds new option to use Cgroup CPU isolation instead of offline of
> CPUs
> ----------
> 
> tools/power/x86/intel-speed-select: Change TRL display for Emerald
> Rapids
> - Emerald Rapid has multiple TRL levels and moves away from TRL level
> based on instruction type
> 
> --------------------------------------
> 
> The base branch for these changes 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> branch: review-hans
> 
>  
> The following changes since commit
> 6f561677c2f234bcf215350b76f2a2fea95fbebf:
> 
>   platform/x86/intel: vsec: Use intel_vsec_dev_release() to simplify
> init() error cleanup (2023-03-20 15:20:05 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 19799d3ae2edec99435b792cfe76b1cba74665fe:
> 
>   tools/power/x86/intel-speed-select: Update version (2023-03-22
> 13:41:17 -0700)
> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (6):
>       tools/power/x86/intel-speed-select: Get punit core mapping
> information
>       tools/power/x86/intel-speed-select: Add missing free cpuset
>       tools/power/x86/intel-speed-select: Use cgroup v2 isolation
>       tools/power/x86/intel-speed-select: Display AMX base frequency
>       tools/power/x86/intel-speed-select: Identify Emerald Rapids
>       tools/power/x86/intel-speed-select: Change TRL display for
> Emerald Rapids
> 
> Zhang Rui (55):
>       tools/power/x86/intel-speed-select: Unify TRL levels
>       tools/power/x86/intel-speed-select: Follow TRL nameing for FACT
> info
>       tools/power/x86/intel-speed-select: Introduce punit to isst_id
>       tools/power/x86/intel-speed-select: Introduce
> isst_is_punit_valid()
>       tools/power/x86/intel-speed-select: Introduce support for multi-
> punit
>       tools/power/x86/intel-speed-select: Rename
> for_each_online_package_in_set
>       tools/power/x86/intel-speed-select: Improve
> isst_print_extended_platform_info
>       tools/power/x86/intel-speed-select: Move mbox functions to isst-
> core.c
>       tools/power/x86/intel-speed-select: Introduce
> isst_get_disp_freq_multiplier
>       tools/power/x86/intel-speed-select: Always invoke
> isst_fill_platform_info
>       tools/power/x86/intel-speed-select: Introduce isst-core-mbox.c
>       tools/power/x86/intel-speed-select: Abstract is_punit_valid
>       tools/power/x86/intel-speed-select: Abstract get_config_levels
>       tools/power/x86/intel-speed-select: Abstract get_ctdp_control
>       tools/power/x86/intel-speed-select: Abstract get_tdp_info
>       tools/power/x86/intel-speed-select: Abstract get_pwr_info
>       tools/power/x86/intel-speed-select: Move code right before its
> caller
>       tools/power/x86/intel-speed-select: Abstract get_tjmax_info
>       tools/power/x86/intel-speed-select: Abstract get_coremask_info
>       tools/power/x86/intel-speed-select: Abstract get_get_trl
>       tools/power/x86/intel-speed-select: Abstract get_trl_bucket_info
>       tools/power/x86/intel-speed-select: Abstract set_tdp_level
>       tools/power/x86/intel-speed-select: Abstract get_pbf_info
>       tools/power/x86/intel-speed-select: Remove
> isst_get_pbf_info_complete
>       tools/power/x86/intel-speed-select: Abstract set_pbf_fact_status
>       tools/power/x86/intel-speed-select: Abstract get_fact_info
>       tools/power/x86/intel-speed-select: Abstract
> get_uncore_p0_p1_info
>       tools/power/x86/intel-speed-select: Enhance get_tdp_info
>       tools/power/x86/intel-speed-select: Abstract get_get_trls
>       tools/power/x86/intel-speed-select: Abstract get_clos_information
>       tools/power/x86/intel-speed-select: Abstract pm_qos_config
>       tools/power/x86/intel-speed-select: Abstract pm_get_clos
>       tools/power/x86/intel-speed-select: Abstract set_clos
>       tools/power/x86/intel-speed-select: Abstract
> clos_get_assoc_status
>       tools/power/x86/intel-speed-select: Abstract clos_associate
>       tools/power/x86/intel-speed-select: Abstract read_pm_config
>       tools/power/x86/intel-speed-select: Abstract adjust_uncore_freq
>       tools/power/x86/intel-speed-select: Move send_mbox_cmd to isst-
> core-mbox.c
>       tools/power/x86/intel-speed-select: Allow api_version based
> platform callbacks
>       tools/power/x86/intel-speed-select: Introduce is_debug_enabled()
>       tools/power/x86/intel-speed-select: Support large clos_min/max
>       tools/power/x86/intel-speed-select: Introduce api_version helper
>       tools/power/x86/intel-speed-select: Introduce TPMI interface
> support
>       tools/power/x86/intel-speed-select: Display punit info
>       tools/power/x86/intel-speed-select: Display amx_p1 and
> cooling_type
>       tools/power/x86/intel-speed-select: Allow display non-cpu power
> domain info
>       tools/power/x86/intel-speed-select: Prevent cpu clos config for
> non-cpu power domain
>       tools/power/x86/intel-speed-select: Show level 0 name for new
> api_version
>       tools/power/x86/intel-speed-select: Display fact info for non-cpu
> power domain
>       tools/power/x86/intel-speed-select: Hide invalid TRL level
>       tools/power/x86/intel-speed-select: Remove cpu mask display for
> non-cpu power domain
>       tools/power/x86/intel-speed-select: Avoid setting duplicate tdp
> level
>       tools/power/x86/intel-speed-select: Add cpu id check
>       tools/power/x86/intel-speed-select: Fix clos-max display with
> TPMI I/F
>       tools/power/x86/intel-speed-select: Update version
> 
>  tools/power/x86/intel-speed-select/Build            |    2 +-
>  tools/power/x86/intel-speed-select/isst-config.c    |  769
> +++++++++++++++++--------------
>  tools/power/x86/intel-speed-select/isst-core-mbox.c | 1066
> +++++++++++++++++++++++++++++++++++++++++++
>  tools/power/x86/intel-speed-select/isst-core-tpmi.c |  787
> ++++++++++++++++++++++++++++++++
>  tools/power/x86/intel-speed-select/isst-core.c      |  846 ++++++-----
> -----------------------
>  tools/power/x86/intel-speed-select/isst-daemon.c    |   38 +-
>  tools/power/x86/intel-speed-select/isst-display.c   |  245 +++++-----
>  tools/power/x86/intel-speed-select/isst.h           |   96 ++--
>  8 files changed, 2617 insertions(+), 1232 deletions(-)
>  create mode 100644 tools/power/x86/intel-speed-select/isst-core-mbox.c
>  create mode 100644 tools/power/x86/intel-speed-select/isst-core-tpmi.c
> 
> Thanks,
> Srinivas

